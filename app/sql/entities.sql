SELECT s.name as SchemaName, 
t.name as TableName, 
c.name as ColumnName, 
case ty.name when 'sysname' then 'varchar' else ty.name end as TypeName, 
ty.is_nullable as IsNullable FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN SYS.TYPES ty on c.system_type_id = ty.system_type_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE  t.name not in ('__BackupVerificationDate','__MigrationHistory','__RefactorLog') and t.name not like 'sys%'

--select * from sys.columns where name ='LeaseCertificationType'