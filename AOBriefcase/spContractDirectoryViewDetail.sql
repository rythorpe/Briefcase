use [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spContractDirectoryViewDetail
	@Alias1 varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT AOID + '.' + Amend_Count + ' - ' + Contract_Name as AOCode, Guid
	FROM Contract_Demographics
	WHERE Contract_Alias1 LIKE @Alias1 + '%'
END
GO