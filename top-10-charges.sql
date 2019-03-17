-- Top 10: Users with highest charges, and daily distribution for each of them
select cl.uid, ifnull(ac.Name, "Undefined") name, sum(timestampdiff(second, Timestamp_start, Timestamp_end)) * 0.04 as charged_total
from call_logs cl
left join accounts ac on cl.UID = ac.UID
where cl.Call_dir = "out" and cl.to not in (select Phone_number from numbers)
group by uid
order by 3 desc
limit 10;