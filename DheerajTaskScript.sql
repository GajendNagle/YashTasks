USE [master]
GO
/****** Object:  Database [DbTask]    Script Date: 27-09-24 9.33.29 PM ******/
CREATE DATABASE [DbTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbUserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbUserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbUserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbUserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbTask] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbTask] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbTask] SET  MULTI_USER 
GO
ALTER DATABASE [DbTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbTask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbTask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbTask', N'ON'
GO
ALTER DATABASE [DbTask] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbTask] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbTask]
GO
/****** Object:  Table [dbo].[tbl_regUsers]    Script Date: 27-09-24 9.33.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_regUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_regUsers] ON 

INSERT [dbo].[tbl_regUsers] ([UserID], [Name], [Email], [Mobile], [Address], [Password], [CreatedAt]) VALUES (1, N'Dheeraj Malvi', N'drzmalviya@gmail.com', N'7509835731', N'Bhopal, Madhya Pradesh', N'drz@777', CAST(N'2024-09-27T17:02:55.257' AS DateTime))
INSERT [dbo].[tbl_regUsers] ([UserID], [Name], [Email], [Mobile], [Address], [Password], [CreatedAt]) VALUES (2, N'Adam', N'adam@hotmail.com', N'8989786456', N'Behind Shiv Mandir', N'Adam@234', CAST(N'2024-09-27T17:04:41.743' AS DateTime))
INSERT [dbo].[tbl_regUsers] ([UserID], [Name], [Email], [Mobile], [Address], [Password], [CreatedAt]) VALUES (3, N'John M', N'john@gmail.com', N'7467389876', N'Near Chetak Bridge, Bhopal', N'John@555', CAST(N'2024-09-27T17:15:19.333' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_regUsers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_regU__A9D105347518E17D]    Script Date: 27-09-24 9.33.30 PM ******/
ALTER TABLE [dbo].[tbl_regUsers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_regUsers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertUser]    Script Date: 27-09-24 9.33.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[USP_InsertUser]
	@Name NVARCHAR(100),
    @Email NVARCHAR(255),
    @Mobile NVARCHAR(15),
    @Address NVARCHAR(500),
    @Password NVARCHAR(255)
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	  BEGIN TRY
		  BEGIN TRANSACTION 
      
			INSERT INTO tbl_regUsers (Name, Email, Mobile, Address, Password)
			VALUES (@Name, @Email, @Mobile, @Address, @Password);
			
			SELECT	@status =1 ,@msg='User successfully registered'	 
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoginUser]    Script Date: 27-09-24 9.33.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_LoginUser]
		@Email		NVARCHAR(255),
		@Password	NVARCHAR(255)
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  
	  BEGIN TRY
		  BEGIN TRANSACTION 
      
			IF EXISTS( select 1 from tbl_regUsers  WHERE Email = @Email)
				BEGIN
					IF EXISTS( select 1 from tbl_regUsers  WHERE Email = @Email and Password=@Password)
					begin
						select UserID,Name,Email, Password from tbl_regUsers  WHERE Email = @Email and Password=@Password
						SELECT @status=1, @msg='Password Mached <br//>'
					end
					else 
					BEGIN
						SELECT @status=0, @msg='Wrong Password<br//>'
					END
				END
				ELSE
				BEGIN
					SELECT @status=0, @msg='Email Not Found<br//>'
					
				END
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
USE [master]
GO
ALTER DATABASE [DbTask] SET  READ_WRITE 
GO
