
with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select orders.customer_id, 
           MAX(payments.Amount) AS lifetime_value
    from orders
    inner join payments using (order_id)
    group by orders.customer_id
)

select * from final order by customer_id