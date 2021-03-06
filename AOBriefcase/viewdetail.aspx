﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdetail.aspx.cs" Inherits="AOBriefcase.viewdetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contract Detail Viewer</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
    <%--Linking external style sheet does not work for some wierd reason. Using internal css.--%>
<style type="text/css" media="screen">
    @import "viewdetail.css";
    /*body {
    font-family:Arial, Helvetica, sans-serif;    
    }

h2{
    color:#2b4b83;    
    }

div{
    font-family:Arial, Helvetica, sans-serif;
    }
dl{
    width:300px;
    margin:0;
    }
dl dt{
    float:left;
    width:400px;
    text-decoration: underline;
    }
dl dt dd{
    float:left;
    width:200px;
    font-weight: bold;
    text-decoration:underline;
    }*/
</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="AOLogo" runat="server" ImageURL="~/Images/AOlogo.png"/>        
        <h2>Contract Detail Viewer</h2>
        <a href="WebForm1.aspx">Back to search page</a>
        <br />
        <br />
        <div id="subMenu">
            <asp:Button ID="btnSub1" runat="server" class="btnSubMenu" Text="Details View" color="#fff" OnClick="btnSub1_Click"/>
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
        <%--Commenting the hardcoded entries here makes the whole thing explode for some reason. Use Visible="false.--%>
        <asp:PlaceHolder ID="phViewDetail" runat="server" Visible="false">
            <dl>
                <dt style="padding-left: 50px;">Contract Details<br /><br /></dt>                           
                <dt>Contract Name:<br /></dt>
                <dd><asp:Label ID="lblCName" runat="server" /><br /></dd>
                <dt>Contract Type:<br /></dt>
                <dd><asp:Label ID="lblCType" runat="server" /><br /></dd>
                <dt>Parent Organization:<br /></dt>
                <dd><asp:Label ID="lblCParent" runat="server" /><br /></dd>
                <dt>Financial Class:<br /></dt>
                <dd><asp:Label ID="lblCFC" runat="server" /><br /></dd>
                <dt>Phone Number:<br /></dt>
                <dd><asp:Label ID="lblCPhone" runat="server" /><br /></dd>
                <dt>Webpage:<br /></dt>
                <dd><asp:Label ID="lblCWeb" runat="server" /><br /></dd>
                <dt>Status:<br /></dt>
                <dd><asp:Label ID="lblCStatus" runat="server" /><br /></dd>
                <dt>Effective Date:<br /></dt>
                <dd><asp:Label ID="lblEffDate" runat="server" /><br /></dd>
                <dt>Termination Date:<br /></dt>
                <dd><asp:Label ID="lblTermDate" runat="server" /><br /></dd>
                <dt>Last Updated:<br /></dt>
                <dd><asp:Label ID="lblUpdDate" runat="server" /><br /><br /></dd>
                <dt><br /></dt>            
                <dt style="padding-left: 50px;">Covered Services<br /><br /></dt>
                <dt>Office Visits:<br /></dt>
                <dd><asp:Label ID="lblOffice" runat="server" /><br /></dd>
                <dt>Surgery:<br /></dt>
                <dd><asp:Label ID="lblSX" runat="server" /><br /></dd>
                <dt>Radiology:<br /></dt>
                <dd><asp:Label ID="lblXray" runat="server" /><br /></dd>
                <dt>Physical Therapy:<br /></dt>
                <dd><asp:Label ID="lblPT" runat="server" /><br /></dd>
                <dt>Occupational Therapy:<br /></dt>
                <dd><asp:Label ID="lblOT" runat="server" /><br /></dd>
                <dt>Pain Management:<br /></dt>
                <dd><asp:Label ID="lblPainMgmt" runat="server" /><br /></dd>
                <dt>Durable Medical Equipment (DME):<br /></dt>
                <dd><asp:Label ID="lblDME" runat="server" /><br /></dd>
                <dt>Podiatry:<br /></dt>
                <dd><asp:Label ID="lblPodiatry" runat="server" /><br /></dd>
                <dt>Injections:<br /></dt>
                <dd><asp:Label ID="lblInject" runat="server" /><br /></dd>
                <dt>Injectables:<br /></dt>
                <dd><asp:Label ID="lblDrug" runat="server" /><br /></dd>
                <dt>Download Cheat Sheet<br /></dt>
                <dd><asp:Label ID="lblPDF" runat="server" /><br /></dd>
                <dt><br /><br /></dt>
                <dt style="padding-left: 50px;">Authorization Requirements<br /><br /></dt>
                <dt>Provider Portal:</dt>
                <dd>Placeholder1</dd>
                <dt>Office Visits:</dt>
                <dd>Placeholder1</dd>
                <dt>Surgery:</dt>
                <dd>Placeholder1</dd>
                <dt>X-rays:</dt>
                <dd>Placeholder1</dd>
                <dt>DME:</dt>
                <dd>Placeholder1</dd>
                <dt>Therapeutic Injections:</dt>
                <dd>Placeholder1</dd>
                <dt>Viscosupplementation:</dt>
                <dd>Placeholder1</dd>
                <dt>Pain Management:</dt>
                <dd>Placeholder1</dd>
                <dt>Physical Therapy:</dt>
                <dd>Placeholder1</dd>
                <dt>Occupational Therapy:</dt>
                <dd>Placeholder1</dd>
                <dt>Podiatry:</dt>
                <dd>Placeholder1</dd>
                <dt>Bundled Services:</dt>
                <dd>Placeholder1</dd>
                <dt>Other:</dt>
                <dd>Placeholder1</dd>
                <dt><br /><br /><br /></dt>
                <dd><a href="WebForm1.aspx">Back to search page</a></dd>
            </dl>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="phNoViewDetail" runat="server" Visible="false">
            <p>No contract selected</p>
        </asp:PlaceHolder>
        <asp:DetailsView 
            ID="DetailsView2" 
            runat="server" 
            AutoGenerateRows="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1"             
            Gridlines="None"
            HeaderText="Contract Details"
            CssClass="viewer"
            HeaderStyle-CssClass="detailheader"
            FieldHeaderStyle-CssClass="detailfieldheader"
            AlternatingRowStyle-CssClass="alternatingRow"
        >
            <Fields>
                <%--<asp:BoundField DataField="ContractID" HeaderText="ContractID" InsertVisible="False" ReadOnly="True" SortExpression="ContractID"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Center"/>--%>
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID"/>
                <asp:BoundField DataField="Amend_Count" HeaderText="Amendments" SortExpression="Amend_Count"/>
                <asp:BoundField DataField="Amend_Comment" HeaderText="Comment" SortExpression="Amend_Comment"/>
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract Name" SortExpression="Contract_Name"/>
                <asp:BoundField DataField="Contract_Parent" HeaderText="Parent Organization" SortExpression="Contract_Parent"/>
                <asp:BoundField DataField="Contract_Type" HeaderText="Type" SortExpression="Contract_Type"/>
                <asp:BoundField DataField="Contract_FC" HeaderText="Financial Class" SortExpression="Contract_FC"/>
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contact Number" SortExpression="Contract_Phone"/>
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Homepage" SortExpression="Contract_Homepage"/>
                <asp:BoundField DataField="Contract_Status" HeaderText="Status" SortExpression="Contract_Status"/>
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Effective Date" SortExpression="Contract_EffectiveDate" dataformatstring="{0:d}"/>
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Termination Date" SortExpression="Contract_TerminateDate" dataformatstring="{0:d}"/>
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Update Date" SortExpression="Contract_UpdateDate" dataformatstring="{0:d}"/>
                <%--<asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />--%>
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits"/>
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX"/>
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology"/>
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT"/>
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT"/>
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt"/>
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME"/>
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry"/>
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections"/>
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles"/>
                <%--<asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
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
                <asp:BoundField DataField="Auth_Injections_Note" HeaderText="Auth_Injections_Note" SortExpression="Auth_Injections_Note" />--%>
                <%--<asp:BoundField DataField="Contract_PDF" HeaderText="Contract_PDF" SortExpression="Contract_PDF" /> --%>
                <%--<asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" /> --%>
            </Fields>
        </asp:DetailsView>
        <br /><br />
        <a href="WebForm1.aspx">Back to search page</a>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics] WHERE ([GUID] = @guide)">
            <SelectParameters>
                <asp:QueryStringParameter Name="guide" QueryStringField="guid" /><%--Type="Object" /> Commenting this out apparently re-fixed the querystring--%>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
