# A view is an alternative way of representing data that exists in one or more tables or views.
# A view can include all or some of the columns from one or more base tables or existing views. 
# Creating a view creates a named specification of a results table, which can be queried in the same way as a table. 

use hr;

CREATE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES;

SELECT * FROM EMPSALARY;

CREATE OR REPLACE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE,
MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

SELECT * FROM EMPSALARY;

DROP VIEW EMPSALARY;

SELECT * FROM EMPSALARY; # doswn`t exist

CREATE VIEW EMP_DEPT AS 
SELECT  EMP_ID, F_NAME, L_NAME, DEP_ID from EMPLOYEES;

CREATE OR REPLACE VIEW EMP_DEPT AS
SELECT EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;



 drop view emp_dept;