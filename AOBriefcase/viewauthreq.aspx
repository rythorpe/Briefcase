<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewauthreq.aspx.cs" Inherits="AOBriefcase.viewauthreq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authorizations Requirements Viewer</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
<style type="text/css" media="screen">
    @import "viewauthreq.css";
</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="AOLogo" runat="server" ImageUrl="~/Images/AOlogo.png" />
        <h2>Authorizations Requirements Viewer</h2>
        <a href="WebForm1.aspx">Back to search page</a>
        <br />
        <br />
        <div id="subMenu">
            <asp:Button ID="btnSub1" runat="server" class="btnSubMenu" Text="Details View" color="#fff" OnClick="btnSub1_Click" />
            <asp:Button ID="btnSub2" runat="server" class="btnSubMenu" Text="Provider Credentialing View" color="#fff" OnClick="btnSub2_Click"/>
            <asp:Button ID="btnSub3" runat="server" class="btnSubMenu" Text="Authorization Requirements View" color="#fff" OnClick="btnSub3_Click"/>
            <asp:Button ID="btnSub4" runat="server" class="btnSubMenu" Text="Business Office Details View" color="#fff" OnClick="btnSub4_Click"/>    
        </div>
            <br />
            <br />
            <br />
        <%-- %>The bottom two lines are for debugging the GUID sql querystring process--%>
            <asp:Label ID="viewGUID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="viewGUID2" runat="server" Visible="false"></asp:Label>        
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="ContractID" DataSourceID="SqlDataSource1" Height="50px" Width="30%">
            <Fields>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" InsertVisible="False" ReadOnly="True" SortExpression="ContractID" />
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend_Count" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Amend_Comment" HeaderText="Amend_Comment" SortExpression="Amend_Comment" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract_Name" SortExpression="Contract_Name" />
                <asp:BoundField DataField="Contract_Parent" HeaderText="Contract_Parent" SortExpression="Contract_Parent" />
                <asp:BoundField DataField="Contract_Type" HeaderText="Contract_Type" SortExpression="Contract_Type" />
                <asp:BoundField DataField="Contract_FC" HeaderText="Contract_FC" SortExpression="Contract_FC" />
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contract_Phone" SortExpression="Contract_Phone" />
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />
                <asp:BoundField DataField="Contract_Status" HeaderText="Contract_Status" SortExpression="Contract_Status" />
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />
                <asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
                <asp:BoundField DataField="Auth_OfficeVisits" HeaderText="Auth_OfficeVisits" SortExpression="Auth_OfficeVisits" />                
                <asp:BoundField DataField="Auth_OfficeVisits_Note" HeaderText="Auth_OfficeVisits_Note" SortExpression="Auth_OfficeVisits_Note" />
                <asp:BoundField DataField="Auth_SX" HeaderText="Auth_SX" SortExpression="Auth_SX" />
                <asp:BoundField DataField="Auth_SX_Note" HeaderText="Auth_SX_Note" SortExpression="Auth_SX_Note" />
                <asp:BoundField DataField="Auth_Radiology" HeaderText="Auth_Radiology" SortExpression="Auth_Radiology" />
                <asp:BoundField DataField="Auth_Radiology_Note" HeaderText="Auth_Radiology_Note" SortExpression="Auth_Radiology_Note" />
                <asp:BoundField DataField="Auth_PT" HeaderText="Auth_PT" SortExpression="Auth_PT" />
                <asp:BoundField DataField="Auth_PT_Note" HeaderText="Auth_PT_Note" SortExpression="Auth_PT_Note" />
                <asp:BoundField DataField="Auth_OT" HeaderText="Auth_OT" SortExpression="Auth_OT" />
                <asp:BoundField DataField="Auth_OT_Note" HeaderText="Auth_OT_Note" SortExpression="Auth_OT_Note" />
                <asp:BoundField DataField="Auth_PainMgmt" HeaderText="Auth_PainMgmt" SortExpression="Auth_PainMgmt" />
                <asp:BoundField DataField="Auth_PainMgmt_Note" HeaderText="Auth_PainMgmt_Note" SortExpression="Auth_PainMgmt_Note" />
                <asp:BoundField DataField="Auth_DME" HeaderText="Auth_DME" SortExpression="Auth_DME" />
                <asp:BoundField DataField="Auth_DME_Note" HeaderText="Auth_DME_Note" SortExpression="Auth_DME_Note" />
                <asp:BoundField DataField="Auth_Podiatry" HeaderText="Auth_Podiatry" SortExpression="Auth_Podiatry" />
                <asp:BoundField DataField="Auth_Podiatry_Note" HeaderText="Auth_Podiatry_Note" SortExpression="Auth_Podiatry_Note" />
                <asp:BoundField DataField="Auth_Injections" HeaderText="Auth_Injections" SortExpression="Auth_Injections" />
                <asp:BoundField DataField="Auth_Injections_Note" HeaderText="Auth_Injections_Note" SortExpression="Auth_Injections_Note" />
                <asp:BoundField DataField="Contract_PDF" HeaderText="Contract_PDF" SortExpression="Contract_PDF" />
                <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics] WHERE ([GUID] = @guide)">
            <SelectParameters>
                <asp:QueryStringParameter Name="guide" QueryStringField="guid" /><%--Type="Object" /> Commenting this out apparently re-fixed the querystring--%>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
