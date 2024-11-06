SELECT p.name as ProcedureName, s.name as SchemaName, 
t.name as Type, 
r.name as ColumnName, r.is_nullable as IsNullable, r.max_length as MaxLength   
FROM  sys.procedures(nolock)  AS p 
left join sys.schemas s 
	on p.schema_id=s.schema_id
CROSS APPLY sys.dm_exec_describe_first_result_set_for_object(p.object_id, 0)  AS r
inner join sys.types (nolock) t on t.system_type_id = r.system_type_id
where 
--p.name like '%[_]%' 
  s.name in ('UEC','LeaseAnalysis','Security','dbo','Reference')
and p.name not like '%Test_%' -- exluce test
and p.name not like '%savekumar%' -- exluce  
and p.name not like '%_2019%' -- exluce  
and p.name not like '%Bk_Orig%' -- exluce  
and p.name not like 'sp_%' -- exclude system sps
and t.name in ('bit','int','date','datetime','decimal','nvarchar','smallint','tinyint','uniqueidentifier','varchar','varbinary','bigint','decimal','char')
and p.name like '%uspRecoveryGet%'
order by p.name