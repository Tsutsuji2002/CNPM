USE [master]
GO
/****** Object:  Database [JobListingWeb]    Script Date: 26/07/2023 11:15:35 SA ******/
CREATE DATABASE [JobListingWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobListingWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRUNGTRUNG\MSSQL\DATA\JobListingWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobListingWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRUNGTRUNG\MSSQL\DATA\JobListingWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JobListingWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobListingWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobListingWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobListingWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobListingWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobListingWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobListingWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobListingWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobListingWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobListingWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobListingWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobListingWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobListingWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobListingWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobListingWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobListingWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobListingWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobListingWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobListingWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobListingWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobListingWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobListingWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobListingWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobListingWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobListingWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [JobListingWeb] SET  MULTI_USER 
GO
ALTER DATABASE [JobListingWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobListingWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobListingWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobListingWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobListingWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobListingWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobListingWeb', N'ON'
GO
ALTER DATABASE [JobListingWeb] SET QUERY_STORE = OFF
GO
USE [JobListingWeb]
GO
/****** Object:  Table [dbo].[TypeofJob]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeofJob](
	[JobtypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[JobtypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Website] [varchar](100) NULL,
	[Image] [nvarchar](500) NULL,
	[Location] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[IndustryID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Company__2D971C4C6C7F9FDA] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[NoOfPost] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Qualification] [nvarchar](max) NULL,
	[Experience] [nvarchar](max) NULL,
	[Specialization] [nvarchar](max) NULL,
	[LastDatetoApply] [date] NULL,
	[Salary] [nvarchar](50) NULL,
	[Jobtype] [int] NULL,
	[CompanyID] [int] NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Location] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[Createdate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Jobs__056690E2D90283BA] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[NewJob]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[NewJob]
as
select top 6 A.*,B.Name as CompanyName,B.Image,B.Website, C.TypeName
from Jobs A, Company B, TypeofJob C
where A.CompanyID = B.CompanyID and A.Jobtype = C.JobtypeID 
order by A.Createdate DESC
GO
/****** Object:  Table [dbo].[Location]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[JobsbyLocation]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[JobsbyLocation] 
as
select A.*, COUNT(B.JobID) as NoOfJobs
from Location A, Jobs B
where A.LocationID = B.Location
GROUP BY A.LocationID, A.Name, A.Country
GO
/****** Object:  Table [dbo].[Industry]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[IndustryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IndustryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[JobsbyCategory]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[JobsbyCategory]
as
select C.*, COUNT(A.JobID) as NoOfJobs
from Jobs A, Company B, Industry C
where A.CompanyID = B.CompanyID and B.IndustryID = C.IndustryID 
GROUP BY C.IndustryID, C.Name
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[likes] [int] NOT NULL,
	[comments] [int] NOT NULL,
	[image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_category]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_category_mapping]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_category_mapping](
	[post_ID] [int] NOT NULL,
	[category_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PostsbyCategory]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PostsbyCategory]
as
select B.*, COUNT(A.ID) as NoOfPosts
from Blog A, Blog_category B, Blog_category_mapping C
where A.ID = c.post_ID and B.ID = C.category_ID 
GROUP BY C.category_ID, B.ID, B.name, B.Content
GO
/****** Object:  View [dbo].[FullJob]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[FullJob]
as
select A.*,B.Name as CompanyName, B.Image,B.Website, C.TypeName, D.IndustryID, D.Name as IndustryName
from Jobs A, Company B, TypeofJob C, Industry D
where A.CompanyID = B.CompanyID and A.Jobtype = C.JobtypeID and B.IndustryID = D.IndustryID 
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phonenum] [varchar](10) NULL,
	[Username] [varchar](15) NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_AM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_comments]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[post_ID] [int] NOT NULL,
	[user_ID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_likes]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_likes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[post_ID] [int] NOT NULL,
	[user_ID] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature_area]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature_area](
	[FaID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[FaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navigation]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigation](
	[NavID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NavID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/07/2023 11:15:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](35) NULL,
 CONSTRAINT [PK__User__3214EC27CE96DD9E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 
GO
INSERT [dbo].[ADMIN] ([ID], [Name], [Phonenum], [Username], [Password], [Role]) VALUES (1, N'admin', N'0385242430', N'admin', N'1111', 1)
GO
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (1, N'Rust-out, khi nhân viên thiếu sự thách thức ở nơi làm việc
', N'“Rust out” là khi một nhân sự cảm thấy mình đang được giao những công việc dưới tầm, thiếu sự thử thách.

Nhiều năm qua, burn out (kiệt sức) thường được nhắc đến tại các văn phòng. Tình trạng này mô tả trạng thái cảm xúc và thể chất mệt mỏi cực độ khi một người phải đối mặt áp lực công việc, cuộc sống kéo dài.

Tuy nhiên, có một trạng thái khác cũng gây ảnh hưởng tiêu cực không kém đối với người lao động đó là rust out.

Theo The Conversation, rust out không gây tác động rõ rệt đến sức khỏe như burn out, nhưng âm thầm “giết chết” tinh thần và sự háo hức làm việc.

“Rust out” là gì?
“Rust out/ bore out” mô tả trạng thái mệt mỏi, mất hứng thú trong công việc.

Nếu như burn out là hệ lụy của việc chịu quá nhiều sức ép, rust out lại đến từ tình trạng công việc thiếu tính thử thách. Nhân viên thường cảm thấy thiếu mục tiêu để phấn đấu.

Tình trạng này đối lập hoàn toàn với “flow” – trạng thái xảy ra khi người lao động được giao nhiệm vụ có mức độ thử thách lý tưởng. Chúng được thiết kế không quá dễ dàng đến mức buồn chán, cũng không quá khó khăn khiến áp lực và mệt mỏi. Vì vậy, nhân sự sẽ cảm thấy hài lòng và phấn khởi khi hoàn thành công việc.

Rơi vào tình trạng rust out kéo dài sẽ dẫn đến việc giảm năng suất, khả năng sáng tạo, gia tăng tỷ lệ mất tập trung. Điều này rõ ràng không tốt cho cá nhân người lao động cũng như nơi họ làm việc.

Đâu là nguyên nhân?
Theo The Conversation, với trình độ học vấn ngày càng được nâng cao, người lao động hiện nay thường có kỹ năng cao hơn so với yêu cầu của công việc.

Trong những giai đoạn bấp bênh như dịch bệnh, suy thoái kinh tế, nhiều nhân sự phải chấp nhận làm những công việc đòi hỏi ít kỹ năng hơn những gì mình có. Xu hướng này càng làm trầm trọng thêm tình trạng rust out chốn công sở.

Ngoài ra, sự phát triển của công nghệ đã ảnh hưởng tới nhiều khía cạnh tinh thần của con người. Ngày nay, con người thường không tham gia trực tiếp vào quá trình tạo ra sản phẩm. Họ không thấy bản thân đang đóng góp thực tế vào công việc. Hệ quả là họ mất đi một mục đích để phấn đấu.

Nhân sự sẽ hài lòng về công việc nếu…
Một số nhà nghiên cứu cho rằng ba yếu tố quan trọng nhất đối với người lao động tại nơi làm việc là quyền tự chủ, quyền làm chủ và mục tiêu làm việc.

Tự chủ là cảm giác tự do khi nhân viên được quyền đưa ra quyết định về cách làm việc và những gì họ làm.

Làm chủ là cảm giác tiến bộ khi nhân sự được cải thiện, phát triển kỹ năng và chinh phục những thử thách mới.

Mục tiêu làm việc xuất hiện khi người lao động cảm thấy rằng mình đang cống hiến cho một điều gì đó lớn lao và có ảnh hưởng tích cực đến thế giới.

Ba yếu tố này góp phần tạo nên cảm giác hài lòng, thỏa mãn và có mục tiêu. Khi chúng không được đáp ứng, nhân viên sẽ dần dần mất tinh thần.

Một yếu tố khác là động lực, thường có thể được chia thành hai loại. Động lực bên ngoài khuyến khích bạn làm điều gì đó vì có phần thưởng, dù là tiền hay chỉ là lời khen ngợi.

Động lực nội tại giúp duy trì tinh thần cống hiến vì nó mang lại niềm hạnh phúc. Nếu động lực nội tại không tồn tại, ngay cả các phần thưởng bên ngoài cũng không thể kích thích nhân viên tập trung vào công việc.

Giải pháp
Sáng kiến về tuần làm việc bốn ngày và làm việc linh hoạt (hybrid) mang lại cho nhân viên quyền tự chủ. Họ có thời gian học các kỹ năng mới, tìm ra những mục tiêu để cống hiến. Đây chính là các cơ sở vững chắc để thúc đẩy một cá nhân tiếp tục lao động hăng say.

Bên cạnh đó, theo The Conservation, để xoá bỏ tình trạng rust out, các doanh nghiệp không chỉ cần khiến nhân sự làm việc chăm chỉ mà còn phải kích thích sự sáng tạo ở mỗi cá nhân.

Những doanh nghiệp khuyến khích sự sáng tạo, ví dụ thông qua môi trường làm việc tích cực, mối quan hệ lành mạnh giữa sếp và nhân viên, thường có sự cạnh tranh, năng suất lao động và hiệu suất làm việc cao hơn.

Ngoài ra, để nhân viên sáng tạo và đổi mới, họ cần có thời gian để làm các công việc khác nhau. Nhiều doanh nghiệp trên thế giới đã đi tiên phong trong việc này.

Atlassian, một công ty phần mềm của Australia, cho phép nhân viên có thể làm bất cứ điều gì họ muốn trong một ngày. Trong khi đó, Google thực hiện một chiến lược tương tự được gọi là quy tắc 20%. Theo đó, nhân viên được khuyến khích dành tới 20% thời gian làm việc của họ để theo đuổi các dự án cá nhân.', NULL, CAST(N'2023-07-18T00:00:00.000' AS DateTime), CAST(N'2023-07-18T00:00:00.000' AS DateTime), 0, 0, N'post1.png')
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (2, N'10 cách giúp thành công trong sự nghiệp cho bạn', N'Bạn cảm thấy sự nghiệp của mình vẫn chưa được như mong muốn? Đạt được thành công trong công việc là một thức thức lớn, không phải ai cũng dễ dàng đạt được. Dưới đây là 10 cách giúp thành công trong sự nghiệp hơn.

1.Xác định mục rõ ràng
 

Điều đầu tiên để đạt được thành công đó là bạn phải biết mình muốn gì và đặt mục tiêu cụ thể mà bạn muốn hướng tới. Bởi những người thành công sẽ không bao giờ chạy theo những khát vọng mơ hồ. Họ phải hiểu rõ mục tiêu để nỗ lực đạt được mục tiêu đề ra. Mục tiêu sẽ giống như kim chỉ nam để dẫn bạn tập trung vào một con đường duy nhất.

Mỗi kẻ lừa đảo chúng ta đều có những thế mạnh và điểm yếu riêng. Thay vì bạn tập trung làm mọi thứ thì hãy tập trung làm một thứ thật tốt và xuất sắc. Như vậy thì bạn mới có cơ hội nhiều hơn, hãy loại bỏ những yếu tố không cần thiết để tập trung vào một mục tiêu duy nhất. 

2. Lòng đam mê và sự kiên trì
 

Khi bạn có lòng đam mê với mục tiêu đã đặt ra, chắc chắn rằng bạn sẽ dốc hết sức lực của mình và để đạt được thứ mà mình mong muốn. Cuộc sống là chuỗi những sự kiện mà bạn không thể biết trước, cho dù có khó khăn hay cực khổ nếu như bạn có lòng kiên trì thì mọi khó khăn sẽ phát triển tiến về phía sau để nhường chỗ cho người thành công.

Theo nghiên cứu, sự thành công của một người sẽ phụ thuộc vào 15% là kiến ​​thức và 85% sẽ phụ thuộc vào thái độ. Một thái độ lạc quan, tích cực khi gặp phải khó khăn, thử thách và đam mê học hỏi… Tất cả sẽ quyết định bạn sẽ bước đến quãng đường thành công là bao xa.

3. Có nguyên tắc sống và niềm tin
 

Nếu như bạn sống mà không có nguyên tắc, thì chắc chắn rằng bạn sẽ không thể đạt đến đỉnh cao của sự thành công. Một người sống có trách nhiệm và nguyên tắc thì sẽ mang lại hiệu quả công việc tốt hơn. Thế nhưng bạn cũng cần phải xác định rõ ràng các nguyên tắc cho công việc, cho cuộc sống hàng ngày là khác nhau. Không nên cài đặt và áp dụng công việc chung vào cuộc sống.

4. Là người có ý nghĩ và người làm
 

Cuộc sống của bạn là do chính bạn quyết định, khi bạn đã có mục tiêu, thì bạn phải thực hiện nó để thành công. Dẫu biết rằng để đi đến cuối con đường đó là bao gian nan trắc trở, hay mọi người có thể nghĩ bạn không đủ khả năng, ý bạn thật thà hơi… Thế nhưng nếu không làm thì làm sao có kết quả. Nếu như bạn chỉ dừng lại ở suy nghĩ mà không thực hiện, thì bạn sẽ bao giờ thành công hết.
Đừng bao giờ để những ước mơ và mục tiêu của mình bị tàn lụi theo thời gian. Thời gian là vàng là bạc, hãy thực hiện ngay khi có sẵn tiêu chuẩn. Đừng quên đặt ra những nguyên tắc và thái độ tích cực, nỗ lực cố gắng hết mình để cho dù có thất bại thì bạn vẫn có thể tự hào vì mình đã từng cố gắng như thế nào.

5. Tự đứng dậy sau vấp ngã
 

Chắc chắn bạn đã từng nghe đến câu “thất bại là mẹ của thành công”. Nếu như bạn có thất bại với mục tiêu mà mình đề ra thì cũng đừng nản lòng. Bởi vì bạn chấp nhận thất bại, tự rút kinh nghiệm cho bản thân, không bao giờ có ý định loại bỏ cuộc thì chắc chắn rằng cuối cùng bạn sẽ tạo ra thứ mà mình muốn.

Một ví dụ điển hình cho câu nói trên đó là phát minh bóng đèn chiếu sáng của nhà bác học Edison. Để có thể tạo ra chiếc xe bóng đèn ngày mà chúng tôi sử dụng hiện nay, Edison đã trải qua hơn 10.000 lần thất bại khi thử nghiệm nhiều loại vật liệu khác nhau để chế tạo nên dây tóc bóng đèn. Thất bại nhiều như thế nhưng anh không buồn nản lòng, bởi anh nghĩ rằng sau mỗi lần vấp ngã sẽ là từng bước giúp anh tiến đến thành công gần hơn.

6. Loại bỏ những suy nghĩ tiêu cực
 

Có câu nói rằng mình rất thích “chỗ ngồi ở vị trí không ai ngồi được thì phải giác mà không ai chịu”. Nếu như bạn muốn trở nên thành công thì những áp lực sẽ luôn bủa vây lấy bạn. Việc cần làm của bạn lúc này là cố gắng loại bỏ những nền tảng đá đó đi. Thay vào đó là những suy nghĩ tích cực, sự vui vẻ, lạc quan để chinh phục mọi áp lực trong cuộc sống. 

7. Không thỏa mãn với những gì đã đạt được
 

Thành công sẽ chỉ đến với những người luôn cố gắng và có những khao khát. Cuộc sống là chuỗi các thử nghiệm được đặt ra để bạn tìm cách và vượt qua nó. Nếu như bạn dễ dàng hài lòng với những gì mình đã đạt được thì điều đó chỉ chứng minh rằng bạn là kẻ thất bại. Nếu bạn đã đạt được mục tiêu ban đầu, hãy đặt mục tiêu cao hơn để tiếp tục chinh phục nó, vì vậy bạn mới là người thành công. 

8. Mở với những đóng góp ý kiến ​​của những người xung quanh
 

Nếu bạn ngại nhận những lời góp ý từ người khác vì cho rằng điều đó là thật giả hoặc người khác đang có ý chê bai bạn, hãy thử suy nghĩ lại. Bạn không nhất thiết phải tiếp nhận hoặc tiếp tục thu từng lời chỉ trích, nhưng ít nhất bạn nên biết những ý kiến ​​đóng góp nào cần được xem xét. Họ có thể gây tổn thương cho bạn trong thời gian ngắn, nhưng hãy lắng nghe những điều đó để thay đổi phát triển lâu dài trong tương lai.

9. Kiểm soát nỗi sợ hãi của bản thân 
 

Hãy tưởng tượng rằng bạn đang lái xe trên đường với nỗi sợ luôn đeo bám trong đầu. Nỗi sợ điều này giống như bạn đang thì thầm bên tai bạn: “Bạn đang lái xe nhanh quá!”, “Bạn đang đi đâu vậy?” Không phải sai đường rồi ” hoặc “Không được đi đến đó, ở đó rất nguy hiểm”. Nỗi sợ hãi chính là một nhà phê bình bên trong bạn . Nó thường xuất hiện khi đã được chuẩn bị sẵn với một điều gì đó, ví dụ như một dự án mà bạn đang thực hiện Mục đích thay đổi định hướng nghề nghiệp. Tất cả những gì bạn phải làm là dừng lại và kiểm soát nỗi sợ hãi của mình bằng cách tự nói với chính mình: “Tôi biết mình đang làm gì!”. Tuy nỗi sợ hãi bên trong bạn sẽ không bao giờ mất đi, nhưng hãy nhớ nó cũng sẽ được chính bạn kiểm soát nó cũng làcách giúp thành công trong sự nghiệp .

10. Biết đâu là thế mạnh của bản thân
 

Biết được thế mạnh của bản thân là một yếu tố quan trọng trong phát triển nghề nghiệp. Bởi vì nó cho bạn biết làm thế nào để phát huy năng lực của bạn trong mọi tình huống. Ngược lại, nếu không biết thế mạnh của bản thân, bạn có thể hành động hoặc làm việc gì không hiệu quả. Điều này không chỉ ảnh hưởng tiêu cực đến danh tiếng nghề nghiệp của bạn mà còn có thể ảnh hưởng tiêu cực đến sự phát triển của công ty. Vì vậy hỹ thuật tìm ra điểm mạnh của bản thân và phát huy nó một cách tốt nhất.', NULL, CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2021-10-07T00:00:00.000' AS DateTime), 0, 0, N'post2.jpg')
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (3, N'05 khoản tiền người lao động có thể nhận khi nghỉ việc
', N'Nghỉ việc là điều không thể tránh khỏi đối với người lao động (NLĐ) trong quá trình làm việc. Để đảm bảo quyền lợi của mình, NLĐ cần biết đến 05 khoản tiền mình có thể nhận sau khi nghỉ việc như sau:

1. Tiền lương cho những ngày làm việc chưa được thanh toán
Đây là khoản tiền mà tất cả NLĐ đều sẽ được nhận khi chấm dứt hợp đồng lao động.

Theo quy định tại Điều 48 Bộ luật Lao động 2019: trong thời hạn 14 ngày làm việc kể từ ngày chấm dứt hợp đồng lao động, người sử dụng lao động có trách nhiệm thanh toán đầy đủ các khoản tiền liên quan đến quyền lợi của NLĐ (trong đó có tiền lương).

Thời hạn thanh toán khoản tiền này có thể được kéo dài nhưng không quá 30 ngày trong các trường hợp:

– Người sử dụng lao động không phải là cá nhân chấm dứt hoạt động;

– Người sử dụng lao động thay đổi cơ cấu, công nghệ hoặc vì lý do kinh tế;

– Chia, tách, hợp nhất, sáp nhập; bán, cho thuê, chuyển đổi loại hình doanh nghiệp; chuyển nhượng quyền sở hữu, quyền sử dụng tài sản của doanh nghiệp, hợp tác xã;

– Do thiên tai, hỏa hoạn, địch họa hoặc dịch bệnh nguy hiểm.

Như vậy, trong thời hạn theo quy định nêu trên thì NLĐ sẽ được chi trả tiền lương cho những ngày mình làm việc mà chưa được thanh toán.

2. Tiền phép năm
Theo quy định tại Điều 113 Bộ luật Lao động 2019, tùy vào đối tượng lao động và điều kiện làm việc thì NLĐ làm việc đủ 12 tháng cho người sử dụng lao động sẽ được nghỉ phép năm từ 12 – 16 ngày.

Theo khoản 3 Điều 113 Bộ luật Lao động 2019 như sau: Trường hợp do thôi việc, bị mất việc làm mà chưa nghỉ hằng năm hoặc chưa nghỉ hết số ngày nghỉ hằng năm thì được người sử dụng lao động thanh toán tiền lương cho những ngày chưa nghỉ.

Như vậy, ngoài tiền lương, NLĐ còn được nhận tiền phép năm mà NLĐ chưa nghỉ hết nếu do thôi việc hoặc mất việc làm.

3. Tiền trợ cấp thôi việc
Căn cứ theo Điều 46 Bộ luật Lao động 2019, NLĐ sẽ nhận được khoản trợ cấp thôi việc khi đáp ứng đủ 02 điều kiện sau:

– Nghỉ việc do chấm dứt hợp đồng lao động theo các khoản 1, 2, 3, 4, 6, 7, 9 và 10 Điều 34 của Bộ luật Lao động 2019

– Làm việc thường xuyên cho cho người sử dụng lao động từ đủ 12 tháng trở lên

Thỏa mãn đủ 02 điều kiện trên, thì mỗi năm làm việc NLĐ được trợ cấp một nửa tháng tiền lương, trừ trường hợp đủ điều kiện hưởng lương hưu theo quy định của pháp luật về bảo hiểm xã hội và NLĐ tự ý bỏ việc mà không có lý do chính đáng từ 05 ngày làm việc liên tục trở lên;

Cách tính trợ cấp thôi việc cụ thể:

Tiền trợ cấp thôi việc = 1/2 x Tiền lương để tính trợ cấp thôi việc x Thời gian làm việc để tính trợ cấp.

Trong đó:

– Tiền lương để tính trợ thôi việc làm là tiền lương bình quân của 06 tháng liền kề theo hợp đồng lao động trước khi NLĐ mất việc làm.

– Thời gian làm việc để tính trợ cấp thôi việc: là tổng thời gian NLĐ đã làm việc thực tế cho người sử dụng lao động trừ đi thời gian NLĐ đã tham gia bảo hiểm thất nghiệp theo quy định về bảo hiểm thất nghiệp và thời gian làm việc đã được người sử dụng lao động chi trả trợ cấp mất việc làm.

4. Tiền trợ cấp mất việc làm
Theo Điều 47 Bộ luật Lao động 2019, NLĐ nghỉ việc được trả trợ cấp mất việc làm khi có đủ 02 điều kiện:

– Nghỉ việc do chấm dứt hợp đồng lao động theo khoản 11 Điều 34 của Bộ luật Lao động 2019;

– Đã làm việc thường xuyên cho người sử dụng lao động từ đủ 12 tháng trở lên.

Như vậy, nếu đáp ứng 02 điều kiện trên, NLĐ sẽ được người sử dụng lao động thanh toán trợ cấp mất việc, cứ mỗi năm làm việc trả 01 tháng tiền lương nhưng ít nhất bằng 02 tháng tiền lương. Cụ thể:

Mức trợ cấp mất việc làm = Thời gian làm việc tính hưởng trợ cấp x Tiền lương tháng tính hưởng trợ cấp.
Trong đó:
– Thời gian làm việc để tính trợ cấp: tổng thời gian NLĐ đã làm việc thực tế cho người sử dụng lao động trừ đi thời gian NLĐ đã tham gia bảo hiểm thất nghiệp theo quy định về bảo hiểm thất nghiệp và thời gian làm việc đã được người sử dụng lao động chi trả trợ cấp thôi việc.

– Tiền lương để tính trợ cấp mất việc làm là tiền lương bình quân của 06 tháng liền kề theo hợp đồng lao động trước khi NLĐ mất việc làm.

5. Tiền trợ cấp thất nghiệp
Tiền trợ cấp thất nghiệp là khoản tiền do Quỹ Bảo hiểm xã hội chi trả không phải người sử dụng lao động.

Tuy nhiên để được hưởng khoản tiền này, NLĐ cần đáp ứng các điều kiện sau:

– Đã chấm dứt hợp đồng lao động hoặc hợp đồng làm việc;

– Đã đóng bảo hiểm thất nghiệp từ đủ 12 tháng trở lên trong thời gian 24 tháng trước khi chấm dứt hợp đồng lao động đối với hợp đồng lao động;

– Đã đăng ký thất nghiệp và nộp hồ sơ hưởng trợ cấp tại Trung tâm dịch vụ việc làm;

– Chưa tìm được việc làm sau 15 ngày, kể từ ngày nộp hồ sơ hưởng bảo hiểm thất nghiệp.

Như vậy, NLĐ đủ điều kiện sẽ được trả trợ cấp thất nghiệp theo Điều 50 Luật Việc làm 2013, như sau:

Mức hưởng hàng tháng = Bình quân tiền lương tháng đóng BHTN của 06 tháng liền kề trước khi thất nghiệp x 60%

Ngoài 05 khoản tiền nêu trên, tùy theo nội dung hợp đồng mà NLĐ đã ký kết hoặc thỏa ước với người sử dụng lao động về các khoản tiền sau khi nghỉ việc thì NLĐ còn được hưởng thêm các quyền lợi đó.', NULL, CAST(N'2023-07-03T00:00:00.000' AS DateTime), CAST(N'2023-07-03T09:07:00.000' AS DateTime), 0, 0, N'post3.png')
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (4, N'Những điều ngại bao nhiêu cũng phải hỏi rõ khi phỏng vấn
', N'Newbie chú ý! Biết là ngại đấy, nhưng ngại vẫn đỡ hơn thiệt thòi! Dù ngại thế nào thì các bạn ứng viên cũng nhớ phải hỏi rõ 5 điều sau lúc phỏng vấn nhé.

Công việc cụ thể của em là gì, khối lượng bao nhiêu? 
Trước khi hỏi câu này, các bạn nên nhắc khéo với nhà tuyển dụng về việc mình đã tìm hiểu về nội dung mô tả và yêu cầu công việc trong tin tuyển dụng. Nhưng vì muốn hiểu rõ ràng cụ thể hơn về công việc để có thể chuẩn bị tốt nhất, nên bạn mới hỏi câu này. 

Có như vậy, nhà tuyển dụng mới không nghĩ bạn chỉ rải CV mà chưa hề đọc qua mô tả công việc. Tuyệt đối tránh nói rằng em chưa biết vị trí này cần phải làm những công việc gì. Mất điểm trầm trọng đấy nhé!

Chẳng hạn, bạn ứng tuyển làm Content Marketing, tuy đã đọc qua mô tả công việc là viết bài quảng cáo Facebook, SEO website, quản trị Fanpage… nhưng vẫn nên hỏi thêm về công việc cụ thể và khối lượng bao nhiêu. Nhờ vậy bạn biết được mỗi ngày cần viết bao nhiêu bài và quản trị bao nhiêu Fanpage… Tránh được tình trạng vô làm mới biết khối lượng công việc quá tải bạn nhé. 

Em có công việc phát sinh không, có làm thêm giờ không?
Câu hỏi này hơi tế nhị. Nếu hỏi không khéo, nhà tuyển dụng sẽ nghĩ bạn lười biếng và không muốn làm thêm giờ hoặc nhận thêm các việc phát sinh. Tuy nhiên, đây lại là vấn đề quan trọng bạn cần nắm để tránh thiệt thòi sau này. Nhất là khi việc phát sinh quá nhiều và thường xuyên phải làm thêm giờ.

Hãy nói khéo với nhà tuyển dụng rằng bạn hỏi để tự lượng sức bản thân xem đáp ứng tốt công việc không. Bên cạnh đó, nhớ hỏi qua về lương làm thêm giờ để tránh mất quyền lợi theo quy định Pháp luật bạn nhé.

Chẳng hạn, với vị trí ứng tuyển Content Marketing khi nãy, bạn hãy hỏi xem công việc phát sinh là gì. Bạn có cần edit video, đăng bài, trả lời tin nhắn Fanpage hay đi quay phim ngoài hiện trường… hay không? Công ty thường yêu cầu làm thêm giờ không, tần suất thế nào và lương ngoài giờ bao nhiêu?

Em có được đóng bảo hiểm không?
Được đóng bảo hiểm là quyền lợi chính đáng của người lao động nhưng rất nhiều ứng viên ngại hỏi điều này trong buổi phỏng vấn. Cứ mạnh dạn hỏi bạn nhé! 

Nếu công ty tuân thủ Pháp luật đàng hoàng, nhà tuyển dụng sẽ giải đáp cụ thể vấn đề bảo hiểm đến bạn. Còn nếu nhà tuyển dụng trả lời mập mờ, lảng tránh, qua loa… thì bạn nên suy nghĩ lại. Trường hợp nhà tuyển dụng khó chịu và thể hiện thiện cảm không tốt về bạn, cũng nên suy nghĩ lại.

Thời gian thử việc của em mấy tháng, lương thử việc bao nhiêu % lương chính thức?
Nắm rõ Luật trước khi hỏi câu này bạn nhé. Theo Pháp luật quy định, thời gian thử việc không quá 60 ngày và lương thử việc không được dưới 85% lương chính thức. Nếu công ty yêu cầu thời gian thử việc trên 2 tháng hoặc lương thử việc thấp hơn 85% lương chính thức, bạn không nên nhận việc. Bên cạnh đó, nhà tuyển dụng nào trả lời mập mờ vấn đề này thì bạn cũng không nên nhận việc.

Em sẽ được nhận những khoản thu nhập nào?
Đặc biệt, một vấn đề quan trọng cần trao đổi thỏa thuận rõ trước khi vào làm, đó chính là lương thưởng. Hãy hỏi xem bạn sẽ nhận được những khoản thu nhập nào? Lương cứng có fix không, dựa theo ngày công hay theo tháng, có dựa theo KPI không? 

Thưởng KPI có mốc cụ thể không, nhân viên công ty thường đạt mốc nào hay công ty đặt KPI cao quá khiến không ai đạt được? Ngoài ra có thể hỏi thêm các khoản khác như phụ cấp ăn trưa, gửi xe, thưởng lễ Tết… Vấn đề lương thưởng nếu không thỏa thuận rõ trước khi nhận việc thì sau này sẽ rất rắc rối bạn nhé.

Trên đây là tuyển tập những điều ngại bao nhiêu cũng phải hỏi rõ khi phỏng vấn, nhất là với các bạn mới ra trường đi làm còn nhiều bỡ ngỡ. Hy vọng các bạn được nhà tuyển dụng giải đáp cụ thể mọi thắc mắc và vượt qua buổi phỏng vấn thành công nhé!', NULL, CAST(N'2023-07-13T14:07:00.000' AS DateTime), CAST(N'2023-07-13T14:07:00.000' AS DateTime), 0, 0, N'post4.png')
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (5, N'12 cách trả lời phỏng vấn thông minh, chuyên nghiệp
', N'Bạn chuẩn bị có một buổi phỏng vấn xin việc cùng với nhà tuyển dụng? Bạn cảm thấy thiếu tự tin vì không có nhiều kinh nghiệm trong việc phỏng vấn? Đừng lo vì đã có VietnamWorks sẽ chia sẻ cho bạn 12 cách trả lời phỏng vấn thông minh, chuyên nghiệp. Hãy tìm hiểu ngay nội dung bài viết để trang bị đầy đủ hành trang và kinh nghiệm để trở nên tự tin hơn khi đối diện trước nhà tuyển dụng nhé!

1. Biết kể chuyện đúng lúc 
Khi trả lời phỏng vấn, có nhiều câu hỏi bạn không thể chỉ trả lời có hoặc không, hay lời đáp quá ngắn gọn. Vì trên thực tế, một số câu hỏi có/không hay câu hỏi ngắn từ nhà tuyển dụng là nhằm mục đích khơi gợi “câu chuyện” của bạn. Ví dụ khi gặp một câu hỏi về kinh nghiệm làm việc, nhà tuyển dụng có thể hỏi bạn về một dự án mà bạn từng tham gia hay tình huống đặc biệt đã gặp phải trong công việc cũ. Lúc này, bạn sẽ đóng vai trò là một storyteller để kể lại câu chuyện của bản thân nhà tuyển dụng nghe.

Nhưng hãy lưu ý rằng, câu chuyện của bạn phải đi đúng trọng tâm câu hỏi, có đầy đủ ngữ cảnh, diễn biến và kết quả thì người nghe mới có thể hiểu được.

2. Câu trả lời sẽ ấn tượng khi đưa ra số lượng, dẫn chứng cụ thể
 

Câu trả lời về thành tựu của bản thân sẽ tạo ấn tượng tốt cho nhà tuyển dụng. Tuy nhiên, cách trả lời phỏng vấn thông minh hơn là câu trả lời nên đưa ra số lượng, dẫn chứng cụ thể. Có nghĩa là bạn cần thêm một vài con số về doanh thu, thời gian đạt dự án để câu trả lời đầy đủ thông tin và giúp người nghe thấy rõ được năng lực của bạn.

3. Trả lời câu hỏi phỏng vấn ngắn gọn, xúc tích
Thông thường, lượt phỏng vấn dành cho một ứng viên sẽ được ấn định trong một khoảng thời nhất định. Vì thế, nhà tuyển dụng sẽ không muốn mất nhiều thời gian để nghe câu trả lời quá dài dòng.

Ngay sau khi hiểu được câu hỏi từ người phỏng vấn, hãy trả lời vào vấn đề trọng tâm, đi thẳng vào dữ kiện mà người hỏi hướng đến.

Nếu sau khi bạn vừa trả lời xong mà người phỏng vấn hỏi lại hay yêu cầu giải thích thì rất có thể bạn đã bị lạc đề hoặc trả lời thiếu thông tin mà người hỏi muốn biết.

4. Đưa ra sự so sánh là cách trả lời phỏng vấn thông minh
Trên thực tế, ở công việc cũ bạn đã đảm nhận và có kinh nghiệm trong một lĩnh vực nhất định, nhưng khi ứng tuyển tại công ty mới có thể là một vị trí bạn chưa từng được tiếp xúc hay không sành sỏi trong lĩnh vực đó. VietnamWorks khuyên rằng, bạn nên áp dụng phương pháp đưa ra sự so sánh để thuyết phục nhà tuyển dụng.

Cách trả lời phỏng vấn thông minh là bạn có thể kể với nhà tuyển dụng rằng bạn đã tìm hiểu và học những gì để chuẩn bị cho vị trí mới khi chưa hề có bất kỳ kinh nghiệm nào. Ngoài ra, đừng quên sử dụng ưu điểm của bản thân để người phỏng vấn thấy rằng bạn có tinh thần học hỏi những điều mới để thích nghi với môi trường, tính chất công việc hay loại khách hàng mới mà công ty đang hợp tác.

Việc đưa ra sự so sánh có mục đích nhằm chuyển hướng tập trung của nhà tuyển dụng và biến khuyết điểm thành thế mạnh của bạn. Hoặc ít nhất, sự so sánh có thể giúp nhà tuyển dụng thấy rằng những nhược điểm đó không phải là rào cản khiến bạn gặp trở ngại trong quá trình công tác.

5. Dành thời gian suy nghĩ và hỏi lại nếu chưa hiểu rõ câu hỏi
Đây là một trong những điều cơ bản nhưng đa số ứng viên thường bị lãng quên nhất là khi đối diện trước nhà tuyển dụng:

Hít thở một hơi thật sâu, thả lỏng cơ thể và phải thật sự dành thời gian để tập trung suy nghĩ trước khi nói hay trả lời câu hỏi. Bởi vì những lời bạn phát ngôn sẽ không thể rút lại được. Nên đừng vội vàng thúc ép bản thân phải trả lời ngay sau khi nghe câu hỏi.
Nếu bạn chưa hiểu hay nghe chưa rõ câu hỏi, hãy mạnh dạn yêu cầu nhà tuyển dụng lặp lại câu hỏi một lần nữa hoặc giải thích thêm cho bạn.

Ví dụ:

“Are you expecting another example? I want to make sure that I fully understand the problem. “

(Anh/chị có thể đưa ra một ví dụ cụ thể khác không? Tôi chỉ muốn đảm bảo rằng tôi đã hiểu rõ câu hỏi).

Hoặc

“Besides my practical expertise, would you like to hear anything else? Actually, I’ve done it myself, but I’ve also mentored small project groups for it.”

(Ngoài chuyên môn thực tế của tôi, anh/chị có muốn nghe gì khác không? Trên thực tế, tôi đã từng làm việc này, nhưng tôi cũng phụ trách điều hành thêm những dự án nhỏ khác nữa).

Bạn cũng có thể hỏi theo cách ngược lại để nhà tuyển dụng xem liệu mình trả lời như vậy đã đủ ý chưa, ví dụ:

“Did my answer meet your expectations, or did you want more specific details?”

(Câu trả lời của tôi có đáp ứng mong đợi của anh/chị hay chưa? Anh chị cần tôi bổ sung gì thêm không?)

6. Kinh nghiệm trả lời phỏng vấn: Đặt câu hỏi
 

Thông thường, khi gần kết thúc buổi phỏng vấn, nhà tuyển dụng sẽ hỏi ứng viên rằng bạn có câu hỏi nào dành cho họ không.

Tuy nhiên, dù người phỏng vấn không chủ động hỏi, bạn cũng nên tự mình chuẩn bị sẵn câu hỏi cho nhà tuyển dụng. Nhất là khi bạn đang ứng tuyển vào một vị trí hoàn toàn mới, chưa có nhiều kinh nghiệm.

Một số câu hỏi để đặt ra cho nhà tuyển dụng bạn có thể tham khảo:

“Liệu anh/chị còn vướng mắc nào trong số những điều tôi vừa chia sẻ cần được làm rõ hơn không?”
“Quy mô của phòng ban mà tôi ứng tuyển hiện tại như thế nào?”
“Những thách thức mà tôi có thể gặp phải khi đảm nhận công việc là gì?”
7. Tập trung vào lợi ích chung và công ty
Đa số, những người đi phỏng vấn đều hướng đến lợi ích cá nhân của họ. Điều này là không sai, nhưng sự thiếu tinh tế này sẽ không được nhà tuyển dụng đánh giá cao.

Bạn sẽ có nhiều cơ hội thăng tiến hơn nếu bạn tập trung cống hiến vì lợi ích của cả công ty thay vì tập trung vào chính mình.

Hãy tập trung vào lợi ích chung và công ty khi tham gia phỏng vấn

Vậy nhà tuyển dụng họ cần gì và quan tâm đến điều gì? 
Bạn không nên chỉ quan tâm vào năng lực của bản thân như: mình làm giỏi cái này, làm tốt cái kia, có nhiều kinh nghiệm thế này thế nọ khi được hỏi đến.

Thay vào đó, hãy cho nhà tuyển dụng thấy rằng những năng lực đó của bạn có thể giúp ích cho công ty và có tính ứng dụng cao vào từng vị trí cụ thể tại công ty.

Bên cạnh đó, hãy đưa ra những dẫn chứng thuyết phục rằng công việc kinh doanh của họ sẽ hoạt động hiệu quả, trơn tru hơn nếu chọn bạn về đội.

Đây là cách trả lời phỏng vấn thông minh giúp bạn ghi điểm trong lòng nhà tuyển dụng, giành được tấm vé vào vòng trong và trở nên nổi bật, khác biệt hơn so với các ứng viên chỉ biết tập trung vào bản thân.

8. Trả lời phỏng vấn với phong thái tự tin và nhiệt huyết
 

Một câu trả lời phỏng vấn thông minh luôn đi kèm với một thái độ chừng mực và đúng đắn. Trả lời với phong thái tự tin và nhiệt huyết sẽ giúp bạn tạo ấn tượng tốt với nhà tuyển dụng.

Nụ cười tươi khi trả lời sẽ tạo cho bạn một phong thái tự tin, thoải mái và thể hiện rằng bạn đang rất hào hứng tham gia vào buổi phỏng vấn.

9. Xem buổi phỏng vấn như cuộc hội thoại trao đổi bình thường
Nhìn chung, một buổi phỏng vấn suy cho cùng cũng chỉ là một cuộc đối thoại giữa hai bên để xem xét liệu ứng viên và công ty có phù hợp với nhau hay không mà thôi.

Hãy hiểu một cách nôm na rằng: Đây là một thỏa thuận mà đôi bên cùng có lợi. Chính vì thế, bạn đừng ngại ngùng, sợ hãi khi bước vào buổi phỏng vấn. Hãy thoải mái trò chuyện với nhà tuyển dụng để đưa ra những giao dịch hợp lý. Từ đó, bạn có thể cảm thấy tự tin và phấn chấn hơn trong việc ứng tuyển vào những công ty bạn mong muốn.

Buổi phỏng vấn như cuộc hội thoại trao đổi bình thường

Đây cũng là một trong những phương pháp trả lời phỏng vấn thông minh hiệu quả nhất, giúp bạn trả lời các câu hỏi, dựa trên tư duy của bản thân mà không bị tác động bởi bất kỳ yếu tố bên ngoài.

10. Giao tiếp bằng ánh mắt khi trả lời phỏng vấn
“Eye contact” là một vũ khí tối ưu giúp bạn tạo điểm nhấn với nhà tuyển dụng. Giao tiếp bằng mắt cho thấy bạn tôn trọng người phỏng vấn và thật sự tập trung vào cuộc trò chuyện giữa bạn và họ.
Nếu bạn muốn trả lời một cách tự nhiên, thể hiện sự tự tin của bản thân như đang trong một cuộc hội thoại xã hội với nhà tuyển dụng, hãy giao tiếp bằng mắt và ngôn ngữ cơ thể để diễn đạt lời nói của mình.

11. Thảo luận về kế hoạch sắp tới
Các câu hỏi phỏng vấn thường tập trung vào quá khứ của ứng viên như kinh nghiệm trước đây, những thất bại trong quá khứ, các rủi ro đã trải qua, thành công đạt được,… để đánh giá kinh nghiệm cũng như khả năng xử lý công việc của họ. Tuy nhiên, mấu chốt lại nằm ở những câu hỏi về kế hoạch, dự đích hay mục tiêu trong tương lai.

Khi bạn trình bày kinh nghiệm cá nhân, nên lòng ghép vào đón những dự định trong thời gian tới như bạn sẽ dùng những kỳ năng sẵn có như thế nào để làm thật tốt vai trò của mình trong vị trí mới tại công ty.

Hãy chủ động đề cập những gì bạn đọc được ở phần mô tả công việc, hoặc những yêu cầu, mục đích tuyển dụng mà công ty đã cung cấp trước đó. Những điều này sẽ giúp bạn có thêm sự tự tin và chứng minh rằng bạn mang lại nhiều lợi ích cho họ. Đây cũng là cách trả lời phỏng vấn thông minh mà bạn có thể áp dụng cho bất kỳ công hỏi phỏng vấn nào. Nhưng trên thực tế, ứng viên thường lãng quên và bỏ qua không bạn dụng trong buổi trao đổi với nhà tuyển dụng.

12. Luôn nói sự thật
Nhà tuyển dụng có thể bỏ qua những thiếu sót nhỏ nhặt trong kinh nghiệm và năng lực của bạn. Tuy nhiên, nếu bạn nói dối về những kiến thức, kinh nghiệm đó và bị phát hiện, bạn sẽ phải chịu sự phán xét, đánh giá thấp và khả năng cao bị loại khỏi danh sách vào vòng trong.
Hãy nhớ rằng không nhất thiết bạn phải nói 100% sự thật về mình. Nhưng phải trung thực và thành thật nhất có thể khi nói về kinh nghiệm làm việc những như thành tựu mà bạn đã đạt được.

Sự tự tưởng được xây dựng ngay từ lần gặp đầu tiên và đó cũng là nền móng để bạn có thể bám trụ lâu dài cùng công ty trong tương lai. Tất cả đều nằm trong bản đánh giá của người phỏng vấn, vì thế hãy thể hiện tốt và chân thật nhất để tạo thiện cảm với họ.

Có thể nói, một buổi phỏng vấn hiệu quả được hướng đến như một buổi trò chuyện chứ không phải là một buổi truy vấn. Có thể thấy, hầu hết nhà tuyển dụng nào cũng muốn ứng viên của mình có những trải nghiệm đáng nhớ khi phỏng vấn. Bởi lẽ, điều này góp phần xây dựng hình ảnh đẹp về công ty nên đa số các buổi phỏng vấn thường không quá khó khăn. Vì thế, chỉ cần bạn nắm vững 12 cách trả lời phỏng vấn thông minh trên là đã có thể dễ dàng vượt qua. Hãy tự tin vào chính bản thân mình và thể hiện tốt nhất những gì bạn có để ghi điểm trong mắt nhà tuyển dụng một cách tuyệt vời nhất.', NULL, CAST(N'2023-07-19T00:07:00.000' AS DateTime), CAST(N'2023-07-19T00:07:00.000' AS DateTime), 0, 0, N'post5.jpg')
GO
INSERT [dbo].[Blog] ([ID], [Title], [Content], [UserID], [created_at], [updated_at], [likes], [comments], [image]) VALUES (6, N'Giải pháp bớt rầu cho Gen Z hay hỏi lương đâu?
', N'Lương vừa nhận đã tiêu gần hết là thực trạng chung của nhiều người, nhất là các bạn Gen Z mới đi làm. Làm thế nào để quản lý chi tiêu và tiết kiệm tiền lương hiệu quả? Giải pháp bớt rầu cho Gen Z hay hỏi lương đâu - bài viết này sẽ hữu ích với bạn!

Ghi chép nhật ký chi tiêu

Thử ghi chép lại những khoản chi tiêu hằng ngày trong tầm 1 tháng. Cách này giúp bạn tìm hiểu được thói quen chi tiêu của bản thân. Nhất là Gen Z mới ra trường, kiếm được thu nhập nên chưa kiểm soát được thói quen chi tiêu khi nhận lương. Lưu ý, không nên kiểm soát hay tiết kiệm trong giai đoạn tìm hiểu thói quen chi tiêu này bạn nhé.

Phân loại những khoản chi theo từng hình thức thanh toán như tiền mặt, thẻ ATM, thanh toán online, thẻ tín dụng… Nhớ giữ lại những hóa đơn tiền nhà, tiền điện nước, tiền internet, tiền mua sắm… Tới cuối tháng, bạn sẽ tổng kết được bản thân đã chi tiêu bao nhiêu và cho những khoản nào. 

Phân khoản chi theo hạng mục

Từ nhật ký chi tiêu, bạn phân các khoản chi theo từng nhóm hạng mục. Điển hình có thể kể đến là các nhóm hạng mục chi tiêu phổ biến với Gen Z hiện nay gồm:

– Tiền thuê nhà.

– Điện nước, internet, xăng xe, điện thoại.

– Tiền ăn uống.

– Nhu yếu phẩm.

– Ăn ngoài, cafe, tụ tập bạn bè, phát triển các mối quan hệ…

– Mua sắm quần áo, mỹ phẩm…

– Tiết kiệm.

Lập kế hoạch chi tiêu

Phân bổ thu nhập vào những hạng mục vừa chia theo tỷ lệ phần trăm trong 1 tháng, sao cho hợp lý nhất. Có thể lập bảng có 2 cột gồm “Dự tính” và “Thực tế”. Theo đó, cột “Dự tính” điền số tiền bạn muốn dành cho khoản chi đó. Còn cột “Thực tế” điền số tiền chi tiêu thực tiễn.

Thường các bạn Gen Z dành tầm 2/3 thu nhập cho 3 nhóm hạng mục thiết yếu là nhà ở, thực phẩm, đi lại. 1/3 còn lại để mua sắm, giải trí, tiết kiệm và trả nợ nếu có. Nếu số tiền chi tiêu thực tế lớn hơn nhiều so với dự tính trong thời gian dài, hãy điều chỉnh dần để có sự hợp lý như dự tính ban đầu bạn nhé.

Mẹo chi tiêu hợp lý và tiết kiệm

Tập tính tiết kiệm

Thói quen chi tiêu “hào phóng” không kiểm soát và lãng phí khiến Gen Z hay hỏi “lương đâu” vào cuối tháng. Nếu không tập được tính tiết kiệm, dù lương cao đến đâu vẫn sẽ bị thâm hụt. Vậy nên hãy rèn dần thói quen tiết kiệm, và không chi tiêu vào những khoản không cần thiết bạn nhé.

Chẳng hạn, có thể tự nấu ăn thay vì ăn tiệm. Hoặc hạn chế những cuộc hẹn giao lưu bạn bè xã giao không cần thiết. Hay kiềm chế tính mua sắm ngẫu hứng quá tay…

Bên cạnh đó, dành ra một khoản nhỏ để tiết kiệm tích lũy ngay từ hôm nay. Mỗi tháng chỉ cần trích một số tiền nhỏ cho vào quỹ tiết kiệm, sau một năm bạn có thể để dành được một khoản tiền kha khá. Số tiền tiết kiệm “phòng thân” này rất hữu ích cho những trường hợp cần thiết cấp bách như bệnh tật, thất nghiệp, sự cố phát sinh…

Tìm cách tăng thu nhập

Tranh thủ thời gian rảnh làm thêm công việc phụ để tăng nguồn thu nhập bạn nhé. Gen Z có sức trẻ, sự năng động và thời gian, nên rất nhiều công việc parttime cho bạn chọn. Phổ biến nhất hiện nay có thể kể đến là shipper, bán hàng online, Youtuber, TikToker…

Giảm chi phí ăn ở

Các bạn Gen Z thường chưa đủ tiền để mua nhà riêng. Vậy nên nếu phải thuê nhà, hãy chọn khu vực xa trung tâm thành phố và có diện tích nhỏ giúp giảm chi phí nhà trọ. Có thể ở ghép với người khác để chia bớt tiền thuê nhà bạn nhé.

Về khoản ăn uống, không nên cắt giảm bữa ăn kẻo ảnh hưởng sức khỏe. Tuy nhiên, bạn có thể tự nấu ăn và mang cơm đi làm để tiết kiệm tiền ăn tiệm. Mất thời gian và công sức nhưng bù lại đảm bảo vệ sinh và tiết kiệm ngân sách tối đa.

Bên cạnh đó, nhiều bạn trẻ Gen Z hiện nay có thói quen hay uống cafe, trà sữa, ăn thức ăn nhanh… Cũng như thích gặp mặt bạn bè đi ăn uống ngoài tiệm. Những khoản chi này nếu tổng kết lại thường là số tiền khá lớn, nhưng lại không phải khoản chi thiết yếu. Vậy nên hãy hạn chế những khoản không thực sự cần thiết bạn nhé. 

Thanh lý đồ cũ

Bạn nên thanh lý những món đồ cũ như quần áo, túi xách, giày dép, đồ đạc trong nhà… Thanh lý đồ cũ không chỉ giúp tiết kiệm không gian nhà ở, mà còn tăng thêm khoản thu nhập nhỏ cho bạn.

Dùng cẩn thận, học sửa chữa, tái sử dụng đồ đạc

Sử dụng đồ đạc cẩn thận và bảo quản kỹ lưỡng giúp hạn chế sự hư hỏng, kéo dài tuổi thọ sản phẩm. Cách này giúp tiết kiệm tiền tối ưu nhờ không phải chi khoản mua đồ đạc mới hay sửa chữa khi hư hỏng.

Học cách tự sửa chữa đồ đạc cơ bản giúp bạn tiết kiệm kha khá số tiền thuê thợ sửa. Chẳng hạn như tự sửa bóng đèn, máy quạt, ống nước… 

Ngoài ra, tái sử dụng đồ đạc giúp bạn không phải mua sản phẩm bên ngoài. Đừng vội vứt bỏ chai nhựa, lọ thủy tinh hay quần áo cũ… Thay vào đó, có thể tái chế thành chậu cây, hộp đựng đồ, kệ decor… bạn nhé.

“Săn” ưu đãi

Dịp lễ Tết, các cửa hàng thường tung chương trình ưu đãi hấp dẫn. Mua sắm vào các dịp này giúp bạn “săn” được hàng giảm giá với chất lượng tốt. Nhưng đừng để trở thành “con nghiện shopping”, nhất là các bạn Gen Z thích mua sắm. Chỉ nên mua sản phẩm nào thực sự cần thiết thôi bạn nhé.

Trên đây là TOP giải pháp bớt rầu cho Gen Z hay hỏi lương đâu. Quản lý chi tiêu và tiết kiệm hiệu quả giúp bạn dự phòng được khoản tiền cho nhiều tình huống phát sinh. Chẳng hạn bệnh tật, thất nghiệp, giúp đỡ người thân lúc khó khăn… Áp dụng những giải pháp trên ngay hôm nay để không phải hỏi “lương đâu” khi vừa mới nhận bạn nhé.', NULL, CAST(N'2023-06-05T11:06:00.000' AS DateTime), CAST(N'2023-06-05T11:06:00.000' AS DateTime), 0, 0, N'post6.jpg')
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog_category] ON 
GO
INSERT [dbo].[Blog_category] ([ID], [name], [Content]) VALUES (1, N'Hành trang yêu nghề', NULL)
GO
INSERT [dbo].[Blog_category] ([ID], [name], [Content]) VALUES (2, N'Hành trang fresher', NULL)
GO
INSERT [dbo].[Blog_category] ([ID], [name], [Content]) VALUES (3, N'Tìm nghề không khó', NULL)
GO
INSERT [dbo].[Blog_category] ([ID], [name], [Content]) VALUES (4, N'Nhà tuyển dụng', NULL)
GO
SET IDENTITY_INSERT [dbo].[Blog_category] OFF
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (1, 1)
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (2, 1)
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (3, 2)
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (4, 2)
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (5, 3)
GO
INSERT [dbo].[Blog_category_mapping] ([post_ID], [category_ID]) VALUES (6, 3)
GO
SET IDENTITY_INSERT [dbo].[Blog_comments] ON 
GO
INSERT [dbo].[Blog_comments] ([ID], [post_ID], [user_ID], [Content], [created_at]) VALUES (1, 1, 1, N'Nice', CAST(N'2023-07-26T08:38:59.963' AS DateTime))
GO
INSERT [dbo].[Blog_comments] ([ID], [post_ID], [user_ID], [Content], [created_at]) VALUES (2, 2, 1, N'nice
', CAST(N'2023-07-26T08:50:52.007' AS DateTime))
GO
INSERT [dbo].[Blog_comments] ([ID], [post_ID], [user_ID], [Content], [created_at]) VALUES (3, 3, 1, N'nice job', CAST(N'2023-07-26T09:05:54.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Blog_comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [Description], [Website], [Image], [Location], [Size], [IndustryID], [UserID]) VALUES (1, N'CÔNG TY TNHH ATEAM VIỆT NAM', N'Ateam là một trong những công ty về Game lớn nhất Nhật Bản. Đến với Ateam bạn có cơ hội trải nghiệm toàn bộ quy trình và công nghệ Game do Ateam phát triển độc lập. Ngoài ra, bạn sẽ có cơ hội được cử đi học tập tại Nhật và phát triển kỹ năng của bản thân.
Tại Việt Nam, Ateam là một công ty mới thành lập. do đó, chúng tôi cần bạn để cùng nhau tạo nên một văn hóa độc đáo cho riêng Ateam.
Là một trong những công ty đi đầu trong ngành công nghệ Mobile Game tại Nhật bản, chúng tôi tin rằng Ateam sẽ nhanh chóng phát triển lớn mạnh tại Việt Nam. Đây sẽ là cơ hội để bạn đóng góp cho chúng tôi và có được mức lương đáng ngưỡng mộ.', N'https://www.a-tm.co.jp/en/', N'logoAteam.jpg', 1, NULL, 1, NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [Description], [Website], [Image], [Location], [Size], [IndustryID], [UserID]) VALUES (2, N'Công ty Cổ Phần Sữa Việt Nam - Vinamilk', N'VINAMILK TRÌNH LÀNG THẾ GIỚI MỚI

Vinamilk đâu chỉ là những bạn bò vui nhộn, Vinamilk còn là mỗi ngày bạn ngập tràn sức sống.
Logo mắt cười. 3 bộ chữ được thiết kế độc quyền. Hệ thống hoạ tiết và thư viện hình ảnh vẽ tay. Bảng màu 28 sắc thái độc đáo. Tất cả mở ra thế giới Vinamilk trẻ trung và giàu khát khao.
Vinamilk táo bạo. Vinamilk quyết tâm. Vinamilk luôn là chính mình. Vinamilk mở màn hành trình mới, luôn hướng về phía trước.

VÌ BẠN.
Cùng khám phá thế giới mới của Vinamilk: https://bit.ly/vinamilk_hanhtrinhmoi
#Vinamilk #Hanhtrinhmoi', N'https://www.vinamilk.com.vn/', N'LogoVinamilk.png', 1, NULL, 2, NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [Description], [Website], [Image], [Location], [Size], [IndustryID], [UserID]) VALUES (3, N'Công Ty Cổ Phần Tập Đoàn Sunhouse

', N'Tập đoàn SUNHOUSE là một trong những doanh nghiệp hàng đầu tại Việt Nam trong lĩnh vực sản xuất và phân phối các mặt hàng gia dụng cao cấp theo công nghệ tiên tiến của Hàn Quốc và đã trở thành một trong những thương hiệu nổi tiếng tại Việt Nam. Với quy mô 2 nhà máy, 6 công ty thành viên, sản phẩm Sunhouse đã có mặt khắp 64 tỉnh thành trên toàn quốc, đồng thời đã xuất khẩu sang các nước Châu Âu, Châu Phi, các nước ASEAN…Qua 13 năm phát triển Tập đoàn Sunhouse đã đạt được những thành tựu đáng kể như: chứng nhận ISO 9000:2008, top thương hiệu Việt Nam năm 2010, hàng Việt nam chất lượng cao năm 2013…', N'http://sunhouse.com.vn/', N'logoSunhouse.png', 2, N'1.000-4.999 nhân viên

', 3, NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [Description], [Website], [Image], [Location], [Size], [IndustryID], [UserID]) VALUES (4, N'NGÂN HÀNG THƯƠNG MẠI CỔ PHẦN BẢO VIỆT
', N'Được thành lập theo giấy phép hoạt động số 328/GP-NHNN ngày 11/12/2008 của Thống đốc Ngân hàng Nhà nước Việt Nam, Ngân hàng TMCP Bảo Việt (BAOVIET Bank) là thành viên trẻ nhất của Tập đoàn Tài chính - Bảo hiểm Bảo Việt cũng là một ngân hàng thương mại trẻ trong hệ thống các tổ chức tín dụng tại Việt Nam. Sự ra đời của BAOVIET Bank góp phần hình thành thế chân kiềng vững chắc Bảo hiểm - Đầu tư - Tài chính - Ngân hàng, tạo nên sức mạnh tổng hợp, đảm bảo cho sự phát triển bền vững, toàn diện cho toàn hệ thống Bảo Việt.
Với cổ đông sáng lập lớn nhất là Tập đoàn Bảo Việt cùng một số cổ đông là các tổ chức có uy tín khác trong nước, BAOVIET Bank có nhiều điều kiện thuận lợi trong việc phát triển quan hệ đối tác với các tổ chức kinh tế trong và ngoài nước, ứng dụng công nghệ ngân hàng tiên tiến và hiệu quả nhất để tạo nên sức mạnh cạnh tranh cho ngân hàng, tạo tiền đề để trở thành một trong những ngân hàng hàng đầu tại Việt Nam.
BAOVIET Bank hướng tới mục tiêu phát triển bền vững, mở rộng kinh doanh trên nền tảng ổn định và hiệu quả, gắn tăng trưởng quy mô với việc bảo đảm an toàn trong hoạt động, đáp ứng những chuẩn mực và thông lệ quốc tế. Bên cạnh đó, BAOVIET Bank cũng nỗ lực xây dựng và đổi mới hệ thống ngân hàng ngày một hiện đại, hướng đến việc hoàn thành kế hoạch kinh doanh đã đặt ra, đảm bảo quyền lợi của cổ đông và người lao động. Với tôn chỉ hoạt động “Niềm tin vững chắc, cam kết vững bền”, BAOVIET Bank cam kết xây dựng một ngân hàng chuẩn mực, cung ứng những sản phẩm dịch vụ tốt nhất, mang lợi ích cao nhất đến với mỗi khách hàng. ', N'https://www.baovietbank.vn/', N'logoBaoViet.png', 1, NULL, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 
GO
INSERT [dbo].[Contact] ([ContactID], [Name], [Email], [Subject], [Message]) VALUES (1, N'Nguyễn Thành Trung', N'nguyentrungtrung2002@gmail.com', N'Report', N'addadasda')
GO
INSERT [dbo].[Contact] ([ContactID], [Name], [Email], [Subject], [Message]) VALUES (4, N'Ricardo', N'ricon@gmail.com', N'Hello', N'nothing')
GO
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature_area] ON 
GO
INSERT [dbo].[Feature_area] ([FaID], [Name], [Link], [Description]) VALUES (1, N'Tìm kiếm', NULL, NULL)
GO
INSERT [dbo].[Feature_area] ([FaID], [Name], [Link], [Description]) VALUES (2, N'Ứng tuyển', NULL, NULL)
GO
INSERT [dbo].[Feature_area] ([FaID], [Name], [Link], [Description]) VALUES (3, N'Bảo mật', NULL, NULL)
GO
INSERT [dbo].[Feature_area] ([FaID], [Name], [Link], [Description]) VALUES (4, N'Thông báo', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Feature_area] OFF
GO
SET IDENTITY_INSERT [dbo].[Industry] ON 
GO
INSERT [dbo].[Industry] ([IndustryID], [Name]) VALUES (1, N' IT - Phần mềm')
GO
INSERT [dbo].[Industry] ([IndustryID], [Name]) VALUES (2, N'Hàng tiêu dùng')
GO
INSERT [dbo].[Industry] ([IndustryID], [Name]) VALUES (3, N'Xuất nhập khẩu, Sản Xuất, Hàng gia dụng')
GO
INSERT [dbo].[Industry] ([IndustryID], [Name]) VALUES (4, N'Ngân hàng')
GO
SET IDENTITY_INSERT [dbo].[Industry] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (4, N'
Chuyên Viên Phát Triển Giải Pháp Kỹ Thuật', NULL, N'Thực hiện các yêu cầu phát triển mới/chỉnh sửa hệ thống Corebanking T24; hệ thống thẻ Way4; Các hệ thống kênh giao tiếp điện tử: Internet Banking, Mobile Banking, SMS banking, Payment Gateway, E-Commerce ... ; Các hệ thống hỗ trợ MIS, FTP …

- Tham gia nghiên cứu, thử nghiệm và nâng cấp hệ thống Core Banking, Hệ thống thẻ, DataWarehouse...

- Tìm hiểu các giải pháp Công nghệ trong lĩnh vực ngân hàng, nghiên cứu khả năng ứng dụng vào hoạt động của BAOVIET Bank

- Tiếp nhận chuyển giao, đào tạo công nghệ từ các đối tác.

- Thực hiện những nhiệm vụ và trách nhiệm khác do Lãnh đạo có thẩm quyền phân công.

- Tuân thủ Nội quy lao động của Ngân hàng.', N'Yêu cầu về học vấn:

Tốt nghiệp Đại học ngành đào tạo Công nghệ Thông tin hoặc Toán tin ứng dụng hoặc Điện tử viễn thông.

Có khả năng lập trình tốt với ít nhất một trong những ngôn ngữ sau: Java, C#, Info Basic (jBase)

Có hiểu biết cơ bản ít nhất một trong những cơ sở dữ liệu sau: Oracle, SQL Server, jBase

Hiểu biết cơ bản ít nhất một trong những hệ điều hành sau: Windows, Unix, Linux.

Hiểu biết về ISO message 8583, NDC++, Diebold912, EMV, ATM, POS, NAC/NCC, HSM là một lợi thế.

Có hiểu biết về một trong những kiến thức sau là một lợi thế, bao gồm: Kiến trúc hướng đối tượng (SOA), Lập trình hướng đối tượng (OOP), Phân tích thiết kế hướng đối tượng (OOAD); DataWarehouse, Business Intelligence (BI).', NULL, N'Java, Công Nghệ Thông Tin, Tài Chính Ngân Hàng, Lập Trình, .NET', CAST(N'2023-08-15' AS Date), N'$500 - $1500', 1, 4, NULL, N'Hà Nội', 2, N'Hà Nội', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (5, N'Chuyên Viên QHKH Cá Nhân', NULL, N'• Trực tiếp thực hiện việc tìm kiếm, thẩm định, duy trì và phát triển quan hệ khách hàng cá nhân;
• Thực hiện các chỉ tiêu kinh doanh được giao đối với lĩnh vực Khách hàng Cá nhân gồm: Tín dụng, Huy động vốn, Sản phẩm bảo hiểm, Dịch vụ tài khoản, Ngân hàng điện tử,…và các chỉ tiêu bán chéo khác;
• Xây dựng, đề xuất các giải pháp trọn gói phục vụ nhu cầu về dịch vụ tài chính ngân hàng của Khách hàng Cá nhân;
• Thực hiện các chức năng của Cán bộ Quan hệ Khách hàng Cá nhân tại Đơn vị;
• Quản lý và hỗ trợ nhóm làm việc được phân công;
• Các công việc khác do cấp quản lý trực tiếp yêu cầu trong phạm vi thẩm quyền được giao.', N'• Tốt nghiệp Cao đẳng trở lên chuyên ngành: Ngân hàng, tài chính, kế toán và kinh tế,...;
• Nắm vững những kiến thức cơ bản về tín dụng ngân hàng;
• Kiến thức cơ bản về Luật và các quy định, quy chế, thông tư hướng dẫn của Ngân hàng Nhà Nước;
• Kỹ năng thuyết trình, giao tiếp;
• Hiểu biết thị trường tài chính tiền tệ;
• Nhanh nhẹn, có khả năng xây dựng và duy trì quan hệ tốt với khách hàng;
• Ưu tiên ứng viên có kinh nghiệm tại các: Ngân hàng, tổ chức tài chính, bảo hiểm, chứng khoán…', N'', N'Ngân Hàng, Quan Hệ Khách Hàng Cá Nhân, Tài Chính Ngân Hàng, Ngân Hàng Bán Lẻ', CAST(N'2023-08-01' AS Date), N'$500 - $1000', 1, 4, NULL, N'Số 90 - 92 Trần Văn Khéo, phường Cái Khế, quận Ninh Kiều, TP. Cần Thơ
', 3, N'Cần Thơ', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (9, N'Trưởng Phòng Phát Triển Sản Phẩm Bán Lẻ', NULL, N'- Lập khai kế hoạch hoạt động của Phòng Phát triển sản phẩm Bán lẻ;
- Chỉ đạo và giám sát thực hiện kế hoạch hoạt động của Phòng PTSP Bán lẻ để đảm bảo triển khai các công việc theo đúng kế hoạch.
- Nghiên cứu đề xuất xây dựng, điều chỉnh các chính sách, sản phẩm, dịch vụ trong từng thời kỳ đảm bảo phù hợp với chiến lược, kế hoạch kinh doanh của BAOVIET Bank trong từng thời kỳ.
- Cải tiến, xây dựng phát triển các quy trình, quy định về sản phẩm dịch vụ.
- Phối hợp các bên để truyền thông, giới thiệu và triển khai các sản phẩm, dịch vụ.
- Phối hợp xây dựng và tham gia triển khai kế hoạch đào tạo các chính sách, sản phẩm dịch vụ của BAOVIET Bank.
- Phân tích, đánh giá kết quả thực hiện từng sản phẩm dịch vụ để có giải pháp kịp thời trong việc cung ứng sản phẩm cho khách hàng đạt hiệu quả cao.
- Đánh giá chất lượng và đề xuất về công tác nhân sự của Phòng.', N'- Tốt nghiệp Đại học chuyên ngành kinh tế, tài chính, ngân hàng, quản trị kinh doanh hoặc chuyên ngành liên quan.
- Kinh nghiệm: Tối thiểu 5 năm kinh nghiệm công tác trong lĩnh vực có liên quan ở vị trí ứng tuyển tại ngân hàng. Tối thiểu 2 năm ở vị trí quản lý cấp phòng có quy mô tương đương.
- Ưu tiên ứng viên đã có kinh nghiệm ở vị trí tương đương tại ngân hàng.
- Am hiểu về chuyên môn, nghiệp vụ trong lĩnh vực tài chính, ngân hàng.
- Hiểu biết chuyên sâu về công việc phát triển sản phẩm dịch vụ cá nhân tại các ngân hàng.
- Có kỹ năng tổ chức, quản lý, đào tạo, huấn luyện
- Có khả năng tư duy logic, đánh giá, nhạy bén, cẩn trọng, có trách nhiệm cao và tinh thần quyết đoán trong xử lý công việc được giao
- Có kỹ năng thuyết trình, làm việc nhóm, giao tiếp, thuyết phục, truyền đạt, hướng dẫn', NULL, N'Ngân Hàng, Kinh Doanh Bán Lẻ, Tài Chính Ngân Hàng, Giới Thiệu Sản Phẩm, Tài Chính Kinh Tế', CAST(N'2023-08-15' AS Date), N'Thương lượng', 1, 4, NULL, N'
Tầng 5, số 16 Phan Chu Trinh, Quận Hoàn Kiếm, Tp.Hà Nội', 2, N'Hà Nội', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (10, N'[Remote] Backend Game Developer (PHP or Java)
', NULL, N'CÁC PHÚC LỢI DÀNH CHO BẠN
Thưởng lễ tết
Làm việc 5 ngày / tuần, nghỉ thứ 7 + chủ nhật + 12 ngày phép năm
Du lịch, nghỉ mát, team building


MÔ TẢ CÔNG VIỆC
Với mong muốn mang đến những sản phẩm ổn định và trải nghiệm thân thiện cho người dùng, chúng tôi đang tìm kiếm những ứng viên cho vị trí Backend Game Developer (PHP or Java)
​', N'YÊU CẦU CÔNG VIỆC
* Yêu cầu chung:
- Ứng viên sinh sống ở Tp. HCM hoặc nơi gần Tp. HCM để có thể thuận tiện đi đến công ty trong trường hợp cần thiết
- Tính cách thân thiện, có khả năng làm việc nhóm
- Trong công việc không yêu cầu sử dụng ngoại ngữ, nhưng cần gửi CV tiếng Anh.
​
*Junior ～ Senior:
・Senior: Có kinh nghiệm làm việc ngành game
​ ・Junior～: Có đam mê game
- Có kiến thức, kinh nghiệm trong việc phát triển phần mềm trên nền PHP hoặc Java & HTML/CSS & JavaScript
- Có kinh nghiệm về các database & cache như MySQL, memcached, Redis..vv..
- Có kiến thức tốt về thuật toán, cấu trúc dữ liệu và lập trình hướng đối tượng.
- Có tư duy lập trình và tư duy hệ thống tốt.
​
* Ưu tiên:
- Có kinh nghiệm về phát triển và vận hành Game là một lợi thế lớn.
- Có kinh nghiệm lập trình giao tiếp giữa mobile với server qua các giao thức TCP/IP, Websocket, WebService
- Có hiểu biết về Cloud-based software(Azure, GCP).
- Có kiến thức tốt về Software design patterns
- Có thể sử dụng nhiều ngôn ngữ lập trình (bên cạnh PHP).
- Có hiểu biết và kinh nghiệm về VertX là một lợi thế lớn (Đối với Java).', NULL, N'Java, PHP, My SQL, CSS, HTML', CAST(N'2023-08-30' AS Date), N'Thương lượng', 3, 1, NULL, N'Phòng 3-139, Tầng 3, Khu văn phòng We Work, tòa nhà Lim tower 3, số 29A Nguyễn Đình Chiểu
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (11, N'[Remote] Mobile Game Developer
', NULL, N'Với mong muốn cùng tôn chỉ của Ateam là mang đến những sản phẩm ổn định và trải nghiệm thân thiện cho người dùng, chúng tôi tìm kiếm đồng nghiệp cho vị trí Mobile Game Developer

* Vai trò và trách nhiệm:
- Phát triển mới, đồng thời bảo trì và vận hành các tính năng Game trên đa nền tảng (Android, iOS ...).
- Đảm bảo chất lượng mã nguồn theo tiêu chuẩn của công ty.
- Không ngừng cập nhật kiến thức, công nghệ mới để đáp ứng nhu cầu công việc.

***Phúc lợi dành cho bạn:
- Thưởng lễ tết', N'* Yêu cầu chung:
- Ứng viên sinh sống ở Tp. HCM hoặc nơi gần Tp. HCM để có thể thuận tiện đi đến công ty trong trường hợp cần thiết
- Tính cách thân thiện, có khả năng làm việc nhóm
- Trong công việc không yêu cầu sử dụng ngoại ngữ, nhưng cần gửi CV tiếng Anh.
​
** Senior/Junior:
- Có kinh nghiệm về Game Engine (Unity, Cocos2d-x ...).
- Có kinh nghiệm trong lĩnh vực phát triển Game.
- Có tư duy lập trình và tư duy hệ thống tốt.
- Có kiến thức tốt về thuật toán, cấu trúc dữ liệu và lập trình hướng đối tượng.
​
* Ưu tiên:
- Có sản phẩm đã Release hoặc Demo.
- Có kiến thức toán học ứng dụng cho game 2D và 3D.
- Sử dụng tốt các Design Pattern.
- Có kinh nghiệm tham gia các dự án Client/Server, các dự án Game Multiplayer.
- Có kinh nghiệm làm việc với Native App: Android hoặc iOS.
- Có hiểu biết về lập trình đồ họa (Render Pipeline, Shader ...).', NULL, N'Phát Triển Game, 3D Unity, Tư Duy Hệ Thống, Lập Trình, Game 2D', CAST(N'2023-08-30' AS Date), N'Thương lượng', 3, 1, NULL, N'Phòng 3-139, Tầng 3, Khu văn phòng We Work, tòa nhà Lim tower 3, số 29A Nguyễn Đình Chiểu
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (12, N'Nhân Viên Kế Hoạch Sản Xuất (Điện Tử)
', NULL, N'1. Tham mưu cho Giám đốc về công tác xây dựng kế hoạch sản xuất
2. Xây dựng & Điều phối Kế hoạch sản xuất
3. Kiểm tra, đôn đốc các bộ phận thực hiện kế hoạch đã đưa ra
4. Thực hiện các Công việc khác theo yêu cầu của Giám đốc', N'1. Trình độ học vấn: Tốt nghiệp cao đẳng trở lên
2. Chuyên môn: Kế toán hoặc liên quan
3. Kinh nghiệm: Ít nhất 1 năm kinh nghiệm tại vị trí tương đương, ưu tiên ứng viên có kinh nghiệm trong lĩnh vực sản xuất điện - điển tử
4. Khả năng:
- Khả năng bao quát & tổ chức công việc
- Khả năng sắp xếp, phân tích công việc & giải quyết vấn đề tốt
- Truyền đạt, giao tiếp tốt. Nhanh nhẹn trong công việc
5. Phẩm chất cá nhân: Trung thực, cẩn thận, thẳng thắn & tâm huyết với công việc
6. Yêu cầu khác: Sức khoẻ: tốt Ngoại hình: ưa nhìn Độ tuổi: 24 – 35 tuổi', NULL, N'Sản Xuất, Điện/Điện tử', CAST(N'2023-08-15' AS Date), N'$500 - $700', 1, 3, NULL, N'Nhà máy Sunhouse, km21 Đại Lộ Thăng Long, xã Ngọc Liệp, Huyện Quốc Oai, Hà Nội
', 2, N'Hà Nội', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (15, N'Chuyên Viên Cấp Cao Quản Lý Khách Hàng Siêu Thị
', NULL, N'1. Quản lý kết quả bán hàng:
- Chịu trách nhiệm về kết quả kinh doanh đối với khách hàng siêu thị trên địa bàn thông qua vai trò là đầu mối chính tương tác trực tiếp (với văn phòng chính, phòng mua.của siêu thị, chuỗi siêu thị…).

2. Tổ chức triển khai và đánh giá kết quả:
- Chịu trách nhiệm chính trong việc triển khai và đánh giá kết quả đối với các kế hoạch phát triển kinh doanh từ công ty đến khách hàng.
- Phối hợp với các bộ phận kinh doanh siêu thị, bộ phận HTTM để đảm bảo tính nhất quán và tuân thủ trong các chương trình, hoạt động, sự kiện…của công ty tại các (chuỗi) siêu thị.
- Chịu trách nhiệm về thực thi và tuân thủ về các tài liệu ISO của đơn vị hiện hành.

3. Xây dựng quan hệ hợp tác và dịch vụ khách hàng tốt đẹp:
- Xây dựng, quản lý mối quan hệ hợp tác kinh doanh với khách hàng (ban giám đốc siêu thị, văn phòng chính, phòng mua hàng…).', N'1. Học vấn:
- Tốt nghiệp đại học trở lên
- Ưu tiên chuyên ngành về Kinh tế, Marketing, Quản trị kinh doanh, Ngoại thương, …

2. Kinh nghiệm:
- Có tối thiểu 3 năm kinh nghiệm trở lên trong lĩnh vực công việc tại vị trí tương đương ở trong các công ty có quy mô lớn.

3. Kiến thức chuyên môn & các kỹ năng:
- Kiến thức tốt về kinh doanh, marketing và quản lý khách hàng kênh siêu thị
- Có hiểu biết về ngành hành tiêu dùng nhanh.
- Kỹ năng phân tích, xử lý dữ liệu tốt.
- Kỹ năng lập kế hoạch kinh doanh cùng khách hàng và quản lý ngân sách tốt.
- Kỹ năng giao tiếp, đàm phán, thuyết trình tốt.
- Kỹ năng quyết định, giải quyết vấn đề ở mức độ tốt
- Hiểu biết tốt về các hoạt động liên quan đến sự vận hành kênh siêu thị (hoặc chuỗi CHTL).
- Có kỹ năng về xây dựng, phát triển quan hệ hợp tác với khách hàng, kinh nghiệm về quản lý và tương tác với khách hàng kênh siêu thị (hoặc chuỗi CHTL), đặc biệt là khối Mua/ bộ phận mua hàng.

4. Các yêu cầu khác:
- Thành thạo vi tính văn phòng.
- Trung thực, nhiệt tình, có tinh thần đồng đội.
- Chịu được áp lực công việc cao và làm ngoài giờ.', NULL, N'Giám Sát Siêu Thị, Modern Trade Planning, Account Management, Key Account Development, Key Account Relationship Building', CAST(N'2023-08-18' AS Date), N'Thương lượng', 1, 2, NULL, N'Số 10 Tân Trào, Phường Tân Phú, Quận 7
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (16, N'Trưởng Ban Nội Dung Truyền Thông
', NULL, N'Chịu trách nhiệm với Trưởng Bộ Phận Truyền thông Doanh nghiệp về việc truyền thông cho Công ty (không bao gồm truyền thông nhãn hàng) ra công chúng, tại Việt Nam và nước ngoài trong việc:

- Lên kế hoạch, triển khai, giám sát các nội dung truyền thông nhằm đảm bảo hiệu quả truyền thông, quảng bá hình ảnh thương hiệu của công ty theo định vị được xác định, duy trì sự nhận diện và uy tín thương hiệu đối với công chúng

- Tham gia xử lý các khủng hoảng truyền thông nhằm bảo vệ hình ảnh, uy tín thương hiệu công ty', N'HỌC VẤN & CHUYÊN NGÀNH:
- Tốt nghiệp Đại học
- Ưu tiên chuyên ngành Quản Trị Kinh Doanh/Marketing/Báo chí, truyền thông

KINH NGHIỆM:
- Có ít nhất 5 năm kinh nghiệm thực tế trong lĩnh vực truyền thông doanh nghiệp và ít nhất từ 2 năm kinh nghiệm ở vị trí quản lý ở các công ty có quy mô lớn, ưu tiên thuộc ngành hàng tiêu dùng nhanh/thực phẩm.
- Có kinh nghiệp xây dựng, triển khai các nội dung truyền thông của doanh nghiệp trên đa nền tảng: báo chí, truyền hình và các phương tiện truyền thông trực tuyến.
- Có kinh nghiệm làm việc với các đối tác cung cấp dịch vụ truyền thông, các cơ quan quản lý báo chí trong nước và nước ngoài…

KIẾN THỨC CHUYÊN MÔN & CÁC KỸ NĂNG:
- Kiến thức tốt & hiểu biết về ngành hàng tiêu dùng nhanh, các công việc liên quan (marketing, nghiên cứu thị trường và kinh doanh)
- Kiến thức tốt về quan hệ công chúng, tổ chức sự kiện, họp báo, quan hệ đối ngoại, tổ chức các mối quan hệ trong công ty.
- Kiến thức về cách thức tổ chức các sự kiện truyền thông liên quan đến doanh nghiệp (vd: họp báo, lễ kỷ
niệm, thành lập công ty, khánh thành, khởi công v.v)
- Kỹ năng đàm phán & thuyết phục.
- Kỹ năng giao tiếp tốt
- Kỹ năng viết lách, soạn thảo thông điệp truyền thông, thuyết trình.

CÁC YÊU CẦU KHÁC:
- Ngoại ngữ: ngoại ngữ tốt, tối thiểu là tiếng Anh với trình độ Trung – Cao cấp.
- Kỹ năng soạn thảo văn bản tiếng Việt và tiếng Anh: Tốt
- Vi tính văn phòng: thành thạo
- Năng động, linh hoạt, khéo léo và tinh tế trong việc xử lý các mối quan hệ.
- Chịu được áp lực cao trong công việc
- Khả năng làm việc nhóm và làm việc giữa các bộ phận tốt.', NULL, N'Truyền Thông, Quan Hệ Công Chúng, Nội Dung PR, Tạo Nội Dung, Content', CAST(N'2023-08-18' AS Date), N'Thương lượng', 1, 2, NULL, N'Số 10 Tân Trào, Phường Tân Phú, Quận 7
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (17, N'Senior Graphic Designer
', NULL, N'About us
Since 1976, VINAMILK has grown from a reconstructed facility in a war-ridden country to become world’s top 50 dairy company, with an unwavering commitment for health and wellness through nutrition. Our mission is to nurture the next generation. We will continue to set the standards for food quality, engage deeply with our customers, deliver personalized and sustainable solutions, and exercise greater corporate and social responsibility, all powered by R&D and technology disruption.

Get To Know The Team
VINAMILK’s Strategy & Innovation Office is expanding its staff and is searching for senior graphic designer(s) to join it. By providing design solutions that inform, inspire, and engage, we concentrate every day on enhancing the company''s brand and bottom line. You will develop a wide range of design projects as a member of the transformation team and collaborate with the larger marketing and e-', N'Basic Qualifications
• 3+ years of graphic design experience specifically focused on creating assets for use in digital marketing and Ecommerce.
• Must be a strong, self-starter adept at independent problem-solving.
• Must have a can-do and positive attitude.
• Demonstrated proficiency in Adobe Creative Suite (Photoshop, Illustrator, InDesign)
• Strong understanding of performance-driven creative
• Strong understanding of social media platforms and trends in design for FB/ IG/ TikTok/Youtube.
• Strong understanding of Ecommerce marketplace platform and customer behavior in design (Lazada, Shopee, Tiki)
• Detailed oriented + Strong ability to prioritize work & resources.
• Good at communication
• Experience using Canva is a plus.
• Video editing is a plus.', NULL, N'Thiết Kế Đồ Họa, Photoshop, Illustrator, Graphic Design, Design', CAST(N'2023-08-18' AS Date), N'Thương lượng', 1, 2, NULL, N'Ho Chi Minh, Ho Chi Minh City, Vietnam
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (18, N'Nhân Viên Vận Hành Máy - Làm Việc Tại Bắc Ninh
', NULL, N'Địa chỉ làm việc: Nhà máy sữa Tiên Sơn - Khu công nghiệp Tiên Sơn, Xã Hoàn Sơn, Huyện Tiên Du, Tỉnh Bắc Ninh

Tóm tắt công việc
- Thực hiện theo đúng các yêu cầu của công việc vận hành máy móc thiết bị
- Kiểm tra chất lượng, định mức nguyên liệu đầu vào và thành phẩm
- Theo dõi sửa chữa và bảo dưỡng máy móc thiết bị
- Giữ gìn vệ sinh sạch sẽ máy móc thiết bị và nhà xưởng, đảm bảo ATVS thực phẩm theo qui định
- Thực hiện các yêu cầu của ISO, FSSC, Halal… và các qui định về ATVSLĐ , PCCC... đề xuất các sáng kiến cải tiến & hợp lý hóa (nếu có)', N'HỌC VẤN & CHUYÊN NGÀNH:
- Tốt nghiệp cao đẳng/trung cấp chuyên ngành Công nghệ thực phẩm, Kỹ thuật Cơ, Điện, Điện tử, Tự động hóa hoặc các ngành kỹ thuật có liên quan.

KIẾN THỨC CHUYÊN MÔN & CÁC KỸ NĂNG:
-Kiến thức cơ bản về an toàn vệ sinh thực phẩm
-Kiến thức cơ bản về công nghệ sản xuất
-Kiến thức cơ bản về ISO và FSSC, Halal…

CÁC YÊU CẦU KHÁC:
- Cẩn thận, trung thực, kỷ luật', NULL, N'Vận Hành, Cơ Khí, Điện
', CAST(N'2023-08-18' AS Date), N'Thương lượng', 1, 2, NULL, N'Khu Công nghiệp Tiên Sơn, xã Hoàn Sơn, huyện Tiên Du, tỉnh Bắc Ninh, Việt Nam
', 4, N'Bắc Ninh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (19, N'Chuyên Viên Marketing (Assistant Brand Manager)
', NULL, N'Tóm tắt công việc:

• Hỗ trợ Trưởng ban Nhãn hiệu trong việc xây dựng chiến lược phát triển của ngành hàng, lên kế hoạch chi tiết và triển khai thực hiện các chương trình/kế hoạch Marketing được giao phù hợp với các định hướng và mục tiêu của nhãn hiệu

Vai trò và Nhiệm vụ chính:

• Hỗ trợ Trưởng bộ phận Marketing ngành hàng/Trưởng ban Nhãn hiệu trong việc xây dựng chiến lược phát triển của ngành hàng, lên kế hoạch chi tiết và triển khai thực hiện các chương trình/kế hoạch Marketing được giao phù hợp với các định hướng và mục tiêu của nhãn hiệu', N'HỌC VẤN:
• Tốt nghiệp đại học - Chuyên ngành Marketing, Kinh tế, Quản Trị Kinh Doanh

KINH NGHIỆM:
• Tối thiểu 02 năm kinh nghiệm làm việc trong lĩnh vực Marketing, tiếp thị nhãn hiệu, quảng cáo … trong đó ít nhất 1 năm kinh nghiệm làm ở vị trí tương đương ở các công ty đa quốc gia/công ty có qui mô lớn về ngành hàng sữa, thực phẩm/ngành hàng tiêu dùng nhanh.

KIẾN THỨC CHUYÊN MÔN & CÁC KỸ NĂNG:
• Có khả năng lên kế hoạch chi tiết cho các chương trình Marketing được giao
• Có khả năng triển khai hoàn thành các kế hoạch đã hoạch định đúng hạn
• Kỹ năng giao tiếp
• Kỹ năng đàm phán, thương lượng
• Kỹ năng thuyết trình/trình bày thuyết phục
• Kỹ năng giải quyết vấn đề
• Kỹ năng làm việc nhóm

CÁC YÊU CẦU KHÁC:
• Giao tiếp tốt tiếng Anh.
• Thành thạo vi tính văn phòng.
• Năng động, sáng tạo
• Tinh thần làm việc tập thể cao
• Nhiệt tình, chủ động trong công việc
• Có khả năng quản lý thời gian & ưu tiên công việc tốt, chịu được áp lực cao
• Thích nghi tốt với môi trường làm việc và văn hoá công ty', NULL, N'Quảng cáo/Khuyến mãi/Đối ngoại, Marketing, Hàng tiêu dùng', CAST(N'2023-08-20' AS Date), N'Thương lượng', 1, 2, NULL, N'Số 10 Tân Trào, Phường Tân Phú, Quận 7
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (23, N'Nhân Viên Thiết Kế, Chế Tạo, Sửa Chữa Cơ Điện, Tự Động Đi Ca
', NULL, N'- Kiểm tra, theo dõi thường xuyên họat động của máy móc thiết bị khi đi ca để kịp thời sửa chữa và chuẩn bị phương án sửa chữa.
- Phối hợp với bộ phận sản xuất để sửa chữa MMTB sản xuất và MMTB động lực trong ca trực.
- Thực hiện sửa chữa MMTB, phương tiện vận chuyển theo qui trình và thủ tục được mô tả bởi các hướng dẫn công việc liên quan. Ghi chép thông tin sửa chữa vào các hồ sơ liên quan.
- Lập nội dung cho các phiếu bảo trì và lập danh sách đăt hàng VTKT khi có yêu cầu', N'I. HỌC VẤN & CHUYÊN NGÀNH:
- Tốt nghiệp đại học/ cao đẳng/ trung cấp chuyên ngành Kỹ thuật cơ điện/ tự động hóa
II. KINH NGHIỆM:
- Có ít nhất 1 năm kinh nghiệm ở vị trí tương đương
III. KIẾN THỨC CHUYÊN MÔN & CÁC KỸ NĂNG:
- Có kiến thức về máy móc thiết bị ngành chế biến thực phẩm
- Kiến thức cơ bản về an toàn vệ sinh thực phẩm
- Kỹ năng tổ chức và thực hiện bảo trì thiết bị.
- Kỹ năng giải quyết vấn đề
- Kỹ năng giao tiếp
IV. CÁC YÊU CẦU KHÁC:
- Ngoại ngữ: Có khả năng đọc hiểu các tài liệu kỹ thuật bằng tiếng Anh chuyên ngành cơ điện
- Cẩn thận, trung thực, nhiệt tình
- Có khả năng làm việc với cường độ cao', NULL, N'Cơ Điện, Sửa Chữa Bảo Trì Thiết Bị, Cơ Khí, Điện Tử, Điện
', CAST(N'2023-08-20' AS Date), N'Thương lượng', 1, 2, NULL, N'Bắc Ninh
', 4, N'Bắc Ninh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Jobs] ([JobID], [Name], [NoOfPost], [Description], [Qualification], [Experience], [Specialization], [LastDatetoApply], [Salary], [Jobtype], [CompanyID], [Email], [Address], [Location], [Country], [Createdate], [UserID]) VALUES (24, N'Senior/ Manager Digital Marketing (Strategy)
', NULL, N'• Develop, optimize, and maintain digital marketing strategy: user journey, digital touchpoints, digital media mix, content strategy, business effectiveness & efficiency measurement.
• Work with Digital Marketing Lead for Capability & Resource planning. The resources consist of Inhouse team & Outsource Agencies & Freelancers.
• Work with cross-function teams: Digital Acquisition, Digital Retention teams to bring the strategy to the reality and deploy the right execution with mindset of prioritization & result-orientation.
• Work with Brand team to design Digital Marketing plan sync with Branding strategy. Developing digital programs that will drive brand''s awareness and sales through messaging and media that are relevant to consumers, across all digital channels including web, SEO/SEM, database marketing, email, social media, and display advertising campaigns
• Work with cross-functions (Data team) to regularly monitor user analytics and use these insights to drive strategies
• Build and oversee the monthly digital marketing
• Regularly educate the organization on digital trends that are pertinent to our business (i.e., algorithm changes, mobile update implications, creative best practices, competitor campaigns, etc...)', N'• Bachelor’s Degree in Business, Marketing, or related field
• 7-10+ years of digital marketing experience preferably in CPG industry
• Good knowledge of various aspects of digital marketing including SEO, social media marketing, email marketing, marketing automation, and digital marketing analytics tools such as Google Analytics and Tableau.
• Firm understanding of paid social and all performance marketing metrics (CPM, CPI, CPA, CPC & LTV)
• Technical background a plus (conversion tagging, FTP, HTML, SQL)
• Strong knowledge in web analytics, ad tracking, and other biddable media
• Strong expertise in all forms of bidding media (Facebook, Instagram, TikTok, YouTube, Pinterest, LinkedIn, Google, and other social platforms)
• A proven track record of successful marketing campaigns with DTC marketing model
• Excellent written & verbal communication skills
• Creative thinker and problem solver
• Thriving in matrix environments and are adept at building relationships with different stakeholders
• Proven record of leadership in a work setting and/or through extracurricular activities

Preferred Qualifications
• Master’s Degree
• Direct experience building a digital marketing capability from scratch', NULL, N'SEO, Digital Marketing, Marketing Materials Strategy, Content', CAST(N'2023-08-20' AS Date), N'Thương lượng', 1, 2, NULL, N'Số 10 Tân Trào, Phường Tân Phú, Quận 7
', 1, N'Hồ Chí Minh', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 
GO
INSERT [dbo].[Location] ([LocationID], [Name], [Country]) VALUES (1, N'Hồ Chí Minh', N'Việt Nam')
GO
INSERT [dbo].[Location] ([LocationID], [Name], [Country]) VALUES (2, N'Hà Nội', N'Việt Nam')
GO
INSERT [dbo].[Location] ([LocationID], [Name], [Country]) VALUES (3, N'Cần Thơ', N'Việt Nam')
GO
INSERT [dbo].[Location] ([LocationID], [Name], [Country]) VALUES (4, N'Bắc Ninh', N'Việt Nam')
GO
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Navigation] ON 
GO
INSERT [dbo].[Navigation] ([NavID], [Name], [Link]) VALUES (1, N'TRANG CHỦ', N'Home')
GO
INSERT [dbo].[Navigation] ([NavID], [Name], [Link]) VALUES (2, N'VIỆC LÀM', N'Job')
GO
INSERT [dbo].[Navigation] ([NavID], [Name], [Link]) VALUES (4, N'GIÁ CẢ', N'Price')
GO
INSERT [dbo].[Navigation] ([NavID], [Name], [Link]) VALUES (5, N'BLOG', N'Blog')
GO
INSERT [dbo].[Navigation] ([NavID], [Name], [Link]) VALUES (6, N'LIÊN HỆ', N'Contact')
GO
SET IDENTITY_INSERT [dbo].[Navigation] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeofJob] ON 
GO
INSERT [dbo].[TypeofJob] ([JobtypeID], [TypeName]) VALUES (1, N'Full-time')
GO
INSERT [dbo].[TypeofJob] ([JobtypeID], [TypeName]) VALUES (2, N'Part-time')
GO
INSERT [dbo].[TypeofJob] ([JobtypeID], [TypeName]) VALUES (3, N'Remote')
GO
SET IDENTITY_INSERT [dbo].[TypeofJob] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password]) VALUES (1, N'Nguyễn Thành Trung', N'nguyentrung@gmail.com', N'0385242430', N'48 btx', N'trungtrung', N'6c715e1c71fb3a233f979cd34c2c98d9')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[ADMIN] ADD  DEFAULT ((1)) FOR [Role]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT ((0)) FOR [likes]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT ((0)) FOR [comments]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Blog_category_mapping] FOREIGN KEY([ID])
REFERENCES [dbo].[Blog_category_mapping] ([post_ID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Blog_category_mapping]
GO
ALTER TABLE [dbo].[Blog_comments]  WITH CHECK ADD  CONSTRAINT [FK_Blog_comments_Blog] FOREIGN KEY([post_ID])
REFERENCES [dbo].[Blog] ([ID])
GO
ALTER TABLE [dbo].[Blog_comments] CHECK CONSTRAINT [FK_Blog_comments_Blog]
GO
USE [master]
GO
ALTER DATABASE [JobListingWeb] SET  READ_WRITE 
GO
