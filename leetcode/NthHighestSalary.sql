CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    select salary into result from (select salary from employee e1 where N-1 = (select count(distinct salary) from employee e2 where e2.salary > e1.salary)
    UNION
    select max(salary) as salary from employee e1 where N-1 = (select count(distinct salary) from employee e2 where e2.salary > e1.salary));
    RETURN result;
END;

CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    select salary into result from (
    select salary, rownum r1 from (select distinct salary from employee order by salary desc)) where r1=N;
    RETURN result;
END;