with source as (
    select * from {{ source('raw', 'products') }}
),

transformed as (
    select
        product_id,
        product_name,
        category,
        price,
        created_at
    from source
)

select * from transformed