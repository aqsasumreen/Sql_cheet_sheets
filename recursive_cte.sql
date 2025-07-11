-- Imp for interview, -> Counting from 1-10 without any function. 
WITH RECURSIVE my_cte AS(
	SELECT 1 AS n        -- base query
    
    UNION ALL
    
    SELECT n+1 FROM my_cte -- recursive query
    WHERE n<5              -- condition
    
)
SELECT * from my_cte;

-- Practice example 

CREATE TABLE employees (
	emp_id serial primary key,
    emp_name varchar(100),
    manager_id INT
);

INSERT INTO employees (
	emp_id, emp_name, manager_id)
Values
	(1, "Madhav", NULL),
    (2, "Sam", 1),
	(3, "Tom", 2),
    (4, "Arjun", 6),
    (5, "Shiva", 4),
    (6, "Keshav", 1),
    (7, "Damodar", 5);


-- Recursive CTE
WITH RECURSIVE EmpCte AS(
	-- base query
	SELECT emp_id, emp_name, manager_id
    from employees
    where emp_id = 7
    
    UNION ALL
    
    -- Recursive Query
    SELECT employees.emp_id, employees.emp_name, employees.manager_id
    from employees
    Join EmpCte
    on employees.emp_id = EmpCte.manager_id -- condition
)

SELECT * from EmpCte;

-- 7	Damodar	5
-- 5	Shiva	4
-- 4	Arjun	6
-- 6	Keshav	1
-- 1	Madhav	null






 