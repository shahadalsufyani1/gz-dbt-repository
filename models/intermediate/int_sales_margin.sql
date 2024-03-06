WITH joined_data AS (
    SELECT
        s.date_date,
        s.orders_id,
        s.pdt_id,
        s.quantity,
        CAST(p.purchase_prise AS FLOAT64) AS purchase_price,
         ROUND(s.quantity*CAST(p.purchase_prise AS FLOAT64),2) AS purchase_cost,
        s.revenue
    FROM {{ ref('stg_raw__sales') }} s
    INNER JOIN {{ ref('stg_raw__product') }} p
    ON s.pdt_id = p.products_id
)

SELECT
    date_date,
    orders_id,
    pdt_id,
    quantity,
    purchase_price,
    revenue,
    purchase_cost,
    ROUND(((revenue - (quantity * purchase_price)) / NULLIF(revenue, 0)), 3) AS margin
FROM joined_data