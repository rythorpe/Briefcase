--USE [E:\AO\BRIEFCASE\AOBRIEFCASE\AOBRIEFCASE\APP_DATA\DATABASE1.MDF]
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO

CREATE PROCEDURE spContractDirectoryViewDetail5
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
END