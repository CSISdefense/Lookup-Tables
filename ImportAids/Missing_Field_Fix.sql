select distinct lettercontract
,undefinitized_action_name
from ErrorLogging.FPDSbetaViolatesConstraint

select iif(max(lettercontract) = min(lettercontract),min(lettercontract),NULL)
,iif(max(parentdunsnumber) = min(parentdunsnumber),min(parentdunsnumber),NULL)
,idvagencyid
,idvpiid
,idvmodificationnumber
,piid
,modnumber
,transactionnumber
,signeddate
from ErrorLogging.FPDSbetaViolatesConstraint
group by idvagencyid
,idvpiid
,idvmodificationnumber
,piid
,modnumber
,transactionnumber
,signeddate
having max(lettercontract) <> min(lettercontract)
or max(parentdunsnumber) <> min(parentdunsnumber)


update f
set lettercontract=coalesce(nullif(beta.lettercontract,''),f.lettercontract)
,parentdunsnumber=coalesce(nullif(beta.parentdunsnumber,''),f.parentdunsnumber)
,ccrexception =coalesce(nullif(beta.ccrexception ,''),f.ccrexception )
from contract.fpds f
inner join (
select iif(max(lettercontract) = min(lettercontract),min(lettercontract),NULL) as lettercontract
,iif(max(parentdunsnumber) = min(parentdunsnumber),min(parentdunsnumber),NULL) as parentdunsnumber
,iif(max(ccrexception ) = min(ccrexception ),min(ccrexception ),NULL) as ccrexception
,idvagencyid
,idvpiid
,idvmodificationnumber
,piid
,modnumber
,transactionnumber
,signeddate
from ErrorLogging.FPDSbetaViolatesConstraint
group by idvagencyid
,idvpiid
,idvmodificationnumber
,piid
,modnumber
,transactionnumber
,signeddate) as beta
on f.idvagencyid=beta.idvagencyid
and f.idvpiid=beta.idvpiid
and f.idvmodificationnumber=beta.idvmodificationnumber
and f.piid=beta.piid
and f.modnumber=beta.modnumber
and f.transactionnumber=beta.transactionnumber
and f.signeddate=beta.signeddate
where (nullif(beta.lettercontract,'') is not null and nullif(f.lettercontract,'') is null)
or (nullif(beta.parentdunsnumber,'') is not null and nullif(f.parentdunsnumber,'') is null)
or (nullif(beta.ccrexception,'') is not null and nullif(f.ccrexception,'') is null)