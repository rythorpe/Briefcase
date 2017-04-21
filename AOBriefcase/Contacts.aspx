﻿<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="AOBriefcase.Contacts" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Information</title>
    <%--  <link rel="stylesheet" href="Contacts.css" type="text/css"/> --%>
</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
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
</asp:Content>