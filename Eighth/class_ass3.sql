CREATE TABLE Sailors(
       sid INTEGER PRIMARY KEY,
	   sname VARCHAR(50),
	   rating INTEGER,
	   age REAL
);

CREATE TABLE Boats(
      bid INTEGER PRIMARY KEY,
	  bname VARCHAR(50),
	  color VARCHAR(20)
);

CREATE TABLE Reserves(
        sid INTEGER,
		bid INTEGER,
		day DATE,
		PRIMARY KEY (sid,bid,day),
		FOREIGN KEY (sid) REFERENCES Sailors(sid),
		FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors (sid, sname, rating, age) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 40),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

INSERT INTO Boats (bid, bname, color) VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');

INSERT INTO Reserves (sid, bid, day) VALUES
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-10-08'),
(22, 104, '1998-10-07'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-06'),
(31, 104, '1998-11-12'),
(64, 101, '1998-09-05'),
(64, 102, '1998-09-08'),
(74, 103, '1998-09-08');

SELECT * FROM Sailors;
SELECT * FROM Boats;
SELECT * FROM Reserves;
 
--1
SELECT  * FROM Sailors s,Reserves r WHERE s.sid=r.sid AND  r.bid=101;

select s.sid, s.sname,s.age from sailors s where s.sid in(
select distinct r.sid from reserves r where r.bid in(

select b.bid from boats b where b.color='red'))
order by s.age;
--2

SELECT s.sid,s.sname from sailors s where s.sid in(
select r.sid from reserves r where r.bid in(
select b.bid from boats b where b.color='red'
))
order by s.age;

--3
SELECT  s.sid,s.sname from sailors s where s.sid in
(select r.sid from reserves r);

--4
SELECT s.sid,s.sname from sailors s where s.sid in
 (select distinct(r1.sid)from reserves r1,reserves r2 
 where r1.sid<>r2.sid and r1.bid<>r2.bid and r1.day=r2.day);

--5
SELECT s.sname 
FROM sailors s
JOIN reserves r ON s.sid = r.sid
WHERE r.bid = 103;

--6
SELECT sname, age 
FROM sailors 
WHERE age = (SELECT MIN(age) FROM sailors);

--7
SELECT sname, rating 
FROM sailors 
WHERE rating > (SELECT MIN(rating) FROM sailors WHERE sname = 'Horatio');


--8
SELECT COUNT(DISTINCT sname) AS unique_sailor_names FROM sailors;

--9
SELECT AVG(age) AS average_age FROM sailors;

--10
SELECT sname, age 
FROM sailors 
WHERE age = (SELECT MIN(age) FROM sailors);

--11
SELECT rating, AVG(age) AS average_age 
FROM sailors 
GROUP BY rating;

--12
SELECT rating, AVG(age) AS average_age 
FROM sailors 
GROUP BY rating 
HAVING COUNT(*) >= 2;

--13
SELECT DISTINCT s.sid 
FROM sailors s
LEFT JOIN reserves r ON s.sid = r.sid
WHERE s.rating >= 8 OR r.bid = 103;

--14
SELECT s.sname 
FROM sailors s
WHERE s.sid NOT IN (
    SELECT r.sid 
    FROM reserves r 
    JOIN boats b ON r.bid = b.bid
    WHERE b.bname LIKE '%storm%'
)
ORDER BY s.sname ASC;

--15
SELECT s.sid 
FROM sailors s
WHERE s.age > 20 
AND s.sid NOT IN (
    SELECT r.sid 
    FROM reserves r 
    JOIN boats b ON r.bid = b.bid
    WHERE b.bname LIKE '%thunder%'
);

--16
SELECT sid 
FROM sailors 
WHERE rating = (SELECT MAX(rating) FROM sailors);