SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_d_AUDIT_PurchaseOrderHeader]
ON [Purchasing].[PurchaseOrderHeader]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Purchasing].[PurchaseOrderHeader]
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
		'PurchaseOrderHeader',
		'Purchasing',
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
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'PurchaseOrderID',
		CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[PurchaseOrderID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'RevisionNumber',
		CONVERT(nvarchar(4000), OLD.[RevisionNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[RevisionNumber] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'Status',
		CONVERT(nvarchar(4000), OLD.[Status], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Status] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'EmployeeID',
		CONVERT(nvarchar(4000), OLD.[EmployeeID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[EmployeeID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'VendorID',
		CONVERT(nvarchar(4000), OLD.[VendorID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[VendorID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ShipMethodID',
		CONVERT(nvarchar(4000), OLD.[ShipMethodID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ShipMethodID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'OrderDate',
		CONVERT(nvarchar(4000), OLD.[OrderDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[OrderDate] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ShipDate',
		CONVERT(nvarchar(4000), OLD.[ShipDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ShipDate] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'SubTotal',
		CONVERT(nvarchar(4000), OLD.[SubTotal], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[SubTotal] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'TaxAmt',
		CONVERT(nvarchar(4000), OLD.[TaxAmt], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[TaxAmt] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'Freight',
		CONVERT(nvarchar(4000), OLD.[Freight], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Freight] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0), '[PurchaseOrderID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0))
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
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_d_AUDIT_PurchaseOrderHeader]', @order='Last', @stmttype='DELETE'
GO
