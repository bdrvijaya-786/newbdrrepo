{{ config(materialized='table') }}

with orders as (
    select *
    from {{ ref('orders') }}
),

customers as (
    select *
    from {{ ref('customers') }}
),

products as (
    select *
    from {{ ref('products') }}
)

select
    o.order_id,
    o.customer_id,
    c.full_name as customer_name,
    c.email as customer_email,
    o.product_id,
    p.product_name,
    p.category as product_category,
    o.quantity,
    o.unit_price,
    o.total_order_amount,
    o.status,
    o.shipped_date
from orders o
left join customers c
    on o.customer_id = c.customer_id
left join products p
    on o.product_id = p.product_id