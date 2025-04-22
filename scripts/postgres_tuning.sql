CREATE TABLE helper.contract_fpds_ctu_list(
	fiscal_year smallint NULL,
contract_transaction_unique_key varchar(154) NULL,
last_modified_date timestamp NULL,
CSIStransactionID int NULL) 

ON [PRIMARY]
GO

select count(*)
from raw.source_procurement_transaction


--100355603 18m00s 
alter table raw.source_procurement_transaction
add fiscal_year smallint
--01s

create schema helper


CREATE TABLE helper.contract_fpds_ctu_list(
	fiscal_year smallint NULL,
contract_transaction_unique_key varchar(154) NULL,
last_modified_date time NULL,
CSIStransactionID int NULL) 

ON [PRIMARY]
GO



--38m48s
create index on raw.source_procurement_transaction (action_date)
include (detached_award_proc_unique)

--31m
create index on raw.source_procurement_transaction (last_modified)
include (detached_award_proc_unique)

--1h1m
select distinct action_date
into helper.date_list
from raw.source_procurement_transaction


insert into helper.date_list (action_date)
select distinct last_modified
from raw.source_procurement_transaction spt
left outer join helper.date_list dl
on spt.last_modified=dl.action_date
where dl.action_date is null and last_modified is not null


alter table helper.date_list
add fiscal_year smallint,
add column t_date timestamp



--01s


--4m48s
update helper.date_list
set t_date=cast(action_date as timestamp)
where t_date is null 

update helper.date_list
set fiscal_year=case 
	when date_part('month',t_date)>=10 --date_part('month',t_date)>=10
			  then date_part('year',t_date)+1
	else date_part('year',t_date)
			  end
where fiscal_year is null



-- update raw.source_procurement_transaction
-- set fiscal_year=
-- case when date_part('month',to_date(action_date, 'yyyy-mm-dd'))>=10
			  -- then date_part('year',to_date(action_date, 'yyyy-mm-dd'))+1
	-- else date_part('year',to_date(action_date, 'yyyy-mm-dd'))
			  -- end

--At least 16h, not worth it.
-- update raw.source_procurement_transaction as spt
-- set fiscal_year=dl.fiscal_year
-- from  helper.date_list as dl
-- where spt.action_date=dl.action_date







