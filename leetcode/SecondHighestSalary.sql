select salary as SecondHighestSalary from (select salary,
 rank() over (order by salary desc) r from Employee ) where r = 2
UNION
select null as SecondHighestSalary from dual where not exists(
    select salary from
    (select salary, rank() over (order by salary desc) r from Employee) where r=2
);

-- this query is corelated sub query,
--used min() cause if no rows returned then min gives null
select nvl(min(salary), null) as SecondHighestSalary from Employee e1
 where 1 = (select count(distinct salary) from employee e2 where e2.salary > e1.salary);