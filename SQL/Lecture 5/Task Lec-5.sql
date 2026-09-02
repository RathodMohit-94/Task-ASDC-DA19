-- Create Database
Create DATABASE JoinPracticeDB;


-- Select Database
USE JoinPracticeDB;



-- CREATE CUSTOMERS TABLE

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);


-- INSERT CUSTOMERS

INSERT INTO Customer
(customer_id, customer_name, city, country)
VALUES
(1, 'Rahul Sharma', 'Ahmedabad', 'India'),
(2, 'Priya Patel', 'Mumbai', 'India'),
(3, 'Amit Shah', 'Delhi', 'India'),
(4, 'Neha Mehta', 'Pune', 'India'),
(5, 'Rohan Desai', 'Surat', 'India'),
(6, 'Karan Joshi', 'Jaipur', 'India'),
(7, 'Sneha Patel', 'Bangalore', 'India'),
(8, 'Vikas Shah', 'Vadodara', 'India'),
(9, 'Anjali Singh', 'Delhi', 'India'),
(10, 'Raj Malhotra', 'Chennai', 'India');


-- CREATE ORDERS TABLE

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);


-- INSERT ORDERS

INSERT INTO Orders
(order_id, customer_id, product_name, quantity, amount)
VALUES
(101, 1, 'Laptop', 1, 55000.00),
(102, 2, 'Mobile', 2, 30000.00),
(103, 3, 'Keyboard', 3, 4500.00),
(104, 4, 'Monitor', 1, 18000.00),
(105, 5, 'Mouse', 5, 2500.00),
(106, 6, 'Printer', 1, 12000.00),
(107, 7, 'Laptop Bag', 2, 3000.00),
(108, 11, 'Tablet', 1, 25000.00),
(109, 12, 'Headphones', 2, 6000.00),
(110, 13, 'Smart Watch', 1, 8000.00);


-- VIEW TABLES

SELECT * FROM Customer;

SELECT * FROM Orders;

--Task 1

select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c
inner join Orders as o 
on c.customer_id = o.customer_id ;

--Task 2

select 
    c.customer_name,
    c.city,
    o.product_name ,
    o.amount
from Customer as c
inner join Orders as o
on c.customer_id = o.customer_id ;

--Task 3 

select 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c 
left join Orders as o 
on c.customer_id = o.customer_id ;

--Task 4 

select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id
from Customer as c
left join Orders as o 
on c.customer_id = o.customer_id 
where o.order_id is null


--Task 5 

select
    o.order_id,
    c.customer_id,
    c.customer_name,
    o.product_name,
    o.amount
from Customer as c 
right join Orders as o 
on c.customer_id = o.customer_id 


--Task 6 
select 
    o.order_id,
    c.customer_id,
    o.product_name,
    o.amount
from Customer as c 
right join Orders as o 
on c.customer_id = o.customer_id
where c.customer_id is null

--Task 7

select 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c
full outer join Orders as o 
on c.customer_id = o.customer_id;

--Task 8

select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c
inner join Orders as o 
on c.customer_id = o.customer_id
where o.amount > 10000;

--Task 9

select 
    c.customer_name,
    o.order_id,
    c.city,
    o.product_name,
    o.amount
from Customer as c
inner join Orders as o 
on c.customer_id = o.customer_id
where c.city = 'Delhi' ;


--Task 10 

select 
    c.customer_name,
    o.product_name,
    o.quantity,
    o.amount
from Customer as c
inner join Orders as o 
on c.customer_id = o.customer_id
where o.quantity > 2
order by quantity desc;

--Taks 11

select 
    c.customer_id,
    c.customer_name,
    SUM(o.amount) as T_Amount
from
    Customer as c
left join Orders as o 
on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name;

--Task 12

select 
    c.customer_id,
    c.customer_name,
    count(o.order_id) as count_order
from Customer as c
left join Orders as o 
on c.customer_id = o.customer_id 
group by 
    c.customer_id,
    c.customer_name;     

--Task 13

select 
c.customer_name,
AVG(o.amount) as Avg_Amount 
from Customer as c
inner join Orders as o 
on c.customer_id = o.customer_id 
group by c.customer_name
order by Avg_Amount desc ;

--Task 14

select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c
Inner join Orders as o 
on c.customer_id = o.customer_id 
where c.customer_name is not null
order by o.amount desc;

--Task 15

select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer as c
Inner join Orders as o 
on c.customer_id = o.customer_id 
order by o.amount asc;

--Task 16

select 
    c.customer_id,
    c.customer_name,
    count(o.order_id) as No_Orders,
    SUM(o.quantity) as t_Quantity,
    SUM(o.amount) as t_amount
from Customer as c
left join Orders as o 
on c.customer_id = o.customer_id 
group by 
    c.customer_id,
    c.customer_name ;

 
 --Task 17

select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.amount,
    SUM(o.amount) as t_amt
from Customer as c
    left join Orders as o 
on 
    c.customer_id = o.customer_id 
group by 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.amount
having 
    SUM(o.amount) > 20000;

select * from Customer
full join Orders 
on Customer.customer_id = Orders.customer_id

--Task 18

select 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) as no_orders
From 
    Customer as c
    inner join orders as o
on 
    c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name
Having 
    COUNT(o.order_id)> 1


--Task 19(1)

SELECT 
    c.customer_id AS customer_table_id,
    c.customer_name,
    o.order_id,
    o.amount,
    CASE 
        WHEN c.customer_id IS NOT NULL AND o.order_id IS NOT NULL 
            THEN 'Customer with Order'
        WHEN c.customer_id IS NOT NULL AND o.order_id IS NULL 
            THEN 'Customer without Order'
        WHEN c.customer_id IS NULL AND o.order_id IS NOT NULL 
            THEN 'Orphan Order (No Customer)'
    END AS record_status
FROM Customer AS c
FULL OUTER JOIN Orders AS o 
    ON c.customer_id = o.customer_id;


select 
    c.customer_id as C_tabel_id,
    c.customer_name,
    c.city,
    c.country,
    o.order_id,
    o.product_name,
    o.amount,
    o.quantity,
    CASE
        WHEN c.customer_id is not null and o.order_id is not null
            then 'Customer With Orders'
        when c.customer_id is not null and o.order_id is null
            then 'Customer without Orders'
        when c.customer_id is null and o.order_id is not null
            then 'Orders without customers'
    end as records
from 
    Customer as  c
full outer join 
    Orders as o
on c.customer_id = o.customer_id




--Task 20


select 
    c.customer_id as C_tabel_id,
    c.customer_name,
    c.city,
    c.country,
    o.order_id,
    o.product_name,
    o.amount,
    o.quantity,
    (o.amount*o.quantity) as total_amount,
    CASE
        WHEN c.customer_id is not null and o.order_id is not null
            then 'Customer With Orders'
        when c.customer_id is not null and o.order_id is null
            then 'Customer without Orders'
        when c.customer_id is null and o.order_id is not null
            then 'Orders without customers'
    end as records
from 
    Customer as  c
full outer join 
    Orders as o
on c.customer_id = o.customer_id;