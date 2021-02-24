--Settings
select name, setting, boot_val, reset_val, unit
from pg_settings
order by name;  


--What is Vacuuming

SELECT datname, usename, pid, state, wait_event, current_timestamp - xact_start AS xact_runtime, query
FROM pg_stat_activity 
WHERE upper(query) LIKE '%VACUUM%' 
ORDER BY xact_start;