/****** Script for SelectTopNRows command from SSMS  ******/

SELECT 
 isnull(gec.[GEC],c2lc.Country2LetterCode) as GEC
		,gec.[Entity]
		,isnull(c2lc.Country2LetterCode,Entity) as CountryText
      ,nullif(gec.[ISOalpha2],'-') as [ISOalpha2]
      ,nullif(gec.[ISOalpha3],'-') as ISOalpha3
      ,nullif(gec.[ISOnumerical],'-') as ISOnumerical
	  ,c2lc.Region
	  ,c2lc.War
	   into location.GEC
   FROM [DIIG].[ErrorLogging].[GEC] gec
   
  full outer join FPDSTypeTable.Country2LetterCode c2lc
  on c2lc.Country2LetterCode=gec.gec
  where nullif(isnull(gec.[GEC],c2lc.Country2LetterCode) ,'-') is not null
  


  

  insert into FPDSTypeTable.Country3LetterCode
  (Country3LetterCode,
  Country3LetterCodeText,
  --GEC,
  IsInternational,
  isoAlpha3)
select distinct cc.[alpha-3],
cc.name,
cc.isforeign,
cc.[alpha-3]
  FROM [DIIG].[FPDSTypeTable].[vendorcountrycode] v
  left outer join FPDSTypeTable.Country3LetterCode c3lc
  on v.Country3LetterCode = c3lc.Country3LetterCode
  left outer join location.GEC g
  on g.gec=v.Country3LetterCode
  left outer join FPDSTypeTable.Country3LetterCode ic3lc
  on v.ISOalpha3 = ic3lc.Country3LetterCode
  left outer join Location.CountryCodes cc
  on v.isoAlpha3 = cc.[alpha-3]
  where v.country3lettercode is null and cc.[alpha-3] is not null
  --and len(v.country3lettercode)=2 and nullif(g.ISOalpha3,'') is not null
  
