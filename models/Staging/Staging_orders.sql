{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'orders') }}
),

transformed as (
    select
        order_id,
        customer_id,
        product_id,
        quantity,
        unit_price,
        quantity * unit_price as total_order_amount,
        status,
        shipped_date
    from source
)

select * from transformed