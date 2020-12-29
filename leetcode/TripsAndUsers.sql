with cte as (
    select count(t1.id) as total_req,
    t1.request_at as day,
    sum(case when t1.status like 'cancelled%' then 1 else 0 end) as num_cancelled
    from trips t1
    inner join users u1 on
    t1.client_id = u1.users_id and u1.banned <> 'Yes'
    inner join users u2 on
    t1.driver_id = u2.users_id and u2.banned <> 'Yes'
    group by t1.request_at

)
select day as "Day", round(num_cancelled*1.0 / total_req, 2) as "Cancellation Rate" from cte
where day between '2013-10-01' and '2013-10-03'
order by day;