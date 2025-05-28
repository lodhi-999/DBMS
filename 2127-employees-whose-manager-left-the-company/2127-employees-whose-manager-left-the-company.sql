# Write your MySQL query statement below
select a.employee_id from Employees a
where a.manager_id is not null and a.salary<30000 and a.manager_id in (select b.manager_id 
                                                                    from Employees b
                                                                    where  b.manager_id  is not null and b.manager_id not  in (select employee_id from Employees))
order by a.employee_id