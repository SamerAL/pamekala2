SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_d_AUDIT_Document]
ON [Production].[Document]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Production].[Document]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:08 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Production].[Document]'
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
		'Document',
		'Production',
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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'DocumentNode',
		CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[DocumentNode] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'Title',
		CONVERT(nvarchar(4000), OLD.[Title], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[Title] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'Owner',
		CONVERT(nvarchar(4000), OLD.[Owner], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[Owner] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'FolderFlag',
		CONVERT(nvarchar(4000), OLD.[FolderFlag], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[FolderFlag] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'FileName',
		CONVERT(nvarchar(4000), OLD.[FileName], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[FileName] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'FileExtension',
		CONVERT(nvarchar(4000), OLD.[FileExtension], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[FileExtension] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'Revision',
		CONVERT(nvarchar(4000), OLD.[Revision], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[Revision] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'ChangeNumber',
		CONVERT(nvarchar(4000), OLD.[ChangeNumber], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[ChangeNumber] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'Status',
		CONVERT(nvarchar(4000), OLD.[Status], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'DocumentSummary',
		CONVERT(nvarchar(4000), OLD.[DocumentSummary], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[DocumentSummary] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'Document',
		dbo.AUDIT_fn_HexToStr(OLD.[Document]),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
	FROM deleted OLD
	WHERE
		OLD.[Document] Is Not Null

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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'rowguid',
		CONVERT(nvarchar(4000), OLD.[rowguid], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
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
		convert(nvarchar(1500), IsNull('[DocumentNode]=N'''+replace(CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])), '''', '''''')+'''', '[DocumentNode] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[DocumentNode])))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_d_AUDIT_Document]', @order='Last', @stmttype='DELETE'
GO
