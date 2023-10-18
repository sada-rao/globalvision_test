with orders as(
    select * from {{ ref('stg_orders') }}
),
order_items as(
    select * from {{ ref('stg_order_items') }}
),

order_payments as(
    select * from {{ ref('stg_order_payments') }}
),
dim_date as(
    select DATEKEY as order_date
    from {{ ref('dim_dates') }}
),

final as (
    select 
        dim_date.order_date,
        orders.order_id,
        orders.customer_id,
        order_items.PRODUCT_ID,
        order_items.PRICE,
        order_items.FREIGHT_VALUE,
        order_payments.PAYMENT_VALUE        

    from orders
    left join order_payments using(order_id)
    join order_items using(order_id)
    join dim_date on orders.order_date = dim_date.order_date
)

select * from final