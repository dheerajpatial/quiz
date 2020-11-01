
/****** Object:  Database [dbShopping]    Script Date: 11/1/2020 8:31:25 PM ******/
CREATE DATABASE [dbShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbShopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbShopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbShopping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbShopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbShopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbShopping] SET RECOVERY FULL 
GO
ALTER DATABASE [dbShopping] SET  MULTI_USER 
GO
ALTER DATABASE [dbShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbShopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbShopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbShopping', N'ON'
GO
ALTER DATABASE [dbShopping] SET QUERY_STORE = OFF
GO
USE [dbShopping]
GO
/****** Object:  User [devuser]    Script Date: 11/1/2020 8:31:25 PM ******/
CREATE USER [devuser] FOR LOGIN [dev] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[County] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerContacts]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerContacts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[FirstName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[Email] [varchar](150) NULL,
	[Address] [nvarchar](350) NULL,
	[City] [varchar](150) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[IsPrimary] [bit] NULL,
	[IsDeleted] [bigint] NULL,
 CONSTRAINT [PK_tblCustomerContacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateId] [int] NOT NULL,
	[CountryId] [int] NULL,
	[State] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryId], [County]) VALUES (1, N'India')
GO
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 
GO
INSERT [dbo].[tblCustomer] ([ID], [PhoneNumber], [IsDeleted], [IsActive], [CreatedOn]) VALUES (1, N'797989798', 0, 1, CAST(N'2020-10-17T11:31:03.693' AS DateTime))
GO
INSERT [dbo].[tblCustomer] ([ID], [PhoneNumber], [IsDeleted], [IsActive], [CreatedOn]) VALUES (2, N'+917837292540', 0, 1, CAST(N'2020-10-17T17:08:44.007' AS DateTime))
GO
INSERT [dbo].[tblCustomer] ([ID], [PhoneNumber], [IsDeleted], [IsActive], [CreatedOn]) VALUES (10002, N' 917837292540', 0, 1, CAST(N'2020-10-25T16:24:23.407' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (1, 1, N'ANDAMAN AND NICOBAR ISLANDS')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (2, 1, N'ANDHRA PRADESH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (3, 1, N'ARUNACHAL PRADESH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (4, 1, N'ASSAM')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (5, 1, N'BIHAR')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (6, 1, N'CHATTISGARH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (7, 1, N'CHANDIGARH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (8, 1, N'DAMAN AND DIU')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (9, 1, N'DELHI')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (10, 1, N'DADRA AND NAGAR HAVELI')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (11, 1, N'GOA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (12, 1, N'GUJARAT')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (13, 1, N'HIMACHAL PRADESH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (14, 1, N'HARYANA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (15, 1, N'JAMMU AND KASHMIR')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (16, 1, N'JHARKHAND')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (17, 1, N'KERALA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (18, 1, N'KARNATAKA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (19, 1, N'LAKSHADWEEP')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (20, 1, N'MEGHALAYA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (21, 1, N'MAHARASHTRA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (22, 1, N'MANIPUR')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (23, 1, N'MADHYA PRADESH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (24, 1, N'MIZORAM')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (25, 1, N'NAGALAND')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (26, 1, N'ORISSA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (27, 1, N'PUNJAB')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (28, 1, N'PONDICHERRY')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (29, 1, N'RAJASTHAN')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (30, 1, N'SIKKIM')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (31, 1, N'TAMIL NADU')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (32, 1, N'TRIPURA')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (33, 1, N'UTTARAKHAND')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (34, 1, N'UTTAR PRADESH')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (35, 1, N'WEST BENGAL')
GO
INSERT [dbo].[tblState] ([StateId], [CountryId], [State]) VALUES (36, 1, N'TELANGANA')
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF_tblCustomer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF_tblCustomer_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCustomerContacts] ADD  CONSTRAINT [DF_tblCustomerContacts_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[tblCustomerContacts] ADD  CONSTRAINT [DF_tblCustomerContacts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
/****** Object:  StoredProcedure [dbo].[spShop_AddUpdateAddress]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dheeraj>
-- Create date: <Create Date,,25 Oct 2020>
-- Description:	<Description,,To get states list>
--spShop_checkInsertCustomer 797989798
-- =============================================
CREATE PROCEDURE [dbo].[spShop_AddUpdateAddress]
	-- Add the parameters for the stored procedure here
	 @FirstName varchar(50),
	 @LastName varchar(50),
	 @Email varchar(50),
	 @Phonenumber varchar(50),
	 @Address varchar(50),
	 @City varchar(50),
	 @StateId varchar(50),
	 @CustomerId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	insert into tblCustomerContacts(CustomerId,FirstName,LastName,Email,Address,City,StateId,CountryId,PhoneNumber,IsPrimary)
	values(@CustomerId,@FirstName,@LastName,@Email,@Address,@City,@StateId,1,@PhoneNumber,1)
	select @@IDENTITY as Id

	END TRY
	BEGIN CATCH
	select 0 as Id
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spShop_checkInsertCustomer]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dheeraj>
-- Create date: <Create Date,,17 Oct 2020>
-- Description:	<Description,,To check user exist with phone number, if not then insert>
--spShop_checkInsertCustomer 797989798
-- =============================================
CREATE PROCEDURE [dbo].[spShop_checkInsertCustomer]
	-- Add the parameters for the stored procedure here
	@phoneNumber nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	if exists(select * from tblCustomer where PhoneNumber=@phoneNumber and IsActive=1)
	BEGIN
	declare @id as int=(select Id from tblCustomer where PhoneNumber=@phoneNumber and IsActive=1)
	if exists(select * from tblCustomerContacts where CustomerId=@id)
	BEGIN
	select 1 as ResultType,@id as Id,CONCAT(FirstName,' ',LastName) as Name from tblCustomerContacts where CustomerId=@id
	END
	ELSE
	BEGIN
	select -1 as ResultType,-1 as Id,'' as Name
	END
	END
	ELSE
	BEGIN
	INSERT INTO tblCustomer(PhoneNumber,IsActive,CreatedOn)
	values(@phoneNumber,1,GETUTCDATE())
	declare @newid as int=@@IDENTITY;
	
	select -1 as ResultType,@newid as Id,'' as Name
	END

	END TRY
	BEGIN CATCH
	select 0 as Id,'' as Name
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spShop_getStates]    Script Date: 11/1/2020 8:31:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dheeraj>
-- Create date: <Create Date,,25 Oct 2020>
-- Description:	<Description,,To get states list>
--spShop_checkInsertCustomer 797989798
-- =============================================
CREATE PROCEDURE [dbo].[spShop_getStates]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	select StateId as Id,State as Name from tblState where CountryId=1
	

	END TRY
	BEGIN CATCH
	select 0 as Id,'' as Name
	END CATCH

END
GO
USE [master]
GO
ALTER DATABASE [dbShopping] SET  READ_WRITE 
GO
