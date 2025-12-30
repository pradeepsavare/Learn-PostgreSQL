CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    salary NUMERIC(10,2),
    is_active BOOLEAN DEFAULT true
);

drop table users;

alter table employees rename column name to emp_name;

alter table employees rename to emp;

INSERT INTO emp (emp_name, email, age, salary, is_active)
VALUES
('Ravi Sharma', 'ravi.sharma@gmail.com', 28, 52000.00, true),
('Sneha Patil', 'sneha.patil@gmail.com', 26, 48000.75, true),
('Rahul Verma', 'rahul.verma@gmail.com', 35, 75000.00, true),
('Neha Singh', 'neha.singh@gmail.com', 24, 40000.00, true),
('Karan Mehta', 'karan.mehta@gmail.com', 29, 58000.25, true),
('Pooja Desai', 'pooja.desai@gmail.com', 32, 67000.00, false),
('Ankit Jain', 'ankit.jain@gmail.com', 27, 50000.00, true),
('Divya Kulkarni', 'divya.k@gmail.com', 31, 62000.00, true);


select * from emp;

SELECT * FROM emp
WHERE emp_name = 'Pradeep Savare';

SELECT * FROM emp
WHERE age > 25;

SELECT * FROM emp
WHERE salary >= 50000;

SELECT * FROM emp
WHERE age > 25 AND is_active = true;

SELECT * FROM emp
WHERE age < 25 OR salary > 60000;

SELECT * FROM emp
WHERE NOT is_active;

SELECT * FROM emp
WHERE salary BETWEEN 40000 AND 60000;

SELECT * FROM emp
WHERE emp_name IN ('Pradeep Savare', 'Amit Kumar');

SELECT * FROM emp
WHERE email LIKE '%@gmail.com';

SELECT * FROM emp
WHERE emp_name LIKE 'P%';

SELECT * FROM emp
WHERE salary IS NULL;

SELECT * FROM emp
WHERE is_active = true
ORDER BY salary DESC;

SELECT * FROM emp
WHERE age >= 25
LIMIT 2;

INSERT INTO department (dept_name)
VALUES
('HR'),
('IT'),
('Finance'),
('Marketing');


SELECT
  d.dept_name,
  e.emp_name,
  e.salary
FROM department d
LEFT JOIN emp e
ON d.dept_id = e.dept_id;

SELECT
  e.emp_name,
  e.salary,
  d.dept_name
FROM department d
RIGHT JOIN emp e
ON d.dept_id = e.dept_id;










