with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
    products_id,
    purchSE_PRICE as purchase_prise

    from source

)

select * from renamed
