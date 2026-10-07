-- Schema
CREATE TABLE IF NOT EXISTS employees ( 
    employee_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    department VARCHAR(50), 
    salary NUMERIC(10,2), 
    hire_date DATE, 
    manager_id INTEGER, 
    email VARCHAR(100) 
); 

CREATE TABLE IF NOT EXISTS projects ( 
    project_id SERIAL PRIMARY KEY, 
    project_name VARCHAR(100), 
    budget NUMERIC(12,2), 
    start_date DATE, 
    end_date DATE, 
    status VARCHAR(20) 
); 

CREATE TABLE IF NOT EXISTS assignments ( 
    assignment_id SERIAL PRIMARY KEY, 
    employee_id INTEGER REFERENCES employees(employee_id), 
    project_id INTEGER REFERENCES projects(project_id), 
    hours_worked NUMERIC(5,1), 
    assignment_date DATE 
);

-- Task 1.1
SELECT first_name || ' ' || last_name AS full_name,
    department, 
    salary
FROM employees;

-- Task 1.2
SELECT DISTINCT department FROM employees;

-- Task 1.3
SELECT project_name,
    budget,
    CASE
        WHEN budget>150000 THEN 'Large'
        WHEN budget BETWEEN 100000 AND 150000 THEN 'Medium'
        ELSE 'Small'
    END AS budget_category
FROM projects;

-- Task 1.4
SELECT first_name|| ' ' ||last_name AS full_name,
    COALESCE(email, 'No email provided') AS email
FROM employees;

-- Task 2.1
SELECT * FROM employees
    WHERE hire_date > '2020-01-01';

-- Task 2.2
SELECT * FROM employees
    WHERE salary BETWEEN 60000 AND 70000;

-- Task 2.3
SELECT * FROM employees
    WHERE last_name LIKE 'S%'
    OR last_name LIKE 'J%';

-- Task 2.4
SELECT * FROM employees
    WHERE manager_id IS NOT NULL
    AND department = 'IT';

-- Task 3.1
SELECT UPPER(last_name||' '||first_name) AS uppered,
    LENGTH(last_name) as length_of_lastname,
    SUBSTRING(email FROM 1 FOR 3) AS email_prefix
FROM employees;

-- Task 3.2
SELECT 
    salary as Annual_salary,
    ROUND(salary/12.0, 2) as Monthly_salary,
    ROUND(salary*0.1, 2) as raise_amount
FROM employees;

-- Task 3.3
SELECT
    FORMAT('Project: %s - Budget: %s - Status: %s', project_name, budget, status) AS project_summary
FROM projects;

-- Task 3.4
SELECT first_name||' '||last_name as full_name,
    hire_date,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS years_with_company
FROM employees;

-- Task 5.1
SELECT employee_id,
    first_name||' '||last_name AS full_name,
    salary
FROM employees
    WHERE salary>65000

UNION

SELECT employee_id,
    first_name||' '||last_name AS full_name,
    salary
FROM employees
    WHERE hire_date > '2020-01-01';

-- Task 5.2
SELECT first_name||' '||last_name AS full_name
FROM employees
    WHERE department = 'IT'

INTERSECT

SELECT first_name||' '||last_name AS full_name
FROM employees
    WHERE salary>65000;

-- Task 5.3
SELECT employee_id
    FROM employees

EXCEPT

SELECT employee_id
    FROM assignments;

-- Task 6.1
SELECT employee_id,
    first_name||' '||last_name AS full_name
FROM employees e
WHERE EXISTS(
    SELECT 1
    FROM assignments a
    where a.employee_id = e.employee_id
);

-- Task 6.2
SELECT 
    employee_id,
    first_name||' '||last_name as full_name
FROM employees 
WHERE employee_id IN(
    SELECT DISTINCT a.employee_id
    FROM assignments a
    JOIN projects p ON a.project_id = p.project_id
    WHERE p.status = 'Active'
);

-- Task 6.3
SELECT first_name||' '||last_name AS full_name,
    salary
FROM employees
WHERE salary > ANY(
    SELECT salary
    FROM employees
    WHERE department = 'Sales'
);

-- Task 7.1
SELECT 
    e.first_name||' '||e.last_name AS full_name,
    e.department,
    AVG(a.hours_worked) AS avg_hours_worked,
    RANK() OVER(
        PARTITION BY e.department 
        ORDER BY e.salary DESC
    ) AS salary_rank
FROM employees e
LEFT JOIN assignments a 
    ON e.employee_id = a.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department,
    e.salary
ORDER BY e.department, salary_rank;

-- Task 7.2
SELECT p.project_name,
    SUM(a.hours_worked) AS total_hours,
    COUNT(DISTINCT a.employee_id) AS num_of_employee
FROM projects p
JOIN assignments a
    ON p.project_id = a.project_id
GROUP BY p.project_id, p.project_name
HAVING SUM(a.hours_worked) > 150;

-- Task 7.3
SELECT 
    department,
    COUNT(*) AS total_employees,
    AVG(salary) as avg_salary,
    (
        ARRAY_AGG(
            first_name||' '||last_name
            ORDER BY salary DESC
        )
    )[1] AS highest_paid_emp,
    GREATEST(MAX(salary), 0) AS highest_sal,
    LEAST(MIN(salary), 1000000) AS lowest_salary
FROM employees
GROUP BY department
ORDER BY department;