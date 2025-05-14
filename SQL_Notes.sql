create database lecture01;		-- creation
create database if not exists lecture01;		-- will create only if the database is not present
drop database lecture01;		-- deletion
drop database if exists lecture001;		-- deletes database only if exists

-- '=' used for single value & 'in' used for multiple value

/* -- topic_01
create database topic_01;
use topic_01;		-- tu select particular db
	create table studentInfo(
		id int primary key,		-- unique and not null value
		naam varchar(20),
		age int check (age >= 18),		-- will return error if condition is false
		registration_no int unique,		-- unique value needed else return error
		gender varchar(10)
	);
	insert into studentInfo values(1, "Tejas", 21, 22070794, "Male");
	insert into studentInfo values(2, "Shraddha" , 18, 2209754, "Female");
    insert into studentInfo values(3, "Saee" , 16, 2209765, "Female");
	select * from studentInfo;
    select naam, registration_no from studentInfo;		-- return value of mentioned column only
    select distinct gender from studentInfo;		-- does not return duplicate value from the column
	drop table studentInfo;

	create table employee (
	sr_no int primary key,
    company_code int default 12321,		-- set default integer value
	naam varchar(20),
	salary int not null		-- value must be assigned
	);
    insert into employee 
    (sr_no, naam, salary)		-- no need to mention default column
    values
    (1, "Sham", 25000),
    (2, "Ghansham", 30000);
    select * from employee;
*/    
    
/* -- topic_02
create database topic_02;
use topic_02;    
	create table school (
		roll_no int primary key,
        reg_no int unique,
        naam varchar(20),
        marks int not null,
        -- city varchar(50) DEFAULT 'Nagpur'
        city varchar(50)
    );
    insert into 
    school(roll_no, reg_no, naam, marks, city)
    values
    (101, 111, "Tejas", 95, "Nagpur"),
    (102, 222, "Aditya", 78, "Mumbai"),
    (103, 333, "Rahul", 90, "Nagpur"),
    (104, 444, "Ram", 88, "Delhi"),
    (105, 555, "Sham", 85, "Mumbai");
    select * from school ;
    
   
		-- General order:-
			-- select
            -- from
            -- where
			-- group by 
			-- having
			-- order by
			-- asc / desc
    
    
    -- Clauses
		select * from school where (marks >= 80);		-- 'where' clause return only those row which fulfills the condition
		select * from s where marks between 75 and 85;
		select * from school where city in ('Mumbai', 'Delhi');
		select * from school where city not in ('Mumbai', 'Delhi');
		select * from school limit 2;
		select * from school order by marks asc;
		select * from school order by marks desc;
        
	-- Aggragate Functions
		select count(marks) from school;
        select min(marks) from school;
        select max(marks) from school;
		select sum(marks) from school;
        select avg(marks) from school;
   
   -- Clause + Aggregte function
		 select city, sum(marks) from school group by city;
         select city, sum(marks) from school group by city order by city asc;
         select city, sum(marks) from school group by city order by city desc;
         select city, count(roll_no) from school group by city having max(marks)>80;
        
	drop table school;
*/
    
/* -- topic_03
create database topic_03;
use topic_03;
	create table college (
		roll_no int primary key,
        reg_no int unique,
        naam varchar(20),
        marks int not null,
        grade varchar(2),
        -- city varchar(50) DEFAULT 'Nagpur'
        city varchar(50)
    );
    insert into 
    college(roll_no, reg_no, naam, marks, grade, city)
    values
    (101, 111, "Tejas", 95, 'A', "Nagpur"),
    (102, 222, "Aditya", 78, 'C', "Mumbai"),
    (103, 333, "Rahul", 90, 'B', "Nagpur"),
    (104, 444, "Ram", 88, 'A', "Delhi"),
    (105, 555, "Sham", 85, 'A', "Mumbai");
    select * from college;
    SET SQL_SAFE_UPDATES = 0;
    update college set grade = 'O' where grade = 'A';
    select * from college;
    delete from college where marks<80;
    select * from college;
    
    drop table college;
    */
    
/* -- topic_04   
create database topic_04;
use topic_04;
	create table dept (
		id int primary key,
        name varchar(15)
    );
    insert dept value
    (101, "Science"),
	(102, "Arts"),
    (103, "Commerce");
    delete from dept where id = 102;
	select * from dept;
    create table teacher (
		id int primary key,
        name varchar(15),
        dept_id int,
        foreign key (dept_id) 
        references dept(id) 
        on update cascade 
        on delete cascade
    );
    insert teacher value
    (1, "Desai", 103),
    (2, "Thote", 101),
    (3, "Kamble", 102);
    select * from teacher;
*/

/* -- topic_05
create database topic_05;
use topic_05;
	create table school (
		roll_no int primary key,
        reg_no int unique,
        naam varchar(20),
        marks int not null,
        -- city varchar(50) DEFAULT 'Nagpur'
        city varchar(50)
    );
    insert into 
    school(roll_no, reg_no, naam, marks, city)
    values
    (101, 111, "Tejas", 95, "Nagpur"),
    (102, 222, "Aditya", 78, "Mumbai"),
    (103, 333, "Rahul", 90, "Nagpur"),
    (104, 444, "Ram", 88, "Delhi"),
    (105, 555, "Sham", 85, "Mumbai");
    select * from school;
    alter table school add column age int;
    alter table school drop column age;
    alter table school rename to college;
    alter table college change column age vay int;
    alter table college modify vay varchar(10);
    select * from college;
*/

/* -- topic_06
	-- inner join
    -- outer join
		-- left join
        -- right join
        -- full join
	-- left exclusive join
    -- right exclusive join
    -- self join
    -- union - return only unique value
    -- union all - return both unique & duplicates value 
 
create database topic_06;
use topic_06;
	create table courses (
		id int primary key,
        course varchar(20)
    );
    insert courses values
    (101, "English"),
    (202, "Marathi"),
    (303, "Hindi"),
    (404, "Chinese");
	create table student (
		id int primary key,
        naam varchar(20)
    );
	insert student values
    (101, "Tejas"),
    (102, "Rahul"),
    (202, "Prachi"),
    (203, "Anvi"),
    (302, "Tina"),
    (303, "Shrawika");
    select * from courses as c		-- 'c' is the alias of coursees 
    inner join student as s
    on c.id = s.id;
	select * from courses
    left join student
    on courses.id = student.id;
    select * from courses
    right join student
    on courses.id = student.id;
	select * from courses
    left join student
    on courses.id = student.id
    union
    select * from courses
    right join student
    on courses.id = student.id;
    select * from courses	-- l e j
    left join student 
    on courses.id = student.id
    where student.id is null;
    select * from courses	-- r e j
    right join student
    on courses.id = student.id
    where courses.id is null;
    create table heirarchy (
		id int primary key,
        naam varchar(20),
        manager_id int
    );
    insert heirarchy values
    (101, "Tejas", 103),
    (102, "Anvi", 101),
    (103, "Prachi", null),
    (104, "Tina", 103);
    select *
    -- select a.naam as manager, b.naam as employee
    from heirarchy as a
    join heirarchy as b
    on a.id = b.manager_id;
    create table heirarchy1 (
		id int primary key,
        naam varchar(20),
        age int
    );
    insert heirarchy1 values
    (101, "Tejas", 21),
    (103, "Prachi", 21),
    (104, "Tina", 22),
    (105, "Tejas", 20);
    select naam from heirarchy
    union
    select naam from heirarchy1;
	select naam from heirarchy
    union all
    select naam from heirarchy1;
*/
    
/* -- topic_07
create database topic_07;
use topic_07;
	create table result (
		roll_no int primary key,
		naam varchar(20),
		marks int
	);
	insert result values
	(257, "Tejas", 96),
	(258, "Tejas", 80),
	(259, "Uday", 78),
	(260, "Vansh", 67);
    select avg(marks) from result;
    select naam from result
    where marks > (select avg(marks) from result);		-- SQL Sub Queries
	select  roll_no from result
    where (roll_no % 2 = 0);
    select naam from result 
    where roll_no in (select roll_no from result where (roll_no % 2 = 0));
	create table college (							
		roll_no int primary key,
        reg_no int unique,
        naam varchar(20),
        marks int not null,
        grade varchar(2),
        -- city varchar(50) DEFAULT 'Nagpur'
        city varchar(50)
    );
    insert into 
    college(roll_no, reg_no, naam, marks, grade, city)
    values
    (101, 111, "Tejas", 95, 'A', "Nagpur"),
    (102, 222, "Aditya", 78, 'C', "Mumbai"),
    (103, 333, "Rahul", 90, 'B', "Nagpur"),
    (104, 444, "Ram", 88, 'A', "Delhi"),
    (105, 555, "Sham", 85, 'A', "Mumbai");
    select * from college;
    create view v as		
    -- View is a concept in which we can create a small version of table (selected cols only).
    -- We can apply queries on view which does not affect the original table and it is also known as 'virtual table'.
    select roll_no, reg_no, naam, marks, grade from college;
	select naam from v
    where marks >= 85;
	drop view v;
*/
    
show databases;
show tables;