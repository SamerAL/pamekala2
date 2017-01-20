SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_Customer]
ON [Sales].[Customer]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[Customer]
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

	--Set @TABLE_NAME = '[Sales].[Customer]'
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
		'Customer',
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'CustomerID',
			CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
			WHERE (
			
			
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
	
	If UPDATE([PersonID])
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'PersonID',
			CONVERT(nvarchar(4000), OLD.[PersonID], 0),
			CONVERT(nvarchar(4000), NEW.[PersonID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
			where (
			
			
				(
					NEW.[PersonID] <>
					OLD.[PersonID]
				) Or
			
				(
					NEW.[PersonID] Is Null And
					OLD.[PersonID] Is Not Null
				) Or
				(
					NEW.[PersonID] Is Not Null And
					OLD.[PersonID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([StoreID])
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'StoreID',
			CONVERT(nvarchar(4000), OLD.[StoreID], 0),
			CONVERT(nvarchar(4000), NEW.[StoreID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
			where (
			
			
				(
					NEW.[StoreID] <>
					OLD.[StoreID]
				) Or
			
				(
					NEW.[StoreID] Is Null And
					OLD.[StoreID] Is Not Null
				) Or
				(
					NEW.[StoreID] Is Not Null And
					OLD.[StoreID] Is Null
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'TerritoryID',
			CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
			CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[CustomerID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0), '[CustomerID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_Customer]', @order='Last', @stmttype='UPDATE'
GO
