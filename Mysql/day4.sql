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


