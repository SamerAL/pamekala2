SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SalesOrderHeaderSalesReason]
ON [Sales].[SalesOrderHeaderSalesReason]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SalesOrderHeaderSalesReason]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:13 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE			varchar(50),
		@AUDIT_LOG_TRANSACTION_ID	Int,
		@PRIM_KEY			nvarchar(4000),
		@Inserted	    		bit,
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Sales].[SalesOrderHeaderSalesReason]'
	Select @ROWS_COUNT=count(*) from inserted
	SET @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

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
		'SalesOrderHeaderSalesReason',
		'Sales',
		1,	--	ACTION ID For UPDATE
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
	

	SET @Inserted = 0
	
	If UPDATE([SalesOrderID])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')+' AND '+IsNull('[SalesReasonID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesReasonID], NEW.[SalesReasonID]), 0), '[SalesReasonID] Is Null')),
		    'SalesOrderID',
			CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)=CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0) or (NEW.[SalesReasonID] Is Null and OLD.[SalesReasonID] Is Null))
			WHERE (
			
			
				(
					NEW.[SalesOrderID] <>
					OLD.[SalesOrderID]
				) Or
			
				(
					NEW.[SalesOrderID] Is Null And
					OLD.[SalesOrderID] Is Not Null
				) Or
				(
					NEW.[SalesOrderID] Is Not Null And
					OLD.[SalesOrderID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesReasonID])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')+' AND '+IsNull('[SalesReasonID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesReasonID], NEW.[SalesReasonID]), 0), '[SalesReasonID] Is Null')),
		    'SalesReasonID',
			CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0),
			CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)=CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0) or (NEW.[SalesReasonID] Is Null and OLD.[SalesReasonID] Is Null))
			WHERE (
			
			
				(
					NEW.[SalesReasonID] <>
					OLD.[SalesReasonID]
				) Or
			
				(
					NEW.[SalesReasonID] Is Null And
					OLD.[SalesReasonID] Is Not Null
				) Or
				(
					NEW.[SalesReasonID] Is Not Null And
					OLD.[SalesReasonID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ModifiedDate])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')+' AND '+IsNull('[SalesReasonID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesReasonID], NEW.[SalesReasonID]), 0), '[SalesReasonID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[SalesReasonID], 0)=CONVERT(nvarchar(4000), OLD.[SalesReasonID], 0) or (NEW.[SalesReasonID] Is Null and OLD.[SalesReasonID] Is Null))
			where (
			
			
				(
					NEW.[ModifiedDate] <>
					OLD.[ModifiedDate]
				) Or
			
				(
					NEW.[ModifiedDate] Is Null And
					OLD.[ModifiedDate] Is Not Null
				) Or
				(
					NEW.[ModifiedDate] Is Not Null And
					OLD.[ModifiedDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	-- Watch
	
	-- Lookup
	
	IF @Inserted = 0
	BEGIN
		DELETE FROM [AdventureWorks2014].dbo.AUDIT_LOG_TRANSACTIONS WHERE AUDIT_LOG_TRANSACTION_ID = @AUDIT_LOG_TRANSACTION_ID
	END

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  
End
GO
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SalesOrderHeaderSalesReason]', @order='Last', @stmttype='UPDATE'
GO
