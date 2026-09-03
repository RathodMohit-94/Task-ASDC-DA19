
----  Lecture 4 Tasks 

--Task 1 
CREATE TABLE sales_transactions(
transaction_id  INT PRIMARY KEY,
customer_name VARCHAR(50),
product_name VARCHAR(50),
category VARCHAR(50),
quantity INT,
unit_price INT,
discount_percent INT,
city VARCHAR(50),
payment_mode VARCHAR(30),
salesperson VARCHAR(50),
customer_type VARCHAR(30)
);

--Insert Data Into This 


INSERT INTO sales_transactions
VALUES 
(1001, 'Aarav Mehta', 'Laptop Pro 15', 'Electronics', 2, 75000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1002, 'Priya Shah', 'Office Chair', 'Furniture', 5, 12000, 8, 'Mumbai', 'Card', 'Neha', 'Regular'),
(1003, 'Rohan Patel', 'Smartphone X', 'Electronics', 3, 45000, 12, 'Ahmedabad', 'UPI', 'Amit', 'Premium'),
(1004, 'Sneha Verma', 'Refrigerator', 'Appliances', 1, 68000, 15, 'Delhi', 'Card', 'Priya', 'VIP'),
(1005, 'Karan Joshi', 'Dining Table', 'Furniture', 4, 18000, 5, 'Pune', 'Cash', 'Rahul', 'Regular'),
(1006, 'Ananya Rao', 'Laptop Air 14', 'Electronics', 1, 62000, 7, 'Bangalore', 'Online', 'Neha', 'Premium'),
(1007, 'Vikram Singh', 'Washing Machine', 'Appliances', 2, 42000, 18, 'Jaipur', 'UPI', 'Amit', 'Regular'),
(1008, 'Meera Kapoor', 'Smartphone Pro', 'Electronics', 4, 55000, 20, 'Mumbai', 'Card', 'Priya', 'VIP'),
(1009, 'Aditya Shah', 'Sofa Set', 'Furniture', 3, 35000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1010, 'Ishita Patel', 'Air Conditioner', 'Appliances', 2, 58000, 12, 'Surat', 'UPI', 'Neha', 'Premium'),
(1011, 'Raj Malhotra', 'Gaming Laptop', 'Electronics', 2, 95000, 15, 'Delhi', 'Card', 'Amit', 'VIP'),
(1012, 'Kavya Desai', 'Bookshelf', 'Furniture', 6, 9000, 5, 'Pune', 'Cash', 'Priya', 'Regular'),
(1013, 'Arjun Mehta', 'Smart TV 55', 'Electronics', 2, 72000, 18, 'Bangalore', 'Online', 'Rahul', 'Premium'),
(1014, 'Nisha Sharma', 'Microwave Oven', 'Appliances', 3, 22000, 8, 'Ahmedabad', 'UPI', 'Neha', 'Regular'),
(1015, 'Yash Patel', 'Refrigerator Pro', 'Appliances', 1, 82000, 20, 'Mumbai', 'Card', 'Amit', 'VIP'),
(1016, 'Simran Kaur', 'Office Desk', 'Furniture', 5, 16000, 12, 'Delhi', 'Online', 'Priya', 'Regular'),
(1017, 'Dev Kumar', 'Smartphone Ultra', 'Electronics', 3, 68000, 10, 'Jaipur', 'UPI', 'Rahul', 'Premium'),
(1018, 'Riya Shah', 'Washing Machine Pro', 'Appliances', 4, 48000, 22, 'Surat', 'Card', 'Neha', 'Premium'),
(1019, 'Manav Joshi', 'Premium Sofa', 'Furniture', 2, 65000, 15, 'Ahmedabad', 'Online', 'Amit', 'VIP'),
(1020, 'Pooja Mehta', 'Tablet Pro', 'Electronics', 5, 32000, 8, 'Pune', 'UPI', 'Priya', 'Regular'),
(1021, 'Harsh Verma', 'Laptop Ultra', 'Electronics', 3, 88000, 25, 'Mumbai', 'Card', 'Rahul', 'VIP'),
(1022, 'Neel Shah', 'Air Conditioner Pro', 'Appliances', 2, 76000, 10, 'Delhi', 'Online', 'Neha', 'Premium'),
(1023, 'Tanvi Rao', 'Dining Set', 'Furniture', 4, 28000, 18, 'Bangalore', 'Cash', 'Amit', 'Regular'),
(1024, 'Siddharth Patel', 'Smart TV Pro', 'Electronics', 6, 60000, 12, 'Surat', 'UPI', 'Priya', 'Premium'),
(1025, 'Aisha Khan', 'Double Door Refrigerator', 'Appliances', 2, 92000, 20, 'Ahmedabad', 'Card', 'Rahul', 'VIP'),
(1026, 'Mohit Singh', 'Executive Chair', 'Furniture', 7, 14000, 10, 'Jaipur', 'Online', 'Neha', 'Regular'),
(1027, 'Diya Mehta', 'Gaming Monitor', 'Electronics', 3, 52000, 15, 'Delhi', 'UPI', 'Amit', 'Premium'),
(1028, 'Varun Shah', 'Washing Machine', 'Appliances', 5, 38000, 28, 'Mumbai', 'Cash', 'Priya', 'Regular'),
(1029, 'Isha Patel', 'Luxury Sofa', 'Furniture', 3, 78000, 12, 'Pune', 'Card', 'Rahul', 'VIP'),
(1030, 'Dhruv Sharma', 'Business Laptop', 'Electronics', 2, 110000, 18, 'Bangalore', 'Online', 'Neha', 'VIP');

select * from sales_transactions;

/*Task 1 — Sales Transaction Summary
Generate a business summary of the sales_transactions table showing:

Total number of transactions
Total quantity sold
Total sales value based on quantity × unit_price
Average unit price
Highest unit price
Lowest unit price
*/

select 
COUNT(*) as total_transactions,
SUM(quantity) as total_quantity,
SUM(quantity*unit_price) as total_sales,
AVG(unit_price) as avg_unit_price,
MAX(unit_price) as Higest_price,
MIN(unit_price) as Lowest_Price
from sales_transactions ;

/*Task 2 — Category Performance Analysis
Management wants to compare product categories.

For each category, display:

Number of transactions
Total quantity sold
Total sales value
Average unit price
Arrange the categories from highest total sales value to lowest.    */

select 
category,
COUNT(*) as number_transaction,
SUM(quantity) as Total_quantity,
SUM(quantity * unit_price ) as Total_Sales,
AVG(unit_price) as avg_price
from sales_transactions 
Group By category
order by Total_Sales desc ;


/*Task 3 — Salesperson Performance Report
Calculate the performance of each salesperson.

Display:

Salesperson
Number of transactions handled
Total quantity sold
Total sales value
Average unit price
Arrange the result from highest total sales value to lowest.*/

select 
salesperson,
COUNT(*) as Total_Transaction,
SUM(quantity) as total_quantity,
SUM(unit_price * quantity) as total_sales,
AVG(unit_price) as avg_unit_price
from sales_transactions
group by salesperson 
order by total_sales desc;



/*Task 4 — City-Wise Sales Analysis
Analyze sales performance across cities.

For each city, display:

Number of transactions
Total quantity sold
Total sales value
Average unit price
Display the cities in descending order of total sales value.*/

select 
city,
COUNT(*) as total_transactions,
SUM(quantity) as total_quantity,
SUM(quantity*unit_price) as total_sales,
AVG(unit_price) as avg_unit_price
from sales_transactions
group by city 
order by total_sales desc;

/*Task 5 — Customer Type Analysis
Analyze purchasing behavior based on customer type.

For each customer type, calculate:

Number of transactions
Total quantity purchased
Total sales value
Average unit price
Arrange the result by total sales value from highest to lowest.*/

select 
customer_type,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions
group by customer_type
order by t_sales desc;

/*Task 6 — Payment Mode Analysis
Management wants to understand which payment methods generate the most business.

For each payment mode, calculate:

Number of transactions
Total quantity sold
Total sales value
Average unit price
Arrange the result by total sales value in descending order.*/

select 
payment_mode,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions 
group by payment_mode 
order by t_sales desc;

/*Task 7 — High-Performing Categories
Identify categories that generated more than 300000 in total sales value.

Display:

Category
Total quantity sold
Total sales value
Average unit price
Only categories meeting the required sales threshold should appear.*/

select 
category,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions
group by category 
Having SUM(quantity * unit_price) > 30000;

/*Task 8 — High-Performing Salespersons
    Identify salespersons whose total sales value is greater than 500000.
Display:
    Salesperson
    Number of transactions
    Total quantity sold
    Total sales value
    Arrange the result from highest to lowest total sales value.*/

select 
salesperson,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions
group by salesperson
having SUM(quantity * unit_price) > 50000
order by t_sales desc;

/*Task 9 — High-Volume Products
    Identify products where the total quantity sold is greater than 5.
Display:
    Product name
    Total quantity sold
    Total sales value
    Average unit price
    Arrange the result by total quantity sold from highest to lowest.*/

select 
product_name,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions
group by product_name
having SUM(quantity) > 5
order by t_quantity desc;

/*Task 10 — Premium Customer Analysis
Analyze only transactions made by Premium customers.
For each category, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only categories where the total sales value is greater than 200000.
*/

select 
category,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_Price
from sales_transactions
where customer_type = 'Premium'
group by category 
Having SUM(quantity*unit_price) > 20000;

/*Task 11 — VIP Customer Analysis
Analyze transactions made by VIP customers.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Display only salespersons who generated more than 300000 in VIP sales*/

select 
salesperson,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales
from sales_transactions
where customer_type = 'VIP'
group by salesperson 
Having SUM(quantity*unit_price) > 300000;

/*Task 12 — City and Payment Analysis
Consider transactions where the payment mode is either Online or Card.
For each city, calculate:
Number of transactions
Total quantity sold
Total sales value
Display only cities where total sales value is greater than 300000.*/

select 
city,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales
from sales_transactions
where payment_mode IN ('Online','Card')
group by city 
Having SUM(quantity*unit_price) > 300000;

/*Task 13 — Discount Performance Analysis
Analyze the effect of discounts.
For each discount percentage, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only discount percentages that occur in at least 2 transactions.*/

select 
discount_percent,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_unit_price 
from sales_transactions
group by discount_percent
Having COUNT(discount_percent) > 2 
order by discount_percent asc;

/*Task 14 — Electronics Business Analysis
Consider only Electronics transactions.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Highest unit price
Display only salespersons whose Electronics sales value exceeds 250000.*/

select 
salesperson,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_unit_price,
MAX(unit_price) as highest_unit_price
from sales_transactions
where category = 'Electronics' 
group by salesperson
Having SUM(quantity * unit_price) > 250000  
order by t_sales desc;

/*Task 15 — Furniture Business Analysis
Consider only Furniture transactions where the quantity is greater than 2.
For each city, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only cities where the resulting total sales value is greater than 50000.*/

select 
city,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_unit_price
from sales_transactions
where category = 'Furniture' and quantity > 2
group by city 
Having SUM(quantity*unit_price) > 50000 
order by t_sales desc;

/*Task 16 — Appliance Sales Analysis
Consider only Appliances transactions where:
Payment mode is not Cash
Discount percentage is less than 20
Group the transactions by salesperson and display:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only salespersons with total sales value above 100000.*/

select 
salesperson,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_unit_price
from sales_transactions
where 
category = 'Appliance' AND
payment_mode != 'Cash' and
discount_percent < 20 
group by salesperson 
Having SUM(quantity*unit_price) > 100000
order by t_sales desc;

/*Task 17 — Premium vs VIP Performance
Analyze only Premium and VIP customers.
For each customer type, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Maximum unit price
Arrange the result by total sales value from highest to lowest.*/

select 
customer_type,
COUNT(*) as t_transaction,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(unit_price) as avg_unit_price,
MAX(unit_price) as higest_unit_price
from sales_transactions
where customer_type IN ('Premium','VIP')
group  by customer_type 
order by t_sales desc;

/*Task 18 — Salesperson Discount Analysis
Management wants to identify salespersons handling high-discount transactions.
Consider only transactions where the discount percentage is greater than 15.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Average discount percentage
Display only salespersons who have at least 2 such transactions.*/

select 
salesperson,
SUM(quantity) as t_quantity,
SUM(quantity * unit_price) as t_sales,
AVG(discount_percent) as avg_discount_percent
from sales_transactions
where discount_percent > 15 
group by salesperson 
Having COUNT(discount_percent) > 2 ;

/*Task 19*/

Insert into sales_transactions
VALUES (
    1031, 'Raj Mehta', 'MacBook Pro', 'Electronics', 
    2, 125000, 10, 'Mumbai', 
    'Online', 'Rahul', 'Premium'
);

select * from sales_transactions
where transaction_id='1031';

--- Task 20 

select 
salesperson,
category,
COUNT(*) as t_transactions,
SUM(quantity) as t_quantity,
SUM(quantity*unit_price) as t_Sales,
AVG(unit_price) as avg_unit_price,
MIN(unit_price) as min_unit_price,
MAX(unit_price) as max_unit_price,
AVG(discount_percent) as avg_dis_price
from sales_transactions
where 
customer_type IN ('Premium','VIP') 
AND
payment_mode != 'Cash' 
AND
discount_percent < 20 
AND
quantity > 1
group by salesperson,category 
Having SUM(quantity*unit_price) >  200000
order by t_Sales desc;

---Additional Things 
-- 1. CREATE: Insert new transaction
INSERT INTO sales_transactions
VALUES (
    1032, 'Raj Mehta', 'MacBook Pro', 'Electronics', 
    2, 125000, 10, 'Mumbai', 
    'Online', 'Rahul', 'Premium'
);

-- 2. READ: Retrieve and analyze
SELECT 
    transaction_id,
    customer_name,
    product_name,
    quantity,
    unit_price,
    (quantity * unit_price) AS total_amount,
    discount_percent
FROM sales_transactions
WHERE transaction_id = 1032;

-- 3. UPDATE: Update discount percent from 10 to 12
UPDATE sales_transactions
SET discount_percent = 12
WHERE transaction_id = 1032;

SELECT * 
FROM sales_transactions 
WHERE transaction_id = 1032;

-- 4. DELETE: Remove transaction 1032
DELETE FROM sales_transactions
WHERE transaction_id = 1032;

-- 5. VERIFY DELETION
SELECT * 
FROM sales_transactions 
WHERE transaction_id = 1032;

----Completed Task From Lecture 4


