with cost_analysis as(
select material_cost, insurance_cost, revenue
from cs_cost cco
left join cs_payment cpa
on cco.transaction_id = cpa.id
)
select
    sum(material_cost) as total_material_cost,
    sum(insurance_cost) as total_insurance_cost,
    sum(material_cost + insurance_cost) as total_cost,
    sum(revenue) as total_revenue,
    sum(revenue - (material_cost + insurance_cost)) as total_profit
from
    cost_analysis;
    
   