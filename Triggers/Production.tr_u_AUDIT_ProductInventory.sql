SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_ProductInventory]
ON [Production].[ProductInventory]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[ProductInventory]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:09 PM
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

	--Set @TABLE_NAME = '[Production].[ProductInventory]'
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
		'ProductInventory',
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
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
			WHERE (
			
			
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
	
	If UPDATE([LocationID])
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
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'LocationID',
			CONVERT(nvarchar(4000), OLD.[LocationID], 0),
			CONVERT(nvarchar(4000), NEW.[LocationID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
			WHERE (
			
			
				(
					NEW.[LocationID] <>
					OLD.[LocationID]
				) Or
			
				(
					NEW.[LocationID] Is Null And
					OLD.[LocationID] Is Not Null
				) Or
				(
					NEW.[LocationID] Is Not Null And
					OLD.[LocationID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Shelf])
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
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'Shelf',
			CONVERT(nvarchar(4000), OLD.[Shelf], 0),
			CONVERT(nvarchar(4000), NEW.[Shelf], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
			where (
			
			
				(
					NEW.[Shelf] <>
					OLD.[Shelf]
				) Or
			
				(
					NEW.[Shelf] Is Null And
					OLD.[Shelf] Is Not Null
				) Or
				(
					NEW.[Shelf] Is Not Null And
					OLD.[Shelf] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Bin])
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
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'Bin',
			CONVERT(nvarchar(4000), OLD.[Bin], 0),
			CONVERT(nvarchar(4000), NEW.[Bin], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
			where (
			
			
				(
					NEW.[Bin] <>
					OLD.[Bin]
				) Or
			
				(
					NEW.[Bin] Is Null And
					OLD.[Bin] Is Not Null
				) Or
				(
					NEW.[Bin] Is Not Null And
					OLD.[Bin] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Quantity])
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
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'Quantity',
			CONVERT(nvarchar(4000), OLD.[Quantity], 0),
			CONVERT(nvarchar(4000), NEW.[Quantity], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
			where (
			
			
				(
					NEW.[Quantity] <>
					OLD.[Quantity]
				) Or
			
				(
					NEW.[Quantity] Is Null And
					OLD.[Quantity] Is Not Null
				) Or
				(
					NEW.[Quantity] Is Not Null And
					OLD.[Quantity] Is Null
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[LocationID]='+CONVERT(nvarchar(4000), IsNull(OLD.[LocationID], NEW.[LocationID]), 0), '[LocationID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[LocationID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[LocationID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[LocationID], 0)=CONVERT(nvarchar(4000), OLD.[LocationID], 0) or (NEW.[LocationID] Is Null and OLD.[LocationID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_ProductInventory]', @order='Last', @stmttype='UPDATE'
GO
