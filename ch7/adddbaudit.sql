USE [WideWorldImporters]
GO
IF EXISTS (SELECT * FROM sys.database_audit_specifications WHERE name = 'AuditWWISpec')
BEGIN
    ALTER DATABASE AUDIT SPECIFICATION AuditWWISpec WITH (STATE = OFF)
    DROP DATABASE AUDIT SPECIFICATION AuditWWISpec
END
GO
CREATE DATABASE AUDIT SPECIFICATION AuditWWISpec  
FOR SERVER AUDIT AuditSQLServer  
ADD (SELECT ON SCHEMA::[Sales] BY public)
WITH (STATE = ON)
GO