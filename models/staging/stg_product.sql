select
    ProductID as product_id,
    Name as product_name,
    ProductNumber as product_number,
    ProductCategoryID as product_category_id,
    ListPrice as list_price,
    ModifiedDate as modified_date

from {{ source('saleslt', 'Product') }}