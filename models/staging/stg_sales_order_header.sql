select
    SalesOrderID as sales_order_id,
    OrderDate as order_date,
    CustomerID as customer_id,
    Status as order_status,
    ModifiedDate as modified_date

from {{ source('saleslt', 'SalesOrderHeader') }}