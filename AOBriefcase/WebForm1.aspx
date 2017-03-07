﻿<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AOBriefcase.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
        <h2>Welcome to the contract reference database. Please search for a contract to view more details.</h2>
        <p> | Search for a contract | <a href="DBEdit.aspx">Edit Contracts</a></p>
        <asp:TextBox ID="txtName" runat="server" />
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Blank entry, please try again" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ErrorMessage="Invalid characters detected, please try again" Display="Dynamic" />
        <asp:PlaceHolder ID="phContractSearch" runat="server" Visible="false">           
        <asp:Repeater ID="rpContractSearchView" runat="server" >
        <ItemTemplate>
            <p><asp:HyperLink ID="h1Link" runat="server" NavigateUrl='<%#Eval("guid", "viewdetail.aspx?guid={0}") %>' Text='<%#Eval("AOCode")%>'/></p>
        </ItemTemplate>
        </asp:Repeater></asp:PlaceHolder>
        <asp:PlaceHolder ID="phNoContractFound" runat="server" Visible="false">
            <p>No contract found. Please double-check your spelling</p>
        </asp:PlaceHolder>
        <asp:SqlDataSource ID="Demographics" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics]"></asp:SqlDataSource>
    </form>
</body>
</html>