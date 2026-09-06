select distinct
    product_id,
    product_name,
    product_number,
    product_category_id,
    list_price

from {{ ref('stg_product') }}