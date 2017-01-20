SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Person].[tr_u_AUDIT_PersonPhone]
ON [Person].[PersonPhone]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Person].[PersonPhone]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:07 PM
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

	--Set @TABLE_NAME = '[Person].[PersonPhone]'
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
		'PersonPhone',
		'Person',
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
	
	If UPDATE([BusinessEntityID])
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[PhoneNumber]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumber], NEW.[PhoneNumber]), 0),'''' ,'''''')+'''', '[PhoneNumber] Is Null')+' AND '+IsNull('[PhoneNumberTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumberTypeID], NEW.[PhoneNumberTypeID]), 0), '[PhoneNumberTypeID] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0) or (NEW.[PhoneNumber] Is Null and OLD.[PhoneNumber] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0) or (NEW.[PhoneNumberTypeID] Is Null and OLD.[PhoneNumberTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[BusinessEntityID] <>
					OLD.[BusinessEntityID]
				) Or
			
				(
					NEW.[BusinessEntityID] Is Null And
					OLD.[BusinessEntityID] Is Not Null
				) Or
				(
					NEW.[BusinessEntityID] Is Not Null And
					OLD.[BusinessEntityID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PhoneNumber])
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[PhoneNumber]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumber], NEW.[PhoneNumber]), 0),'''' ,'''''')+'''', '[PhoneNumber] Is Null')+' AND '+IsNull('[PhoneNumberTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumberTypeID], NEW.[PhoneNumberTypeID]), 0), '[PhoneNumberTypeID] Is Null')),
		    'PhoneNumber',
			CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0),
			CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0) or (NEW.[PhoneNumber] Is Null and OLD.[PhoneNumber] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0) or (NEW.[PhoneNumberTypeID] Is Null and OLD.[PhoneNumberTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[PhoneNumber] <>
					OLD.[PhoneNumber]
				) Or
			
				(
					NEW.[PhoneNumber] Is Null And
					OLD.[PhoneNumber] Is Not Null
				) Or
				(
					NEW.[PhoneNumber] Is Not Null And
					OLD.[PhoneNumber] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PhoneNumberTypeID])
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[PhoneNumber]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumber], NEW.[PhoneNumber]), 0),'''' ,'''''')+'''', '[PhoneNumber] Is Null')+' AND '+IsNull('[PhoneNumberTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumberTypeID], NEW.[PhoneNumberTypeID]), 0), '[PhoneNumberTypeID] Is Null')),
		    'PhoneNumberTypeID',
			CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0),
			CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0) or (NEW.[PhoneNumber] Is Null and OLD.[PhoneNumber] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0) or (NEW.[PhoneNumberTypeID] Is Null and OLD.[PhoneNumberTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[PhoneNumberTypeID] <>
					OLD.[PhoneNumberTypeID]
				) Or
			
				(
					NEW.[PhoneNumberTypeID] Is Null And
					OLD.[PhoneNumberTypeID] Is Not Null
				) Or
				(
					NEW.[PhoneNumberTypeID] Is Not Null And
					OLD.[PhoneNumberTypeID] Is Null
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[PhoneNumber]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumber], NEW.[PhoneNumber]), 0),'''' ,'''''')+'''', '[PhoneNumber] Is Null')+' AND '+IsNull('[PhoneNumberTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[PhoneNumberTypeID], NEW.[PhoneNumberTypeID]), 0), '[PhoneNumberTypeID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumber], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumber], 0) or (NEW.[PhoneNumber] Is Null and OLD.[PhoneNumber] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[PhoneNumberTypeID], 0)=CONVERT(nvarchar(4000), OLD.[PhoneNumberTypeID], 0) or (NEW.[PhoneNumberTypeID] Is Null and OLD.[PhoneNumberTypeID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Person].[tr_u_AUDIT_PersonPhone]', @order='Last', @stmttype='UPDATE'
GO
