SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_CurrencyRate]
ON [Sales].[CurrencyRate]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[CurrencyRate]
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

	--Set @TABLE_NAME = '[Sales].[CurrencyRate]'
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
		'CurrencyRate',
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'CurrencyRateID',
			CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0),
			CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			WHERE (
			
			
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
	
	If UPDATE([CurrencyRateDate])
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'CurrencyRateDate',
			CONVERT(nvarchar(4000), OLD.[CurrencyRateDate], 121),
			CONVERT(nvarchar(4000), NEW.[CurrencyRateDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			where (
			
			
				(
					NEW.[CurrencyRateDate] <>
					OLD.[CurrencyRateDate]
				) Or
			
				(
					NEW.[CurrencyRateDate] Is Null And
					OLD.[CurrencyRateDate] Is Not Null
				) Or
				(
					NEW.[CurrencyRateDate] Is Not Null And
					OLD.[CurrencyRateDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([FromCurrencyCode])
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'FromCurrencyCode',
			CONVERT(nvarchar(4000), OLD.[FromCurrencyCode], 0),
			CONVERT(nvarchar(4000), NEW.[FromCurrencyCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			where (
			
			
				(
					NEW.[FromCurrencyCode] <>
					OLD.[FromCurrencyCode]
				) Or
			
				(
					NEW.[FromCurrencyCode] Is Null And
					OLD.[FromCurrencyCode] Is Not Null
				) Or
				(
					NEW.[FromCurrencyCode] Is Not Null And
					OLD.[FromCurrencyCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ToCurrencyCode])
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'ToCurrencyCode',
			CONVERT(nvarchar(4000), OLD.[ToCurrencyCode], 0),
			CONVERT(nvarchar(4000), NEW.[ToCurrencyCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			where (
			
			
				(
					NEW.[ToCurrencyCode] <>
					OLD.[ToCurrencyCode]
				) Or
			
				(
					NEW.[ToCurrencyCode] Is Null And
					OLD.[ToCurrencyCode] Is Not Null
				) Or
				(
					NEW.[ToCurrencyCode] Is Not Null And
					OLD.[ToCurrencyCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([AverageRate])
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'AverageRate',
			CONVERT(nvarchar(4000), OLD.[AverageRate], 2),
			CONVERT(nvarchar(4000), NEW.[AverageRate], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			where (
			
			
				(
					NEW.[AverageRate] <>
					OLD.[AverageRate]
				) Or
			
				(
					NEW.[AverageRate] Is Null And
					OLD.[AverageRate] Is Not Null
				) Or
				(
					NEW.[AverageRate] Is Not Null And
					OLD.[AverageRate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([EndOfDayRate])
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'EndOfDayRate',
			CONVERT(nvarchar(4000), OLD.[EndOfDayRate], 2),
			CONVERT(nvarchar(4000), NEW.[EndOfDayRate], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
			where (
			
			
				(
					NEW.[EndOfDayRate] <>
					OLD.[EndOfDayRate]
				) Or
			
				(
					NEW.[EndOfDayRate] Is Null And
					OLD.[EndOfDayRate] Is Not Null
				) Or
				(
					NEW.[EndOfDayRate] Is Not Null And
					OLD.[EndOfDayRate] Is Null
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
		    convert(nvarchar(1500), IsNull('[CurrencyRateID]='+CONVERT(nvarchar(4000), IsNull(OLD.[CurrencyRateID], NEW.[CurrencyRateID]), 0), '[CurrencyRateID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CurrencyRateID], 0)=CONVERT(nvarchar(4000), OLD.[CurrencyRateID], 0) or (NEW.[CurrencyRateID] Is Null and OLD.[CurrencyRateID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_CurrencyRate]', @order='Last', @stmttype='UPDATE'
GO
