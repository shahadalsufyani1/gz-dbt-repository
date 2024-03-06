SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_prise AS FLOAT64), 
    ROUND(s.quantity*CAST(p.purchase_prise AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_prise AS FLOAT64),2) AS margin
FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ ref('stg_raw__product') }} p 
    ON s.pdt_id = p.products_id
