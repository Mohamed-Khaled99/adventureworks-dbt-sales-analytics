with numbers as (

    select
        row_number() over (order by (select null)) - 1 as n

    from {{ ref('int_sales') }}

),

date_spine as (

    select
        dateadd(
            day,
            n,
            cast('2011-05-31' as date)
        ) as full_date

    from numbers

    where n <= datediff(
        day,
        '2011-05-31',
        '2014-06-30'
    )

)

select
    cast(convert(varchar(8), full_date, 112) as int) as date_key,
    full_date,
    year(full_date) as year,
    datepart(quarter, full_date) as quarter,
    month(full_date) as month,
    datename(month, full_date) as month_name,
    day(full_date) as day,
    datename(weekday, full_date) as day_name

from date_spine