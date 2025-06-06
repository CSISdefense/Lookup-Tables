SELECT  
coalesce(d.fiscal_year,c.fiscal_year) as fiscal_year
,case
when c.contract_transaction_unique_key is null
then 'Postgres'
when p.detached_award_proc_unique is null
then 'FPDS'
end
,sum(1) as n
   FROM  helper.contract_fpds_ctu_list c
   FULL OUTER JOIN raw.source_procurement_transaction p
   on p.detached_award_proc_unique=c.contract_transaction_unique_key 
   left outer join helper.date_list d
   on p.action_date=d.action_date
   WHERE p.detached_award_proc_unique is NULL or  c.contract_transaction_unique_key is  null
group by case 
when c.contract_transaction_unique_key is null
then 'Postgres'
when p.detached_award_proc_unique is null
then 'FPDS'
end
,coalesce(d.fiscal_year,c.fiscal_year)