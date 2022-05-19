--1. Truy vấn dữ liệu trên một bảng
--Liệt kê tên và vai trò của người dùng
SELECT Full_name, User_role
FROM [dbo].[tblUser]
--2. Truy vấn có sử dụng Order by
--Sắp xếp tên các bài báo từ mới tới cũ
SELECT Title, Publication_date
FROM [dbo].[tblArticle]
Order By Publication_date DESC
--3. Truy vấn sử dụng toán tử Like và các so sánh xâu ký tự.
--Liệt kê các người dùng có họ Nguyễn cùng ngày sinh của họ
SELECT Full_name, Birthday
FROM [dbo].[tblUser]
WHERE Full_name like N'Nguyễn %'
--4. Truy vấn liên quan tới điều kiện về thời gian
--Liệt kê các bài báo được đăng trong 2 ngày 7-10-2021 và 8-10-2021
SELECT Title, Publication_date
FROM [dbo].[tblArticle]
WHERE convert(date, Publication_date) between convert(date,'7-10-2021',105) and convert(date,'8-10-2021',105)
Order By Publication_date
--5. Truy vấn dữ liệu từ nhiều bảng sử dụng Inner join
--Liệt kê các bài báo và người viết chúng
SELECT Title, Full_name AS Author
FROM [dbo].[tblArticle] A JOIN [dbo].[tblUser] U
ON A.Author=U.UserID
--6. Truy vấn sử dụng Self join, Outer join.
--Liệt kê phóng viên cùng người quản lý họ
SELECT U2.Full_name AS Reporter, U1.Full_name AS Editor
FROM [dbo].[tblUser] U1 JOIN [dbo].[tblUser] U2
ON U2.Supervisor=U1.UserID
--Liệt kê tên các người dùng và bài báo bình luận
SELECT U.Full_name, C.ArticleID
FROM [dbo].[tblUser] U FULL OUTER JOIN [dbo].[tblComment] C
ON U.UserID=C.UserID
--7. Truy vấn sử dụng truy vấn con.
--Liệt kê các bài báo trong ngày mới nhất
SELECT Title, Publication_date
FROM [dbo].[tblArticle]
WHERE convert(date,Publication_date)=(SELECT MAX(convert(date,Publication_date)) FROM [dbo].[tblArticle])
Order By Publication_date DESC
--8. Truy vấn sử dụng With.
--Liệt kê các người dùng sinh năm 1997 mà mang họ Nguyễn.
;WITH tblTemp AS (
	SELECT * FROM [dbo].[tblUser]
	WHERE Full_name LIKE N'Nguyễn %'
)
SELECT * FROM tblTemp
Where year(Birthday)=1997
--9. Truy vấn thống kê sử dụng Group by và Having
--Liệt kê các lĩnh vực có nhiều hơn 1 phóng viên tham gia viết bài
SELECT TypeName AS N'Lĩnh vực', COUNT(DISTINCT Author) AS N'Số phóng viên'
FROM [dbo].[tblArticle] A JOIN [dbo].[tblType] T
ON A.Article_Type=T.TypeID
GROUP BY TypeName
HAVING COUNT(DISTINCT Author) > 1
ORDER BY TypeName
GO
--10. Truy vấn sử dụng function (hàm) đã viết trong bước trước.
--Liệt kê các đọc giả lớn hơn 25 tuổi và các phóng viên lớn hơn 30 tuổi.
(SELECT * FROM [dbo].[User_with_role]('Viewer')
WHERE DATEDIFF(year,Birthday,GETDATE()) > 25)
UNION
(SELECT * FROM [dbo].[User_with_role]('Reporter')
WHERE DATEDIFF(year,Birthday,GETDATE()) > 30)