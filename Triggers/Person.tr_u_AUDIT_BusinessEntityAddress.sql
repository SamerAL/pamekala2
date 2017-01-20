SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Person].[tr_u_AUDIT_BusinessEntityAddress]
ON [Person].[BusinessEntityAddress]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Person].[BusinessEntityAddress]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:06 PM
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

	--Set @TABLE_NAME = '[Person].[BusinessEntityAddress]'
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
		'BusinessEntityAddress',
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
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
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
	
	If UPDATE([AddressID])
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
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'AddressID',
			CONVERT(nvarchar(4000), OLD.[AddressID], 0),
			CONVERT(nvarchar(4000), NEW.[AddressID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[AddressID] <>
					OLD.[AddressID]
				) Or
			
				(
					NEW.[AddressID] Is Null And
					OLD.[AddressID] Is Not Null
				) Or
				(
					NEW.[AddressID] Is Not Null And
					OLD.[AddressID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([AddressTypeID])
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
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'AddressTypeID',
			CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0),
			CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[AddressTypeID] <>
					OLD.[AddressTypeID]
				) Or
			
				(
					NEW.[AddressTypeID] Is Null And
					OLD.[AddressTypeID] Is Not Null
				) Or
				(
					NEW.[AddressTypeID] Is Not Null And
					OLD.[AddressTypeID] Is Null
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
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
	
	IF UPDATE([AddressTypeID])
	begin
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
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
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')+' AND '+IsNull('[AddressTypeID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressTypeID], NEW.[AddressTypeID]), 0), '[AddressTypeID] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			
			'W'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)))
		FROM inserted NEW 
		Full Outer Join deleted OLD On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[AddressTypeID], 0)=CONVERT(nvarchar(4000), OLD.[AddressTypeID], 0) or (NEW.[AddressTypeID] Is Null and OLD.[AddressTypeID] Is Null))
		
		WHERE
			(
			
				( NEW.[AddressTypeID] <> OLD.[AddressTypeID] ) Or
			
			(NEW.[AddressTypeID] Is Null And OLD.[AddressTypeID] Is Not Null) Or
			(NEW.[AddressTypeID] Is Not Null And OLD.[AddressTypeID] Is Null))
		
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
EXEC sp_settriggerorder @triggername= '[Person].[tr_u_AUDIT_BusinessEntityAddress]', @order='Last', @stmttype='UPDATE'
GO
