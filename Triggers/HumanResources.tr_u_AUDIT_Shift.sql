SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [HumanResources].[tr_u_AUDIT_Shift]
ON [HumanResources].[Shift]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [HumanResources].[Shift]
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

	--Set @TABLE_NAME = '[HumanResources].[Shift]'
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
		'Shift',
		'HumanResources',
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
	
	If UPDATE([ShiftID])
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
		    convert(nvarchar(1500), IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')),
		    'ShiftID',
			CONVERT(nvarchar(4000), OLD.[ShiftID], 0),
			CONVERT(nvarchar(4000), NEW.[ShiftID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null))
			WHERE (
			
			
				(
					NEW.[ShiftID] <>
					OLD.[ShiftID]
				) Or
			
				(
					NEW.[ShiftID] Is Null And
					OLD.[ShiftID] Is Not Null
				) Or
				(
					NEW.[ShiftID] Is Not Null And
					OLD.[ShiftID] Is Null
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
		    convert(nvarchar(1500), IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')),
		    'Name',
			CONVERT(nvarchar(4000), OLD.[Name], 0),
			CONVERT(nvarchar(4000), NEW.[Name], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null))
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
	
	If UPDATE([StartTime])
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
		    convert(nvarchar(1500), IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')),
		    'StartTime',
			CONVERT(nvarchar(4000), OLD.[StartTime], 121),
			CONVERT(nvarchar(4000), NEW.[StartTime], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null))
			where (
			
			
				(
					NEW.[StartTime] <>
					OLD.[StartTime]
				) Or
			
				(
					NEW.[StartTime] Is Null And
					OLD.[StartTime] Is Not Null
				) Or
				(
					NEW.[StartTime] Is Not Null And
					OLD.[StartTime] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([EndTime])
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
		    convert(nvarchar(1500), IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')),
		    'EndTime',
			CONVERT(nvarchar(4000), OLD.[EndTime], 121),
			CONVERT(nvarchar(4000), NEW.[EndTime], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null))
			where (
			
			
				(
					NEW.[EndTime] <>
					OLD.[EndTime]
				) Or
			
				(
					NEW.[EndTime] Is Null And
					OLD.[EndTime] Is Not Null
				) Or
				(
					NEW.[EndTime] Is Not Null And
					OLD.[EndTime] Is Null
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
		    convert(nvarchar(1500), IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[HumanResources].[tr_u_AUDIT_Shift]', @order='Last', @stmttype='UPDATE'
GO
