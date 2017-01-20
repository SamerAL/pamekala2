SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_i_AUDIT_SalesOrderHeader]
ON [Sales].[SalesOrderHeader]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [Sales].[SalesOrderHeader]
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

	--Set @TABLE_NAME = '[Sales].[SalesOrderHeader]'
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
		'SalesOrderHeader',
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SalesOrderID',
		CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[SalesOrderID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'RevisionNumber',
		CONVERT(nvarchar(4000), NEW.[RevisionNumber], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[RevisionNumber] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'OrderDate',
		CONVERT(nvarchar(4000), NEW.[OrderDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[OrderDate] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'DueDate',
		CONVERT(nvarchar(4000), NEW.[DueDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[DueDate] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipDate',
		CONVERT(nvarchar(4000), NEW.[ShipDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[ShipDate] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Status',
		CONVERT(nvarchar(4000), NEW.[Status], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[Status] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'OnlineOrderFlag',
		CONVERT(nvarchar(4000), NEW.[OnlineOrderFlag], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[OnlineOrderFlag] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'PurchaseOrderNumber',
		CONVERT(nvarchar(4000), NEW.[PurchaseOrderNumber], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[PurchaseOrderNumber] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'AccountNumber',
		CONVERT(nvarchar(4000), NEW.[AccountNumber], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[AccountNumber] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CustomerID',
		CONVERT(nvarchar(4000), NEW.[CustomerID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[CustomerID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SalesPersonID',
		CONVERT(nvarchar(4000), NEW.[SalesPersonID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[SalesPersonID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'TerritoryID',
		CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[TerritoryID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'BillToAddressID',
		CONVERT(nvarchar(4000), NEW.[BillToAddressID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[BillToAddressID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipToAddressID',
		CONVERT(nvarchar(4000), NEW.[ShipToAddressID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[ShipToAddressID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipMethodID',
		CONVERT(nvarchar(4000), NEW.[ShipMethodID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[ShipMethodID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CreditCardID',
		CONVERT(nvarchar(4000), NEW.[CreditCardID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[CreditCardID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CreditCardApprovalCode',
		CONVERT(nvarchar(4000), NEW.[CreditCardApprovalCode], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[CreditCardApprovalCode] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CurrencyRateID',
		CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[CurrencyRateID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SubTotal',
		CONVERT(nvarchar(4000), NEW.[SubTotal], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[SubTotal] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'TaxAmt',
		CONVERT(nvarchar(4000), NEW.[TaxAmt], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[TaxAmt] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Freight',
		CONVERT(nvarchar(4000), NEW.[Freight], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[Freight] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Comment',
		CONVERT(nvarchar(4000), NEW.[Comment], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[Comment] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), NEW.[rowguid], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[ModifiedDate] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[Sales].[tr_i_AUDIT_SalesOrderHeader]', @order='Last', @stmttype='INSERT'
GO
