<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AOBriefcase.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" OnAuthenticate ="ValidateUser"></asp:Login>
        <a href="WebForm1.aspx">Back to search page</a>
        <p>To do: (mid) Patch user authentication persistence after abandon()</p>
    <div>
        <%--Welcome
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />--%>
    </div>
    </form>
</body>
</html>
