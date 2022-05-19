USE [asm2]

delete FROM [dbo].[tblImage]
delete FROM [dbo].[tblVideo]
delete FROM [dbo].[tblComment]
delete FROM [dbo].[tblArticle]
delete FROM [dbo].[tblType]
delete FROM [dbo].[tblLogin]
delete FROM [dbo].[tblUser]

INSERT INTO [dbo].[tblUser] VALUES
(1,N'Nguyễn Văn A','asinh@gmail.com','asinh97','123456','Viewer',NULL,'1997-04-27'),
(2,N'Trần Văn B','anhB98@gmail.com','VanBTran','123456','Viewer',NULL,'1997-04-27'),
(3,N'Phạm Quang Minh','minhqq85@gmail.com','QuangMinh285','123qwe*','Editor',NULL,'1997-05-28'),
(4,N'Võ Quốc Bá Cẩn','bacan88@gmail.com','VQBC88','bc123654','Reporter',3,'1988-01-21'),
(5,N'Lý Linh Đan','lldan97@gmail.com','danll1197','qwe*fgh','Reporter',3,'1997-01-01'),
(6,N'Phạm Quang Minh','quangminhmap@gmail.com','fatboy97','123456','Viewer',NULL,'1995-04-27'),
(7,N'Lê Anh Vinh','vinhJenny@gmail.com','JennyCLB','123456','Viewer',NULL,'1982-09-27'),
(8,N'Nguyễn Văn An','vananNguyen80@gmail.com','nguyenvanan_editor','123456','Editor',NULL,'1980-11-21'),
(9,N'Nguyễn Văn An','vanan91@gmail.com','Ngvanan1991','123456','Reporter',8,'1991-04-17'),
(10,N'Hoàng Lộc','darkhorse@gmail.com','lochoang97','123456','Viewer',NULL,'1997-04-08')
GO
INSERT INTO [dbo].[tblLogin] VALUES
(123,'20211001 05:30:20 AM','192.168.2.20',10),
(124,'20211001 05:30:20 AM','192.168.21.30',7),
(125,'20211001 09:30:21 AM','192.168.2.20',10),
(126,'20211001 09:40:40 AM','192.168.2.20',10),
(127,'20211001 09:40:40 PM','192.168.21.30',1),
(128,'20211002 05:30:20 AM','192.168.2.20',10),
(129,'20211002 05:30:20 AM','192.168.21.30',7),
(130,'20211002 09:40:21 AM','192.168.2.20',10),
(131,'20211003 09:40:21 AM','192.168.2.23',5),
(132,'20211003 09:40:40 PM','192.168.21.30',1)
GO
INSERT INTO [dbo].[tblType] VALUES
(1,N'Thời sự'),
(2,N'Pháp luật'),
(3,N'Kinh doanh'),
(4,N'Công nghệ'),
(5,N'Du lịch'),
(6,N'Văn hóa'),
(7,N'Giải trí'),
(8,N'Thể thao'),
(9,N'Giáo dục'),
(10,N'Sức khỏe')
GO
INSERT INTO [dbo].[tblArticle] VALUES
(1002,N'Quảng Nam xin phép Thủ tướng cho đón khách du lịch quốc tế',N'Ngày 8-10, Văn phòng UBND tỉnh Quảng Nam cho biết...','20211008 02:05:00 PM',5,4,3),
(1003,N'Tái khởi động lộ trình mở cửa đón du khách quốc tế',N'Ngành du lịch đang tích cực chuẩn bị tái khởi động với lộ trình mở cửa với phương châm...','20211007 09:24:00 PM',5,4,3),
(1004,N'Băn khoăn của phụ huynh về thời điểm mở cửa trường học',N'Theo kế hoạch của Sở Giáo dục và Đào tạo, học sinh ở TP HCM sẽ tiếp tục ở nhà...','20211009 05:31:00 PM',9,9,8),
(1005,N'Trường tư thục Hà Nội bị phát hiện ''vượt rào'', học trực tiếp',N'Trong khi Hà Nội chưa cho học sinh quay lại trường, trường liên cấp Capitole...','20211008 08:10:00 PM',9,5,3),
(1006,N'Thêm 5 ca nhiễm liên quan viện Việt Đức',N'...','20211008 02:05:00 PM',10,4,3),
(1007,N'Thêm 4.513 ca Covid-19',N'Trong 4.513 ca nhiễm Bộ Y tế công bố tối 9/10 có...','20211009 06:26:00 PM',10,4,3),
(1008,N'Hội chứng ''ngón chân Covid''',N'Phản ứng miễn dịch quá mức của cơ thể sau khi tiếp xúc với virus...','20211006 01:28:20 PM',10,9,8),
(1009,N'Nhiều người ngộ độc rượu sau nới giãn cách',N'Tuần đầu tháng 10...','20211009 09:58:20 AM',10,9,8),
(1010,N'Cục Nghệ thuật biểu diễn đề nghị xử lý các rapper dung tục: Hướng nào cho đúng?',N'Trong khi các rapper liên tục phải xin lỗi vì xúc phạm...','20211008 06:53:21 PM',6,5,3),
(1011,N'Nhiều địa phương Đông Bắc Bộ tăng cường ứng phó bão số 7',N'Hải Phòng, Quảng Ninh, Thái Bình,...','20211009 03:10:00 PM',10,9,8)

GO
INSERT INTO [dbo].[tblComment] VALUES
(1,2,1002,N'Cục Hàng không xin ý kiến mở sân bay thì không trả lời vậy khách du lịch tới bằng phương tiện gì?'),
(2,2,1002,N'Mừng cho tỉnh Quảng Nam!'),
(3,1,1002,N'cần phải có sự liên kết với tỉnh, thành lân cận để kết nối giao thông, mới phát huy hiệu quả hơn.'),
(1,2,1004,N'Mọi người muốn yên ổn để làm ăn, hay cho con đi học để dịch bùng phát rồi tiếp tục phong tỏa.'),
(2,10,1004,N'Cứ tiêm vaccine 2 mũi cho các cháu rồi đi học cũng chưa muộn.'),
(3,7,1004,N'Việc học online ở các nước họ vẫn thực hiện tốt đấy thôi. Đừng đổ cho con cái nghiện điện thoại, hư mắt,...'),
(4,6,1004,N'Tôi quyết định bảo lưu 1 năm học cho con tôi.'),
(1,6,1005,N'Mở cửa cho học sinh đến là tốt chứ giam cầm các cháu ở nhà mãi đến bao giờ.'),
(2,6,1005,N'Từ khi nào có quy định cha mẹ phải trang bị máy tính, mạng cho con vậy? Ai sợ thì cho con ở nhà.'),
(1,10,1007,N'Có giảm là tín hiệu đáng mừng rồi.'),
(1,10,1009,N'Vui buồn gì cũng nhậu... hậu quả gia đình gánh hết!'),
(1,10,1010,N'Phải xử thật nặng những hành vi thiếu văn hóa, cổ súy vi phạm thuần phong mỹ tục.')

GO
INSERT INTO [dbo].[tblImage] VALUES
(10321,'shorturl.at/czJU1',N'Khách du lịch tham quan Phú Quốc.',1003),
(10322,'shorturl.at/awxHN',N'Học sinh lớp 1 trường Tiểu học Lương Thế Vinh, học trực tuyến tại nhà.',1004),
(10323,'shorturl.at/eDGR3',N'Học sinh lớp 5 trường Tiểu học Lê Đức Thọ trong buổi học hồi tháng 5/2020.',1004),
(10324,'shorturl.at/wHSV4',N'Phòng cách ly được bố trí tại trường THPT Lê Quý Đôn, quận 3 tháng 7/2020.',1004),
(10325,'shorturl.at/oqCFK',N'Trường liên cấp Capitole tại xã Tiên Dược, huyện Sóc Sơn, Hà Nội.',1005),
(10326,'shorturl.at/nzS04',N'Nhân viên y tế đưa người bệnh từ viện Việt Đức vào viện Thanh Nhàn cách ly tối 4/10.',1006),
(10327,'shorturl.at/AEXZ9',N'Hiện tượng sưng tấy ngón chân, còn gọi là ''ngón chân Covid''.',1008),
(10328,'shorturl.at/swR18',N'Rapper Chị Cả phải đăng lời xin lỗi khán giả vì đã không chọn lọc ngôn từ.',1010),
(10329,'shorturl.at/lqLXY', N'Tàu thuyền về nơi neo đậu an toàn sau khi địa phương áp dụng lệnh cấm biển.',1011),
(10330,'shorturl.at/lJ147', N'Công nhân cây xanh TP Vinh cắt tỉa cây xanh phòng gãy đổ do mưa bão.',1011)
GO
INSERT INTO [dbo].[tblVideo] VALUES
(10321,'www.youtube.com/watch?v=ePRE1yjvK1M',N'Vinpearl Land Phú Quốc.',1003),
(10322,'www.youtube.com/watch?v=wQo0in7xUuY',N'Khám Phá Chợ Đêm.',1003),
(10323,'www.youtube.com/watch?v=tpTDU8MNuuM',N'Cáp treo xuyên biển ở Hòn Thơm.',1003),
(10324,'www.youtube.com/watch?v=kzaxMiggCoY',N'GrandWorld - Thành phố không ngủ.',1003),
(10325,'www.youtube.com/watch?v=45YCUPjjR3s',N'Vườn tiêu Phú Quốc.',1003),
(10328,'www.youtube.com/watch?v=kfzRdAb_Ybk',N'Ca nhiễm mới tại viện Việt Đức 5/10.',1006),
(10329,'www.youtube.com/watch?v=cXcLZ6Si0HU',N'Nhiều người ngộ độc rượu sau nới giãn cách.',1009),
(10330,'www.youtube.com/watch?v=fjsWEB674VU',N'Đề nghị xử lý các rapper sáng tác nhạc phản cảm.',1010)
