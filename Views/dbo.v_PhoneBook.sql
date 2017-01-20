SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_PhoneBook] (UserID,Name, Surname, Street, City, Home_phone, Mobile_Phone) 
as
select * from dbo.PhoneBook
where UserID<10
order by Surname desc offset 0 row fetch next 5 rows only;

GO
