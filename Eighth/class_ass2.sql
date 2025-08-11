CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt NUMERIC(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5003),
(70013, 3045.60, '2012-04-25', 3002, 5001);
select * from orders;

--1
select sum(purch_amt) from orders;
--2
select avg(purch_amt) from orders;
--3
select count(distinct salesman_id) from orders;
select distinct salesman_id from orders;
--4
select max(purch_amt) from orders;
--5
select min(purch_amt) from orders;
--6
select customer_id,max(purch_amt)as highest_purch_amt 
from orders group by customer_id
order by customer_id;
--7
select customer_id,ord_date,max(purch_amt)as  highest_purch_amt 
from orders group by customer_id,ord_date
order by ord_date;
--8
select salesman_id, max(purch_amt) from orders where ord_date='2012-08-17' 
group by salesman_id;
--9
select customer_id, ord_date, max(purch_amt) from orders
where purch_amt>2000
group by customer_id,ord_date;
--10
select customer_id, ord_date, max(purch_amt) from orders
where purch_amt>=2000 and purch_amt<=6000
group by customer_id,ord_date;
--10 alternate
SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;
--11
SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) IN (2000, 3000, 5760, 6000);
--12
SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;
--13
SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING MAX(purch_amt) > 1000;
--14
SELECT salesman_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id;
--15
SELECT COUNT(*) AS total_orders
FROM orders
WHERE ord_date = '2012-08-17';
--16
SELECT ord_date, salesman_id, COUNT(*) AS total_orders
FROM orders
GROUP BY ord_date, salesman_id;