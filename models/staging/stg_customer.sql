select
    CustomerID as customer_id,
    FirstName as first_name,
    LastName as last_name,
    CompanyName as company_name,
    EmailAddress as email_address,
    ModifiedDate as modified_date

from {{ source('saleslt', 'Customer') }}