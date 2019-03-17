-- Top 10: Most active users
select cl.uid, ifnull(ac.Name, "Undefined") name, sum(timestampdiff(second, Timestamp_start, Timestamp_end)) as seconds_talked
from call_logs cl
left outer join accounts ac on cl.UID = ac.UID
group by uid
order by 3 desc
limit 10;