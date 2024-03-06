WITH source AS (
        SELECT * FROM `optimal-analogy-414708`.`gz_raw_data`.`sales`
    ),
    renamed AS (
        SELECT
            date_date,
            orders_id,
            pdt_id,
            revenue,
            quantity
        FROM source
    )
    SELECT * FROM renamed