# Write your MySQL query statement below

select c.name from Orders a 
join Company b 
on a.com_id = b.com_id and b.name = 'RED'
right join SalesPerson c
on a.sales_id = c.sales_id 
where a.order_id is null