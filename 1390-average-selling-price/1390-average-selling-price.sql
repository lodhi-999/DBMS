# Write your MySQL query statement below
With H as (select a.product_id ,  a.price  ,coalesce(b.purchase_date, 0) purchase_date , coalesce(b.units, 0) units , (b.units* a.price) as total_price from Prices a   left join UnitsSold b
on a.product_id = b.product_id and b.purchase_date between a.start_date and a.end_date
  
group by a.product_id, b.purchase_date)


select product_id ,  case when sum(units) = 0 then 0 
when sum(units) > 0 then round( sum(total_price) / sum(units) , 2)  end as average_price  from H 
group by product_id 