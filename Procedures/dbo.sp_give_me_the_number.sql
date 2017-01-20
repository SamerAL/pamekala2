SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_give_me_the_number]
@NumberID bigint
as
select * from dbo.PhoneBook 
where UserID=@NumberID

GO
