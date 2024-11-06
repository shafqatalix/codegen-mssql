 
SELECT 
p.name as ProcedureName, 
s.name as SchemaName, 
r.error_type_desc 
FROM  sys.procedures(nolock)  AS p 
inner join sys.schemas s on p.schema_id=s.schema_id
CROSS APPLY sys.dm_exec_describe_first_result_set_for_object(p.object_id, 0)  AS r
where 
r.error_type_desc in ('CONFLICTING_RESULTS')
and s.name in ('UEC','LeaseAnalysis','Security','dbo') 
--p.name not like '%sp_%'
/*
RECURSION
UNSUPPORTED_STATEMENT
SYNTAX
MISC
CONFLICTING_RESULTS -- multi result
TEMPORARY_TABLE -- 
DYNAMIC_SQL
OBJECT_TYPE_NOT_SUPPORTED
*/
 

 