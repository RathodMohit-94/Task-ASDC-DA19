# GlobalMart Sales & Business Performance Dataset
### Power BI Classroom Practice Project — Data Dictionary 


## 1. Data Dictionary

### 1.1 Transaction Information

| Column | Data Type | Description |
|---|---|---|
| Transaction_ID | Text | Unique ID for each order line (primary key of the table) |
| Order_ID | Text | Order-level ID; repeats when an order has multiple product lines. A small number of fully duplicated rows exist intentionally for de-duplication practice |
| Order_Date | Date | Date the order was placed |
| Ship_Date | Date | Date the order shipped (some blanks intentionally present) |
| Delivery_Date | Date | Date the order was delivered |
| Sales_Channel | Text | Online, In-Store, Mobile App, Distributor |
| Order_Status | Text | Delivered, Shipped, Processing, Cancelled, Returned |
| Payment_Mode | Text | Credit Card, Debit Card, Net Banking, UPI, Cash on Delivery, PayPal — **contains inconsistent casing** ("Credit Card" / "Credit card" / "credit card" / "CREDIT CARD") for cleaning practice |

### 1.2 Customer Information

| Column | Data Type | Description |
|---|---|---|
| Customer_ID | Text | Unique customer identifier (customers repeat across orders — supports repeat-customer analysis) |
| Customer_Name | Text | Fictional customer name |
| Customer_Age | Whole Number | 18–70 |
| Gender | Text | Male / Female |
| Customer_Segment | Text | Consumer, Corporate, Home Office, Small Business (contains a few stray leading/trailing spaces) |
| Customer_Rating | Decimal | 1–5 star rating; some values intentionally missing |

### 1.3 Geographic Information

| Column | Data Type | Description |
|---|---|---|
| Country | Text | India, USA, UK, Canada, Australia |
| State | Text | State/province within country |
| City | Text | City (contains a few inconsistent alternate spellings, e.g. Bangalore/Bengaluru, Mumbai/Bombay) |
| Region | Text | Sales region within country (a few blanks intentionally present) |
| Postal_Code | Text | Postal/ZIP code (some missing values) |
| Latitude | Decimal | For map visuals |
| Longitude | Decimal | For map visuals |

### 1.4 Product Information

| Column | Data Type | Description |
|---|---|---|
| Product_ID | Text | Unique product identifier |
| Product_Name | Text | Product name |
| Category | Text | 7 categories (a few rows have inconsistent casing for cleaning practice) |
| Sub_Category | Text | 5–6 sub-categories per category |
| Brand | Text | Fictional brand name |
| Product_Type | Text | Standard, Premium, Economy, Limited Edition |
| Unit_Cost | Decimal (currency) | Cost per unit |
| Unit_Price | Decimal (currency) | Selling price per unit |

### 1.5 Sales & Financial Information

| Column | Data Type | Formula / Logic |
|---|---|---|
| Quantity | Whole Number | 1–20 (a few high outliers 30–60 intentionally injected) |
| Sales | Decimal (currency) | Quantity × Unit_Price |
| Discount_Percentage | Decimal (%) | 0–40% |
| Discount_Amount | Decimal (currency) | Sales × Discount_Percentage |
| Cost | Decimal (currency) | Quantity × Unit_Cost |
| Profit | Decimal (currency) | Sales − Discount_Amount − Cost (can be negative) |
| Profit_Margin | Decimal (%) | Profit ÷ Sales |
| Tax | Decimal (currency) | 8% of (Sales − Discount_Amount) |
| Shipping_Cost | Decimal (currency) | Random cost between $2–$25 |
| Total_Amount | Decimal (currency) | Sales − Discount_Amount + Tax + Shipping_Cost |

### 1.6 Time Intelligence Columns

| Column | Data Type | Description |
|---|---|---|
| Year | Whole Number | 2024, 2025, 2026 |
| Quarter | Text | Q1–Q4 |
| Month | Text | e.g. "Jan-2024" (sortable label) |
| Month_Number | Whole Number | 1–12 |
| Month_Name | Text | January–December |
| Week_Number | Whole Number | ISO week number |
| Day | Whole Number | Day of month |
| Day_Name | Text | Monday–Sunday |

### 1.7 Target / Goal Fields

| Column | Data Type | Description |
|---|---|---|
| Sales_Target | Decimal (currency) | Row-level daily-equivalent sales target (varies by Category, Region, Month) |
| Profit_Target | Decimal (currency) | Row-level profit target |
| Monthly_Target | Decimal (currency) | Aggregate target for that Category/Region/Month combination |
| Target_Achievement_Percentage | Decimal (%) | Sales ÷ Sales_Target × 100 |

---

## 2. Known Data-Quality Issues (for Power Query practice)

| Issue | Where | Approx. Volume |
|---|---|---|
| Inconsistent capitalization | Payment_Mode, Category, Sub_Category, Brand | ~2% of rows |
| Leading/trailing spaces | City, Sales_Channel, Customer_Segment | ~1% per column |
| Alternate city names | City (e.g. Bangalore/Bengaluru, Mumbai/Bombay, New York City/NYC, Chennai/Madras) | ~10% within affected cities |
| Missing values | Customer_Rating, Postal_Code, Ship_Date, Region | 1–2% per column |
| Duplicate rows | Full-row duplicates (same Transaction_ID repeated) | ~1% of rows |
| Outliers | Quantity (30–60 units), Sales (3–6x normal), Profit (large negative) | <1% of rows |

Recommended Power Query steps: `Trim`, `Clean`, `Text.Proper`/`Text.Upper` standardization, replace-value mapping for city aliases, remove duplicates, and flag/handle outliers with conditional columns.

---



## 5. Suggested Table Structure (Star Schema)


| Table | Key Columns | Relationship |
|---|---|---|
| **Fact_Sales** | Transaction_ID, Order_ID, Order_Date, Customer_ID, Product_ID, Quantity, Sales, Discount_Amount, Cost, Profit, Tax, Shipping_Cost, Total_Amount, Sales_Target | Central fact table |
| **Dim_Customer** | Customer_ID, Customer_Name, Age, Gender, Segment | 1-to-many → Fact_Sales[Customer_ID] |
| **Dim_Product** | Product_ID, Product_Name, Category, Sub_Category, Brand, Product_Type, Unit_Cost, Unit_Price | 1-to-many → Fact_Sales[Product_ID] |
| **Dim_Geography** | Country, State, City, Region, Postal_Code, Latitude, Longitude | 1-to-many → Fact_Sales (via City or a generated Geo_ID) |
| **Dim_Date** | Date, Year, Quarter, Month, Month_Name, Week_Number, Day, Day_Name | 1-to-many → Fact_Sales[Order_Date] |

---

