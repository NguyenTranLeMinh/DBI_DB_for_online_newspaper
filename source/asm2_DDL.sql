CREATE DATABASE asm2
GO
USE [asm2]
GO
CREATE TABLE tblUser 
(
	UserID int NOT NULL PRIMARY KEY,
	Full_name nvarchar(50) NOT NULL,
	Birthday date NOT NULL,
	Email varchar(30) NOT NULL UNIQUE,
	Username varchar(20) NOT NULL UNIQUE,
	User_password nvarchar(20) NOT NULL,
	User_role varchar(10) NOT NULL,
	Supervisor int
)
GO 
CREATE TABLE tblLogin 
(
	LoginID int NOT NULL PRIMARY KEY,
	Login_time datetime NOT NULL,
	Login_IP varchar(20) NOT NULL,
	UserID int NOT NULL FOREIGN KEY REFERENCES tblUser(UserID)
)
GO
CREATE TABLE tblType
(
	TypeID int NOT NULL PRIMARY KEY,
	TypeName nvarchar(20) NOT NULL
)
GO
CREATE TABLE tblArticle
(
	ArticleID int NOT NULL PRIMARY KEY,
	Title nvarchar(100) NOT NULL,
	Content nvarchar(1000) NOT NULL,
	Publication_date datetime NOT NULL,
	Article_Type int NOT NULL FOREIGN KEY REFERENCES tblType(TypeID),
	Author int NOT NULL FOREIGN KEY REFERENCES tblUser(UserID),
	Approver int NOT NULL FOREIGN KEY REFERENCES tblUser(UserID)
)
GO
CREATE TABLE tblComment
(
	CommentID int NOT NULL,
	UserID int NOT NULL,
	ArticleID int NOT NULL,
	Comment nvarchar(200),
	CONSTRAINT FK_User FOREIGN KEY (UserID) REFERENCES tblUser(UserID),
	CONSTRAINT FK_Article FOREIGN KEY (ArticleID) REFERENCES tblArticle(ArticleID),
	CONSTRAINT PK_Comment PRIMARY KEY (CommentID, UserID, ArticleID) 
)
GO
CREATE TABLE tblImage
(
	ImageID int NOT NULL PRIMARY KEY,
	Link_Source varchar(50),
	Title nvarchar(100) NOT NULL,
	ArticleID int FOREIGN KEY REFERENCES tblArticle(ArticleID)
)
GO
CREATE TABLE tblVideo
(
	VideoID int NOT NULL PRIMARY KEY,
	Link_Source varchar(50),
	Title nvarchar(100) NOT NULL,
	ArticleID int FOREIGN KEY REFERENCES tblArticle(ArticleID)
)

