SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Person].[tr_d_AUDIT_EmailAddress]
ON [Person].[EmailAddress]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Person].[EmailAddress]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:07 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Person].[EmailAddress]'
	Select @ROWS_COUNT=count(*) from deleted
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
		'EmailAddress',
		'Person',
		3,	--	ACTION ID For DELETE
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
	


	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0), '[BusinessEntityID] Is Null') + ' AND ' + IsNull('[EmailAddressID]='+CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0), '[EmailAddressID] Is Null')),
		'BusinessEntityID',
		CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0))
	FROM deleted OLD
	WHERE
		OLD.[BusinessEntityID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0), '[BusinessEntityID] Is Null') + ' AND ' + IsNull('[EmailAddressID]='+CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0), '[EmailAddressID] Is Null')),
		'EmailAddressID',
		CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0))
	FROM deleted OLD
	WHERE
		OLD.[EmailAddressID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0), '[BusinessEntityID] Is Null') + ' AND ' + IsNull('[EmailAddressID]='+CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0), '[EmailAddressID] Is Null')),
		'EmailAddress',
		CONVERT(nvarchar(4000), OLD.[EmailAddress], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0))
	FROM deleted OLD
	WHERE
		OLD.[EmailAddress] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0), '[BusinessEntityID] Is Null') + ' AND ' + IsNull('[EmailAddressID]='+CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0), '[EmailAddressID] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), OLD.[rowguid], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0))
	FROM deleted OLD
	WHERE
		OLD.[rowguid] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0), '[BusinessEntityID] Is Null') + ' AND ' + IsNull('[EmailAddressID]='+CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0), '[EmailAddressID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[EmailAddressID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ModifiedDate] Is Not Null

	-- Lookup
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

END
GO
EXEC sp_settriggerorder @triggername= '[Person].[tr_d_AUDIT_EmailAddress]', @order='Last', @stmttype='DELETE'
GO
