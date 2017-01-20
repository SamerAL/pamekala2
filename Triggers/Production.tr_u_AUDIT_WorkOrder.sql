SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_WorkOrder]
ON [Production].[WorkOrder]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[WorkOrder]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:11 PM
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

	--Set @TABLE_NAME = '[Production].[WorkOrder]'
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
		'WorkOrder',
		'Production',
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
	
	If UPDATE([WorkOrderID])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'WorkOrderID',
			CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			WHERE (
			
			
				(
					NEW.[WorkOrderID] <>
					OLD.[WorkOrderID]
				) Or
			
				(
					NEW.[WorkOrderID] Is Null And
					OLD.[WorkOrderID] Is Not Null
				) Or
				(
					NEW.[WorkOrderID] Is Not Null And
					OLD.[WorkOrderID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ProductID])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[ProductID] <>
					OLD.[ProductID]
				) Or
			
				(
					NEW.[ProductID] Is Null And
					OLD.[ProductID] Is Not Null
				) Or
				(
					NEW.[ProductID] Is Not Null And
					OLD.[ProductID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([OrderQty])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'OrderQty',
			CONVERT(nvarchar(4000), OLD.[OrderQty], 0),
			CONVERT(nvarchar(4000), NEW.[OrderQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[OrderQty] <>
					OLD.[OrderQty]
				) Or
			
				(
					NEW.[OrderQty] Is Null And
					OLD.[OrderQty] Is Not Null
				) Or
				(
					NEW.[OrderQty] Is Not Null And
					OLD.[OrderQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ScrappedQty])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'ScrappedQty',
			CONVERT(nvarchar(4000), OLD.[ScrappedQty], 0),
			CONVERT(nvarchar(4000), NEW.[ScrappedQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[ScrappedQty] <>
					OLD.[ScrappedQty]
				) Or
			
				(
					NEW.[ScrappedQty] Is Null And
					OLD.[ScrappedQty] Is Not Null
				) Or
				(
					NEW.[ScrappedQty] Is Not Null And
					OLD.[ScrappedQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([StartDate])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'StartDate',
			CONVERT(nvarchar(4000), OLD.[StartDate], 121),
			CONVERT(nvarchar(4000), NEW.[StartDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[StartDate] <>
					OLD.[StartDate]
				) Or
			
				(
					NEW.[StartDate] Is Null And
					OLD.[StartDate] Is Not Null
				) Or
				(
					NEW.[StartDate] Is Not Null And
					OLD.[StartDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([EndDate])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'EndDate',
			CONVERT(nvarchar(4000), OLD.[EndDate], 121),
			CONVERT(nvarchar(4000), NEW.[EndDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[EndDate] <>
					OLD.[EndDate]
				) Or
			
				(
					NEW.[EndDate] Is Null And
					OLD.[EndDate] Is Not Null
				) Or
				(
					NEW.[EndDate] Is Not Null And
					OLD.[EndDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([DueDate])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'DueDate',
			CONVERT(nvarchar(4000), OLD.[DueDate], 121),
			CONVERT(nvarchar(4000), NEW.[DueDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[DueDate] <>
					OLD.[DueDate]
				) Or
			
				(
					NEW.[DueDate] Is Null And
					OLD.[DueDate] Is Not Null
				) Or
				(
					NEW.[DueDate] Is Not Null And
					OLD.[DueDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ScrapReasonID])
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'ScrapReasonID',
			CONVERT(nvarchar(4000), OLD.[ScrapReasonID], 0),
			CONVERT(nvarchar(4000), NEW.[ScrapReasonID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
			where (
			
			
				(
					NEW.[ScrapReasonID] <>
					OLD.[ScrapReasonID]
				) Or
			
				(
					NEW.[ScrapReasonID] Is Null And
					OLD.[ScrapReasonID] Is Not Null
				) Or
				(
					NEW.[ScrapReasonID] Is Not Null And
					OLD.[ScrapReasonID] Is Null
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_WorkOrder]', @order='Last', @stmttype='UPDATE'
GO
