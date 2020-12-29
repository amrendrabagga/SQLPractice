select a.name as employee from employee a JOIN employee b on a.managerid=b.id and a.salary > b.salary;
