with payments as (
    select
        ORDER_ID
        ,PAYMENT_INSTALLMENTS
        ,PAYMENT_SEQUENTIAL
        ,PAYMENT_TYPE
    from {{ ref('stg_order_payments') }}
)
select * from payments