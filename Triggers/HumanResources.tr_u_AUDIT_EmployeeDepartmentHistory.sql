SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [HumanResources].[tr_u_AUDIT_EmployeeDepartmentHistory]
ON [HumanResources].[EmployeeDepartmentHistory]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [HumanResources].[EmployeeDepartmentHistory]
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

	--Set @TABLE_NAME = '[HumanResources].[EmployeeDepartmentHistory]'
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
		'EmployeeDepartmentHistory',
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
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
	
	If UPDATE([DepartmentID])
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'DepartmentID',
			CONVERT(nvarchar(4000), OLD.[DepartmentID], 0),
			CONVERT(nvarchar(4000), NEW.[DepartmentID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
			WHERE (
			
			
				(
					NEW.[DepartmentID] <>
					OLD.[DepartmentID]
				) Or
			
				(
					NEW.[DepartmentID] Is Null And
					OLD.[DepartmentID] Is Not Null
				) Or
				(
					NEW.[DepartmentID] Is Not Null And
					OLD.[DepartmentID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'ShiftID',
			CONVERT(nvarchar(4000), OLD.[ShiftID], 0),
			CONVERT(nvarchar(4000), NEW.[ShiftID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'StartDate',
			CONVERT(nvarchar(4000), OLD.[StartDate], 0),
			CONVERT(nvarchar(4000), NEW.[StartDate], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
			WHERE (
			
			
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'EndDate',
			CONVERT(nvarchar(4000), OLD.[EndDate], 0),
			CONVERT(nvarchar(4000), NEW.[EndDate], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
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
			, KEY1, KEY2, KEY3, KEY4
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')+' AND '+IsNull('[DepartmentID]='+CONVERT(nvarchar(4000), IsNull(OLD.[DepartmentID], NEW.[DepartmentID]), 0), '[DepartmentID] Is Null')+' AND '+IsNull('[ShiftID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ShiftID], NEW.[ShiftID]), 0), '[ShiftID] Is Null')+' AND '+IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[StartDate], NEW.[StartDate]), 0),'''' ,'''''')+'''', '[StartDate] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[DepartmentID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[DepartmentID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ShiftID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ShiftID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[StartDate], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[DepartmentID], 0)=CONVERT(nvarchar(4000), OLD.[DepartmentID], 0) or (NEW.[DepartmentID] Is Null and OLD.[DepartmentID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ShiftID], 0)=CONVERT(nvarchar(4000), OLD.[ShiftID], 0) or (NEW.[ShiftID] Is Null and OLD.[ShiftID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[StartDate], 0)=CONVERT(nvarchar(4000), OLD.[StartDate], 0) or (NEW.[StartDate] Is Null and OLD.[StartDate] Is Null))
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
EXEC sp_settriggerorder @triggername= '[HumanResources].[tr_u_AUDIT_EmployeeDepartmentHistory]', @order='Last', @stmttype='UPDATE'
GO
