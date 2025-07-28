create database lesson15hw

use lesson15hw


CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);



-- 1. Find Employees with Minimum Salary

select * from employees

select id,name,salary from employees where salary = (select min(salary) from employees)



CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);


-- 2. Find Products Above Average Price

select * from products where price > (select AVG(price) from products)





CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);


-- 3. Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. 
 -- Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)

 select * from employees
 select * from departments

 select * from employees where department_id= (select id from departments where department_name='Sales')




CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);


-- 4. Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

select * from customers
select * from orders

select * from customers where customer_id not in (select distinct customer_id from orders)


drop table products

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);


-- 5. Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)
select * from products

select * from products p1 where p1.price= (select max(price) from products p2 where p2.category_id=p1.category_id)
