create database homework17

use homework17

-- 1. You must provide a report of all distributors and their sales by region. 
-- If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. 
-- Assume there is at least one sale for each region

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);


select a.Region,b.Distributor,iif(c.Sales is null,0,c.sales) Sales from (select distinct region from #RegionSales) a cross join (select distinct Distributor from #RegionSales) b
left join #RegionSales c on a.Region=c.Region and b.Distributor=c.Distributor

-- 2. Find managers with at least five direct reports

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

select * from Employee

with cte as (
select *, COUNT(managerid) over (order by managerid) as Managers from Employee
)
select name from cte where id in (select managerid from cte where Managers>=5)


-- 3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);


select * from Products
select * from Orders

select b.product_name,sum(a.unit) as TotalUnit from Orders a 
join products b on a.product_id=b.product_id 
where a.order_date between '2020-02-01' and '2020-02-29' 
group by b.product_name
having sum(a.unit)>=100
