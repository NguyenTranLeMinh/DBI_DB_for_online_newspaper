--Tạo Trigger1: chặn xóa phân loại bài báo.
IF EXISTS (SELECT name FROM sysobjects
      WHERE name = 'TR_tblType' AND type = 'TR')
   DROP TRIGGER TR_tblType
GO
CREATE TRIGGER TR_tblType
ON [dbo].[tblType]
INSTEAD OF DELETE 
AS RAISERROR ('Không được Xóa từ bảng tblType!', 16, 1)
--test TR1
GO
begin tran
delete from [dbo].[tblType]
where TypeID=5
Select * from [dbo].[tblType]
rollback tran
GO
--Tạo Trigger2: Xóa bài báo. Cần xóa trước các hàng tham chiếu tới cái cần xóa
IF EXISTS (SELECT name FROM sysobjects
      WHERE name = 'TR_tblArticle' AND type = 'TR')
   DROP TRIGGER TR_tblArticle
GO
CREATE TRIGGER TR_tblArticle
ON [dbo].[tblArticle]
INSTEAD OF DELETE
AS BEGIN
	DELETE FROM [dbo].[tblComment]
	WHERE ArticleID IN (SELECT ArticleID FROM deleted)
	DELETE FROM [dbo].[tblImage]
	WHERE ArticleID IN (SELECT ArticleID FROM deleted)
	DELETE FROM [dbo].[tblVideo]
	WHERE ArticleID IN (SELECT ArticleID FROM deleted)
	DELETE FROM [dbo].[tblArticle]
	WHERE ArticleID IN (SELECT ArticleID FROM deleted)
END
--TEST tr2
GO
begin tran
	delete from [dbo].[tblArticle]
	where Title like '%Covid%'
	--where ArticleID=1011
	Select * from [dbo].[tblArticle]
	Select * from [dbo].[tblImage]
rollback tran