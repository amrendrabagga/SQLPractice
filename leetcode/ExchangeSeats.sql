SELECT id,
CASE WHEN mod(id,2)=0 THEN
(LAG(student,1) OVER(order by id))
ELSE (COALESCE(LEAD(student,1) OVER(order by id), student))
END AS student
FROM seat;

-- easy and efficient
select row_number() over (order by new_id) as id, student from (select student,
case when mod(id,2) = 0
then id -1
else id+1
end as new_id
from seat);