<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AOBriefcase.Admin" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Portal</title>

</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>
