select
d.name as Department,
e.name as Employee, e.salary as Salary from
(select name, departmentid, salary, DENSE_RANK() over (partition by departmentid order by salary desc) rnk from employee) e
INNER JOIN department d ON e.departmentid=d.id
where e.rnk < 4;