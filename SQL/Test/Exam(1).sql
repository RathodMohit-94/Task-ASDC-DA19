
Use SQL_Advanced_Joins_Test ;

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
	DISTINCT e.employee_id,
	e.employee_name,
	o.order_id
from Orders as o
right join Employees as e
on e.employee_id = o.sales_employee_id


--Task 39

select 
	c.customer_segment,
	p.category
from Customers as c
cross join Products as p


--Task 40 

select 
	e.employee_name,
	p.category
from Employees as e
cross join Products as p
where 
	e.department = 'Sales'
order by 
	e.employee_name,p.category

--Task 41 

select 
	p.category,
	COUNT(DISTINCT o.customer_id) as customer_count
from Orders as o
join Products as p 
on o.product_id = p.product_id
Group By 
	p.category


--Task 42

select 
	p.category,
	COUNT(DISTINCT o.customer_id) as customer_count
from Orders as o
join Products as p 
on o.product_id = p.product_id
Group By 
	p.category
Having 
	Count(o.customer_id) >= 5

--Task 43

select 
	c.customer_id,
	c.customer_name,
	COUNT(o.product_id) as Diff_count
from Customers as c 
Join Orders as o
on c.customer_id = o.customer_id
Group By 
	c.customer_id,
	c.customer_name
Having 
	COUNT(o.product_id) >= 3;


--Task 44

select 
	c.customer_segment,
	AVG(o.quantity * p.unit_price ) as average_order_value
from Customers as c 
join Orders as o
on c.customer_id = o.customer_id
join Products as p
on o.product_id = p.product_id
where 
	o.order_status = 'Completed'
Group By 
	c.customer_segment ;


	
--Task 45

select 
	c.customer_segment,
	AVG(o.quantity * p.unit_price ) as average_order_value
from Customers as c 
join Orders as o
on c.customer_id = o.customer_id
join Products as p
on o.product_id = p.product_id
where 
	o.order_status = 'Completed'
Group By 
	c.customer_segment
Having
	AVG(o.quantity * p.unit_price ) > 50000
Order by 
	average_order_value desc;


--Task 46 

select 
	e.employee_id,
	e.employee_name,
	e.department,
	COUNT(o.order_id) as total_order,
	COUNT(o.quantity) as total_quantity,
	SUM(o.quantity * p.unit_price) as total_revenue,
	AVG(o.quantity * p.unit_price) as average_order_value
from Employees as e 
join Orders as o
on e.employee_id = o.sales_employee_id
join Products as p
on o.product_id = p.product_id
Where
	o.order_status = 'Completed'
	AND
	e.department = 'Sales'
Group By 
	e.employee_id,
	e.employee_name,
	e.department;


--Task 47

select 
	top 1
	e.employee_id,
	e.employee_name,
	e.department,
	COUNT(o.order_id) as total_order,
	COUNT(o.quantity) as total_quantity,
	SUM(o.quantity * p.unit_price) as total_revenue
from Employees as e 
join Orders as o
on e.employee_id = o.sales_employee_id
join Products as p
on o.product_id = p.product_id
Where
	o.order_status = 'Completed'
	AND
	e.department = 'Sales'
Group By 
	e.employee_id,
	e.employee_name,
	e.department
order by 
	total_order desc;

--Task 48

select 
	p.product_name,
	p.category,
	p.stock_quantity,
	COUNT(o.quantity) as orders_quantity,
	COALESCE(SUM(CASE WHEN o.order_status = 'Completed' then o.quantity * p.unit_price else 0 end),0) as sales_value,
	COUNT(DISTINCT o.customer_id) as customer_count
from Products as p
full join Orders as o
on p.product_id = o.product_id
Group By
	p.product_name,
	p.category,
	p.stock_quantity

--Task 49


SELECT 
    c1.customer_segment, 
    c1.customer_name AS customer_1, 
    c1.total_revenue AS customer_1_revenue, 
    c2.customer_name AS customer_2, 
    c2.total_revenue AS customer_2_revenue
FROM (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        c.customer_segment, 
        SUM(o.quantity * p.unit_price) AS total_revenue
    FROM Customers c
		JOIN Orders o 
	ON c.customer_id = o.customer_id
    JOIN Products p 
		ON o.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.customer_segment
) c1
JOIN (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        c.customer_segment, 
        SUM(o.quantity * p.unit_price) AS total_revenue
    FROM Customers c
		JOIN Orders o 
	ON c.customer_id = o.customer_id
		JOIN Products p 
	ON o.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.customer_segment
) c2 
    ON c1.customer_segment = c2.customer_segment 
   AND c1.total_revenue > c2.total_revenue
ORDER BY c1.customer_segment, c1.total_revenue DESC, c2.total_revenue DESC;




select 
	c1.customer_segment,
	c1.customer_name as customer_1,
	c1.total_revenue as customer_1_revenue,
	c2.customer_name as customer_2,
	c2.total_revenue as customer_2_revenue
from 
(select
	c.customer_id,
	c.customer_name,
	c.customer_segment,
	SUM(o.quantity * p.unit_price ) as total_revenue
from Customers as c 
join Orders as o on c.customer_id = o.customer_id and O.order_status = 'Completed'
join Products as p on p.product_id = o.product_id 
--where o.order_status = 'Completed'
Group by
	c.customer_id,
	c.customer_name,
	c.customer_segment
)
as c1 
Join 
(select
	c.customer_id,
	c.customer_name,
	c.customer_segment,
	SUM(o.quantity * p.unit_price ) as total_revenue
from Customers as c 
join Orders as o on c.customer_id = o.customer_id and O.order_status = 'Completed'
join Products as p on p.product_id = o.product_id 
--where o.order_status = 'Completed'
Group by
	c.customer_id,
	c.customer_name,
	c.customer_segment)
as c2
on c1.customer_segment = c2.customer_segment
	WHERE c1.total_revenue > c2.total_revenue
group by 
	c1.customer_segment,
	c1.customer_name,
	c1.total_revenue,
	c2.customer_name,
	c2.total_revenue






--Task 50

SELECT 
    c.customer_segment, 
    COUNT(DISTINCT c.customer_id) AS number_of_customers, 
    COUNT(DISTINCT CASE WHEN o.order_status = 'Completed' THEN o.order_id END) AS completed_orders_count, 
    COALESCE(SUM(CASE WHEN o.order_status = 'Completed' THEN o.quantity ELSE 0 END), 0) AS total_quantity_sold, 
    COALESCE(SUM(CASE WHEN o.order_status = 'Completed' THEN o.quantity * p.unit_price ELSE 0 END), 0) AS total_revenue, 
    COALESCE(AVG(CASE WHEN o.order_status = 'Completed' THEN o.quantity * p.unit_price END), 0) AS avg_order_value
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
GROUP BY c.customer_segment;

