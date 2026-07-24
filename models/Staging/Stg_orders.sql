{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    product_id,
    quantity,
    unit_price,
    total_order_amount,
    status,
    shipped_date
from {{ ref('stg_orders') }}