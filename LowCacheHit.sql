SELECT query,
calls,
total_time,
total_time / calls as time_per_call,
stddev_time,rows,rows / calls as rows_per_call,
100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) AS hit_percent
FROM pg_stat_statements
ORDER BY 6 desc , 2 desc;
