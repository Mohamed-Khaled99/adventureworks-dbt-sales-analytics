# AdventureWorks dbt Sales Analytics

End-to-end Analytics Engineering project built with **dbt Core + SQL Server**, transforming AdventureWorksLT sales data into a tested and documented Star Schema for Power BI.

## Architecture

[Architecture Screenshot]

**Source → Staging → Intermediate → Marts → Power BI**

## Data Warehouse

[Star Schema Screenshot]

### Fact
- `fact_sales`

### Dimensions
- `dim_customer`
- `dim_product`
- `dim_product_category`
- `dim_date`

## dbt Implementation

| Area | Implementation |
|---|---|
| Sources | AdventureWorksLT / SalesLT |
| Transformations | Staging + Intermediate + Marts |
| Data Modeling | Star Schema |
| Seeds | Product Category Mapping |
| Testing | not_null, unique, relationships, accepted_values |
| Snapshots | Customer history / SCD Type 2 |
| Macros | Reusable sales calculation logic |
| Documentation | Sources, models, columns & lineage |
| Materialization | Views / Tables |

## Power BI

[Dashboard Screenshot]

Dashboard includes:

- Total Sales
- Total Orders
- Total Customers
- Sales by Category
- Sales Trend
- Top Products

## Project Structure

```text
models/
├── staging/
├── intermediate/
└── marts/

seeds/
snapshots/
macros/
tests/