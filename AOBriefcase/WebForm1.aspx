﻿<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AOBriefcase.WebForm1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Arrowhead Orthopaedics Contract Search</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
<style type="text/css" media="screen">
@import "WebForm1.css";
</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="AOLogo" runat="server" ImageURL="~/Images/AOlogo.png"/>
        
        <div id="NavigationBar">            
        <asp:Menu ID="Navi" runat="server" EnableViewState="false" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="~/disclaimer.aspx" Text="Home" />
                <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Search for a Contract" />
                <asp:MenuItem NavigateUrl="~/DBEdit.aspx" Text="Edit Contracts" />
            </Items>
        </asp:Menu>
        </div>
        <div id="titleText">
        <h2>Welcome to the Contract Reference Database.</h2><br />
            <h3>This tool is to help determine if we are contracted with a patient's particular insurance. Please enter all or a portion of the insurance name. You may also enter a known abbreviated name for the insurance (ie. BMG for Beaver Medical Group)</h3>
        </div>
        <%--<p>
            | Search for a contract || 
            <a href="DBEdit.aspx">Edit Contracts</a>
        </p>--%>
        <div id="results">            
            <asp:TextBox ID="txtName" runat="server" />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" ValidationGroup="Search"/>            
            <asp:Button ID="btnViewall" runat="server" OnClick="btnViewall_Click" Text="View All" ValidationGroup="OmniView"/>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Blank entry, please try again" Display="Dynamic" ValidationGroup="Search"/>            
            <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ErrorMessage="Invalid search term, please try again" Display="Dynamic" ValidationGroup="Search"/>
            <asp:PlaceHolder ID="phContractSearch" runat="server" Visible="false">            
            <asp:Repeater ID="rpContractSearchView" runat="server" >
            <ItemTemplate>
                <p><asp:HyperLink ID="h1Link" runat="server" NavigateUrl='<%#Eval("guid", "viewdetail.aspx?guid={0}") %>' Text='<%#Eval("AOCode")%>'/></p>
            </ItemTemplate>
            </asp:Repeater></asp:PlaceHolder>                           
        </div>        
        <asp:PlaceHolder ID="phNoContractFound" runat="server" Visible="false">
            <p>No contract found. Please double-check your spelling</p>
        </asp:PlaceHolder>
        <asp:SqlDataSource ID="Demographics" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics]"></asp:SqlDataSource>
    </form>
</body>
</html>