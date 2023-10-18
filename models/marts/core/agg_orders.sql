with
    agg_orders as (
        select
            order_date,
            count(distinct order_id) as total_orders,
            count(distinct customer_id) as total_customers,
            sum(payment_value) as total_revenue
        from {{ ref("fct_orders") }}
        group by order_date
    ),
    product_rank as (
        select
            o.order_date,
            p.product_category_name,
            row_number() over (
                partition by o.order_date order by sum(o.payment_value)
            ) as rank_,
            sum(o.payment_value) as category_revenue
        from {{ ref("fct_orders") }} o
        join {{ ref("dim_product") }} p using (product_id)
        group by o.order_date, p.product_category_name
    )
select
    ao.order_date as "Order Purchase Date",
    total_orders "Number of Orders",
    total_customers "Number of Orders per Customer",
    total_revenue as "Revenue (USD)",
    total_revenue / total_orders as "Average Revenue per Order (USD)",
    listagg(product_category_name, ', ') within group (order by total_revenue) as "Top 3 Products per Category",
    listagg(CAST(category_revenue as VARCHAR),', ' ) within group (order by total_revenue) as "Top 3 Products Revenue per Category (USD)"
from agg_orders ao
left join product_rank pr on ao.order_date = pr.order_date and rank_ <= 3
group by ao.order_date,total_orders,total_customers,total_revenue,total_revenue / total_orders
order by 1 desc
