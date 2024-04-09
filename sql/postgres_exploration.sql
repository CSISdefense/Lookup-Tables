select SUBSTRING(unique_award_key,1,8) as award_idv_flag,
date_part('year',to_date(p.action_date, 'yyyy-mm-dd')) fiscal_year,
count(*)
from raw.source_procurement_transaction p
group by date_part('year',to_date(p.action_date, 'yyyy-mm-dd')),
SUBSTRING(unique_award_key,1,8)
order by fiscal_year,award_idv_flag



select
max(length([additional_reporting])) as additional_reporting
,max(length([entity_data_source])) as [entity_data_source]
,max(length([foreign_owned_and_located])) as [foreign_owned_and_located]
,max(length([legal_entity_zip_last4])) as [legal_entity_zip_last4]
,max(length([legal_entity_zip5])) as [legal_entity_zip5]
,max(length([place_of_perform_country_n])) as [place_of_perform_country_n]
,max(length([place_of_perform_state_nam])) as [place_of_perform_state_nam]
,max(length([place_of_perform_zip_last4])) as [place_of_perform_zip_last4]
,max(length([pulled_from])) as [pulled_from]
,max(length([ultimate_parent_unique_ide])) as [ultimate_parent_unique_ide]
,max(length([vendor_enabled])) as [vendor_enabled]
from raw.source_procurement_transaction p