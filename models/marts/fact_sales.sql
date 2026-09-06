{{ config(
    materialized='incremental',
    unique_key='sales_order_detail_id'
) }}

{% set sales_columns = [
    'sales_order_id',
    'sales_order_detail_id',
    'customer_id',
    'product_id',
    'order_date',
    'order_quantity',
    'unit_price',
    'gross_sales',
    'discount_amount',
    'order_status'
] %}

select

    {% for column in sales_columns %}
        {{ column }},
    {% endfor %}

    {{ calculate_net_sales(
        'order_quantity',
        'unit_price',
        'unit_price_discount'
    ) }} as net_sales,

    modified_date

from {{ ref('int_sales') }}

{% if is_incremental() %}

where modified_date >= (
    select max(modified_date)
    from {{ this }}
)

{% endif %}