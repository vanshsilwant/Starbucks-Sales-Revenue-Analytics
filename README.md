
# Starbucks Sales & Revenue Analytics

An interactive business intelligence dashboard built to analyze Starbucks sales, revenue, customer loyalty, payment gaps, and refund patterns.

## Tools & Technologies

- Excel
- PostgreSQL
- Power BI
- SQL
- DAX

## Project Workflow

Excel → PostgreSQL → Power BI

## Data Preparation

- Removed duplicate records
- Handled missing values
- Replaced appropriate numerical nulls with 0
- Replaced missing categorical values with "Unknown"
- Created structured PostgreSQL tables
- Defined primary and foreign key relationships

## Data Model

The project uses three main business tables:

- Customers
- Orders
- Revenue

A dedicated Date table was also created for time-based analysis.

Relationships:

Customers → Orders → Revenue

## Key Analysis

The dashboard analyzes:

- Revenue by country
- Order volume by country
- Customer distribution by loyalty tier
- Revenue by product category
- Loyalty tier performance
- Payment gaps by country
- Payment gaps by product category
- Refund rate by country
- Payment risk by payment method

## Key Metrics

- Net Revenue
- Total Orders
- Total Customers
- Average Order Value (AOV)
- Refund Rate
- Payment Records
- Payment Gap Orders
- Payment Gap %

## Payment Gap

Payment gap represents orders for which no corresponding payment record was found in the Revenue table.

Current analysis:

- Total Orders: 10,000
- Payment Records: 9,493
- Payment Gap Orders: 507
- Payment Gap: 5.07%

## Dashboard Pages

### 1. Executive Overview
High-level view of revenue, orders, customers, loyalty performance, and payment gaps.

### 2. Market & Customer Deep Dive
Detailed analysis of countries, loyalty tiers, product categories, and order volume.

### 3. Risk & Payment Analysis
Detailed analysis of payment gaps, payment methods, and refund exposure.

## Skills Demonstrated

- Data Cleaning
- SQL
- PostgreSQL
- Database Relationships
- Data Modeling
- Power BI
- DAX
- Data Visualization
- Business Analysis
