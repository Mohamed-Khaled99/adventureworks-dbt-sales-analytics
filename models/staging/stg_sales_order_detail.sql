select
    SalesOrderDetailID as sales_order_detail_id,
    SalesOrderID as sales_order_id,
    OrderQty as order_quantity,
    ProductID as product_id,
    UnitPrice as unit_price,
    UnitPriceDiscount as unit_price_discount,
    LineTotal as line_total

from {{ source('saleslt', 'SalesOrderDetail') }}