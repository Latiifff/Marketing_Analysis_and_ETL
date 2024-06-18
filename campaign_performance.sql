with campaign_performance as(
select campaign_name, discount_rate, revenue, payment_method, bank_code,
transaction_date, transaction_status, username, product_category
from cs_campaign cca
left join cs_payment cpa
on cca.id =cpa.id
left join cs_transaction ctr
on cpa.id = ctr.id
where transaction_status = 'SUCCESS'
order by to_date(transaction_date, 'DD-MM-YYYY') desc
)
, revenue_generated as (
select campaign_name, sum(revenue) as total_revenue
from campaign_performance
group by 1
)
, discount_rates as(
select campaign_name, avg(discount_rate) as average_discount_rate
from campaign_performance
group by 1
)
, marketing_effectiveness as(
select campaign_name, payment_method,
    count(distinct username) as total_unique_customers,
    count(distinct product_category) as total_unique_product_categories
from campaign_performance
group by 1, 2
)
select * from marketing_effectiveness

select * from discount_rates

select * from revenue_generated

select * from marketing_effectiveness

