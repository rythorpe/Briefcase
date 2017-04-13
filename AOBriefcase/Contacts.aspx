<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="AOBriefcase.Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Information</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="Contacts.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="AOLogo" runat="server" ImageUrl="~/Images/AOlogo.png" />

    <div id="NavigationBar">
        <h2 id="CI"><span style="color:#79b9ef">C</span>ontact <span style="color:#79b9ef">I</span>nformation</h2>
        <asp:Menu ID="Navi" runat="server" EnableViewState="false" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="~/disclaimer.aspx" Text="Home" />
                <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Search for a Contract" />
                <asp:MenuItem NavigateUrl="~/DBEdit.aspx" Text="Edit Contracts" />
                <asp:MenuItem NavigateUrl="~/Contact.aspx" Text="Contact Page" />
            </Items>
        </asp:Menu>
    </div>

    <div id="Contents">
        <p>For questions regarding contract information, please contact:</p>
        <p>For questions regarding credentialing information, please contact:</p>
        <p>For questions regarding billing/collection information regarding contracts, please contact:</p>
        <p>To report issues with this web application, please contact:</p>
    </div>
    </form>
</body>
</html>
