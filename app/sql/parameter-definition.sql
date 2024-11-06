select 
sp.name as ProcedureName,
s.name as SchemaName,
--substring(sp.name, 0, patindex('%[_]%', sp.name)) as ClassName, 
--substring(sp.name, patindex('%[_]%', sp.name) + 1, len(sp.name)) as ProcName,
right(p.name, len(p.name) - 1) as ParamName,
t.name as ParamType,
-- special case when param of varchar is -1 (for unknown reason)
case when t.name='varchar' and p.max_length<0 then 2000 else p.max_length end as ParamLength,
p.is_output as ParamOut,
t.is_user_defined as IsUserDefined
from sys.procedures sp
	inner join sys.schemas s 
	on sp.schema_id=s.schema_id
	left join sys.parameters p
	on p.object_id = sp.object_id
	left join sys.types t
	on t.system_type_id = p.system_type_id and t.user_type_id=p.user_type_id
		
where 
(t.name <> 'sysname' or t.name is null)
--and sp.name like '%[_]%' 
and s.name in ('UEC','LeaseAnalysis','Security','dbo','Reference')
and sp.name not like '%Test_%' -- exluce test
and sp.name not like '%savekumar%' -- exluce  
and sp.name not like '%_2019%' -- exluce  
and sp.name not like '%Bk_Orig%' -- exluce  
and sp.name not like 'sp_%' -- exclude system sps
--and (t.name in ('bit','int','date','datetime','decimal','nvarchar','smallint','tinyint','uniqueidentifier','varchar','varbinary','bigint','decimal','char') OR t.name is null)
--and sp.name like '%uspLeaseDealInfoGet%' 
order by sp.object_id, p.parameter_id 