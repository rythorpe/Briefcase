USE [master]
GO
/****** Object:  Database [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]    Script Date: 4/3/2017 5:52:43 PM ******/
CREATE DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database1', FILENAME = N'E:\AO\Briefcase\AOBriefcase\AOBriefcase\App_Data\Database1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Database1_log', FILENAME = N'E:\AO\Briefcase\AOBriefcase\AOBriefcase\App_Data\Database1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET  MULTI_USER 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT AOID + '.' + Amend_Count + ' - ' + Contract_Name as AOCode, GUID
	FROM Contract_Demographics
	WHERE Contract_Alias1 LIKE @Alias1 + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail1]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail1]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT AOID /*+ '.' + Amend_Count + ' - ' + Contract_Name*/ as AOCode, GUID
	FROM Contract_Demographics
	WHERE Contract_Alias1 LIKE @Alias1 + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail2]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail2]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT AOID as AOCode
	FROM Contract_Demographics
	WHERE Contract_Alias1 LIKE @Alias1 + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail3]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail3]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		AOID + '.' + Amend_Count + ' - ' + Contract_Name as AOCode--, GUID
	FROM 
		Contract_Demographics
	WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%'
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail4]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail4]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		AOID + '.' + Amend_Count + ' - ' + [Contract_Name] as AOCode--, GUID
	FROM 
		Contract_Demographics
	WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%'
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail5]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail5]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		AOID + '.' + CONVERT(varchar(3),Amend_Count) + ' - ' + [Contract_Name] as AOCode, GUID
	FROM 
		Contract_Demographics
	WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%' OR
		[Contract_Name] LIKE @Alias1 + '%' OR
		[Contract_Parent] LIKE @Alias1 + '%'
	)
	--HAVING [Amend_Count]=MAX([Amend_Count])
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail6]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail6]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		AOID + '.' + CONVERT(varchar(3),Amend_Count) + ' - ' + [Contract_Name] as AOCode, GUID
	FROM 
		Contract_Demographics
	WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%' OR
		[Contract_Name] LIKE @Alias1 + '%' OR
		[Contract_Parent] LIKE @Alias1 + '%'		
	)	
	GROUP BY AOID, Amend_Count, [Contract_Name], GUID
	HAVING [Amend_Count]=MAX([Amend_Count])
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetail7]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContractDirectoryViewDetail7]
	@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		'[' + CD.AOID + '.' + CONVERT(varchar(3),Amend_Count) + ']' + ' - ' + [Contract_Name] as AOCode, GUID
	FROM 
		Contract_Demographics AS CD
	INNER JOIN
	(
		SELECT AOID, MAX(Amend_Count) AS RecentOnly
		FROM Contract_Demographics
		GROUP BY AOID
	) AS ContractSort
	ON CD.AOID = ContractSort.AOID
	AND CD.Amend_Count = ContractSort.RecentOnly
	WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%' OR
		[Contract_Name] LIKE @Alias1 + '%' OR
		[Contract_Parent] LIKE @Alias1 + '%'		
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewDetailAll]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContractDirectoryViewDetailAll]
	--@Alias1 varchar(40)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		'[' + CD.AOID + '.' + CONVERT(varchar(3),Amend_Count) + ']' + ' - ' + [Contract_Name] as AOCode, GUID
	FROM 
		Contract_Demographics AS CD
	INNER JOIN
	(
		SELECT AOID, MAX(Amend_Count) AS RecentOnly
		FROM Contract_Demographics
		GROUP BY AOID
	) AS ContractSort
	ON CD.AOID = ContractSort.AOID
	AND CD.Amend_Count = ContractSort.RecentOnly
	ORDER BY CD.AOID
	/*WHERE 
	(
		Contract_Alias1 LIKE @Alias1 + '%' OR 
		Contract_Alias2 LIKE @Alias1 + '%' OR
		Contract_Alias3 LIKE @Alias1 + '%' OR
		Contract_Alias4 LIKE @Alias1 + '%' OR
		[Contract_Name] LIKE @Alias1 + '%' OR
		[Contract_Parent] LIKE @Alias1 + '%'		
	)*/
END
GO
/****** Object:  StoredProcedure [dbo].[spContractDirectoryViewGuid0]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContractDirectoryViewGuid0]
	@Guid uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM
		Contract_Demographics
	WHERE
		GUID=@Guid
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAuthFilePath]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateAuthFilePath]
	@filepath varchar(150),
	@SelectedIndex int
AS
BEGIN
	UPDATE [Contract_Demographics]
	SET [Contract_PDF] = @filepath
WHERE
	[ContractID]=@SelectedIndex
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBillFilePath]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBillFilePath]
	@filepath varchar(150),
	@SelectedIndex int
AS
BEGIN
	UPDATE [Contract_Demographics]
	SET [Billing_PDF] = @filepath
WHERE
	[ContractID]=@SelectedIndex
END
GO
/****** Object:  StoredProcedure [dbo].[testPDFUpload]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[testPDFUpload]
(
	@FileData VARBINARY(MAX)
)
AS

INSERT INTO 
	UploadTable_test ([file])
VALUES
	(@FileData);
GO
/****** Object:  StoredProcedure [dbo].[testPDFview]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[testPDFview]
AS

SELECT [file]
FROM [UploadTable_test]
WHERE Id=2;
GO
/****** Object:  StoredProcedure [dbo].[Validate_Admin]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Validate_Admin]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId INT, @LastLoginDate DATETIME

	SELECT @UserId = UserID, @LastLoginDate = LastLoginDate
	FROM AccessControl
	WHERE Username = @Username AND [Password] = @Password

	IF @UserId IS NOT NULL
	BEGIN
		IF EXISTS(SELECT UserID,LastLoginDate FROM AccessControl WHERE UserID = @UserId)
		BEGIN
		-- Last login column update does not seem to be functional, investigate later
			UPDATE AccessControl
			SET LastLoginDate = GETDATE()
			WHERE UserID = @UserId
			SELECT @UserId [UserID] -- User Valid
		END
		ELSE
		BEGIN
			SELECT -2 -- User not activated (exception catch return)
		END
	END
	ELSE
	BEGIN
		SELECT -1 -- User invalid
	END
END
GO
/****** Object:  Table [dbo].[AccessControl]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessControl](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attachments](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContentType] [nvarchar](200) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract_Demographics]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract_Demographics](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[AOID] [varchar](5) NULL,
	[Amend_Count] [int] NULL,
	[Amend_Comment] [varchar](max) NULL,
	[Contract_Name] [varchar](40) NULL,
	[Contract_Parent] [varchar](40) NULL,
	[Contract_Type] [varchar](40) NULL,
	[Contract_FC] [varchar](20) NULL,
	[Contract_Phone] [varchar](15) NULL,
	[Contract_Homepage] [varchar](255) NULL,
	[Contract_Status] [varchar](40) NULL,
	[Contract_EffectiveDate] [date] NULL,
	[Contract_TerminateDate] [date] NULL,
	[Contract_UpdateDate] [date] NULL,
	[Contract_Alias1] [varchar](40) NULL,
	[Contract_Alias2] [varchar](40) NULL,
	[Contract_Alias3] [varchar](40) NULL,
	[Contract_Alias4] [varchar](40) NULL,
	[SVC_OfficeVisits] [bit] NULL,
	[SVC_SX] [bit] NULL,
	[SVC_Radiology] [bit] NULL,
	[SVC_PT] [bit] NULL,
	[SVC_OT] [bit] NULL,
	[SVC_PainMgmt] [bit] NULL,
	[SVC_DME] [bit] NULL,
	[SVC_Podiatry] [bit] NULL,
	[SVC_Injections] [bit] NULL,
	[SVC_Injectibles] [varchar](40) NULL,
	[Auth_ProviderPortal] [varchar](255) NULL,
	[Auth_OfficeVisits] [varchar](255) NULL,
	[Auth_SX] [varchar](255) NULL,
	[Auth_Radiology] [varchar](255) NULL,
	[Auth_PT] [varchar](255) NULL,
	[Auth_OT] [varchar](255) NULL,
	[Auth_PainMgmt] [varchar](255) NULL,
	[Auth_DME] [varchar](255) NULL,
	[Auth_Podiatry] [varchar](255) NULL,
	[Auth_Injections] [varchar](255) NULL,
	[Auth_OfficeVisits_Note] [varchar](255) NULL,
	[Auth_SX_Note] [varchar](255) NULL,
	[Auth_Radiology_Note] [varchar](255) NULL,
	[Auth_PT_Note] [varchar](255) NULL,
	[Auth_OT_Note] [varchar](255) NULL,
	[Auth_PainMgmt_Note] [varchar](255) NULL,
	[Auth_DME_Note] [varchar](255) NULL,
	[Auth_Podiatry_Note] [varchar](255) NULL,
	[Auth_Injections_Note] [varchar](255) NULL,
	[Contract_PDF] [varchar](150) NULL,
	[Billing_PDF] [varchar](150) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractStatus_lookup]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContractStatus_lookup](
	[ContractStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ContractStatus_Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractStatus_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinancialClass_lookup]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinancialClass_lookup](
	[FCID] [int] IDENTITY(1,1) NOT NULL,
	[FinancialClass_Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FinancialClass_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Injectibles_lookup]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Injectibles_lookup](
	[InjectiblesID] [int] IDENTITY(1,1) NOT NULL,
	[Injectibles_Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Injectibles_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderContract_junction]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderContract_junction](
	[ProviderID] [int] NOT NULL,
	[ContractID] [int] NOT NULL,
	[Credentialing_Status] [varchar](50) NULL,
	[Credentialing_EffectiveDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC,
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderList]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderList](
	[ProviderListID] [int] IDENTITY(1,1) NOT NULL,
	[Provider_FullName] [varchar](100) NULL,
	[Provider_PLUS] [nchar](8) NULL,
	[Provider_Facilities] [varchar](50) NULL,
	[Provider_Specialty] [varchar](50) NULL,
	[Provider_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UploadTable_test]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UploadTable_test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](20) NULL,
	[file] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TestOmniView]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestOmniView]
	AS SELECT * FROM [Contract_Demographics]
GO
/****** Object:  View [dbo].[testView]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[testView]
	AS 
	SELECT ProviderListID, ContractID
	FROM [ProviderList]
	CROSS JOIN [Contract_Demographics]
GO
/****** Object:  View [dbo].[testView1]    Script Date: 4/3/2017 5:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[testView1]
	AS 
	SELECT DISTINCT f.ProviderListID, i.ContractID
	FROM [Contract_Demographics] i
	CROSS JOIN [ProviderList] f
	LEFT JOIN ProviderContract_junction e
	ON i.ContractID = e.ContractID
GO
ALTER TABLE [dbo].[Contract_Demographics] ADD  DEFAULT ((0)) FOR [Amend_Count]
GO
ALTER TABLE [dbo].[Contract_Demographics] ADD  DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[Contract_Demographics]  WITH CHECK ADD  CONSTRAINT [FK_ContractStatus_lookup] FOREIGN KEY([Contract_Status])
REFERENCES [dbo].[ContractStatus_lookup] ([ContractStatus_Name])
GO
ALTER TABLE [dbo].[Contract_Demographics] CHECK CONSTRAINT [FK_ContractStatus_lookup]
GO
ALTER TABLE [dbo].[Contract_Demographics]  WITH CHECK ADD  CONSTRAINT [FK_FinancialClass_lookup] FOREIGN KEY([Contract_FC])
REFERENCES [dbo].[FinancialClass_lookup] ([FinancialClass_Name])
GO
ALTER TABLE [dbo].[Contract_Demographics] CHECK CONSTRAINT [FK_FinancialClass_lookup]
GO
ALTER TABLE [dbo].[Contract_Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Injectibles_lookup] FOREIGN KEY([SVC_Injectibles])
REFERENCES [dbo].[Injectibles_lookup] ([Injectibles_Name])
GO
ALTER TABLE [dbo].[Contract_Demographics] CHECK CONSTRAINT [FK_Injectibles_lookup]
GO
ALTER TABLE [dbo].[ProviderContract_junction]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract_Demographics] ([ContractID])
GO
ALTER TABLE [dbo].[ProviderContract_junction]  WITH CHECK ADD FOREIGN KEY([ProviderID])
REFERENCES [dbo].[ProviderList] ([ProviderListID])
GO
USE [master]
GO
ALTER DATABASE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF] SET  READ_WRITE 
GO
