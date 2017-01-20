SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_WorkOrderRouting]
ON [Production].[WorkOrderRouting]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[WorkOrderRouting]
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

	--Set @TABLE_NAME = '[Production].[WorkOrderRouting]'
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
		'WorkOrderRouting',
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
	
	If UPDATE([WorkOrderID])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'WorkOrderID',
			CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0),
			CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			WHERE (
			
			
				(
					NEW.[WorkOrderID] <>
					OLD.[WorkOrderID]
				) Or
			
				(
					NEW.[WorkOrderID] Is Null And
					OLD.[WorkOrderID] Is Not Null
				) Or
				(
					NEW.[WorkOrderID] Is Not Null And
					OLD.[WorkOrderID] Is Null
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
			, KEY1, KEY2, KEY3
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ProductID',
			CONVERT(nvarchar(4000), OLD.[ProductID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
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
	
	If UPDATE([OperationSequence])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'OperationSequence',
			CONVERT(nvarchar(4000), OLD.[OperationSequence], 0),
			CONVERT(nvarchar(4000), NEW.[OperationSequence], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			WHERE (
			
			
				(
					NEW.[OperationSequence] <>
					OLD.[OperationSequence]
				) Or
			
				(
					NEW.[OperationSequence] Is Null And
					OLD.[OperationSequence] Is Not Null
				) Or
				(
					NEW.[OperationSequence] Is Not Null And
					OLD.[OperationSequence] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LocationID])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'LocationID',
			CONVERT(nvarchar(4000), OLD.[LocationID], 0),
			CONVERT(nvarchar(4000), NEW.[LocationID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[LocationID] <>
					OLD.[LocationID]
				) Or
			
				(
					NEW.[LocationID] Is Null And
					OLD.[LocationID] Is Not Null
				) Or
				(
					NEW.[LocationID] Is Not Null And
					OLD.[LocationID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ScheduledStartDate])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ScheduledStartDate',
			CONVERT(nvarchar(4000), OLD.[ScheduledStartDate], 121),
			CONVERT(nvarchar(4000), NEW.[ScheduledStartDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ScheduledStartDate] <>
					OLD.[ScheduledStartDate]
				) Or
			
				(
					NEW.[ScheduledStartDate] Is Null And
					OLD.[ScheduledStartDate] Is Not Null
				) Or
				(
					NEW.[ScheduledStartDate] Is Not Null And
					OLD.[ScheduledStartDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ScheduledEndDate])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ScheduledEndDate',
			CONVERT(nvarchar(4000), OLD.[ScheduledEndDate], 121),
			CONVERT(nvarchar(4000), NEW.[ScheduledEndDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ScheduledEndDate] <>
					OLD.[ScheduledEndDate]
				) Or
			
				(
					NEW.[ScheduledEndDate] Is Null And
					OLD.[ScheduledEndDate] Is Not Null
				) Or
				(
					NEW.[ScheduledEndDate] Is Not Null And
					OLD.[ScheduledEndDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ActualStartDate])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ActualStartDate',
			CONVERT(nvarchar(4000), OLD.[ActualStartDate], 121),
			CONVERT(nvarchar(4000), NEW.[ActualStartDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ActualStartDate] <>
					OLD.[ActualStartDate]
				) Or
			
				(
					NEW.[ActualStartDate] Is Null And
					OLD.[ActualStartDate] Is Not Null
				) Or
				(
					NEW.[ActualStartDate] Is Not Null And
					OLD.[ActualStartDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ActualEndDate])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ActualEndDate',
			CONVERT(nvarchar(4000), OLD.[ActualEndDate], 121),
			CONVERT(nvarchar(4000), NEW.[ActualEndDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ActualEndDate] <>
					OLD.[ActualEndDate]
				) Or
			
				(
					NEW.[ActualEndDate] Is Null And
					OLD.[ActualEndDate] Is Not Null
				) Or
				(
					NEW.[ActualEndDate] Is Not Null And
					OLD.[ActualEndDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ActualResourceHrs])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ActualResourceHrs',
			CONVERT(nvarchar(4000), OLD.[ActualResourceHrs], 0),
			CONVERT(nvarchar(4000), NEW.[ActualResourceHrs], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ActualResourceHrs] <>
					OLD.[ActualResourceHrs]
				) Or
			
				(
					NEW.[ActualResourceHrs] Is Null And
					OLD.[ActualResourceHrs] Is Not Null
				) Or
				(
					NEW.[ActualResourceHrs] Is Not Null And
					OLD.[ActualResourceHrs] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([PlannedCost])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'PlannedCost',
			CONVERT(nvarchar(4000), OLD.[PlannedCost], 2),
			CONVERT(nvarchar(4000), NEW.[PlannedCost], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[PlannedCost] <>
					OLD.[PlannedCost]
				) Or
			
				(
					NEW.[PlannedCost] Is Null And
					OLD.[PlannedCost] Is Not Null
				) Or
				(
					NEW.[PlannedCost] Is Not Null And
					OLD.[PlannedCost] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ActualCost])
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ActualCost',
			CONVERT(nvarchar(4000), OLD.[ActualCost], 2),
			CONVERT(nvarchar(4000), NEW.[ActualCost], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
			where (
			
			
				(
					NEW.[ActualCost] <>
					OLD.[ActualCost]
				) Or
			
				(
					NEW.[ActualCost] Is Null And
					OLD.[ActualCost] Is Not Null
				) Or
				(
					NEW.[ActualCost] Is Not Null And
					OLD.[ActualCost] Is Null
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
		    convert(nvarchar(1500), IsNull('[WorkOrderID]='+CONVERT(nvarchar(4000), IsNull(OLD.[WorkOrderID], NEW.[WorkOrderID]), 0), '[WorkOrderID] Is Null')+' AND '+IsNull('[ProductID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductID], NEW.[ProductID]), 0), '[ProductID] Is Null')+' AND '+IsNull('[OperationSequence]='+CONVERT(nvarchar(4000), IsNull(OLD.[OperationSequence], NEW.[OperationSequence]), 0), '[OperationSequence] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[OperationSequence], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[WorkOrderID], 0)=CONVERT(nvarchar(4000), OLD.[WorkOrderID], 0) or (NEW.[WorkOrderID] Is Null and OLD.[WorkOrderID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[ProductID], 0)=CONVERT(nvarchar(4000), OLD.[ProductID], 0) or (NEW.[ProductID] Is Null and OLD.[ProductID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[OperationSequence], 0)=CONVERT(nvarchar(4000), OLD.[OperationSequence], 0) or (NEW.[OperationSequence] Is Null and OLD.[OperationSequence] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_WorkOrderRouting]', @order='Last', @stmttype='UPDATE'
GO
