create database groupby;
use groupby;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'HR'),
(5, 'IT');
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees VALUES
(101, 'Alice', 1, 55000, '2021-01-15'),
(102, 'Bob', 2, 60000, '2020-03-10'),
(103, 'Charlie', 1, 52000, '2019-07-23'),
(104, 'David', 3, 75000, '2018-11-12'),
(105, 'Eva', 4, 48000, '2022-06-01'),
(106, 'Frank', 1, 57000, '2021-08-19'),
(107, 'Grace', 2, 62000, '2023-01-05'),
(108, 'Helen', 3, 77000, '2019-02-17'),
(109, 'Ian', 5, 69000, '2020-09-09'),
(110, 'Jane', 5, 72000, '2021-12-12');


select count(*) ,department_id from employees group by department_id;


select count(*) as employeecount , department_name
from departments inner join employees 
using (department_id) group by department_name having employeecount >=1;

select count(*) as employeecount , department_name
from departments inner join employees 
using (department_id) group by department_name ;

select distinct department_name from departments;
select * from departments;


select sum(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name with rollup having totalsalary > 141000 order by totalsalary desc  ;


select sum(salary) from employees;
select max(salary) from employees;


-- Show the total number of employees in each department.

select count(*) as employeecount , department_name
from departments inner join employees 
using (department_id) group by department_name ;

-- Display the average salary of employees in each department.

select avg(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
 
 -- List departments and their highest salary.
  
  select max(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
 
 -- 4 Show the lowest salary in each department.
 
   select min(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
 
 -- 5 Display the department name with the total salary paid to its employees.
 
    select sum(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
 
 
 --  6 List each department and count of employees hired after '2020-01-01'.
 
 select count(employee_id) ,department_name from 
 departments inner join employees using(department_id) 
 where hire_date > '2020-01-01'
 group by department_name;
 
 
 
 -- 7 Show department names and the number of employees whose salary is more than 60000.
 
 
     select sum(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name
 having totalsalary > 60000;
 
 -- -- 8  Display departments where the average salary is greater than 60000.
   select avg(salary) as avgsalary ,department_name
 from departments inner join employees 
 using(department_id) group by department_name
 having avgsalary > 60000;
 
 
 
--  9 Find the total number of departments that have more than 2 employees.

select count(*) as totalemp, department_name from departments inner join employees using(department_id) group by department_name having totalemp >2;


--  10 Show the name of each department along with the sum of salary for employees hired in 2021.

 select sum(salary) as totalsalary ,department_name
 from departments inner join employees 
 using(department_id) 
 where hire_date between "2021-01-01" and "2022-01-01" group by department_name ;
 
 
 
-- 11   List departments and the earliest hire date among their employees.

select min(hire_date) as hiredate ,department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
 
 -- 12 For each department, display the latest hire date and total number of employees.


select max(hire_date) as hiredate ,count(*),department_name
 from departments inner join employees 
 using(department_id) group by department_name;
 
-- 13 Show departments having total salary greater than 150000.

select sum(salary)as total,department_name from departments inner join employees 
using(department_id) group by department_name having total >150000 ;

-- 14 Show department names and average salary of employees whose name starts with 'A' to 'M'.
select avg(salary)as avgs,department_name from departments inner join employees 
using(department_id)  where left(name,1) between "A" and "m" group by department_name;
select * from employees;

select name from employees where left(name,1) between "A" and "m";