--Stored Procedure tìm bài báo từ được đăng trong 1 khoảng thời gian.
IF exists (SELECT name FROM sysobjects
        WHERE name = 'Article_Filter' AND type = 'P')
	DROP PROC Article_Filter
GO
CREATE PROC Article_Filter(@start_date date, @end_date date) AS
BEGIN
	SELECT Title, Publication_date
	FROM [dbo].[tblArticle]
	WHERE convert(date,Publication_date) between @start_date and @end_date
END

exec Article_Filter '20211006', '20211007'