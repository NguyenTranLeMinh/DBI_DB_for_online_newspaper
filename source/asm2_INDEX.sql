--Tạo nonclustered index trên cột Tên để sắp xếp theo bảng chữ cái
IF EXISTS (SELECT *  FROM sys.indexes  
		WHERE name='IX_Name' 
		AND object_id = OBJECT_ID('[dbo].[tblUser]'))
    DROP INDEX IX_Name ON [dbo].[tblUser];
GO
CREATE NONCLUSTERED INDEX IX_Name
ON [dbo].[tblUser](Full_name)
GO
SELECT Full_name
FROM [dbo].[tblUser]
