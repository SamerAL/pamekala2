SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SalesTaxRate]
ON [Sales].[SalesTaxRate]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SalesTaxRate]
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

	--Set @TABLE_NAME = '[Sales].[SalesTaxRate]'
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
		'SalesTaxRate',
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
	
	If UPDATE([SalesTaxRateID])
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'SalesTaxRateID',
			CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0),
			CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
			WHERE (
			
			
				(
					NEW.[SalesTaxRateID] <>
					OLD.[SalesTaxRateID]
				) Or
			
				(
					NEW.[SalesTaxRateID] Is Null And
					OLD.[SalesTaxRateID] Is Not Null
				) Or
				(
					NEW.[SalesTaxRateID] Is Not Null And
					OLD.[SalesTaxRateID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([StateProvinceID])
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'StateProvinceID',
			CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0),
			CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
			where (
			
			
				(
					NEW.[StateProvinceID] <>
					OLD.[StateProvinceID]
				) Or
			
				(
					NEW.[StateProvinceID] Is Null And
					OLD.[StateProvinceID] Is Not Null
				) Or
				(
					NEW.[StateProvinceID] Is Not Null And
					OLD.[StateProvinceID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([TaxType])
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'TaxType',
			CONVERT(nvarchar(4000), OLD.[TaxType], 0),
			CONVERT(nvarchar(4000), NEW.[TaxType], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
			where (
			
			
				(
					NEW.[TaxType] <>
					OLD.[TaxType]
				) Or
			
				(
					NEW.[TaxType] Is Null And
					OLD.[TaxType] Is Not Null
				) Or
				(
					NEW.[TaxType] Is Not Null And
					OLD.[TaxType] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([TaxRate])
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'TaxRate',
			CONVERT(nvarchar(4000), OLD.[TaxRate], 2),
			CONVERT(nvarchar(4000), NEW.[TaxRate], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
			where (
			
			
				(
					NEW.[TaxRate] <>
					OLD.[TaxRate]
				) Or
			
				(
					NEW.[TaxRate] Is Null And
					OLD.[TaxRate] Is Not Null
				) Or
				(
					NEW.[TaxRate] Is Not Null And
					OLD.[TaxRate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Name])
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'Name',
			CONVERT(nvarchar(4000), OLD.[Name], 0),
			CONVERT(nvarchar(4000), NEW.[Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
			where (
			
			
				(
					NEW.[Name] <>
					OLD.[Name]
				) Or
			
				(
					NEW.[Name] Is Null And
					OLD.[Name] Is Not Null
				) Or
				(
					NEW.[Name] Is Not Null And
					OLD.[Name] Is Null
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SalesTaxRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SalesTaxRateID], NEW.[SalesTaxRateID]), 0), '[SalesTaxRateID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SalesTaxRateID], 0)=CONVERT(nvarchar(4000), OLD.[SalesTaxRateID], 0) or (NEW.[SalesTaxRateID] Is Null and OLD.[SalesTaxRateID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SalesTaxRate]', @order='Last', @stmttype='UPDATE'
GO
