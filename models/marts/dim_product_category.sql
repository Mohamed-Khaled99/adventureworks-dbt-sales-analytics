with product_categories as (

    select
        product_category_id,
        category_name,
        parent_product_category_id

    from {{ ref('stg_product_category') }}

),

category_mapping as (

    select
        product_category_id,
        business_category

    from {{ ref('product_category_mapping') }}

)

select
    pc.product_category_id,
    pc.category_name,
    pc.parent_product_category_id,
    cm.business_category

from product_categories pc

left join category_mapping cm
    on pc.product_category_id = cm.product_category_id