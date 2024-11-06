IF 
(SELECT count(*)
FROM  sys.procedures p 
INNER JOIN sys.sql_modules m
ON    P.[object_id] = m.[object_id]
WHERE 1=1
AND p.name = @name
AND m.[definition] LIKE '% IF %') = 1
RAISERROR(N'Has conditionals, this method will return bad data.', 11, 1);

SET FMTONLY ON;
EXEC sp_executesql @statement=@statement;
SET FMTONLY OFF;