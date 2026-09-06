# AdventureWorks dbt Sales Analytics

End-to-end Analytics Engineering project built with **dbt Core + SQL Server**, transforming AdventureWorksLT sales data into a tested and documented Star Schema for Power BI.

## Architecture
<img width="1024" height="430" alt="image" src="https://github.com/user-attachments/assets/5d3b847c-0f5e-4e34-aec8-ed4f8c726b1f" />






## **DAG : Source → Staging → Intermediate → Marts**



<img width="1801" height="877" alt="DAG" src="https://github.com/user-attachments/assets/de0f2977-773e-4d62-9c32-69d27bded8de" />


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

<img width="1920" height="1007" alt="vs" src="https://github.com/user-attachments/assets/3e27308d-5e22-4d0b-8f17-1704c6c901a3" />



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
```

## Documentation 
<img width="1847" height="925" alt="docs" src="https://github.com/user-attachments/assets/28bdd134-7e1a-4749-8fcf-8e0fabb70868" />

