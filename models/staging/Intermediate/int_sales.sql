with sales_data as (

    select
        h.sales_order_id,
        h.order_date,
        h.customer_id,
        h.order_status,
        h.modified_date,

        d.sales_order_detail_id,
        d.product_id,
        d.order_quantity,
        d.unit_price,
        d.unit_price_discount,
        d.line_total

    from {{ ref('stg_sales_order_header') }} h

    inner join {{ ref('stg_sales_order_detail') }} d
        on h.sales_order_id = d.sales_order_id

),

enriched_sales as (

    select
        s.sales_order_id,
        s.sales_order_detail_id,
        s.customer_id,
        s.product_id,
        s.order_date,
        s.order_status,
        s.modified_date,
        s.order_quantity,
        s.unit_price,
        s.unit_price_discount,
        s.line_total,

        p.product_name,
        p.product_number,
        p.product_category_id,

        c.first_name,
        c.last_name,
        c.company_name,
        c.email_address

    from sales_data s

    inner join {{ ref('stg_product') }} p
        on s.product_id = p.product_id

    inner join {{ ref('stg_customer') }} c
        on s.customer_id = c.customer_id

),

calculated_sales as (

    select
        *,

        order_quantity * unit_price as gross_sales,

        (order_quantity * unit_price)
            * unit_price_discount as discount_amount,

        {{ calculate_net_sales(
            'order_quantity',
            'unit_price',
            'unit_price_discount'
        ) }} as net_sales

    from enriched_sales

)

select *
from calculated_sales
where order_quantity > 0
  and unit_price >= 0