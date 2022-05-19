--Tạo 1 transaction thử xóa hết các bài báo mới nhất (trong cùng ngày). Đếm số bài báo còn lại.
BEGIN TRAN
	SELECT COUNT(*) AS NumArticle_Before_delete FROM tblArticle
	DELETE FROM tblArticle
	WHERE convert(date,Publication_date)=(SELECT MAX(convert(date,Publication_date)) FROM tblArticle)
	SELECT COUNT(*) AS NumArticle_After_delete FROM tblArticle
ROLLBACK TRAN