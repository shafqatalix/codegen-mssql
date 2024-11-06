 
declare @ProcName varchar(max)=N'##PROC##';

declare @ProcedureText varchar(max);
SELECT top 1 @ProcedureText=[definition]
		FROM sys.sql_modules  
		WHERE object_id = (OBJECT_ID(@ProcName)) 
  
 SELECT OBJECT_NAME(referencing_id) AS ParentProcedure,   
    o.type_desc AS Type,   
    --COALESCE(COL_NAME(referencing_id, referencing_minor_id), '(n/a)') AS referencing_minor_id,   
    --referencing_class_desc,  
    --referenced_server_name, referenced_database_name, referenced_schema_name,  
    referenced_entity_name as ChildProcedure,   
    --COALESCE(COL_NAME(referenced_id, referenced_minor_id), '(n/a)') AS referenced_column_name,  
    --is_caller_dependent, is_ambiguous, 
	@ProcedureText as ParentProcedureText,
	charindex(referenced_entity_name,@ProcedureText) as ChildExecutionOrder	 
FROM sys.sql_expression_dependencies AS sed  
INNER JOIN sys.objects AS o ON sed.referencing_id = o.object_id  
WHERE referencing_id = OBJECT_ID(@ProcName)
order by ChildExecutionOrder
