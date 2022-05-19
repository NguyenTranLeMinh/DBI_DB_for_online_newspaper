--Hàm trả về các THÔNG TIN user theo chức vụ
IF EXISTS (SELECT name FROM sysobjects
		WHERE name='User_with_role' and type='FN')
	DROP FUNCTION User_with_role
GO
CREATE FUNCTION User_with_role(@role varchar(10))
RETURNS TABLE AS RETURN
(
	SELECT * FROM [dbo].[tblUser]
	WHERE User_role=@role
)
GO

SELECT Full_name
FROM User_with_role('Viewer')