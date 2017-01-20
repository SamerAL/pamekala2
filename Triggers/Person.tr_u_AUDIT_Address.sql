SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Person].[tr_u_AUDIT_Address]
ON [Person].[Address]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Person].[Address]
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

	--Set @TABLE_NAME = '[Person].[Address]'
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
		'Address',
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'AddressID',
			CONVERT(nvarchar(4000), OLD.[AddressID], 0),
			CONVERT(nvarchar(4000), NEW.[AddressID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
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
	
	If UPDATE([AddressLine1])
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'AddressLine1',
			CONVERT(nvarchar(4000), OLD.[AddressLine1], 0),
			CONVERT(nvarchar(4000), NEW.[AddressLine1], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
			where (
			
			
				(
					NEW.[AddressLine1] <>
					OLD.[AddressLine1]
				) Or
			
				(
					NEW.[AddressLine1] Is Null And
					OLD.[AddressLine1] Is Not Null
				) Or
				(
					NEW.[AddressLine1] Is Not Null And
					OLD.[AddressLine1] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([AddressLine2])
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'AddressLine2',
			CONVERT(nvarchar(4000), OLD.[AddressLine2], 0),
			CONVERT(nvarchar(4000), NEW.[AddressLine2], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
			where (
			
			
				(
					NEW.[AddressLine2] <>
					OLD.[AddressLine2]
				) Or
			
				(
					NEW.[AddressLine2] Is Null And
					OLD.[AddressLine2] Is Not Null
				) Or
				(
					NEW.[AddressLine2] Is Not Null And
					OLD.[AddressLine2] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([City])
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'City',
			CONVERT(nvarchar(4000), OLD.[City], 0),
			CONVERT(nvarchar(4000), NEW.[City], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
			where (
			
			
				(
					NEW.[City] <>
					OLD.[City]
				) Or
			
				(
					NEW.[City] Is Null And
					OLD.[City] Is Not Null
				) Or
				(
					NEW.[City] Is Not Null And
					OLD.[City] Is Null
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'StateProvinceID',
			CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0),
			CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
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
	
	If UPDATE([PostalCode])
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'PostalCode',
			CONVERT(nvarchar(4000), OLD.[PostalCode], 0),
			CONVERT(nvarchar(4000), NEW.[PostalCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
			where (
			
			
				(
					NEW.[PostalCode] <>
					OLD.[PostalCode]
				) Or
			
				(
					NEW.[PostalCode] Is Null And
					OLD.[PostalCode] Is Not Null
				) Or
				(
					NEW.[PostalCode] Is Not Null And
					OLD.[PostalCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SpatialLocation])
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'SpatialLocation',
			CONVERT(nvarchar(max), CONVERT(nvarchar(max), OLD.[SpatialLocation])),
			CONVERT(nvarchar(max), CONVERT(nvarchar(max), NEW.[SpatialLocation])),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
			where (
			
			
				(
					CONVERT(nvarchar(max), NEW.[SpatialLocation]) <>
					CONVERT(nvarchar(max), OLD.[SpatialLocation])
				) Or
			
				(
					NEW.[SpatialLocation] Is Null And
					OLD.[SpatialLocation] Is Not Null
				) Or
				(
					NEW.[SpatialLocation] Is Not Null And
					OLD.[SpatialLocation] Is Null
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[AddressID]='+CONVERT(nvarchar(4000), IsNull(OLD.[AddressID], NEW.[AddressID]), 0), '[AddressID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[AddressID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[AddressID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[AddressID], 0)=CONVERT(nvarchar(4000), OLD.[AddressID], 0) or (NEW.[AddressID] Is Null and OLD.[AddressID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Person].[tr_u_AUDIT_Address]', @order='Last', @stmttype='UPDATE'
GO
