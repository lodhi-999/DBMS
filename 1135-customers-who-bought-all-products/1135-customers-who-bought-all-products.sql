# Write your MySQL query statement below
with H as (select  a.customer_id, count(distinct a.product_key) as No_of_Products_purchased from Customer a inner join Product b
on a.product_key = b.product_key
group by a.customer_id)

select customer_id from H
where No_of_Products_purchased = (select count(distinct product_key) from Product)
