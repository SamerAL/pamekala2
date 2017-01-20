SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_ProductReview]
ON [Production].[ProductReview]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[ProductReview]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:10 PM
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

	--Set @TABLE_NAME = '[Production].[ProductReview]'
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
		'ProductReview',
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
	
	If UPDATE([ProductReviewID])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'ProductReviewID',
			CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			WHERE (
			
			
				(
					NEW.[ProductReviewID] <>
					OLD.[ProductReviewID]
				) Or
			
				(
					NEW.[ProductReviewID] Is Null And
					OLD.[ProductReviewID] Is Not Null
				) Or
				(
					NEW.[ProductReviewID] Is Not Null And
					OLD.[ProductReviewID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
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
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
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
	
	If UPDATE([ReviewerName])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'ReviewerName',
			CONVERT(nvarchar(4000), OLD.[ReviewerName], 0),
			CONVERT(nvarchar(4000), NEW.[ReviewerName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
				(
					NEW.[ReviewerName] <>
					OLD.[ReviewerName]
				) Or
			
				(
					NEW.[ReviewerName] Is Null And
					OLD.[ReviewerName] Is Not Null
				) Or
				(
					NEW.[ReviewerName] Is Not Null And
					OLD.[ReviewerName] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ReviewDate])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'ReviewDate',
			CONVERT(nvarchar(4000), OLD.[ReviewDate], 121),
			CONVERT(nvarchar(4000), NEW.[ReviewDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
				(
					NEW.[ReviewDate] <>
					OLD.[ReviewDate]
				) Or
			
				(
					NEW.[ReviewDate] Is Null And
					OLD.[ReviewDate] Is Not Null
				) Or
				(
					NEW.[ReviewDate] Is Not Null And
					OLD.[ReviewDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([EmailAddress])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'EmailAddress',
			CONVERT(nvarchar(4000), OLD.[EmailAddress], 0),
			CONVERT(nvarchar(4000), NEW.[EmailAddress], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
				(
					NEW.[EmailAddress] <>
					OLD.[EmailAddress]
				) Or
			
				(
					NEW.[EmailAddress] Is Null And
					OLD.[EmailAddress] Is Not Null
				) Or
				(
					NEW.[EmailAddress] Is Not Null And
					OLD.[EmailAddress] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Rating])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'Rating',
			CONVERT(nvarchar(4000), OLD.[Rating], 0),
			CONVERT(nvarchar(4000), NEW.[Rating], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
				(
					NEW.[Rating] <>
					OLD.[Rating]
				) Or
			
				(
					NEW.[Rating] Is Null And
					OLD.[Rating] Is Not Null
				) Or
				(
					NEW.[Rating] Is Not Null And
					OLD.[Rating] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Comments])
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'Comments',
			CONVERT(nvarchar(4000), OLD.[Comments], 0),
			CONVERT(nvarchar(4000), NEW.[Comments], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
			where (
			
			
				(
					NEW.[Comments] <>
					OLD.[Comments]
				) Or
			
				(
					NEW.[Comments] Is Null And
					OLD.[Comments] Is Not Null
				) Or
				(
					NEW.[Comments] Is Not Null And
					OLD.[Comments] Is Null
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
		    convert(nvarchar(1500), IsNull('[ProductReviewID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductReviewID], NEW.[ProductReviewID]), 0), '[ProductReviewID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductReviewID], 0)=CONVERT(nvarchar(4000), OLD.[ProductReviewID], 0) or (NEW.[ProductReviewID] Is Null and OLD.[ProductReviewID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_ProductReview]', @order='Last', @stmttype='UPDATE'
GO
