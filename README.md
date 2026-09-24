# ☕ Starbucks Sales & Revenue Analytics

An interactive Business Intelligence project designed to analyze sales performance, revenue, customer loyalty, payment gaps, and refund patterns using Excel, PostgreSQL, SQL, and Power BI.

> **Project Type:** Business Intelligence / Data Analytics  
> **Tools:** Excel, PostgreSQL, SQL, Power BI, DAX  
> **Dashboard Pages:** 3  
> **Orders Analyzed:** 10,000  
> **Markets:** 6 Countries  
> **Payment Methods:** 4  
> **Customer Loyalty Tiers:** 3

---

## 📌 Project Overview

This project analyzes Starbucks-themed sales and revenue data to understand business performance across different countries, product categories, customer loyalty tiers, and payment methods.

The project follows an end-to-end analytics workflow:

**Excel → Data Cleaning → PostgreSQL → Relational Data Modeling → Power BI → Business Analysis**

The final Power BI dashboard provides an interactive view of sales performance, customer behavior, payment gaps, and refund patterns.

---

# 🎯 Business Objectives

The dashboard was designed to answer four major business questions:

1. Which country markets generate higher revenue and order volume?
2. How do payment methods differ in payment-gap and refund patterns?
3. How does revenue vary across different customer loyalty tiers?
4. Where are payment gaps concentrated across countries and product categories?

---

# 🛠️ Tools & Technologies

### Excel
- Initial data preparation
- Duplicate removal
- Missing-value handling
- Data validation
- Basic data cleaning

### PostgreSQL
- Database creation
- Table creation
- Data types
- Primary keys
- Foreign keys
- Relational data modeling
- CSV data loading
- Data verification

### Power BI
- Data modeling
- Relationships
- Interactive dashboards
- KPI cards
- Charts
- Matrix visualizations
- Slicers
- Tooltips
- Cross-filtering

### DAX
Used to create business metrics such as:

- Net Revenue
- Total Orders
- Total Customers
- AOV
- Refund Rate
- Total Refund
- Payment Records
- Payment Gap Orders
- Payment Gap %

---

# 🔄 Project Workflow

```text
Raw Data
   ↓
Excel Data Cleaning
   ↓
PostgreSQL Database
   ↓
Primary & Foreign Key Relationships
   ↓
Power BI Data Model
   ↓
DAX Measures
   ↓
Interactive Dashboard
   ↓
Business Insights
```

---

# 🧹 Data Preparation

The source data was prepared in Excel before being structured in PostgreSQL.

Data preparation included:

- Removing duplicate records
- Checking missing values
- Replacing missing numeric values 
- Replacing missing categorical values 
- Checking column data types
- Validating date fields
- Reviewing categorical values
- Preparing clean datasets for database loading

The cleaned datasets were then loaded into PostgreSQL.

---

# 🗄️ PostgreSQL Database Design

The project uses three main relational tables:

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ▼
Revenue
```

## 1. Customers

Contains customer-level information.

Important columns include:

- customer_id
- customer_name
- email
- city
- state_or_region
- country
- signup_date
- membership_tier

`customer_id` is the **Primary Key**.

---

## 2. Orders

Contains transaction-level order information.

Important columns include:

- order_id
- customer_id
- order_date
- product_category
- quantity
- unit_price_usd
- order_status
- payment_method

`order_id` is the **Primary Key**.

`customer_id` is a **Foreign Key** referencing:

```text
customers.customer_id
```

---

## 3. Revenue

Contains payment and refund information.

Important columns include:

- revenue_id
- order_id
- payment_date
- amount_paid_usd
- payment_status
- refund_amount_usd

`revenue_id` is the **Primary Key**.

`order_id` is a **Foreign Key** referencing:

```text
orders.order_id
```

---

# 🔗 Data Relationships

The relational structure is:

```text
Customers
    │
    │ 1 : Many
    ▼
Orders
    │
    │ 1 : Many
    ▼
Revenue
```

### Relationship 1

```text
Customers.customer_id
        ↓
Orders.customer_id
```

One customer can have multiple orders.

### Relationship 2

```text
Orders.order_id
        ↓
Revenue.order_id
```

An order can have corresponding payment/revenue records.

Primary and foreign keys were used to maintain referential relationships between the tables.

---

# 📊 Power BI Data Model

The PostgreSQL data was connected to Power BI and combined with a Date table for time-based analysis.

The Power BI model contains:

```text
Customers
    │
    ▼
Orders
    │
    ▼
Revenue

Date
  │
  ▼
Orders
```

The Date table enables analysis by:

- Year
- Quarter
- Month
- Day

---

# 🧮 Key DAX Measures

## Net Revenue

Measures revenue after accounting for refunds.

```DAX
Net_Revenue =
SUM('public revenue'[amount_paid_usd])
-
SUM('public revenue'[refund_amount_usd])
```

## Total Orders

Counts the total number of unique orders.

```DAX
Total_Orders =
DISTINCTCOUNT('public orders'[order_id])
```

## Total Customers

Counts unique customers.

```DAX
Total_Customers =
DISTINCTCOUNT('public customers'[customer_id])
```

## Average Order Value

Measures the average revenue generated per order.

```DAX
AOV =
DIVIDE(
    [Net_Revenue],
    [Total_Orders]
)
```

## Total Refund

Calculates the total refunded amount.

```DAX
Total_Refund =
SUM('public revenue'[refund_amount_usd])
```

## Refund Rate

Measures refunded revenue as a percentage of revenue.

```DAX
Refund_Rate =
DIVIDE(
    [Total_Refund],
    SUM('public revenue'[amount_paid_usd])
)
```

## Payment Records

Counts orders that have a corresponding payment record.

```DAX
Payment_Records =
DISTINCTCOUNT('public revenue'[order_id])
```

## Payment Gap Orders

Measures orders without a corresponding payment record.

```DAX
Payment_Gap_Orders =
[Total_Orders] - [Payment_Records]
```

## Payment Gap %

Measures the share of orders without a payment record.

```DAX
Payment_Gap% =
DIVIDE(
    [Payment_Gap_Orders],
    [Total_Orders]
)
```

---

# 💡 What is Payment Gap?

A **Payment Gap** represents an order that does not have a corresponding payment record in the revenue/payment table.

For example:

```text
Total Orders       = 10,000
Payment Records    = 9,493
Payment Gap Orders = 507
```

Therefore:

```text
10,000 - 9,493 = 507
```

This metric helps identify potential payment-recording or reconciliation gaps.

---

# 📈 Dashboard

The Power BI report contains three analytical pages.

## 1️⃣ Executive Overview

The Executive Overview provides a high-level summary of business performance.

### KPI Cards

- Net Revenue
- Total Orders
- Total Customers
- Average Order Value
- Refund Rate

### Visualizations

- Net Revenue by Country
- Payment Gap & Refund Rate by Payment Method
- Net Revenue by Membership Tier
- Payment Gap by Country
- Payment Gap by Product Category

---

## 2️⃣ Market & Customer Deep Dive

This page focuses on market performance, customer distribution, and product performance.

### Visualizations

- Country Revenue & Order Volume
- Customers by Loyalty Tier
- Product Category Performance
- Loyalty Tier Performance
- Country & Category Performance

The matrix provides a detailed breakdown of:

- Country
- Total Orders
- Net Revenue
- Payment Gap Orders

---

## 3️⃣ Risk & Payment Analysis

This page focuses specifically on payment and refund-related risks.

### Visualizations

- Payment Risk by Method
- Payment Gap by Country
- Payment Gap by Product Category
- Refund Rate by Country
- Payment & Refund Risk Detail

The detailed risk table includes:

- Total Orders
- Payment Gap Orders
- Payment Gap %
- Total Refund
- Refund Rate

---

# 🎛️ Interactive Features

The dashboard includes interactive filters for:

- Year
- Country
- Membership Tier

Users can select different filter combinations to analyze specific segments of the business.

Visuals also support cross-filtering to explore relationships between markets, customers, products, and payment behavior.

---

# 📊 Key Metrics

| KPI | Description |
|---|---|
| Net Revenue | Revenue after refunds |
| Total Orders | Total number of unique orders |
| Total Customers | Unique customers |
| AOV | Average revenue per order |
| Refund Rate | Percentage of revenue refunded |
| Payment Records | Orders with corresponding payment records |
| Payment Gap Orders | Orders without a payment record |
| Payment Gap % | Percentage of orders without payment records |

---

# 📁 Repository Structure

```text
Starbucks-Sales-Revenue-Analytics/
│
├── Screenshot/
│   ├── Executive Overview.png
│   ├── Market & Customer Deep Dive.png
│   └── Risk & Payment Analysis.png
│
├── sql query/
│   └── Starbucks_SQL_Schema.sql
│
├── Customers.csv
├── Orders.csv
├── Revenue.csv
├── Starbucks.pbix
└── README.md
```

---

# 🖼️ Dashboard Screenshots

## Executive Overview

![Executive Overview]

## Market & Customer Deep Dive

![Market & Customer Deep Dive]

## Risk & Payment Analysis

![Risk & Payment Analysis]
---

# 🎓 Skills Demonstrated

- Excel Data Cleaning
- SQL
- PostgreSQL
- Database Design
- Relational Data Modeling
- Primary Keys
- Foreign Keys
- Data Validation
- Power BI
- DAX
- KPI Development
- Data Visualization
- Business Intelligence
- Interactive Dashboard Design
- Business Analysis

---

# 🚀 Project Outcome

The final dashboard transforms raw sales, customer, and payment data into an interactive business intelligence solution.

It allows users to explore:

- Market performance
- Revenue contribution
- Order volume
- Customer loyalty
- Product categories
- Payment gaps
- Refund patterns
- Payment-method risk

The project demonstrates an end-to-end analytics workflow from **raw data preparation to database modeling, analytical calculations, and interactive Power BI reporting**.

---

## 👤 Author

**Vansh Silwant**

Data Analytics | Power BI | SQL | PostgreSQL | Excel

---

## ⭐ Project

If you find this project useful, feel free to explore the repository and dashboard files.
