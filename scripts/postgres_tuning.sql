select count(*)
from raw.source_procurement_transaction


--100355603 18m00s 
alter table raw.source_procurement_transaction
add fiscal_year smallint
--01s

create schema helper
--1h1m
select distinct action_date
into helper.date_list
from raw.source_procurement_transaction

--100355603 18m00s 
alter table helper.date_list
add fiscal_year smallint
--01s

update raw.source_procurement_transaction
set fiscal_year=
case when date_part('month',to_date(action_date, 'yyyy-mm-dd'))>=10
			  then date_part('year',to_date(action_date, 'yyyy-mm-dd'))+1
	else date_part('year',to_date(action_date, 'yyyy-mm-dd'))
			  end


--Much faster than the 75h failure, done in minutes
update helper.date_list
set fiscal_year=
case when date_part('month',to_date(action_date, 'yyyy-mm-dd'))>=10
			  then date_part('year',to_date(action_date, 'yyyy-mm-dd'))+1
	else date_part('year',to_date(action_date, 'yyyy-mm-dd'))
			  end

--At least 16h
update raw.source_procurement_transaction as spt
set fiscal_year=dl.fiscal_year
from  helper.date_list as dl
where spt.action_date=dl.action_date


--38m48s
create index on raw.source_procurement_transaction (action_date)
include (detached_award_proc_unique)
