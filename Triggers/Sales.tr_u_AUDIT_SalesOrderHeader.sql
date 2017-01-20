SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SalesOrderHeader]
ON [Sales].[SalesOrderHeader]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SalesOrderHeader]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:12 PM
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

	--Set @TABLE_NAME = '[Sales].[SalesOrderHeader]'
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
		'SalesOrderHeader',
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'SalesOrderID',
			CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'RevisionNumber',
			CONVERT(nvarchar(4000), OLD.[RevisionNumber], 0),
			CONVERT(nvarchar(4000), NEW.[RevisionNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'OrderDate',
			CONVERT(nvarchar(4000), OLD.[OrderDate], 121),
			CONVERT(nvarchar(4000), NEW.[OrderDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'DueDate',
			CONVERT(nvarchar(4000), OLD.[DueDate], 121),
			CONVERT(nvarchar(4000), NEW.[DueDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'ShipDate',
			CONVERT(nvarchar(4000), OLD.[ShipDate], 121),
			CONVERT(nvarchar(4000), NEW.[ShipDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'Status',
			CONVERT(nvarchar(4000), OLD.[Status], 0),
			CONVERT(nvarchar(4000), NEW.[Status], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
	
	If UPDATE([OnlineOrderFlag])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'OnlineOrderFlag',
			CONVERT(nvarchar(4000), OLD.[OnlineOrderFlag], 0),
			CONVERT(nvarchar(4000), NEW.[OnlineOrderFlag], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[OnlineOrderFlag] <>
					OLD.[OnlineOrderFlag]
				) Or
			
				(
					NEW.[OnlineOrderFlag] Is Null And
					OLD.[OnlineOrderFlag] Is Not Null
				) Or
				(
					NEW.[OnlineOrderFlag] Is Not Null And
					OLD.[OnlineOrderFlag] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PurchaseOrderNumber])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'PurchaseOrderNumber',
			CONVERT(nvarchar(4000), OLD.[PurchaseOrderNumber], 0),
			CONVERT(nvarchar(4000), NEW.[PurchaseOrderNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[PurchaseOrderNumber] <>
					OLD.[PurchaseOrderNumber]
				) Or
			
				(
					NEW.[PurchaseOrderNumber] Is Null And
					OLD.[PurchaseOrderNumber] Is Not Null
				) Or
				(
					NEW.[PurchaseOrderNumber] Is Not Null And
					OLD.[PurchaseOrderNumber] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([AccountNumber])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'AccountNumber',
			CONVERT(nvarchar(4000), OLD.[AccountNumber], 0),
			CONVERT(nvarchar(4000), NEW.[AccountNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[AccountNumber] <>
					OLD.[AccountNumber]
				) Or
			
				(
					NEW.[AccountNumber] Is Null And
					OLD.[AccountNumber] Is Not Null
				) Or
				(
					NEW.[AccountNumber] Is Not Null And
					OLD.[AccountNumber] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CustomerID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'CustomerID',
			CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[CustomerID] <>
					OLD.[CustomerID]
				) Or
			
				(
					NEW.[CustomerID] Is Null And
					OLD.[CustomerID] Is Not Null
				) Or
				(
					NEW.[CustomerID] Is Not Null And
					OLD.[CustomerID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesPersonID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'SalesPersonID',
			CONVERT(nvarchar(4000), OLD.[SalesPersonID], 0),
			CONVERT(nvarchar(4000), NEW.[SalesPersonID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[SalesPersonID] <>
					OLD.[SalesPersonID]
				) Or
			
				(
					NEW.[SalesPersonID] Is Null And
					OLD.[SalesPersonID] Is Not Null
				) Or
				(
					NEW.[SalesPersonID] Is Not Null And
					OLD.[SalesPersonID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([TerritoryID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'TerritoryID',
			CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
			CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[TerritoryID] <>
					OLD.[TerritoryID]
				) Or
			
				(
					NEW.[TerritoryID] Is Null And
					OLD.[TerritoryID] Is Not Null
				) Or
				(
					NEW.[TerritoryID] Is Not Null And
					OLD.[TerritoryID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([BillToAddressID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'BillToAddressID',
			CONVERT(nvarchar(4000), OLD.[BillToAddressID], 0),
			CONVERT(nvarchar(4000), NEW.[BillToAddressID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[BillToAddressID] <>
					OLD.[BillToAddressID]
				) Or
			
				(
					NEW.[BillToAddressID] Is Null And
					OLD.[BillToAddressID] Is Not Null
				) Or
				(
					NEW.[BillToAddressID] Is Not Null And
					OLD.[BillToAddressID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ShipToAddressID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'ShipToAddressID',
			CONVERT(nvarchar(4000), OLD.[ShipToAddressID], 0),
			CONVERT(nvarchar(4000), NEW.[ShipToAddressID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[ShipToAddressID] <>
					OLD.[ShipToAddressID]
				) Or
			
				(
					NEW.[ShipToAddressID] Is Null And
					OLD.[ShipToAddressID] Is Not Null
				) Or
				(
					NEW.[ShipToAddressID] Is Not Null And
					OLD.[ShipToAddressID] Is Null
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'ShipMethodID',
			CONVERT(nvarchar(4000), OLD.[ShipMethodID], 0),
			CONVERT(nvarchar(4000), NEW.[ShipMethodID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
	
	If UPDATE([CreditCardID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'CreditCardID',
			CONVERT(nvarchar(4000), OLD.[CreditCardID], 0),
			CONVERT(nvarchar(4000), NEW.[CreditCardID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[CreditCardID] <>
					OLD.[CreditCardID]
				) Or
			
				(
					NEW.[CreditCardID] Is Null And
					OLD.[CreditCardID] Is Not Null
				) Or
				(
					NEW.[CreditCardID] Is Not Null And
					OLD.[CreditCardID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CreditCardApprovalCode])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'CreditCardApprovalCode',
			CONVERT(nvarchar(4000), OLD.[CreditCardApprovalCode], 0),
			CONVERT(nvarchar(4000), NEW.[CreditCardApprovalCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[CreditCardApprovalCode] <>
					OLD.[CreditCardApprovalCode]
				) Or
			
				(
					NEW.[CreditCardApprovalCode] Is Null And
					OLD.[CreditCardApprovalCode] Is Not Null
				) Or
				(
					NEW.[CreditCardApprovalCode] Is Not Null And
					OLD.[CreditCardApprovalCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CurrencyRateID])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'CurrencyRateID',
			CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0),
			CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[CurrencyRateID] <>
					OLD.[CurrencyRateID]
				) Or
			
				(
					NEW.[CurrencyRateID] Is Null And
					OLD.[CurrencyRateID] Is Not Null
				) Or
				(
					NEW.[CurrencyRateID] Is Not Null And
					OLD.[CurrencyRateID] Is Null
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'SubTotal',
			CONVERT(nvarchar(4000), OLD.[SubTotal], 2),
			CONVERT(nvarchar(4000), NEW.[SubTotal], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'TaxAmt',
			CONVERT(nvarchar(4000), OLD.[TaxAmt], 2),
			CONVERT(nvarchar(4000), NEW.[TaxAmt], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'Freight',
			CONVERT(nvarchar(4000), OLD.[Freight], 2),
			CONVERT(nvarchar(4000), NEW.[Freight], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
	
	If UPDATE([Comment])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'Comment',
			CONVERT(nvarchar(4000), OLD.[Comment], 0),
			CONVERT(nvarchar(4000), NEW.[Comment], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[Comment] <>
					OLD.[Comment]
				) Or
			
				(
					NEW.[Comment] Is Null And
					OLD.[Comment] Is Not Null
				) Or
				(
					NEW.[Comment] Is Not Null And
					OLD.[Comment] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([rowguid])
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
			where (
			
			
				(
					NEW.[rowguid] <>
					OLD.[rowguid]
				) Or
			
				(
					NEW.[rowguid] Is Null And
					OLD.[rowguid] Is Not Null
				) Or
				(
					NEW.[rowguid] Is Not Null And
					OLD.[rowguid] Is Null
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
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
	
	if @Inserted > 0
	begin
	
	IF UPDATE([DueDate])
	begin
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'OrderDate',
			CONVERT(nvarchar(4000), OLD.[OrderDate], 121),
			CONVERT(nvarchar(4000), NEW.[OrderDate], 121),
			
			'W'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
		FROM inserted NEW 
		Full Outer Join deleted OLD On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
		
		WHERE
			(
			
				( NEW.[DueDate] <> OLD.[DueDate] ) Or
			
			(NEW.[DueDate] Is Null And OLD.[DueDate] Is Not Null) Or
			(NEW.[DueDate] Is Not Null And OLD.[DueDate] Is Null))
		
	end
	
	IF UPDATE([DueDate])
	begin
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'ShipDate',
			CONVERT(nvarchar(4000), OLD.[ShipDate], 121),
			CONVERT(nvarchar(4000), NEW.[ShipDate], 121),
			
			'W'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
		FROM inserted NEW 
		Full Outer Join deleted OLD On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
		
		WHERE
			(
			
				( NEW.[DueDate] <> OLD.[DueDate] ) Or
			
			(NEW.[DueDate] Is Null And OLD.[DueDate] Is Not Null) Or
			(NEW.[DueDate] Is Not Null And OLD.[DueDate] Is Null))
		
	end
	
	IF UPDATE([SalesPersonID])
	begin
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
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
		    convert(nvarchar(1500), IsNull('[SalesOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesOrderID], NEW.[SalesOrderID]), 0), '[SalesOrderID] Is Null')),
		    'CustomerID',
			CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerID], 0),
			
			'W'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)))
		FROM inserted NEW 
		Full Outer Join deleted OLD On
			(CONVERT(nvarchar(4000), NEW.[SalesOrderID], 0)=CONVERT(nvarchar(4000), OLD.[SalesOrderID], 0) or (NEW.[SalesOrderID] Is Null and OLD.[SalesOrderID] Is Null))
		
		WHERE
			(
			
				( NEW.[SalesPersonID] <> OLD.[SalesPersonID] ) Or
			
			(NEW.[SalesPersonID] Is Null And OLD.[SalesPersonID] Is Not Null) Or
			(NEW.[SalesPersonID] Is Not Null And OLD.[SalesPersonID] Is Null))
		
	end
	
	end
	
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SalesOrderHeader]', @order='Last', @stmttype='UPDATE'
GO
