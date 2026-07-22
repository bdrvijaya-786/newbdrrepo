with source as (
    select * from {{ source('raw', 'customers') }}
),

transformed as (
    select
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || coalesce(last_name, '') as full_name,
        email,
        phone,
        city,
        country,
        created_at
    from source
)

select * from transformed