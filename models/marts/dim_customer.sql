select distinct
    customer_id,
    first_name,
    last_name,
    company_name,
    email_address

from {{ ref('stg_customer') }}