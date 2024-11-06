SELECT   
sch.name AS SchemaName,
userDefinedTypes.name AS UdtTypeName,
clmns.name as ColumnName,
ut.name as DbTypeName
FROM sys.types AS userDefinedTypes   
      
INNER JOIN sys.schemas AS sch   
	ON sch.schema_id = userDefinedTypes.schema_id   
inner JOIN sys.table_types AS userDefinedTableTypes   
	ON userDefinedTableTypes.user_type_id = userDefinedTypes.user_type_id   
left join sys.columns AS clmns   
	on userDefinedTableTypes.type_table_object_id=clmns.object_id
left JOIN sys.types AS t 
	ON t.system_type_id = clmns.system_type_id   
LEFT JOIN sys.types ut 
	ON ut.user_type_id = clmns.user_type_id   

order by UdtTypeName