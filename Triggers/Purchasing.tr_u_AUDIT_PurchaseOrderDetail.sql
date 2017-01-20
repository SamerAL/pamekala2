SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_u_AUDIT_PurchaseOrderDetail]
ON [Purchasing].[PurchaseOrderDetail]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Purchasing].[PurchaseOrderDetail]
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

	--Set @TABLE_NAME = '[Purchasing].[PurchaseOrderDetail]'
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
		'PurchaseOrderDetail',
		'Purchasing',
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
	
	If UPDATE([PurchaseOrderID])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'PurchaseOrderID',
			CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
			WHERE (
			
			
				(
					NEW.[PurchaseOrderID] <>
					OLD.[PurchaseOrderID]
				) Or
			
				(
					NEW.[PurchaseOrderID] Is Null And
					OLD.[PurchaseOrderID] Is Not Null
				) Or
				(
					NEW.[PurchaseOrderID] Is Not Null And
					OLD.[PurchaseOrderID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PurchaseOrderDetailID])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'PurchaseOrderDetailID',
			CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0),
			CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
			WHERE (
			
			
				(
					NEW.[PurchaseOrderDetailID] <>
					OLD.[PurchaseOrderDetailID]
				) Or
			
				(
					NEW.[PurchaseOrderDetailID] Is Null And
					OLD.[PurchaseOrderDetailID] Is Not Null
				) Or
				(
					NEW.[PurchaseOrderDetailID] Is Not Null And
					OLD.[PurchaseOrderDetailID] Is Null
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'DueDate',
			CONVERT(nvarchar(4000), OLD.[DueDate], 121),
			CONVERT(nvarchar(4000), NEW.[DueDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'OrderQty',
			CONVERT(nvarchar(4000), OLD.[OrderQty], 0),
			CONVERT(nvarchar(4000), NEW.[OrderQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
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
	
	If UPDATE([UnitPrice])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'UnitPrice',
			CONVERT(nvarchar(4000), OLD.[UnitPrice], 2),
			CONVERT(nvarchar(4000), NEW.[UnitPrice], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
			where (
			
			
				(
					NEW.[UnitPrice] <>
					OLD.[UnitPrice]
				) Or
			
				(
					NEW.[UnitPrice] Is Null And
					OLD.[UnitPrice] Is Not Null
				) Or
				(
					NEW.[UnitPrice] Is Not Null And
					OLD.[UnitPrice] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ReceivedQty])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'ReceivedQty',
			CONVERT(nvarchar(4000), OLD.[ReceivedQty], 0),
			CONVERT(nvarchar(4000), NEW.[ReceivedQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
			where (
			
			
				(
					NEW.[ReceivedQty] <>
					OLD.[ReceivedQty]
				) Or
			
				(
					NEW.[ReceivedQty] Is Null And
					OLD.[ReceivedQty] Is Not Null
				) Or
				(
					NEW.[ReceivedQty] Is Not Null And
					OLD.[ReceivedQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([RejectedQty])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'RejectedQty',
			CONVERT(nvarchar(4000), OLD.[RejectedQty], 0),
			CONVERT(nvarchar(4000), NEW.[RejectedQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
			where (
			
			
				(
					NEW.[RejectedQty] <>
					OLD.[RejectedQty]
				) Or
			
				(
					NEW.[RejectedQty] Is Null And
					OLD.[RejectedQty] Is Not Null
				) Or
				(
					NEW.[RejectedQty] Is Not Null And
					OLD.[RejectedQty] Is Null
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')+' AND '+IsNull('[PurchaseOrderDetailID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderDetailID], NEW.[PurchaseOrderDetailID]), 0), '[PurchaseOrderDetailID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PurchaseOrderDetailID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderDetailID], 0) or (NEW.[PurchaseOrderDetailID] Is Null and OLD.[PurchaseOrderDetailID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_u_AUDIT_PurchaseOrderDetail]', @order='Last', @stmttype='UPDATE'
GO
