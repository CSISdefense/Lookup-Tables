select count(*)
from raw.source_procurement_transaction

alter table raw.source_procurement_transaction
add fiscal_year smallint

update raw.source_procurement_transaction
set fiscal_year=
case when date_part('month',to_date(action_date, 'yyyy-mm-dd'))>=10
			  then date_part('year',to_date(action_date, 'yyyy-mm-dd'))+1
	else date_part('year',to_date(action_date, 'yyyy-mm-dd'))
			  end
+
iif(date_part('month',to_date(action_date, 'yyyy-mm-dd'))>=10,1,0)