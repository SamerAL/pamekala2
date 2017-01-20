SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Person].[tr_u_AUDIT_StateProvince]
ON [Person].[StateProvince]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Person].[StateProvince]
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

	--Set @TABLE_NAME = '[Person].[StateProvince]'
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
		'StateProvince',
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'StateProvinceID',
			CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0),
			CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
			WHERE (
			
			
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
	
	If UPDATE([StateProvinceCode])
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'StateProvinceCode',
			CONVERT(nvarchar(4000), OLD.[StateProvinceCode], 0),
			CONVERT(nvarchar(4000), NEW.[StateProvinceCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
			where (
			
			
				(
					NEW.[StateProvinceCode] <>
					OLD.[StateProvinceCode]
				) Or
			
				(
					NEW.[StateProvinceCode] Is Null And
					OLD.[StateProvinceCode] Is Not Null
				) Or
				(
					NEW.[StateProvinceCode] Is Not Null And
					OLD.[StateProvinceCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CountryRegionCode])
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'CountryRegionCode',
			CONVERT(nvarchar(4000), OLD.[CountryRegionCode], 0),
			CONVERT(nvarchar(4000), NEW.[CountryRegionCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
			where (
			
			
				(
					NEW.[CountryRegionCode] <>
					OLD.[CountryRegionCode]
				) Or
			
				(
					NEW.[CountryRegionCode] Is Null And
					OLD.[CountryRegionCode] Is Not Null
				) Or
				(
					NEW.[CountryRegionCode] Is Not Null And
					OLD.[CountryRegionCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([IsOnlyStateProvinceFlag])
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'IsOnlyStateProvinceFlag',
			CONVERT(nvarchar(4000), OLD.[IsOnlyStateProvinceFlag], 0),
			CONVERT(nvarchar(4000), NEW.[IsOnlyStateProvinceFlag], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
			where (
			
			
				(
					NEW.[IsOnlyStateProvinceFlag] <>
					OLD.[IsOnlyStateProvinceFlag]
				) Or
			
				(
					NEW.[IsOnlyStateProvinceFlag] Is Null And
					OLD.[IsOnlyStateProvinceFlag] Is Not Null
				) Or
				(
					NEW.[IsOnlyStateProvinceFlag] Is Not Null And
					OLD.[IsOnlyStateProvinceFlag] Is Null
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'Name',
			CONVERT(nvarchar(4000), OLD.[Name], 0),
			CONVERT(nvarchar(4000), NEW.[Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'TerritoryID',
			CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
			CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[StateProvinceID]='+CONVERT(nvarchar(4000), IsNull(OLD.[StateProvinceID], NEW.[StateProvinceID]), 0), '[StateProvinceID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[StateProvinceID], 0)=CONVERT(nvarchar(4000), OLD.[StateProvinceID], 0) or (NEW.[StateProvinceID] Is Null and OLD.[StateProvinceID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Person].[tr_u_AUDIT_StateProvince]', @order='Last', @stmttype='UPDATE'
GO
