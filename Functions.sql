create database Mysql_Learners ;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

#-------------- BUilt-in Fnctions-------------------
# Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT SUM(COST) FROM PETRESCUE;

# Write a query that displays the maximum quantity of animals rescued (of any kind).

SELECT MAX(QUANTITY) FROM PETRESCUE;
SELECT MIN(QUANTITY) FROM PETRESCUE;

#Write a query that displays the average cost of animals rescued.
SELECT AVG(COST) FROM PETRESCUE;

#---------------Scalar Functions and String Functions--------
# Write a query that displays the rounded integral cost of each rescue.
SELECT ROUND(COST) FROM PETRESCUE; 
# Can also be written as
SELECT ROUND(COST, 0) FROM PETRESCUE;
# In case of 2 values decimal
SELECT ROUND(COST, 2) FROM PETRESCUE;

#Write a query that displays the length of each animal name.
SELECT LENGTH(ANIMAL) FROM PETRESCUE;

# Write a query that displays the animal name in each rescue in uppercase.
SELECT UCASE(ANIMAL) FROM PETRESCUE;

SELECT LCASE(ANIMAL) FROM PETRESCUE;

#-------------- Date Functions -------------
# Write a query that displays the rescue date, Month, year.
SELECT DAY(RESCUEDATE) FROM PETRESCUE;
SELECT MONTH(RESCUEDATE) FROM PETRESCUE;
SELECT YEAR(RESCUEDATE) FROM PETRESCUE;

# Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.
SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

# If the question was to add 2 months to the date, 
SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;

# We can retrieve a date before the one given in the column by a given number using the function DATE_SUB
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

# Write a query that displays the length of time the animals have been rescued, for example, 
# the difference between the current date and the rescue date.

SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE; #returns the present date as known to the server.

SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE;

#The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. 
# Write a query that displays the ID and the target date.

SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM PETRESCUE;
