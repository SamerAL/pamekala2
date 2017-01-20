SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_d_AUDIT_CreditCard]
ON [Sales].[CreditCard]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Sales].[CreditCard]
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

	--Set @TABLE_NAME = '[Sales].[CreditCard]'
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
		'CreditCard',
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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'CreditCardID',
		CONVERT(nvarchar(4000), OLD.[CreditCardID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'CardType',
		CONVERT(nvarchar(4000), OLD.[CardType], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CardType] Is Not Null

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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'CardNumber',
		CONVERT(nvarchar(4000), OLD.[CardNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CardNumber] Is Not Null

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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'ExpMonth',
		CONVERT(nvarchar(4000), OLD.[ExpMonth], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ExpMonth] Is Not Null

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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'ExpYear',
		CONVERT(nvarchar(4000), OLD.[ExpYear], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ExpYear] Is Not Null

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
		convert(nvarchar(1500), IsNull('[CreditCardID]='+CONVERT(nvarchar(4000), OLD.[CreditCardID], 0), '[CreditCardID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CreditCardID], 0))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_d_AUDIT_CreditCard]', @order='Last', @stmttype='DELETE'
GO
