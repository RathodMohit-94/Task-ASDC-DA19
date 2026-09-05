--Lecture 6 

USE ASDC ;

--Task 1

select * from Customers;
select * from Orders;
select * from Products;
select * from Employees;
select * from Departments;

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_purchase,
	AVG(o.amount) as AVG_order_value
from Customers as c 
join Orders as o
on c.customer_id = o.customer_id
group by 
	c.customer_id,
	c.customer_name,
	c.city
Having 
SUM(o.quantity * o.amount) > 75000 AND COUNT(o.quantity) >= 3 
order by total_purchase desc;


--Task 2

select 
	c.city,
	COUNT(DISTINCT c.customer_id) as total_customer,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity*o.amount) as total_sales,
	AVG(o.amount*o.amount) as average_order_value
from Customers as c 
join Orders as o 
	on c.customer_id = o.customer_id
group by 
	c.city
having 
	SUM(o.quantity * o.amount) > 100000 
order by total_sales desc;


--Task 3

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.amount * o.quantity) as total_Purchase_value,
	MAX(o.amount * o.quantity) as Highest_amount
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id 
group by 
	c.customer_id,
	c.customer_name,
	c.city
Having 
	MAX(o.amount * o.quantity) > 25000 AND
	SUM(o.amount * o.quantity) > 50000
order by total_Purchase_value desc;

/*select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.amount * o.quantity) as total_Purchase_value,
	MAX(o.amount * o.quantity) as Highest_amount
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id 
WHERE 
	o.amount > 25000
group by 
	c.customer_id,
	c.customer_name,
	c.city
Having 
	SUM(o.amount * o.quantity) > 50000
order by total_Purchase_value desc;
*/

--Task 4

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_purchase_value,
	AVG(o.quantity * o.amount) as average_order_value
from Customers as c
join Orders as o
	on c.customer_id = o.customer_id
group by
	c.customer_id,
	c.customer_name,
	c.city
having 
	COUNT(o.order_id) > 4 
order by
	total_orders,total_purchase_value desc;



--Task 5


select 
	o.product_name,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_revenue,
	AVG(o.amount * o.quantity) as average_order_amount,
	MAX(o.amount * o.quantity) as highest_amount
from Customers as c
join Orders as o
	on c.customer_id = o.customer_id
group by
	o.product_name
HAVING
	count(o.order_id) > 3 
order by 
	total_revenue desc;



--Task 6

select 
	o.product_name,
	SUM(o.quantity) as total_quantity,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity * o.amount) as total_revenue
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id 
group by
	o.product_name
having 
	SUM(quantity) > 100
 	AND
	COUNT(o.order_id) > 5 ;


--Task 7

select 
	c.city,
	COUNT(c.customer_id) as total_customer,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_revenue
from Customers as c
join Orders as o
	on c.customer_id = o.customer_id 
group by 
	c.city
having 
	COUNT(c.customer_id) > 3 AND
	COUNT(o.order_id) > 5 AND
	SUM(o.quantity * o.amount) > 200000 
order by total_revenue desc;



--Task 8 

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	MIN(o.amount * o.quantity) as minimum_order_value,
	MAX(o.amount * o.quantity) as maximum_order_value,
	AVG(o.amount * o.quantity) as average_order_value,
	SUM(o.amount * o.quantity) as total_revenue
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id 
Group by 
	c.customer_id,
	c.customer_name,
	c.city
HAVING 
	COUNT(o.order_id) >= 3
	;

--Task 9

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_purchase_value
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id
Group By 
	c.customer_id,
	c.customer_name,
	c.city
Having
	COUNT(o.order_id) >= 5 
order by
	total_orders desc;



--Task 10 

select 
	c.customer_id,
	customer_name,
	city,
	COUNT(order_id) as number_of_orders,
	SUM(amount * quantity) as total_purchase_value
FROM Customers as c 
join Orders as o
	on c.customer_id = o.customer_id
Group by 
	c.customer_id,
	customer_name,
	city
Having 
	COUNT(order_id) < 3 
order by total_purchase_value desc;


--Task 11

select 
	c.customer_id,
	c.customer_name,
	c.city,
	count(o.order_id) as number_of_orders,
	SUM(o.quantity) as total_quantity ,
	SUM(o.quantity * o.amount) as total_purchase_value
from Customers as c 
left join Orders as o 
	on c.customer_id = o.customer_id 
Group by 
	c.customer_id,
	c.customer_name,
	c.city



--Task 12

select 
	c.customer_id,
	c.customer_name,
	c.city
from Customers as c
left Join Orders as o
	on c.customer_id=o.customer_id
where 
	o.order_id is null ;


--Task 13

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as num_orders,
	SUM(o.quantity * o.amount) as total_purchase_amount
from Customers as c
 left join Orders as o
on c.customer_id = o.customer_id 
Group by 
	c.customer_id,c.customer_name,c.city

-- Can use COALESCE for 0 instead of null like : 
--  COALESCE(SUM(o.quantity * o.amount),0) as total_purchase_amount

--Task 14
	
select 
	p.product_id,
	p.product_name,
	p.category,
	p.price
from Products as p
left join Orders as o
	on o.product_name = p.product_name
where 
	o.order_id is null ;


--Task 15 

select 
	c.customer_id,
	c.customer_name,
	c.city,
	o.order_id,
	o.product_name,
	o.quantity,
	o.amount
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id


--Task 16 

select 
	c.customer_id,
	c.customer_name,
	o.order_id,
	o.product_name,
	o.amount
from Customers as c 
full join Orders as o 
	on c.customer_id = o.customer_id
where 
	o.order_id is null 
	OR 
	c.customer_id is null


--Task 17 

select 
	c.customer_id,
	c.customer_name,
	c.city,
	o.order_id,
	o.product_name,
	o.quantity,
	o.amount,
	(o.quantity * o.amount) as trans_amount
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id ;


--Task 18 

select 
	c.customer_id,
	c.customer_name,
	c.city
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id
where o.order_id is null ;

SELECT c.customer_id, c.customer_name, c.city
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id
);

--Task 19

select 
	p.product_id,
	p.product_name,
	p.category,
	p.price
from Products as p
full join Orders as o
on p.product_name = o.product_name
where order_id is null;


--Task 20 

select 
	c.customer_id,
	c.customer_name,
	c.city
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id
where o.order_id is null ;
--Same as 18

--Task 21

select 
	p.product_id,
	p.product_name,
	p.category,
	p.price
from Products as p
full join Orders as o
on p.product_name = o.product_name
where order_id is null;
--same as Task 19


--Task 22

select 
	customer_id,
	customer_name,
	city,
	product_id,
	product_name,
	category
from Customers 
cross join Products  



--Task 23


select 
(select 
	COUNT(customer_id)
	from Customers) * 
(select
	count(product_id)
	from Products
	)
 as Total_combination ;



 --Task 24

 select 
(select 
	COUNT(DISTINCT city)
	from Customers) * 
(select
	count(product_name)
	from Products
	)
 as Total_combination;


--Task 25

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as total_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.amount * o.quantity) as total_revenue,
	AVG(o.amount * o.quantity) as average_order_value,
	MAX(o.amount * o.quantity) as minimum_order_value
from Customers as c
join Orders as o 
	on c.customer_id = o.customer_id 
Group by 
	c.customer_id,
	c.customer_name,
	c.city
HAVING 
	COUNT(o.order_id) >= 3
order by 
	total_revenue desc,
	total_orders desc,
	average_order_value 
	desc;




--Task 26


select 
	o.product_name,
	COUNT(o.order_id) as num_orders,
	SUM(o.quantity) AS total_quantity,
	SUM(o.quantity * o.amount) as total_revenue,
	AVG(o.quantity * o.amount) as avg_order_value,
	MAX(o.quantity * o.amount) as maximum_order_value
from Orders as o
group by 
	o.product_name
HAVING 
	COUNT(o.order_id) > 5 AND SUM(o.quantity * o.amount) > 200000


--Task 27

select
	c.city,
	COUNT(c.customer_id) as num_customer,
	COUNT(o.order_id) as num_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_revenue,
	avg(o.quantity * o.amount)  as average_order_value
from Customers as c
full join Orders as o
	on c.customer_id = o.customer_id
Group by 
	c.city
Having
	COUNT(c.customer_id) >= 5 AND
	COUNT(o.order_id) > 10 AND
	SUM(o.quantity * o.amount) > 500000 ;

--Task 28

select 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) as orders,
	SUM(o.amount * o.quantity) as total_value
from Customers as c
join Orders as o
on c.customer_id = o.customer_id
WHERE 
	(o.amount * o.quantity) > 25000 
Group by 
	c.customer_id,
	c.customer_name,
	c.city
HAVING
	COUNT(o.order_id) >= 2 
Order By total_value desc ;


--Task 29

select 
	o.product_name ,
	COUNT(o.order_id) as num_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_revenue,
	AVG(o.quantity * o.amount) as average_order_value
from Orders as o
group by 
	o.product_name 
HAVING
	SUM(o.quantity) > 100
	AND 
	SUM(o.quantity * o.amount) > 100000
	AND
	COUNT(o.order_id) >= 5 ;


--Task 30


select 
	c.customer_id,c.customer_name,c.city,
	COUNT(o.order_id) as num_orders,
	SUM(o.quantity) as total_quantity,
	SUM(o.quantity * o.amount) as total_purchase_value,
	AVG(o.amount * o.quantity) as average_order_value,
	MIN(o.amount * o.quantity) as minimum_order_value,
	MAX(o.amount * o.quantity) as maximum_order_value
from Customers as c
 join Orders as o
 on c.customer_id = o.customer_id
 Group By 
	c.customer_id,
	c.customer_name,
	c.city
HAVING
	COUNT(o.order_id) >= 3
	AND
	SUM(o.quantity * o.amount) > 100000 
order by 
		total_purchase_value desc;

----ALL TASK COMPLETED OF LECTURE 6 ----