# AdventureWorks dbt Sales Analytics

## Project Overview

This project demonstrates an end-to-end analytics engineering workflow using **dbt Core and Microsoft SQL Server**.

The project transforms raw sales data from **AdventureWorksLT** into a tested and analytics-ready **Star Schema** that can be consumed by Power BI.

### Project Objectives

- Build a structured dbt project using SQL Server.
- Transform raw source data through staging and intermediate models.
- Build a dimensional Star Schema.
- Implement data quality tests.
- Use Seeds for reference data.
- Implement a Snapshot for historical tracking using SCD Type 2 concepts.
- Use Jinja and reusable Macros.
- Implement an Incremental Model.
- Document the project and model dependencies.

---

## Architecture

```text
AdventureWorksLT
       │
       ▼
    Sources
       │
       ▼
   Staging Layer
       │
       ▼
 Intermediate Layer
       │
       ▼
    Marts Layer
       │
       ▼
   Star Schema
       │
       ▼
    Power BI
Source Data

The project uses the following tables from the SalesLT schema:

Customer
Product
ProductCategory
SalesOrderHeader
SalesOrderDetail

These tables are configured as dbt Sources.

Project Structure
sales_dbt_project/
│
├── analyses/
│
├── macros/
│   └── calculate_net_sales.sql
│
├── models/
│   ├── marts/
│   │   ├── dim_customer.sql
│   │   ├── dim_date.sql
│   │   ├── dim_product.sql
│   │   ├── dim_product_category.sql
│   │   ├── fact_sales.sql
│   │   └── schema.yml
│   │
│   └── staging/
│       ├── Intermediate/
│       │   └── int_sales.sql
│       ├── source.yml
│       ├── stg_customer.sql
│       ├── stg_product.sql
│       ├── stg_product_category.sql
│       ├── stg_sales_order_detail.sql
│       └── stg_sales_order_header.sql
│
├── seeds/
│   └── product_category_mapping.csv
│
├── snapshots/
│   └── customer_snapshot.sql
│
├── tests/
│
├── .gitignore
├── dbt_project.yml
└── README.md
Data Transformation Layers
1. Staging Layer

The staging layer prepares the raw source tables for downstream transformations.

It includes:

stg_customer
stg_product
stg_product_category
stg_sales_order_header
stg_sales_order_detail

Typical transformations include:

Column renaming
Data type standardization
Basic data cleaning
Source-to-model preparation
2. Intermediate Layer
int_sales

The intermediate model combines sales order headers and details with customer and product information.

It prepares the transactional data required by the final sales fact table.

Key calculations include:

Gross Sales
Discount Amount
Net Sales

The project uses dbt ref() dependencies to build the transformation flow.

Star Schema

The final analytics layer follows a Star Schema design.

Fact Table

fact_sales

Contains sales transaction-level data including:

Sales Order ID
Sales Order Detail ID
Customer ID
Product ID
Order Date
Order Quantity
Unit Price
Gross Sales
Discount Amount
Net Sales
Order Status
Modified Date
Dimension Tables

dim_customer

Contains customer attributes.

dim_product

Contains product attributes.

dim_product_category

Contains product category information and business classification.

dim_date

Provides date attributes such as:

Date
Year
Quarter
Month
Month Name
Day
Day Name
Seeds

The project uses a dbt Seed containing product category mapping information.

seeds/product_category_mapping.csv

The Seed provides a business-level category classification that is used downstream in the product category dimension.

To load the Seed:

dbt seed

For a full reload:

dbt seed --full-refresh
Data Quality

Data quality is implemented using dbt tests.

The project includes tests for:

not_null
unique
relationships
accepted_values

Examples include validating:

Unique customer IDs
Unique product IDs
Unique sales detail IDs
Valid customer relationships
Valid product relationships
Valid product category relationships
Valid order status values

Run the tests using:

dbt test
Snapshots & SCD Type 2

The project includes a customer snapshot:

snapshots/customer_snapshot.sql

The snapshot tracks changes to customer attributes over time using:

customer_id as the unique key
modified_date as the update timestamp
Timestamp-based snapshot strategy

This preserves historical versions of customer records and demonstrates the implementation of SCD Type 2 behavior.

Run the snapshot using:

dbt snapshot
Jinja & Macros

The project uses Jinja and dbt Macros to create reusable SQL logic.

Example Macro:

macros/calculate_net_sales.sql

The Macro is used to encapsulate reusable sales calculation logic.

Incremental Model

The project includes an Incremental Model:

incremental_sales.sql

The model demonstrates incremental processing for handling new or updated sales data without rebuilding the complete dataset every time.

Documentation & Lineage

The dbt project includes model and column documentation through YAML configuration.

Generate dbt documentation:

dbt docs generate

Then serve the documentation locally:

dbt docs serve

The dbt documentation provides:

Model documentation
Source documentation
Column descriptions
Test information
Model dependencies
Lineage / DAG visualization
Running the Project
Install Dependencies

Create and activate a Python virtual environment, then install the required dbt SQL Server adapter.

pip install dbt-sqlserver
Verify the Project
dbt debug
Load Seeds
dbt seed
Run Models
dbt run
Run Tests
dbt test
Run Snapshots
dbt snapshot
Generate Documentation
dbt docs generate
Technologies
dbt Core
Microsoft SQL Server
Python
SQL
Jinja
Power BI
Git & GitHub
Project Outcome

The project demonstrates a complete dbt-based analytics engineering workflow:

Raw Data
   ↓
Sources
   ↓
Staging
   ↓
Intermediate Transformations
   ↓
Star Schema
   ↓
Data Quality Tests
   ↓
Historical Tracking
   ↓
Documentation & Lineage
   ↓
Power BI

The final result is a structured, tested, documented, and analytics-ready sales data warehouse built with dbt and SQL Server.