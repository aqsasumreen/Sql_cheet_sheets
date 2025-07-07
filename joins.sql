# A join operation combines the rows from two or more tables based on a relationship between certain columns in these tables.
# The most common type of join is an inner join. which displays only the rows from two tables that have matching value in a
# common column, usually the primary key of one table that exists as a foreign key in the second table. 

 # Outer joins, like inner joins, return the rows from each table that have matching values in the join columns.
 # Unlike inner joins, outer joins also return the rows that do not have a match between the tables. 
 # SQL offers  three types of outer joins: left outer join, right outer join and full outer join
# LEFT JOIN: Returns all the rows from the left table and matching rows from the right table.
# RIGHT JOIN: Returns all the rows from the right table and matching rows from the left table.
# FULL OUTER JOIN: Returns all the rows when a match in the left or right table.

# Retrieve the names and job start dates of all employees who work for department number 5.
SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
FROM EMPLOYEES  E 
INNER JOIN JOB_HISTORY JH 
ON E.EMP_ID=JH.EMPL_ID 
WHERE E.DEP_ID ='5';

# Retrieve employee ID, last name, department ID, and department name for all employees.
SELECT E.EMP_ID, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME 
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS  D
ON E.DEP_ID = D.DEPT_ID_DEP;

# Retrieve the First name, Last name, and Department name of all employees.
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

UNION

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP;

# Retrieve the names, job start dates, and job titles of all employees who work for department number 5.

select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
where E.DEP_ID ='5';

# Retrieve employee ID, last name, and department ID for all employees but department names for only those born before 1980.
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP
AND YEAR(E.B_DATE) < 1980;

#Retrieve the first name and last name of all employees but department ID and department names only for male employees.

SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'

UNION

SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
from EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';