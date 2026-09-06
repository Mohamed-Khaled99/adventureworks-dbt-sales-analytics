select
    ProductCategoryID as product_category_id,
    Name as category_name,
    ParentProductCategoryID as parent_product_category_id

from {{ source('saleslt', 'ProductCategory') }}