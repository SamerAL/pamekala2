SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_i_AUDIT_SalesOrderDetail]
ON [Sales].[SalesOrderDetail]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [Sales].[SalesOrderDetail]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:12 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Sales].[SalesOrderDetail]'
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
		'SalesOrderDetail',
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
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'SalesOrderID',
		CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[SalesOrderID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'SalesOrderDetailID',
		CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[SalesOrderDetailID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'CarrierTrackingNumber',
		CONVERT(nvarchar(4000), NEW.[CarrierTrackingNumber], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[CarrierTrackingNumber] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'OrderQty',
		CONVERT(nvarchar(4000), NEW.[OrderQty], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[OrderQty] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'ProductID',
		CONVERT(nvarchar(4000), NEW.[ProductID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[ProductID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'SpecialOfferID',
		CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[SpecialOfferID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'UnitPrice',
		CONVERT(nvarchar(4000), NEW.[UnitPrice], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[UnitPrice] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'UnitPriceDiscount',
		CONVERT(nvarchar(4000), NEW.[UnitPriceDiscount], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[UnitPriceDiscount] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), NEW.[rowguid], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[rowguid] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null') + ' AND ' + IsNull('[SalesOrderDetailID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0), '[SalesOrderDetailID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderDetailID], 0))
	FROM inserted NEW
	WHERE NEW.[ModifiedDate] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[Sales].[tr_i_AUDIT_SalesOrderDetail]', @order='Last', @stmttype='INSERT'
GO
