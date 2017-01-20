SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SalesTerritory]
ON [Sales].[SalesTerritory]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SalesTerritory]
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

	--Set @TABLE_NAME = '[Sales].[SalesTerritory]'
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
		'SalesTerritory',
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'TerritoryID',
			CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
			CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			WHERE (
			
			
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'Name',
			CONVERT(nvarchar(4000), OLD.[Name], 0),
			CONVERT(nvarchar(4000), NEW.[Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'CountryRegionCode',
			CONVERT(nvarchar(4000), OLD.[CountryRegionCode], 0),
			CONVERT(nvarchar(4000), NEW.[CountryRegionCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
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
	
	If UPDATE([Group])
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'Group',
			CONVERT(nvarchar(4000), OLD.[Group], 0),
			CONVERT(nvarchar(4000), NEW.[Group], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			where (
			
			
				(
					NEW.[Group] <>
					OLD.[Group]
				) Or
			
				(
					NEW.[Group] Is Null And
					OLD.[Group] Is Not Null
				) Or
				(
					NEW.[Group] Is Not Null And
					OLD.[Group] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesYTD])
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'SalesYTD',
			CONVERT(nvarchar(4000), OLD.[SalesYTD], 2),
			CONVERT(nvarchar(4000), NEW.[SalesYTD], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			where (
			
			
				(
					NEW.[SalesYTD] <>
					OLD.[SalesYTD]
				) Or
			
				(
					NEW.[SalesYTD] Is Null And
					OLD.[SalesYTD] Is Not Null
				) Or
				(
					NEW.[SalesYTD] Is Not Null And
					OLD.[SalesYTD] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesLastYear])
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'SalesLastYear',
			CONVERT(nvarchar(4000), OLD.[SalesLastYear], 2),
			CONVERT(nvarchar(4000), NEW.[SalesLastYear], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			where (
			
			
				(
					NEW.[SalesLastYear] <>
					OLD.[SalesLastYear]
				) Or
			
				(
					NEW.[SalesLastYear] Is Null And
					OLD.[SalesLastYear] Is Not Null
				) Or
				(
					NEW.[SalesLastYear] Is Not Null And
					OLD.[SalesLastYear] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CostYTD])
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'CostYTD',
			CONVERT(nvarchar(4000), OLD.[CostYTD], 2),
			CONVERT(nvarchar(4000), NEW.[CostYTD], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			where (
			
			
				(
					NEW.[CostYTD] <>
					OLD.[CostYTD]
				) Or
			
				(
					NEW.[CostYTD] Is Null And
					OLD.[CostYTD] Is Not Null
				) Or
				(
					NEW.[CostYTD] Is Not Null And
					OLD.[CostYTD] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CostLastYear])
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'CostLastYear',
			CONVERT(nvarchar(4000), OLD.[CostLastYear], 2),
			CONVERT(nvarchar(4000), NEW.[CostLastYear], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
			where (
			
			
				(
					NEW.[CostLastYear] <>
					OLD.[CostLastYear]
				) Or
			
				(
					NEW.[CostLastYear] Is Null And
					OLD.[CostLastYear] Is Not Null
				) Or
				(
					NEW.[CostLastYear] Is Not Null And
					OLD.[CostLastYear] Is Null
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[TerritoryID]='+CONVERT(nvarchar(4000), IsNull(OLD.[TerritoryID], NEW.[TerritoryID]), 0), '[TerritoryID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[TerritoryID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[TerritoryID], 0)=CONVERT(nvarchar(4000), OLD.[TerritoryID], 0) or (NEW.[TerritoryID] Is Null and OLD.[TerritoryID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SalesTerritory]', @order='Last', @stmttype='UPDATE'
GO
