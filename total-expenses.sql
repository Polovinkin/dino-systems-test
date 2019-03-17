-- Total expenses
select sum(timestampdiff(second, Timestamp_start, Timestamp_end)) * 0.04 as total_expenses 
from call_logs cl
where Call_dir = "out" and cl.to not in (select Phone_number from numbers);