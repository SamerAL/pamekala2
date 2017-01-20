SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SpecialOffer]
ON [Sales].[SpecialOffer]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SpecialOffer]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:14 PM
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

	--Set @TABLE_NAME = '[Sales].[SpecialOffer]'
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
		'SpecialOffer',
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
	
	If UPDATE([SpecialOfferID])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'SpecialOfferID',
			CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0),
			CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			WHERE (
			
			
				(
					NEW.[SpecialOfferID] <>
					OLD.[SpecialOfferID]
				) Or
			
				(
					NEW.[SpecialOfferID] Is Null And
					OLD.[SpecialOfferID] Is Not Null
				) Or
				(
					NEW.[SpecialOfferID] Is Not Null And
					OLD.[SpecialOfferID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Description])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'Description',
			CONVERT(nvarchar(4000), OLD.[Description], 0),
			CONVERT(nvarchar(4000), NEW.[Description], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[Description] <>
					OLD.[Description]
				) Or
			
				(
					NEW.[Description] Is Null And
					OLD.[Description] Is Not Null
				) Or
				(
					NEW.[Description] Is Not Null And
					OLD.[Description] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([DiscountPct])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'DiscountPct',
			CONVERT(nvarchar(4000), OLD.[DiscountPct], 2),
			CONVERT(nvarchar(4000), NEW.[DiscountPct], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[DiscountPct] <>
					OLD.[DiscountPct]
				) Or
			
				(
					NEW.[DiscountPct] Is Null And
					OLD.[DiscountPct] Is Not Null
				) Or
				(
					NEW.[DiscountPct] Is Not Null And
					OLD.[DiscountPct] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Type])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'Type',
			CONVERT(nvarchar(4000), OLD.[Type], 0),
			CONVERT(nvarchar(4000), NEW.[Type], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[Type] <>
					OLD.[Type]
				) Or
			
				(
					NEW.[Type] Is Null And
					OLD.[Type] Is Not Null
				) Or
				(
					NEW.[Type] Is Not Null And
					OLD.[Type] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Category])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'Category',
			CONVERT(nvarchar(4000), OLD.[Category], 0),
			CONVERT(nvarchar(4000), NEW.[Category], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[Category] <>
					OLD.[Category]
				) Or
			
				(
					NEW.[Category] Is Null And
					OLD.[Category] Is Not Null
				) Or
				(
					NEW.[Category] Is Not Null And
					OLD.[Category] Is Null
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'StartDate',
			CONVERT(nvarchar(4000), OLD.[StartDate], 121),
			CONVERT(nvarchar(4000), NEW.[StartDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'EndDate',
			CONVERT(nvarchar(4000), OLD.[EndDate], 121),
			CONVERT(nvarchar(4000), NEW.[EndDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
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
	
	If UPDATE([MinQty])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'MinQty',
			CONVERT(nvarchar(4000), OLD.[MinQty], 0),
			CONVERT(nvarchar(4000), NEW.[MinQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[MinQty] <>
					OLD.[MinQty]
				) Or
			
				(
					NEW.[MinQty] Is Null And
					OLD.[MinQty] Is Not Null
				) Or
				(
					NEW.[MinQty] Is Not Null And
					OLD.[MinQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([MaxQty])
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'MaxQty',
			CONVERT(nvarchar(4000), OLD.[MaxQty], 0),
			CONVERT(nvarchar(4000), NEW.[MaxQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
			where (
			
			
				(
					NEW.[MaxQty] <>
					OLD.[MaxQty]
				) Or
			
				(
					NEW.[MaxQty] Is Null And
					OLD.[MaxQty] Is Not Null
				) Or
				(
					NEW.[MaxQty] Is Not Null And
					OLD.[MaxQty] Is Null
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[SpecialOfferID]='+CONVERT(nvarchar(4000), IsNull(OLD.[SpecialOfferID], NEW.[SpecialOfferID]), 0), '[SpecialOfferID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[SpecialOfferID], 0)=CONVERT(nvarchar(4000), OLD.[SpecialOfferID], 0) or (NEW.[SpecialOfferID] Is Null and OLD.[SpecialOfferID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SpecialOffer]', @order='Last', @stmttype='UPDATE'
GO
