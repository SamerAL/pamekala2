SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_i_AUDIT_SalesTaxRate]
ON [Sales].[SalesTaxRate]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [Sales].[SalesTaxRate]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:13 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Sales].[SalesTaxRate]'
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
		'SalesTaxRate',
		'Sales',
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'SalesTaxRateID',
		CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[SalesTaxRateID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'StateProvinceID',
		CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[StateProvinceID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'TaxType',
		CONVERT(nvarchar(4000), NEW.[TaxType], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[TaxType] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'TaxRate',
		CONVERT(nvarchar(4000), NEW.[TaxRate], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[TaxRate] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'Name',
		CONVERT(nvarchar(4000), NEW.[Name], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[Name] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), NEW.[rowguid], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[rowguid] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0), '[SalesTaxRateID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0))
	FROM inserted NEW
	WHERE NEW.[ModifiedDate] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[Sales].[tr_i_AUDIT_SalesTaxRate]', @order='Last', @stmttype='INSERT'
GO
