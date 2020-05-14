SELECT "orderID" AS order_id,
       amount
FROM {{ source('stripe', 'payment') }}