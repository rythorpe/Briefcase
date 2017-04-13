﻿<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AOBriefcase.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="WebForm1.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Image id="AOLogo" runat="server" ImageURL="~/Images/AOlogo.png" />
        
        <div id="NavigationBar">
            <h2 id="CRD"><span style="color:#79b9ef">C</span>ontract <span style="color:#79b9ef">R</span>eference <span style="color:#79b9ef">D</span>atabase</h2>      
            <asp:Menu ID="Navi" runat="server" EnableViewState="false" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/disclaimer.aspx" Text="Home" />                    
                    <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Search for a Contract" />
                    <asp:MenuItem NavigateUrl="~/DBEdit.aspx" Text="Edit Contracts" />
                    <asp:MenuItem NavigateUrl="~/Contacts.aspx" Text="Contact Page" />
                </Items>
            </asp:Menu>
        </div>
        
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
    </form>
</body>
</html>
