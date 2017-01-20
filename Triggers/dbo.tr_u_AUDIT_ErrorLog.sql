SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_ErrorLog]
ON [dbo].[ErrorLog]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[ErrorLog]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:05 PM
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

	--Set @TABLE_NAME = '[dbo].[ErrorLog]'
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
		'ErrorLog',
		'dbo',
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
	
	If UPDATE([ErrorLogID])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorLogID',
			CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			WHERE (
			
			
				(
					NEW.[ErrorLogID] <>
					OLD.[ErrorLogID]
				) Or
			
				(
					NEW.[ErrorLogID] Is Null And
					OLD.[ErrorLogID] Is Not Null
				) Or
				(
					NEW.[ErrorLogID] Is Not Null And
					OLD.[ErrorLogID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorTime])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorTime',
			CONVERT(nvarchar(4000), OLD.[ErrorTime], 121),
			CONVERT(nvarchar(4000), NEW.[ErrorTime], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorTime] <>
					OLD.[ErrorTime]
				) Or
			
				(
					NEW.[ErrorTime] Is Null And
					OLD.[ErrorTime] Is Not Null
				) Or
				(
					NEW.[ErrorTime] Is Not Null And
					OLD.[ErrorTime] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([UserName])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'UserName',
			CONVERT(nvarchar(4000), OLD.[UserName], 0),
			CONVERT(nvarchar(4000), NEW.[UserName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[UserName] <>
					OLD.[UserName]
				) Or
			
				(
					NEW.[UserName] Is Null And
					OLD.[UserName] Is Not Null
				) Or
				(
					NEW.[UserName] Is Not Null And
					OLD.[UserName] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorNumber])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorNumber',
			CONVERT(nvarchar(4000), OLD.[ErrorNumber], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorNumber] <>
					OLD.[ErrorNumber]
				) Or
			
				(
					NEW.[ErrorNumber] Is Null And
					OLD.[ErrorNumber] Is Not Null
				) Or
				(
					NEW.[ErrorNumber] Is Not Null And
					OLD.[ErrorNumber] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorSeverity])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorSeverity',
			CONVERT(nvarchar(4000), OLD.[ErrorSeverity], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorSeverity], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorSeverity] <>
					OLD.[ErrorSeverity]
				) Or
			
				(
					NEW.[ErrorSeverity] Is Null And
					OLD.[ErrorSeverity] Is Not Null
				) Or
				(
					NEW.[ErrorSeverity] Is Not Null And
					OLD.[ErrorSeverity] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorState])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorState',
			CONVERT(nvarchar(4000), OLD.[ErrorState], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorState], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorState] <>
					OLD.[ErrorState]
				) Or
			
				(
					NEW.[ErrorState] Is Null And
					OLD.[ErrorState] Is Not Null
				) Or
				(
					NEW.[ErrorState] Is Not Null And
					OLD.[ErrorState] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorProcedure])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorProcedure',
			CONVERT(nvarchar(4000), OLD.[ErrorProcedure], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorProcedure], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorProcedure] <>
					OLD.[ErrorProcedure]
				) Or
			
				(
					NEW.[ErrorProcedure] Is Null And
					OLD.[ErrorProcedure] Is Not Null
				) Or
				(
					NEW.[ErrorProcedure] Is Not Null And
					OLD.[ErrorProcedure] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorLine])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorLine',
			CONVERT(nvarchar(4000), OLD.[ErrorLine], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorLine], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorLine] <>
					OLD.[ErrorLine]
				) Or
			
				(
					NEW.[ErrorLine] Is Null And
					OLD.[ErrorLine] Is Not Null
				) Or
				(
					NEW.[ErrorLine] Is Not Null And
					OLD.[ErrorLine] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ErrorMessage])
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
		    convert(nvarchar(1500), IsNull('[ErrorLogID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ErrorLogID], NEW.[ErrorLogID]), 0), '[ErrorLogID] Is Null')),
		    'ErrorMessage',
			CONVERT(nvarchar(4000), OLD.[ErrorMessage], 0),
			CONVERT(nvarchar(4000), NEW.[ErrorMessage], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ErrorLogID], 0)=CONVERT(nvarchar(4000), OLD.[ErrorLogID], 0) or (NEW.[ErrorLogID] Is Null and OLD.[ErrorLogID] Is Null))
			where (
			
			
				(
					NEW.[ErrorMessage] <>
					OLD.[ErrorMessage]
				) Or
			
				(
					NEW.[ErrorMessage] Is Null And
					OLD.[ErrorMessage] Is Not Null
				) Or
				(
					NEW.[ErrorMessage] Is Not Null And
					OLD.[ErrorMessage] Is Null
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
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_ErrorLog]', @order='Last', @stmttype='UPDATE'
GO
