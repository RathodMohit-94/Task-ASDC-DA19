# SQL JOIN Assessment — Business Analytics Level




## Task 1 — Customer Revenue Performance

The Finance team wants to identify customers contributing significantly to company revenue.

Prepare a customer revenue report containing:

* Customer ID
* Customer Name
* City
* Total Number of Orders
* Total Quantity Purchased
* Total Purchase Value
* Average Order Value

Only customers with **at least 3 orders** and **total purchase value above ₹75,000** should be included.

Sort the report by total purchase value from highest to lowest.

***

## Task 2 — Regional Sales Performance

The Business Intelligence team wants to compare sales performance across customer locations.

Generate a city-level sales report containing:

* City
* Number of Customers
* Number of Orders
* Total Quantity Sold
* Total Sales Value
* Average Order Value

Only cities generating **more than ₹1,00,000 in sales** should appear.

Sort the report by sales value descending.

***

## Task 3 — High-Value Customer Identification

The Customer Success team wants to identify customers responsible for high-value transactions.

Find customers who have:

* At least one order with a transaction value above ₹25,000
* Total purchase value above ₹50,000

Display:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Purchase Value
* Highest Transaction Value

***

## Task 4 — Customer Purchase Concentration

Management wants to identify customers with frequent purchasing activity.

Generate a report showing customers who have placed **more than 4 orders**.

Display:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Quantity Purchased
* Total Purchase Value
* Average Order Value

Sort by order count and then total purchase value.

***

## Task 5 — Product Revenue Performance

The Product Analytics team wants to understand which products are generating the largest commercial contribution.

Generate a product performance report containing:

* Product Name
* Number of Orders
* Total Quantity Sold
* Total Revenue
* Average Order Amount
* Highest Order Amount

Only products with **at least 3 orders** should be included.

Sort by total revenue descending.

***

## Task 6 — High-Volume Products

The Operations team wants to identify products with consistently high sales volume.

Identify products where:

* Total quantity sold is greater than 100
* Number of orders is greater than 5

Display:

* Product Name
* Total Quantity Sold
* Number of Orders
* Total Revenue

***

## Task 7 — Revenue Contribution by City

Senior management wants to identify the strongest revenue-generating markets.

For every city, calculate:

* Total Customers
* Total Orders
* Total Quantity Sold
* Total Revenue

Display only cities with:

* At least 3 customers
* At least 5 orders
* Revenue above ₹2,00,000

***

## Task 8 — Customer Order Value Analysis

The Finance team wants to analyze the order-value behavior of customers.

Generate a report containing:

* Customer ID
* Customer Name
* City
* Number of Orders
* Minimum Order Value
* Maximum Order Value
* Average Order Value
* Total Purchase Value

Only customers with **at least 3 orders** should be included.

***

## Task 9 — Customer Retention Analysis

The CRM team wants to identify customers who are actively purchasing from the company.

Generate a report for customers who have placed **at least 5 orders**.

Display:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Quantity Purchased
* Total Purchase Value

Sort customers by number of orders descending.

***

## Task 10 — Low-Activity Customer Analysis

The business team wants to identify customers with limited purchasing activity.

Find customers who have placed **1 or 2 orders only**.

Display:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Purchase Value

Sort by total purchase value descending.

***

# Advanced LEFT JOIN Analysis

## Task 11 — Customer Coverage Analysis

The CRM department wants a complete customer coverage report.

Include **every customer**, regardless of whether they have placed an order.

Display:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Quantity Purchased
* Total Purchase Value

Customers with no purchases must still be represented in the report.

***

## Task 12 — Unconverted Customer Analysis

The Marketing team wants a list of registered customers who have never generated an order.

Prepare a report containing:

* Customer ID
* Customer Name
* City

The result should represent only customers with **zero purchasing activity**.

***

## Task 13 — Customer Revenue Coverage

The Finance team wants to compare the complete customer base with purchasing activity.

Generate a report containing every customer and their:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Purchase Value

The report must preserve customers who have no order history.

***

## Task 14 — Product Sales Coverage

The Product team wants to identify products that are present in the company's product catalog but have no sales activity.

Generate a report containing:

* Product ID
* Product Name
* Category
* Price

Only products with **zero order activity** should be returned.

***

# RIGHT JOIN / FULL JOIN Reconciliation

## Task 15 — Order Data Reconciliation

The Data Quality team wants to identify inconsistencies between customer master data and order transaction data.

Prepare a reconciliation report containing:

* Customer ID
* Customer Name
* City
* Order ID
* Product Name
* Quantity
* Amount

The report must preserve records from **both datasets**, including unmatched records.

***

## Task 16 — Customer Master vs Transaction Analysis

The company is performing a data-quality audit between customer and order records.

Identify all records where customer information and order information do not have a matching relationship.

Display:

* Customer ID
* Customer Name
* Order ID
* Product Name
* Amount

***

## Task 17 — Complete Transaction Reconciliation

Generate a complete reconciliation dataset containing:

* Customer ID
* Customer Name
* City
* Order ID
* Product Name
* Quantity
* Amount
* Transaction Value

All records from both customer and order datasets must be retained.

***

# ANTI JOIN — Business Problems

## Task 18 — Customers With No Commercial Activity

The Marketing department wants to identify customers who have registered with the company but have generated **no transactions**.

Display:

* Customer ID
* Customer Name
* City

***

## Task 19 — Products With No Sales

The Product Management team wants to identify products that are currently available in the catalog but have **never been purchased**.

Display:

* Product ID
* Product Name
* Category
* Price

***

## Task 20 — Customer Acquisition Gap

The Growth team wants to identify customers who have not converted into paying customers.

Return all customers with **no corresponding order records**.

Display:

* Customer ID
* Customer Name
* City

***

## Task 21 — Unsold Product Inventory

The Inventory team wants to identify products that have never appeared in a transaction.

Display:

* Product ID
* Product Name
* Category
* Price

Sort by price from highest to lowest.

***

# Cross Join — Enterprise Scenario

## Task 22 — Product-Customer Campaign Universe

The Marketing Analytics team is preparing a personalized campaign.

Create a dataset representing **every possible customer-product combination**.

Display:

* Customer ID
* Customer Name
* City
* Product ID
* Product Name
* Category

***

## Task 23 — Campaign Population Size

The Marketing department wants to know the theoretical size of a campaign where every customer could receive an offer for every product.

Calculate the total number of possible:

**Customer × Product combinations**

Return the result as a single value.

***

## Task 24 — Geographic Product Opportunity

Create every possible combination of:

* Customer City
* Product Name

Display the complete opportunity matrix.

The result should contain every possible city-product combination, regardless of whether a customer from that city has purchased the product.

***

# High-Level Business Analysis

## Task 25 — Customer Sales Leaderboard Dataset

Management wants a customer performance dataset for the monthly business review.

Generate:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Quantity Purchased
* Total Revenue
* Average Order Value
* Maximum Order Value

Only customers with **at least 3 orders** should be included.

Sort the output by:

1. Total Revenue
2. Number of Orders
3. Average Order Value

All in descending order.

***

## Task 26 — Product Business Review

The Product Management team is conducting a quarterly product review.

Generate:

* Product Name
* Number of Orders
* Total Quantity Sold
* Total Revenue
* Average Order Value
* Maximum Order Value

Only products with **at least 5 orders** and **total revenue above ₹2,00,000** should be included.

***

## Task 27 — Market Performance Report

The Sales Strategy team wants to identify markets with strong customer engagement and revenue generation.

Generate a city-level report containing:

* City
* Number of Customers
* Number of Orders
* Total Quantity Sold
* Total Revenue
* Average Order Value

Only cities satisfying all of the following should appear:

* At least 5 customers
* More than 10 orders
* Revenue greater than ₹5,00,000

***

## Task 28 — High-Value Transaction Analysis

The Finance team wants to investigate customers responsible for high-value business.

Identify customers whose transaction history contains **at least 2 orders with transaction value greater than ₹25,000**.

Display:

* Customer ID
* Customer Name
* City
* Number of qualifying orders
* Total value of qualifying orders

***

## Task 29 — Product Demand Analysis

The Supply Chain team wants to identify products with strong customer demand.

Find products where:

* Total quantity sold is greater than 100
* At least 5 separate orders exist
* Total revenue exceeds ₹1,00,000

Display:

* Product Name
* Number of Orders
* Total Quantity Sold
* Total Revenue
* Average Order Value

***

## Task 30 — Executive Sales Performance Report

The executive team wants a high-level customer sales report for a management dashboard.

Generate a customer-level dataset containing:

* Customer ID
* Customer Name
* City
* Number of Orders
* Total Quantity Purchased
* Total Purchase Value
* Average Order Value
* Minimum Order Value
* Maximum Order Value

Only customers meeting **both** conditions should be included:

* At least **3 orders**
* Total purchase value greater than **₹1,00,000**

Sort the final report by **Total Purchase Value descending**.