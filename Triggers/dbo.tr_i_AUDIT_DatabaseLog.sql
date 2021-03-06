SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_i_AUDIT_DatabaseLog]
ON [dbo].[DatabaseLog]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [dbo].[DatabaseLog]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:05 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[DatabaseLog]'
	Select @ROWS_COUNT=count(*) from inserted
	Set @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_TRANSACTIONS
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'DatabaseLog',
		'dbo',
		2,	--	ACTION ID For INSERT
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'AdventureWorks2014'
	)

	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	

	
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'DatabaseLogID',
		CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[DatabaseLogID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'PostTime',
		CONVERT(nvarchar(4000), NEW.[PostTime], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[PostTime] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'DatabaseUser',
		CONVERT(nvarchar(4000), NEW.[DatabaseUser], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[DatabaseUser] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'Event',
		CONVERT(nvarchar(4000), NEW.[Event], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[Event] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'Schema',
		CONVERT(nvarchar(4000), NEW.[Schema], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[Schema] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'Object',
		CONVERT(nvarchar(4000), NEW.[Object], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[Object] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'TSQL',
		CONVERT(nvarchar(4000), NEW.[TSQL], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[TSQL] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[DatabaseLogID]='+CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0), '[DatabaseLogID] Is Null')),
		'XmlEvent',
		CONVERT(nvarchar(max), CONVERT(nvarchar(max), NEW.[XmlEvent])),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DatabaseLogID], 0))
	FROM inserted NEW
	WHERE NEW.[XmlEvent] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_i_AUDIT_DatabaseLog]', @order='Last', @stmttype='INSERT'
GO
