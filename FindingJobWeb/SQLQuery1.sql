create table Contact(
	ContactID int primary key identity(1,1) not null,
	Name nvarchar(50),
	Email varchar(50),
	Subject nvarchar(100),
	Message nvarchar(Max)
)
create table Navigation(
	NavID int primary key identity(1,1) not null,
	Name nvarchar(50),
	Link nvarchar(50)
)
create table Feature_area(
	FaID int primary key identity(1,1) not null,
	Name nvarchar(50),
	Link nvarchar(50),
	Description nvarchar(100)
)
create table Jobs(
	JobID int primary key identity(1,1) not null,
	Name nvarchar(50),
	NoOfPost int,
	Description nvarchar(Max),
	Qualification nvarchar(50),
	Experience nvarchar(50),
	Specialization nvarchar(Max),
	LastDatetoApply date,
	Salary nvarchar(50),
	Jobtype nvarchar(50),
	CompanyID int,
	Email varchar(50),
	Address nvarchar(Max),
	Country nvarchar(50),
	Createdate datetime
)
create table Company(
	CompanyID int primary key identity(1,1) not null,
	Name nvarchar(50),
	Description nvarchar(Max),
	Website varchar(100),
	Image nvarchar(500),
	Location nvarchar(50),
	Size nvarchar(50),
	IndustryID int
)
create table TypeofJob(
	JobtypeID int primary key identity(1,1) not null,
	TypeName nvarchar(50)
)
create table Industry(
	IndustryID int primary key identity(1,1) not null,
	Name nvarchar(50)
)
alter view NewJob
as
select top 6 A.*,B.Name as CompanyName,B.Image,B.Website, C.TypeName
from Jobs A, Company B, TypeofJob C
where A.CompanyID = B.CompanyID and A.Jobtype = C.JobtypeID 
order by A.Createdate DESC

create view JobsbyLocation 
as
select A.*, COUNT(B.JobID) as NoOfJobs
from Location A, Jobs B
where A.LocationID = B.Location
GROUP BY A.LocationID, A.Name, A.Country

create view JobsbyCategory
as
select C.*, COUNT(A.JobID) as NoOfJobs
from Jobs A, Company B, Industry C
where A.CompanyID = B.CompanyID and B.IndustryID = C.IndustryID 
GROUP BY C.IndustryID, C.Name

create view FullJob
as
select A.*,B.Name as CompanyName,B.Image,B.Website, C.TypeName, D.IndustryID, D.Name as IndustryName
from Jobs A, Company B, TypeofJob C, Industry D
where A.CompanyID = B.CompanyID and A.Jobtype = C.JobtypeID and B.IndustryID = D.IndustryID 

create table Blog
(
	ID int primary key identity(1,1) not null,
	Title nvarchar(200) not null,
	Content nvarchar(Max),
	UserID int,
	created_at datetime,
	updated_at datetime,
	likes int not null default 0,
	comments int not null default 0
)

create TABLE Blog_likes 
(
    ID INT primary key identity(1,1) not null,
    post_ID INT NOT NULL,
    user_ID INT NOT NULL,
    created_at datetime
)

create TABLE Blog_comments (
    ID INT primary key identity(1,1) not null,
    post_ID INT NOT NULL,
    user_ID INT NOT NULL,
	Content nvarchar(Max),
    created_at datetime
)

CREATE TABLE Blog_category (
    ID INT primary key identity(1,1) not null,
    name nvarchar(100),
	Content nvarchar(max)
)

CREATE TABLE Blog_category_mapping (
    post_ID int primary key NOT NULL,
	category_ID int not null
)

create view PostsbyCategory
as
select B.*, COUNT(A.ID) as NoOfPosts
from Blog A, Blog_category B, Blog_category_mapping C
where A.ID = c.post_ID and B.ID = C.category_ID 
GROUP BY C.category_ID, B.ID, B.name, B.Content