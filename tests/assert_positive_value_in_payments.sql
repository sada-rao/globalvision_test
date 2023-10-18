--  Asserting only for positive values in payment table
select 
    order_id,
    sum(payment_value) as total_payment
    from {{ ref('stg_order_payments') }}
group by 1
having not(total_payment >=0)