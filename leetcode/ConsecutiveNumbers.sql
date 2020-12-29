select distinct num as ConsecutiveNums from(
    select num, lead(num, 1) over(order by id) as check1,
        lead(num, 2) over (order by id) as check2 from logs
 )
 where check1=num and check2=num;


select distinct a.num as ConsecutiveNums from logs a JOIN logs b
on a.num=b.num and a.id-b.id=1
JOIN logs c on
a.num=c.num and a.id-c.id=2;