select w1.id from weather w1 JOIN weather w2 on w1.recordDate > w2.recordDate and w1.temperature > w2.temperature
where trunc(w1.recordDate - w2.recordDate) = 1;

select w2.id as id from Weather  w1
 join  Weather w2
on  w1.recordDate+1=w2.recordDate
where w1.temperature <w2.temperature ;