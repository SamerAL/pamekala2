SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_u_AUDIT_ProductVendor]
ON [Purchasing].[ProductVendor]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Purchasing].[ProductVendor]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:11 PM
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

	--Set @TABLE_NAME = '[Purchasing].[ProductVendor]'
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
		'ProductVendor',
		'Purchasing',
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
	
	If UPDATE([ProductID])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			WHERE (
			
			
				(
					NEW.[ProductID] <>
					OLD.[ProductID]
				) Or
			
				(
					NEW.[ProductID] Is Null And
					OLD.[ProductID] Is Not Null
				) Or
				(
					NEW.[ProductID] Is Not Null And
					OLD.[ProductID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
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
	
	If UPDATE([AverageLeadTime])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'AverageLeadTime',
			CONVERT(nvarchar(4000), OLD.[AverageLeadTime], 0),
			CONVERT(nvarchar(4000), NEW.[AverageLeadTime], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[AverageLeadTime] <>
					OLD.[AverageLeadTime]
				) Or
			
				(
					NEW.[AverageLeadTime] Is Null And
					OLD.[AverageLeadTime] Is Not Null
				) Or
				(
					NEW.[AverageLeadTime] Is Not Null And
					OLD.[AverageLeadTime] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([StandardPrice])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'StandardPrice',
			CONVERT(nvarchar(4000), OLD.[StandardPrice], 2),
			CONVERT(nvarchar(4000), NEW.[StandardPrice], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[StandardPrice] <>
					OLD.[StandardPrice]
				) Or
			
				(
					NEW.[StandardPrice] Is Null And
					OLD.[StandardPrice] Is Not Null
				) Or
				(
					NEW.[StandardPrice] Is Not Null And
					OLD.[StandardPrice] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LastReceiptCost])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'LastReceiptCost',
			CONVERT(nvarchar(4000), OLD.[LastReceiptCost], 2),
			CONVERT(nvarchar(4000), NEW.[LastReceiptCost], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[LastReceiptCost] <>
					OLD.[LastReceiptCost]
				) Or
			
				(
					NEW.[LastReceiptCost] Is Null And
					OLD.[LastReceiptCost] Is Not Null
				) Or
				(
					NEW.[LastReceiptCost] Is Not Null And
					OLD.[LastReceiptCost] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LastReceiptDate])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'LastReceiptDate',
			CONVERT(nvarchar(4000), OLD.[LastReceiptDate], 121),
			CONVERT(nvarchar(4000), NEW.[LastReceiptDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[LastReceiptDate] <>
					OLD.[LastReceiptDate]
				) Or
			
				(
					NEW.[LastReceiptDate] Is Null And
					OLD.[LastReceiptDate] Is Not Null
				) Or
				(
					NEW.[LastReceiptDate] Is Not Null And
					OLD.[LastReceiptDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([MinOrderQty])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'MinOrderQty',
			CONVERT(nvarchar(4000), OLD.[MinOrderQty], 0),
			CONVERT(nvarchar(4000), NEW.[MinOrderQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[MinOrderQty] <>
					OLD.[MinOrderQty]
				) Or
			
				(
					NEW.[MinOrderQty] Is Null And
					OLD.[MinOrderQty] Is Not Null
				) Or
				(
					NEW.[MinOrderQty] Is Not Null And
					OLD.[MinOrderQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([MaxOrderQty])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'MaxOrderQty',
			CONVERT(nvarchar(4000), OLD.[MaxOrderQty], 0),
			CONVERT(nvarchar(4000), NEW.[MaxOrderQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[MaxOrderQty] <>
					OLD.[MaxOrderQty]
				) Or
			
				(
					NEW.[MaxOrderQty] Is Null And
					OLD.[MaxOrderQty] Is Not Null
				) Or
				(
					NEW.[MaxOrderQty] Is Not Null And
					OLD.[MaxOrderQty] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([OnOrderQty])
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'OnOrderQty',
			CONVERT(nvarchar(4000), OLD.[OnOrderQty], 0),
			CONVERT(nvarchar(4000), NEW.[OnOrderQty], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[OnOrderQty] <>
					OLD.[OnOrderQty]
				) Or
			
				(
					NEW.[OnOrderQty] Is Null And
					OLD.[OnOrderQty] Is Not Null
				) Or
				(
					NEW.[OnOrderQty] Is Not Null And
					OLD.[OnOrderQty] Is Null
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'UnitMeasureCode',
			CONVERT(nvarchar(4000), OLD.[UnitMeasureCode], 0),
			CONVERT(nvarchar(4000), NEW.[UnitMeasureCode], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
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
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_u_AUDIT_ProductVendor]', @order='Last', @stmttype='UPDATE'
GO
