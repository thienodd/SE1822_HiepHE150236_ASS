USE [master]
GO
/****** Object:  Database [HiepBlog]    Script Date: 3/16/2024 3:56:43 PM ******/
CREATE DATABASE [HiepBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HiepBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HiepBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HiepBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HiepBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HiepBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HiepBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HiepBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HiepBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HiepBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HiepBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HiepBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [HiepBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HiepBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HiepBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HiepBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HiepBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HiepBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HiepBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HiepBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HiepBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HiepBlog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HiepBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HiepBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HiepBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HiepBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HiepBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HiepBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HiepBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HiepBlog] SET RECOVERY FULL 
GO
ALTER DATABASE [HiepBlog] SET  MULTI_USER 
GO
ALTER DATABASE [HiepBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HiepBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HiepBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HiepBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HiepBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HiepBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HiepBlog', N'ON'
GO
ALTER DATABASE [HiepBlog] SET QUERY_STORE = OFF
GO
USE [HiepBlog]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/16/2024 3:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[banner] [ntext] NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_category] [int] NULL,
	[blog_body1] [nvarchar](4000) NULL,
	[img1] [ntext] NULL,
	[create_date] [date] NULL,
	[viewCount] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 3/16/2024 3:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/16/2024 3:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[c_content] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
	[blog_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/16/2024 3:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
	[gender] [bit] NULL,
	[create_date] [date] NULL,
	[dob] [date] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (1, N'https://www.cuongchan.com/wp-content/uploads/2017/03/MG_9473-1170x780.jpg', N'Full bộ hình quốc gia hạnh phúc nhất thế giới', 2, N'Đôi khi bạn thấy cuộc sống xung quanh quá bộn bề, nhiều bon che chỉ vì đồng tiền và vật chất. Vậy bạn hãy đi du lịch, đi đến một nơi nào đó thật xa nơi mà họ ko biết bạn, và bạn cũng ko biết họ. Ở đó không có sự ganh tỵ hay bất kỳ điều dị nghị nào, ở đó bạn sẽ được sống tự do làm điều mình thích.
                        ', N'https://www.cuongchan.com/wp-content/uploads/2017/03/MG_8486.jpg', CAST(N'2024-01-01' AS Date), 2, 1)
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (3, N'https://www.cuongchan.com/wp-content/uploads/2017/09/du-lich-dao-Kyushu-nhat-ban-35-cuong-chan-1170x779.jpg', N'Chuyến đi tới hòn đảo Kyushu của Tuân Cuồng Chân', 1, N'Rồi một ngày mùa hè tôi đứng xếp hàng bên ngoài lãnh sự quán Nhật để nộp đơn làm visa.
Rồi một ngày trong chuyến tàu từ quê vào Đà Nẵng tôi nhận được 1 cuộc điện thoại báo đã đậu visa Nhật. Cũng không bất ngờ lắm vì tôi đi theo dạng giấy mời, nhưng vẫn có sự vui sướng không hề nhẹ.
Và rồi một ngày tôi lên chuyến bay đêm để đi Nhật, đáp xuống sân bay Fukuoka và lúc 7h30 sáng của Nhật. Sau màn đón tiếp ở phía Nhật Bản, chúng tôi bắt đầu lên xe và tham qua hòn đảo xinh đẹp Kyushu nằm ở phía Tây Nam Nhật Bản. Đây là lần đầu tiên tôi đến Nhật, ấn tượng đầu tiên của tôi ở xứ sở Phù Tang này là sự sạch sẽ con người lúc nào cũng cười nói. Đặc biệt hòn đảo tôi đến là 1 nơi có rất nhiều cây xanh bao phủ.', N'https://www.cuongchan.com/wp-content/uploads/2017/09/du-lich-dao-Kyushu-nhat-ban-36-cuong-chan-1024x682.jpg', CAST(N'2024-01-01' AS Date), 5, 1)
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (6, N'https://www.cuongchan.com/wp-content/uploads/2022/09/https-lh5-googleusercontent-com-atzhvq__kkwpoyyr-1170x781.jpeg', N'Giá vé máy bay Tết 2024 liệu có bị đẩy giá quá cao', 2, N'Tết là dịp để những người con xa quê về sum họp với gia đình, là lúc mọi người đoàn tụ với gia đình hoặc hơn hết cùng đi du lịch với người yêu thương. Vì vậy, đây là thời gian các hãng hàng không làm việc hết công suất để đảm bảo nhu cầu đi lại tăng cao của hành khách. Trong giai đoạn này, các hãng cũng sẽ lên phương án tăng chỗ, tăng chuyến để tránh tình trạng bị quá tải.
                        ', N'https://www.cuongchan.com/wp-content/uploads/2022/09/https-lh6-googleusercontent-com-hqytkmeqhm3uxhxb-1024x456.png', CAST(N'2024-01-01' AS Date), 55, 1)
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (7, N'https://www.cuongchan.com/wp-content/uploads/2024/01/rach-vem-tuan-cuong-chan-17-1.webp', N'Rạch Vẹm Phú Quốc nơi thiên nhiên giao thoa', 3, N'Rạch Vẹm Phú Quốc là 1 nơi cho tôi cảm giác muốn quay lại đảo ngọc nhiều lần sau những lần thất vọng. Ở đây có đầy đủ mọi thứ dành cho 1 người yêu thích thiên nhiên. Đặc biệt biển Rạch Vẹm rất trong và có nguyên 1 rừng nguyên sinh kế bên che mát.
Để đi Rạch Vẹm, bạn có thể đi xe máy hoặc nếu đông thì di chuyển bằng ô tô. Tuy nhiên, nếu ai say xe thì tốt nhất nên đi xe máy. Để đi chơi được lâu và nhiều thì nên xuất phát từ buổi sáng, ra tới thuyền có thể lên một nhà bè nào đó để cất đồ và đặt đồ ăn, thuyền của nhà bè sẽ chở bạn ra. Tôi thường hay tới nhà bè Vịnh Sao Biển, ở đây có chiếc cầu gỗ ngồi ngắm hoàng hôn rất hợp lý. 

Tới nhà bè thì các bạn nên đặt đồ ăn trưa, sau đó thuê thuyền chở đi mũi Hàm Rồng và các bãi biển khác dọc Rạch Vẹm để tắm biển. Tắm xong thì về lại nhà bè ăn trưa, tới chiều ngắm hoàng hôn rồi đi về lại Dương Đông.
                        ', N'https://www.cuongchan.com/wp-content/uploads/2024/01/rach-vem-tuan-cuong-chan-28.webp', CAST(N'2024-03-16' AS Date), 0, 1)
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (8, N'https://www.cuongchan.com/wp-content/uploads/2021/11/hon-mot.jpg', N'Top 10 bãi biển đẹp nhất Phú Quốc', 3, N'Phú Quốc được ví như một thiên đường biển đảo đẹp nhất Việt Nam. Ngoài việc sở hữu vẻ đẹp của thiên nhiên, không khí của đất trời, Phú Quốc còn được mẹ thiên nhiên ưu ái trao tặng những bãi biển cực đẹp với làn nước trong veo, xanh ngát. Lưu lại top 10 bãi biển đẹp nhất Phú Quốc bên dưới để vi vu cùng gia đình, bạn bè.
                        ', N'https://www.cuongchan.com/wp-content/uploads/2021/11/bai-khem.jpg', CAST(N'2024-03-16' AS Date), 0, 1)
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [blog_body1], [img1], [create_date], [viewCount], [status]) VALUES (9, N'https://cdn.tgdd.vn/Files/2022/01/25/1412805/cach-nau-pho-bo-nam-dinh-chuan-vi-thom-ngon-nhu-hang-quan-202201250230038502.jpg', N'Phở', 4, N'Phở là một món ăn truyền thống của Việt Nam có xuất xứ từ Vân Cù, Nam Định. Phở được xem là một trong những món ăn tiêu biểu cho nền ẩm thực Việt Nam.

Thành phần chính của phở là bánh phở và nước dùng cùng với thịt bò hoặc thịt gà cắt lát mỏng. Thịt bò thích hợp nhất để nấu phở là thịt, xương từ các giống bò ta (bò nội, bò vàng). Ngoài ra còn kèm theo các gia vị như: tương, tiêu, chanh, nước mắm, ớt, vân vân. Những gia vị này được thêm vào tùy theo khẩu vị của người dùng. Phở thông thường được dùng để làm món điểm tâm buổi sáng hoặc lót dạ buổi đêm; nhưng ở các thành phố lớn, món ăn này có thể được thưởng thức cả ngày. Tại các tỉnh phía Nam Việt Nam và một số vùng miền khác, phở được bày kèm với đĩa rau thơm như hành, giá và những lá cây rau mùi, rau húng, trong đó ngò gai là loại lá đặc trưng của phở; tuy nhiên tại Hà Nội thông thường sẽ không có đĩa rau sống này. Phở thường là phở bò hay phở gà, nhưng đôi khi cũng có những biến thể khác, đặc biệt là phở sốt vang, phở khô, phở xào, phở chua, phở vịt ở Cao Bằng, và phở thịt quay ở các tỉnh miền núi phía Bắc.
                        ', N'', CAST(N'2024-03-16' AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 

INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (1, N'Du Ký', CAST(N'2024-02-02' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (2, N'Kinh Nghiệm', CAST(N'2024-02-02' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (3, N'Du Lịch', CAST(N'2024-02-02' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (4, N'Ẩm Thực', CAST(N'2024-02-02' AS Date))
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [user_id], [c_content], [create_date], [blog_id]) VALUES (1, 2, N'HAY QUA', CAST(N'2024-02-02' AS Date), 1)
INSERT [dbo].[Comment] ([id], [user_id], [c_content], [create_date], [blog_id]) VALUES (2, 2, N'TUYET VOI', CAST(N'2024-02-02' AS Date), 3)
INSERT [dbo].[Comment] ([id], [user_id], [c_content], [create_date], [blog_id]) VALUES (3, 3, N'BUON VI KHONG DUOC DI', CAST(N'2024-02-02' AS Date), 6)
INSERT [dbo].[Comment] ([id], [user_id], [c_content], [create_date], [blog_id]) VALUES (4, 1, N'DUOC QUA', CAST(N'2024-02-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [gender], [create_date], [dob], [role]) VALUES (1, N'Hiep', N'admin@gmail.com', N'123456', N'123456    ', 1, CAST(N'2024-02-02' AS Date), CAST(N'2001-01-03' AS Date), 1)
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [gender], [create_date], [dob], [role]) VALUES (2, N'Tuan', N'tuan@gmail.com', N'202cb962ac59075b964b07152d234b70', N'0123456789', 1, CAST(N'2024-02-02' AS Date), CAST(N'2001-01-01' AS Date), 1)
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [gender], [create_date], [dob], [role]) VALUES (3, N'Trang ', N'trang@gmail.com', N'202cb962ac59075b964b07152d234b70', N'0987675411', 0, CAST(N'2024-02-02' AS Date), CAST(N'2000-02-02' AS Date), 1)
INSERT [dbo].[User] ([id], [name], [email], [password], [phone], [gender], [create_date], [dob], [role]) VALUES (5, N'Hiệp Đỗ', N'admin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'123456    ', 1, CAST(N'2024-03-16' AS Date), CAST(N'2001-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogCategory] FOREIGN KEY([blog_category])
REFERENCES [dbo].[BlogCategory] ([id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_BlogCategory]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([blog_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
USE [master]
GO
ALTER DATABASE [HiepBlog] SET  READ_WRITE 
GO
