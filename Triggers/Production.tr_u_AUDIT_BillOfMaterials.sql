SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_BillOfMaterials]
ON [Production].[BillOfMaterials]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[BillOfMaterials]
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

	--Set @TABLE_NAME = '[Production].[BillOfMaterials]'
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
		'BillOfMaterials',
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
	
	If UPDATE([BillOfMaterialsID])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'BillOfMaterialsID',
			CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0),
			CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			WHERE (
			
			
				(
					NEW.[BillOfMaterialsID] <>
					OLD.[BillOfMaterialsID]
				) Or
			
				(
					NEW.[BillOfMaterialsID] Is Null And
					OLD.[BillOfMaterialsID] Is Not Null
				) Or
				(
					NEW.[BillOfMaterialsID] Is Not Null And
					OLD.[BillOfMaterialsID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ProductAssemblyID])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'ProductAssemblyID',
			CONVERT(nvarchar(4000), OLD.[ProductAssemblyID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductAssemblyID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			where (
			
			
				(
					NEW.[ProductAssemblyID] <>
					OLD.[ProductAssemblyID]
				) Or
			
				(
					NEW.[ProductAssemblyID] Is Null And
					OLD.[ProductAssemblyID] Is Not Null
				) Or
				(
					NEW.[ProductAssemblyID] Is Not Null And
					OLD.[ProductAssemblyID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ComponentID])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'ComponentID',
			CONVERT(nvarchar(4000), OLD.[ComponentID], 0),
			CONVERT(nvarchar(4000), NEW.[ComponentID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			where (
			
			
				(
					NEW.[ComponentID] <>
					OLD.[ComponentID]
				) Or
			
				(
					NEW.[ComponentID] Is Null And
					OLD.[ComponentID] Is Not Null
				) Or
				(
					NEW.[ComponentID] Is Not Null And
					OLD.[ComponentID] Is Null
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'StartDate',
			CONVERT(nvarchar(4000), OLD.[StartDate], 121),
			CONVERT(nvarchar(4000), NEW.[StartDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'EndDate',
			CONVERT(nvarchar(4000), OLD.[EndDate], 121),
			CONVERT(nvarchar(4000), NEW.[EndDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
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
	
	If UPDATE([UnitMeasureCode])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'UnitMeasureCode',
			CONVERT(nvarchar(4000), OLD.[UnitMeasureCode], 0),
			CONVERT(nvarchar(4000), NEW.[UnitMeasureCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			where (
			
			
				(
					NEW.[UnitMeasureCode] <>
					OLD.[UnitMeasureCode]
				) Or
			
				(
					NEW.[UnitMeasureCode] Is Null And
					OLD.[UnitMeasureCode] Is Not Null
				) Or
				(
					NEW.[UnitMeasureCode] Is Not Null And
					OLD.[UnitMeasureCode] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([BOMLevel])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'BOMLevel',
			CONVERT(nvarchar(4000), OLD.[BOMLevel], 0),
			CONVERT(nvarchar(4000), NEW.[BOMLevel], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			where (
			
			
				(
					NEW.[BOMLevel] <>
					OLD.[BOMLevel]
				) Or
			
				(
					NEW.[BOMLevel] Is Null And
					OLD.[BOMLevel] Is Not Null
				) Or
				(
					NEW.[BOMLevel] Is Not Null And
					OLD.[BOMLevel] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PerAssemblyQty])
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'PerAssemblyQty',
			CONVERT(nvarchar(4000), OLD.[PerAssemblyQty], 0),
			CONVERT(nvarchar(4000), NEW.[PerAssemblyQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
			where (
			
			
				(
					NEW.[PerAssemblyQty] <>
					OLD.[PerAssemblyQty]
				) Or
			
				(
					NEW.[PerAssemblyQty] Is Null And
					OLD.[PerAssemblyQty] Is Not Null
				) Or
				(
					NEW.[PerAssemblyQty] Is Not Null And
					OLD.[PerAssemblyQty] Is Null
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
		    convert(nvarchar(1500), IsNull('[BillOfMaterialsID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BillOfMaterialsID], NEW.[BillOfMaterialsID]), 0), '[BillOfMaterialsID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BillOfMaterialsID], 0)=CONVERT(nvarchar(4000), OLD.[BillOfMaterialsID], 0) or (NEW.[BillOfMaterialsID] Is Null and OLD.[BillOfMaterialsID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_BillOfMaterials]', @order='Last', @stmttype='UPDATE'
GO
