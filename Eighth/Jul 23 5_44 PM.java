SELECT subject, count(name) FROM student

SELECT subject, count(*) FROM student

//subjects to a student
//philip math
//philip eng

select name,rank() over(partition by name order by subject) as count(rank) from student;

//philip, 2

//duplicate name

select distinct name from student

select name from student
group