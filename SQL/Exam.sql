--Task 1 

select * from Orders ;


select 
	c.customer_name,
	c.city,
	c.customer_segment,
	o.order_id,
	o.order_date,
	o.order_status
from Customers as c 
join Orders as o  
on c.customer_id = o.customer_id
where o.order_date between '2025-01-01' AND '2025-12-31'




--Task 2 

select * from Customers ;

select 
	c.customer_name,
	c.city,
	c.customer_segment
from Customers as c
where c.state  = 'Gujarat' AND 
	c.customer_segment IN ('Enterprise','Premium') ;

--Task 3

select * from Products ;


select * 
from Products 
where unit_price Between 5000 AND 20000
order by unit_price desc;

--Task 4
 

 select 
	order_id,
	customer_id,
	product_id,
	quantity,
	order_date
 from Orders
 where 
	quantity > 4 

--task5 

select top 5 
	product_name,
	category,
	unit_price
from Products 
order by unit_price desc ;



--Task 6 

select 
	customer_segment,
	COUNT(customer_id) as total_Customers
from Customers 
group by customer_segment


--Task 7 


select 
	Products.product_name,
	SUM(quantity) as Ordered_count
from Orders 
join Products 
on Orders.product_id = Products.product_id
Group By 
	Products.product_name


--Task 8 

select
	category,
	AVG(unit_price) as avg_price
from Products
group by category 
order by avg_price;

--TAsk 9

select
	category,
	AVG(unit_price) as avg_price
from Products
group by category
HAVING AVG(unit_price) > 10000
order by avg_price desc;

--Task 10 

select 
	customer_id,
	COUNT(order_id) as order_count
from Orders 
Group by 
	customer_id 
Having
	COUNT(order_id) >=  3	



--Task 11 

select 
	c.customer_name,
	o.order_id,
	p.product_name,
	o.quantity,
	p.unit_price
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Products as p  
on p.product_id = o.product_id


--task 12 


select 
	c.customer_name,
	o.order_id,
	p.product_name,
	o.quantity,
	p.unit_price,
	SUM(o.quantity * p.unit_price) as total_value
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Products as p  
on p.product_id = o.product_id
Group by 
	c.customer_name,
	o.order_id,
	p.product_name,
	o.quantity,
	p.unit_price



--task 13 


select 
	c.customer_id,
	SUM(o.quantity * p.unit_price) as total_Sales
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Products as p  
on p.product_id = o.product_id
Group By 
	c.customer_id


--task 14


select 
	p.category,
	SUM(o.quantity * p.unit_price) as total_Sales
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Products as p  
on p.product_id = o.product_id
Group By 
	p.category


--task 15 

select 
	e.employee_name,
	e.department,
	COUNT(o.order_id) AS order_count
From Employees as e 
inner join Orders as o  
on e.employee_id = o.sales_employee_id
group by 
	e.employee_name,
	e.department

select *
from Employees;

select *
from Orders;

--task 16 
select 
	e.employee_name,
	e.department,
	COUNT(o.order_id) AS order_count
From Employees as e 
inner join Orders as o  
on e.employee_id = o.sales_employee_id
group by 
	e.employee_name,
	e.department
Having 
	COUNT(o.order_id) > 8


--task 17 
	
select 
	c.customer_name,
	o.order_id,
	o.order_status
from Customers as c 
full join Orders as o
on c.customer_id = o.customer_id


-- task 18 

select 
	c.customer_name,
	o.order_id,
	o.order_status
from Customers as c 
left join Orders as o
on c.customer_id = o.customer_id
where o.order_id is null

-- task 19 

select 
	p.product_id,
	p.product_name,
	p.category
from Products as p 
left join Orders as o
on p.product_id = o.product_id
where o.order_id is null

--task 20

select 
	p.product_id,
	p.product_name,
	p.category,
	COUNT(o.order_id) as order_count
from Products as p 
left join Orders as o
on p.product_id = o.product_id
Group by
	p.product_id,
	p.product_name,
	p.category
order by 
	order_count desc;


--task 21

select 
	c.customer_id,
	C.customer_name,
	SUM(o.quantity * p.unit_price) as total_Sales
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Products as p  
on p.product_id = o.product_id
GROUP BY 
	C.customer_id,
	c.customer_name
Having 
	SUM(o.quantity * p.unit_price) > 150000
order by total_Sales desc;


--task 22

select 
	c.customer_id,
	C.customer_name,
	COUNT(DISTINCT o.order_id) as completed_count,
	COALESCE(SUM(o.quantity * p.unit_price), 0) as total_Sales
From Customers as c 
left join Orders as o  
on c.customer_id = o.customer_id
left join Products as p  
on p.product_id = o.product_id
GROUP BY 
	C.customer_id,
	c.customer_name

	
select * from Orders

--task 23

select 
top 5
	c.customer_id,
	C.customer_name,
	COUNT(DISTINCT o.order_id) as completed_count,
	COALESCE(SUM(o.quantity * p.unit_price), 0) as total_Sales
From Customers as c 
left join Orders as o  
on c.customer_id = o.customer_id
left join Products as p  
on p.product_id = o.product_id
GROUP BY 
	C.customer_id,
	c.customer_name
order by total_Sales desc;


--task 24

select 
top 5
	p.category,
	COUNT(DISTINCT o.quantity) as total_quantity
From Orders as o 
left join Products as p  
on p.product_id = o.product_id
GROUP BY 
	p.category
order by total_quantity desc;


--task 25

select 
	c.customer_id,
	C.customer_name,
	o.order_id,
	p.paid_amount,
	p.payment_status
From Customers as c 
inner join Orders as o  
on c.customer_id = o.customer_id
inner join Payments as p  
on p.order_id = o.order_id
GROUP BY 
	C.customer_id,
	c.customer_name,o.order_id,
	p.paid_amount,
	p.payment_status;

--task 26

select 
	o.order_id,
	p.payment_status,
	o.order_status
From Customers as c 
left join Orders as o  
on c.customer_id = o.customer_id
left join Payments as p  
on p.order_id = o.order_id
where 
	p.payment_status <> 'Paid' AND 
	o.order_status <> 'Completed'

--task 27

select 
	c.customer_id,
	c.customer_name,
	COALESCE(st.ticket_status,'Not Raised Ticket') as ticket_status
from Customers as c
left join SupportTickets as st
on c.customer_id = st.customer_id
where
	st.ticket_id is null

--task 28 

select 
	distinct
	c.customer_id,
	c.customer_name
from Customers as c
inner join SupportTickets as st
on c.customer_id = st.customer_id
left join Orders as o
on c.customer_id = o.customer_id
where
	o.order_id is null 

-- task 29

select 
	e.employee_id,
	e.employee_name,
	COUNT(st.ticket_id) as ticket_count 
from Employees as e
left join SupportTickets as st
on e.employee_id = st.employee_id
Group By 
	e.employee_id,
	e.employee_name


--task 30

select 
	e.employee_id,
	e.employee_name,
	COUNT(st.ticket_id) as ticket_count 
from Employees as e
left join SupportTickets as st
on e.employee_id = st.employee_id
where 
	e.department = 'Support'
Group By 
	e.employee_id,
	e.employee_name
Having
	COUNT(st.ticket_id) > 2
	

select * from Employees



--task 31 

select 
	c.customer_name,
	o.order_id,
	p.product_name,
	e.employee_name,
	e.department,
	o.quantity,
	(o.quantity * p.unit_price) as total_order_value
from Customers as c
join Orders as o 
on c.customer_id = o.customer_id
join Products as p
on p.product_id = o.product_id
join Employees as e
on e.employee_id = o.sales_employee_id;


--task 32

select 
	e.employee_name,
	SUM(o.quantity * p.unit_price) as total_value
from Employees as e
join Orders as o
on e.employee_id = o.sales_employee_id
join Products as p 
on p.product_id = o.product_id
where 
	o.order_status = 'Completed'
group by 
	e.employee_name ;

--task 33
select 
	e.employee_name,
	SUM(o.quantity * p.unit_price) as total_value
from Employees as e
join Orders as o
on e.employee_id = o.sales_employee_id
join Products as p 
on p.product_id = o.product_id
where 
	o.order_status = 'Completed'
group by 
	e.employee_name
Having 
	SUM(o.quantity * p.unit_price) > 500000


--task 34

select 
	c.city,
	SUM(o.quantity * p.unit_price) as total_value
from Customers as c
join Orders as o
on c.customer_id = o.customer_id
join Products as p 
on p.product_id = o.product_id
group by 
	c.city


--task 35 

select 
	c.city,
	SUM(o.quantity * p.unit_price) as total_value
from Customers as c
join Orders as o
on c.customer_id = o.customer_id
join Products as p 
on p.product_id = o.product_id
group by 
	c.city
Having
	SUM(o.quantity * p.unit_price) > 300000;

--Task 36

select 
	c.customer_id,
	c.customer_name,
	o.order_id,
	st.ticket_id
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id
full join SupportTickets as st 
on st.customer_id = c.customer_id


--Task 37
select 
	DISTINCT
	c.customer_id,
	c.customer_name,
	o.order_id,
	st.ticket_id
from Customers as c
full join Orders as o
on c.customer_id = o.customer_id
full join SupportTickets as st 
on st.customer_id = c.customer_id
where 
	o.order_id is not null OR st.ticket_id is not null

--Task 38

select 
	e.employee_id,
	e.employee_name,
	o.order_id
from Employees as e
right join Orders as o
on e.employee_id = o.sales_employee_id


