{% snapshot customer_snapshot %}

{{
    config(
        target_schema='dbo',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='modified_date',
        invalidate_hard_deletes=True
    )
}}

select
    CAST(customer_id As INT) As customer_id ,
    first_name,
    last_name,
    company_name,
    email_address,
    modified_date

from {{ ref('stg_customer') }}

{% endsnapshot %}