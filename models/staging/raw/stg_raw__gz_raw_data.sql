with source as (
    select * from {{ source('raw_gs_sales', 'gz_raw_data') }}
),

-- Define a transformation query
renamed as (
    select
        date_date,
        orders_id,
        pdt_id,
        revenue,
        quantity
    from source
)

-- Final select from the transformed data
select * from renamed;