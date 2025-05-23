# Write your MySQL query statement below
select P.project_id, round(avg(b.experience_years ),2) as average_years  from Project P join Employee b
on P.employee_id      = b.employee_id      
group by P.project_id