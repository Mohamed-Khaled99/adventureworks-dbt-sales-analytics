{% macro calculate_net_sales(quantity, unit_price, discount) %}

    (
        ({{ quantity }} * {{ unit_price }})
        -
        ({{ quantity }} * {{ unit_price }} * {{ discount }})
    )

{% endmacro %}