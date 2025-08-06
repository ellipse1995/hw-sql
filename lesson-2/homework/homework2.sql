create database homework2

use homework2

-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
create table Employees (EmpId int, name VARCHAR(50), Salary decimal (10,2))


-- 2.Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
insert into employees values (1, 'Amal', 1000000)
insert into employees values (2, 'Bobur', 2000000)

insert into employees values (3, 'Xurshid', 400000),(4,'Ikrom', 1500000), (5, 'Elyor', 120000)

-- 3. Update the Salary of an employee to 7000 where EmpID = 1.
update Employees set Salary=7000 where EmpId=1

-- 4. Delete a record from the Employees table where EmpID = 2.

delete from Employees where EmpId=2

-- 5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.

Function delete deletes rows from the tables
Function truncate delete all data from the table
Function drop delete whole table 

-- 6. Modify the Name column in the Employees table to VARCHAR(100)

alter table employees alter column name varchar(100)

-- 7.Add a new column Department (VARCHAR(50)) to the Employees table.

alter table employees add Department varchar (50)

-- 8. Change the data type of the Salary column to FLOAT

alter table employees alter column salary float

-- 9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).

create table Departments (departmentID int primary key, departmentname varchar(50))

-- 10. Remove all records from the Employees table without deleting its structure.

truncate table employees

-- 11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).

insert into Departments (departmentID,departmentname)
select 1, 'Priemnaya' union all
select 2, 'Accounting' union all
select 3, 'Finance' union all
select 4, 'HR' union all
select 5, 'PR'

-- 12. Update the Department of all employees where Salary > 5000 to 'Management'.

update Employees set department = 'Management' where Salary>5000

-- 13. Write a query that removes all employees but keeps the table structure intact.

truncate table employees

-- 14. Drop the Department column from the Employees table. 

alter table employees drop column Department 

-- 15. Rename the Employees table to StaffMembers using SQL commands.

exec sp_rename 'employees', 'StaffMembers'

-- 16. Write a query to completely remove the Departments table from the database.

drop table Departments
