
-- fra_config.sql
-- show location and size of FRA
-- jkstill 2015-08-18 16:03:00 PDT

col fra_location format a30
col fra_size format a20

select fra_location, fra_size from (
	select name, value
	from v$parameter2
	where name like 'db_recovery_file_dest%'
)d
pivot ( max(value) for name in (
	'db_recovery_file_dest' as FRA_LOCATION,
	'db_recovery_file_dest_size' as FRA_SIZE
	)
)
/
