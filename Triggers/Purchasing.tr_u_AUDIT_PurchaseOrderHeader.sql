SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_u_AUDIT_PurchaseOrderHeader]
ON [Purchasing].[PurchaseOrderHeader]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Purchasing].[PurchaseOrderHeader]
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

	--Set @TABLE_NAME = '[Purchasing].[PurchaseOrderHeader]'
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
		'PurchaseOrderHeader',
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'PurchaseOrderID',
			CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
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
	
	If UPDATE([RevisionNumber])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'RevisionNumber',
			CONVERT(nvarchar(4000), OLD.[RevisionNumber], 0),
			CONVERT(nvarchar(4000), NEW.[RevisionNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[RevisionNumber] <>
					OLD.[RevisionNumber]
				) Or
			
				(
					NEW.[RevisionNumber] Is Null And
					OLD.[RevisionNumber] Is Not Null
				) Or
				(
					NEW.[RevisionNumber] Is Not Null And
					OLD.[RevisionNumber] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Status])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'Status',
			CONVERT(nvarchar(4000), OLD.[Status], 0),
			CONVERT(nvarchar(4000), NEW.[Status], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[Status] <>
					OLD.[Status]
				) Or
			
				(
					NEW.[Status] Is Null And
					OLD.[Status] Is Not Null
				) Or
				(
					NEW.[Status] Is Not Null And
					OLD.[Status] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([EmployeeID])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'EmployeeID',
			CONVERT(nvarchar(4000), OLD.[EmployeeID], 0),
			CONVERT(nvarchar(4000), NEW.[EmployeeID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[EmployeeID] <>
					OLD.[EmployeeID]
				) Or
			
				(
					NEW.[EmployeeID] Is Null And
					OLD.[EmployeeID] Is Not Null
				) Or
				(
					NEW.[EmployeeID] Is Not Null And
					OLD.[EmployeeID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([VendorID])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'VendorID',
			CONVERT(nvarchar(4000), OLD.[VendorID], 0),
			CONVERT(nvarchar(4000), NEW.[VendorID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[VendorID] <>
					OLD.[VendorID]
				) Or
			
				(
					NEW.[VendorID] Is Null And
					OLD.[VendorID] Is Not Null
				) Or
				(
					NEW.[VendorID] Is Not Null And
					OLD.[VendorID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ShipMethodID])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'ShipMethodID',
			CONVERT(nvarchar(4000), OLD.[ShipMethodID], 0),
			CONVERT(nvarchar(4000), NEW.[ShipMethodID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[ShipMethodID] <>
					OLD.[ShipMethodID]
				) Or
			
				(
					NEW.[ShipMethodID] Is Null And
					OLD.[ShipMethodID] Is Not Null
				) Or
				(
					NEW.[ShipMethodID] Is Not Null And
					OLD.[ShipMethodID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([OrderDate])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'OrderDate',
			CONVERT(nvarchar(4000), OLD.[OrderDate], 121),
			CONVERT(nvarchar(4000), NEW.[OrderDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[OrderDate] <>
					OLD.[OrderDate]
				) Or
			
				(
					NEW.[OrderDate] Is Null And
					OLD.[OrderDate] Is Not Null
				) Or
				(
					NEW.[OrderDate] Is Not Null And
					OLD.[OrderDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ShipDate])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'ShipDate',
			CONVERT(nvarchar(4000), OLD.[ShipDate], 121),
			CONVERT(nvarchar(4000), NEW.[ShipDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[ShipDate] <>
					OLD.[ShipDate]
				) Or
			
				(
					NEW.[ShipDate] Is Null And
					OLD.[ShipDate] Is Not Null
				) Or
				(
					NEW.[ShipDate] Is Not Null And
					OLD.[ShipDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SubTotal])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'SubTotal',
			CONVERT(nvarchar(4000), OLD.[SubTotal], 2),
			CONVERT(nvarchar(4000), NEW.[SubTotal], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[SubTotal] <>
					OLD.[SubTotal]
				) Or
			
				(
					NEW.[SubTotal] Is Null And
					OLD.[SubTotal] Is Not Null
				) Or
				(
					NEW.[SubTotal] Is Not Null And
					OLD.[SubTotal] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([TaxAmt])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'TaxAmt',
			CONVERT(nvarchar(4000), OLD.[TaxAmt], 2),
			CONVERT(nvarchar(4000), NEW.[TaxAmt], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[TaxAmt] <>
					OLD.[TaxAmt]
				) Or
			
				(
					NEW.[TaxAmt] Is Null And
					OLD.[TaxAmt] Is Not Null
				) Or
				(
					NEW.[TaxAmt] Is Not Null And
					OLD.[TaxAmt] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Freight])
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'Freight',
			CONVERT(nvarchar(4000), OLD.[Freight], 2),
			CONVERT(nvarchar(4000), NEW.[Freight], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
			where (
			
			
				(
					NEW.[Freight] <>
					OLD.[Freight]
				) Or
			
				(
					NEW.[Freight] Is Null And
					OLD.[Freight] Is Not Null
				) Or
				(
					NEW.[Freight] Is Not Null And
					OLD.[Freight] Is Null
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
		    convert(nvarchar(1500), IsNull('[PurchaseOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PurchaseOrderID], NEW.[PurchaseOrderID]), 0), '[PurchaseOrderID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[PurchaseOrderID], 0)=CONVERT(nvarchar(4000), OLD.[PurchaseOrderID], 0) or (NEW.[PurchaseOrderID] Is Null and OLD.[PurchaseOrderID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_u_AUDIT_PurchaseOrderHeader]', @order='Last', @stmttype='UPDATE'
GO
