SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_d_AUDIT_SalesOrderHeader]
ON [Sales].[SalesOrderHeader]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Sales].[SalesOrderHeader]
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
		'SalesOrderHeader',
		'Sales',
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SalesOrderID',
		CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[SalesOrderID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'RevisionNumber',
		CONVERT(nvarchar(4000), OLD.[RevisionNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'OrderDate',
		CONVERT(nvarchar(4000), OLD.[OrderDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'DueDate',
		CONVERT(nvarchar(4000), OLD.[DueDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[DueDate] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipDate',
		CONVERT(nvarchar(4000), OLD.[ShipDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Status',
		CONVERT(nvarchar(4000), OLD.[Status], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'OnlineOrderFlag',
		CONVERT(nvarchar(4000), OLD.[OnlineOrderFlag], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[OnlineOrderFlag] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'PurchaseOrderNumber',
		CONVERT(nvarchar(4000), OLD.[PurchaseOrderNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[PurchaseOrderNumber] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'AccountNumber',
		CONVERT(nvarchar(4000), OLD.[AccountNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[AccountNumber] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CustomerID',
		CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CustomerID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SalesPersonID',
		CONVERT(nvarchar(4000), OLD.[SalesPersonID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[SalesPersonID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'TerritoryID',
		CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[TerritoryID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'BillToAddressID',
		CONVERT(nvarchar(4000), OLD.[BillToAddressID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[BillToAddressID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipToAddressID',
		CONVERT(nvarchar(4000), OLD.[ShipToAddressID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ShipToAddressID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ShipMethodID',
		CONVERT(nvarchar(4000), OLD.[ShipMethodID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CreditCardID',
		CONVERT(nvarchar(4000), OLD.[CreditCardID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CreditCardID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CreditCardApprovalCode',
		CONVERT(nvarchar(4000), OLD.[CreditCardApprovalCode], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CreditCardApprovalCode] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'CurrencyRateID',
		CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CurrencyRateID] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'SubTotal',
		CONVERT(nvarchar(4000), OLD.[SubTotal], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'TaxAmt',
		CONVERT(nvarchar(4000), OLD.[TaxAmt], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Freight',
		CONVERT(nvarchar(4000), OLD.[Freight], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'Comment',
		CONVERT(nvarchar(4000), OLD.[Comment], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
	FROM deleted OLD
	WHERE
		OLD.[Comment] Is Not Null

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
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), OLD.[rowguid], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0), '[SalesOrderID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_d_AUDIT_SalesOrderHeader]', @order='Last', @stmttype='DELETE'
GO
