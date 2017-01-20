SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_u_AUDIT_ProductPhoto]
ON [Production].[ProductPhoto]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Production].[ProductPhoto]
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

	--Set @TABLE_NAME = '[Production].[ProductPhoto]'
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
		'ProductPhoto',
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
	
	If UPDATE([ProductPhotoID])
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'ProductPhotoID',
			CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0),
			CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
			WHERE (
			
			
				(
					NEW.[ProductPhotoID] <>
					OLD.[ProductPhotoID]
				) Or
			
				(
					NEW.[ProductPhotoID] Is Null And
					OLD.[ProductPhotoID] Is Not Null
				) Or
				(
					NEW.[ProductPhotoID] Is Not Null And
					OLD.[ProductPhotoID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ThumbNailPhoto])
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'ThumbNailPhoto',
			dbo.AUDIT_fn_HexToStr(OLD.[ThumbNailPhoto]),
			dbo.AUDIT_fn_HexToStr(NEW.[ThumbNailPhoto]),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
			where (
			
			
				(
					NEW.[ThumbNailPhoto] <>
					OLD.[ThumbNailPhoto]
				) Or
			
				(
					NEW.[ThumbNailPhoto] Is Null And
					OLD.[ThumbNailPhoto] Is Not Null
				) Or
				(
					NEW.[ThumbNailPhoto] Is Not Null And
					OLD.[ThumbNailPhoto] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ThumbnailPhotoFileName])
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'ThumbnailPhotoFileName',
			CONVERT(nvarchar(4000), OLD.[ThumbnailPhotoFileName], 0),
			CONVERT(nvarchar(4000), NEW.[ThumbnailPhotoFileName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
			where (
			
			
				(
					NEW.[ThumbnailPhotoFileName] <>
					OLD.[ThumbnailPhotoFileName]
				) Or
			
				(
					NEW.[ThumbnailPhotoFileName] Is Null And
					OLD.[ThumbnailPhotoFileName] Is Not Null
				) Or
				(
					NEW.[ThumbnailPhotoFileName] Is Not Null And
					OLD.[ThumbnailPhotoFileName] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LargePhoto])
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'LargePhoto',
			dbo.AUDIT_fn_HexToStr(OLD.[LargePhoto]),
			dbo.AUDIT_fn_HexToStr(NEW.[LargePhoto]),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
			where (
			
			
				(
					NEW.[LargePhoto] <>
					OLD.[LargePhoto]
				) Or
			
				(
					NEW.[LargePhoto] Is Null And
					OLD.[LargePhoto] Is Not Null
				) Or
				(
					NEW.[LargePhoto] Is Not Null And
					OLD.[LargePhoto] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LargePhotoFileName])
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'LargePhotoFileName',
			CONVERT(nvarchar(4000), OLD.[LargePhotoFileName], 0),
			CONVERT(nvarchar(4000), NEW.[LargePhotoFileName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
			where (
			
			
				(
					NEW.[LargePhotoFileName] <>
					OLD.[LargePhotoFileName]
				) Or
			
				(
					NEW.[LargePhotoFileName] Is Null And
					OLD.[LargePhotoFileName] Is Not Null
				) Or
				(
					NEW.[LargePhotoFileName] Is Not Null And
					OLD.[LargePhotoFileName] Is Null
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
		    convert(nvarchar(1500), IsNull('[ProductPhotoID]='+CONVERT(nvarchar(4000), IsNull(OLD.[ProductPhotoID], NEW.[ProductPhotoID]), 0), '[ProductPhotoID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[ProductPhotoID], 0)=CONVERT(nvarchar(4000), OLD.[ProductPhotoID], 0) or (NEW.[ProductPhotoID] Is Null and OLD.[ProductPhotoID] Is Null))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_u_AUDIT_ProductPhoto]', @order='Last', @stmttype='UPDATE'
GO
