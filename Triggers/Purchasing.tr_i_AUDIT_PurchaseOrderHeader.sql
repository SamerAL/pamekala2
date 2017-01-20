SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_i_AUDIT_PurchaseOrderHeader]
ON [Purchasing].[PurchaseOrderHeader]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [Purchasing].[PurchaseOrderHeader]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:11 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Purchasing].[PurchaseOrderHeader]'
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
		'PurchaseOrderHeader',
		'Purchasing',
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'PurchaseOrderID',
		CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[PurchaseOrderID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'RevisionNumber',
		CONVERT(nvarchar(4000), NEW.[RevisionNumber], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'Status',
		CONVERT(nvarchar(4000), NEW.[Status], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'EmployeeID',
		CONVERT(nvarchar(4000), NEW.[EmployeeID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[EmployeeID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'VendorID',
		CONVERT(nvarchar(4000), NEW.[VendorID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[VendorID] Is Not Null
    
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ShipMethodID',
		CONVERT(nvarchar(4000), NEW.[ShipMethodID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'OrderDate',
		CONVERT(nvarchar(4000), NEW.[OrderDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ShipDate',
		CONVERT(nvarchar(4000), NEW.[ShipDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'SubTotal',
		CONVERT(nvarchar(4000), NEW.[SubTotal], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'TaxAmt',
		CONVERT(nvarchar(4000), NEW.[TaxAmt], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'Freight',
		CONVERT(nvarchar(4000), NEW.[Freight], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))
	FROM inserted NEW
	WHERE NEW.[ModifiedDate] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_i_AUDIT_PurchaseOrderHeader]', @order='Last', @stmttype='INSERT'
GO
