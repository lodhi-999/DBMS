# Write your MySQL query statement below
with h as (select  customer_id , min(order_date )as ic, min(customer_pref_delivery_date) as foc
from Delivery

group by customer_id )
select round((count(case when ic = foc then ic end)/ count(foc))*100, 2) as immediate_percentage from h



