<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="DBEdit.aspx.cs" Inherits="AOBriefcase.DBEdit" MaintainScrollPositionOnPostBack = "true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" ForeColor="Red" runat="server" Visible="false"/>
        <a href="WebForm1.aspx">Back to search page</a>
        <br />
        <br />
        Welcome
        <asp:LoginName ID="LoginName2" runat="server" Font-Bold ="true" />                        
        <asp:LoginStatus ID="LoginStatus2" runat="server" />        
        <h2>You have entered the database editing module. Please be very careful here.</h2>
        <br /><br />
        <a href="ProviderEdit.aspx">Configure Providers</a>
        <br /><br />
    <div>
        <%--Welcome
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold ="true" />                        
        <asp:LoginStatus ID="LoginStatus1" runat="server" />        --%>
    </div>
        <asp:Label ID="StatusLabel1" ForeColor="Red" runat="server" Visible="false"/>
        <asp:DetailsView 
            ID="DetailsView1" 
            runat="server" 
            AutoGenerateRows="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1" 
            Height="50px" 
            Width="400px" 
            Visible="False" 
            RowStyle-Wrap="false"
            >
            <Fields>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" InsertVisible="False" ReadOnly="True" SortExpression="ContractID" />
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend_Count" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Amend_Comment" HeaderText="Amend_Comment" SortExpression="Amend_Comment" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract_Name" SortExpression="Contract_Name" />
                <asp:BoundField DataField="Contract_Type" HeaderText="Contract_Type" SortExpression="Contract_Type" />
                <asp:BoundField DataField="Contract_Parent" HeaderText="Contract_Parent" SortExpression="Contract_Parent" />
                <asp:BoundField DataField="Contract_FC" HeaderText="Contract_FC" SortExpression="Contract_FC" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:BoundField DataField="Contract_Status" HeaderText="Contract_Status" SortExpression="Contract_Status" />
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contract_Phone" SortExpression="Contract_Phone" />
                <asp:BoundField DataField="Contract_PDF" HeaderText="Contract_PDF" SortExpression="Contract_PDF" />
                <asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
                <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="ChangeSelectedIndex" 
            RowStyle-Wrap="false" 
            HeaderStyle-Wrap="false"
            >
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" SortExpression="ContractID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                    <%--<ItemStyle Width="10px"></ItemStyle>--%>
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend_Count" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Amend_Comment" HeaderText="Amend_Comment" SortExpression="Amend_Comment" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract_Name" SortExpression="Contract_Name" />
                <asp:BoundField DataField="Contract_Type" HeaderText="Contract_Type" SortExpression="Contract_Type" />
                <asp:BoundField DataField="Contract_Parent" HeaderText="Contract_Parent" SortExpression="Contract_Parent" />
                <asp:BoundField DataField="Contract_FC" HeaderText="Contract_FC" SortExpression="Contract_FC" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:BoundField DataField="Contract_Status" HeaderText="Contract_Status" SortExpression="Contract_Status" />
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contract_Phone" SortExpression="Contract_Phone" />
                <asp:BoundField DataField="Contract_PDF" HeaderText="Contract_PDF" SortExpression="Contract_PDF" />
                <asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" DeleteCommand="DELETE FROM [Contract_Demographics] WHERE [ContractID] = @ContractID" InsertCommand="INSERT INTO [Contract_Demographics] ([AOID], [Amend_Count], [Amend_Comment], [Contract_Name], [Contract_Type], [Contract_Parent], [Contract_FC], [Contract_Alias3], [Contract_Alias2], [Contract_Alias1], [Contract_UpdateDate], [Contract_TerminateDate], [Contract_EffectiveDate], [Contract_Status], [Contract_Homepage], [Contract_Phone], [Contract_PDF], [Auth_ProviderPortal], [SVC_Injectibles], [SVC_Injections], [Contract_Alias4], [SVC_OfficeVisits], [SVC_SX], [SVC_Radiology], [SVC_OT], [SVC_PT], [SVC_PainMgmt], [SVC_Podiatry], [SVC_DME]) VALUES (@AOID, @Amend_Count, @Amend_Comment, @Contract_Name, @Contract_Type, @Contract_Parent, @Contract_FC, @Contract_Alias3, @Contract_Alias2, @Contract_Alias1, @Contract_UpdateDate, @Contract_TerminateDate, @Contract_EffectiveDate, @Contract_Status, @Contract_Homepage, @Contract_Phone, @Contract_PDF, @Auth_ProviderPortal, @SVC_Injectibles, @SVC_Injections, @Contract_Alias4, @SVC_OfficeVisits, @SVC_SX, @SVC_Radiology, @SVC_OT, @SVC_PT, @SVC_PainMgmt, @SVC_Podiatry, @SVC_DME)" SelectCommand="SELECT [ContractID], [AOID], [Amend_Count], [Amend_Comment], [Contract_Name], [Contract_Type], [Contract_Parent], [Contract_FC], [Contract_Alias3], [Contract_Alias2], [Contract_Alias1], [Contract_UpdateDate], [Contract_TerminateDate], [Contract_EffectiveDate], [Contract_Status], [Contract_Homepage], [Contract_Phone], [Contract_PDF], [Auth_ProviderPortal], [SVC_Injectibles], [SVC_Injections], [Contract_Alias4], [SVC_OfficeVisits], [SVC_SX], [SVC_Radiology], [SVC_OT], [SVC_PT], [SVC_PainMgmt], [SVC_Podiatry], [SVC_DME] FROM [Contract_Demographics] ORDER BY [AOID], [Amend_Count]" UpdateCommand="UPDATE [Contract_Demographics] SET [AOID] = @AOID, [Amend_Count] = @Amend_Count, [Amend_Comment] = @Amend_Comment, [Contract_Name] = @Contract_Name, [Contract_Type] = @Contract_Type, [Contract_Parent] = @Contract_Parent, [Contract_FC] = @Contract_FC, [Contract_Alias3] = @Contract_Alias3, [Contract_Alias2] = @Contract_Alias2, [Contract_Alias1] = @Contract_Alias1, [Contract_UpdateDate] = @Contract_UpdateDate, [Contract_TerminateDate] = @Contract_TerminateDate, [Contract_EffectiveDate] = @Contract_EffectiveDate, [Contract_Status] = @Contract_Status, [Contract_Homepage] = @Contract_Homepage, [Contract_Phone] = @Contract_Phone, [Contract_PDF] = @Contract_PDF, [Auth_ProviderPortal] = @Auth_ProviderPortal, [SVC_Injectibles] = @SVC_Injectibles, [SVC_Injections] = @SVC_Injections, [Contract_Alias4] = @Contract_Alias4, [SVC_OfficeVisits] = @SVC_OfficeVisits, [SVC_SX] = @SVC_SX, [SVC_Radiology] = @SVC_Radiology, [SVC_OT] = @SVC_OT, [SVC_PT] = @SVC_PT, [SVC_PainMgmt] = @SVC_PainMgmt, [SVC_Podiatry] = @SVC_Podiatry, [SVC_DME] = @SVC_DME WHERE [ContractID] = @ContractID">
            <DeleteParameters>
                <asp:Parameter Name="ContractID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AOID" Type="String" />
                <asp:Parameter Name="Amend_Count" Type="Int32" />
                <asp:Parameter Name="Amend_Comment" Type="String" />
                <asp:Parameter Name="Contract_Name" Type="String" />
                <asp:Parameter Name="Contract_Type" Type="String" />
                <asp:Parameter Name="Contract_Parent" Type="String" />
                <asp:Parameter Name="Contract_FC" Type="String" />
                <asp:Parameter Name="Contract_Alias3" Type="String" />
                <asp:Parameter Name="Contract_Alias2" Type="String" />
                <asp:Parameter Name="Contract_Alias1" Type="String" />
                <asp:Parameter DbType="Date" Name="Contract_UpdateDate" />
                <asp:Parameter DbType="Date" Name="Contract_TerminateDate" />
                <asp:Parameter DbType="Date" Name="Contract_EffectiveDate" />
                <asp:Parameter Name="Contract_Status" Type="String" />
                <asp:Parameter Name="Contract_Homepage" Type="String" />
                <asp:Parameter Name="Contract_Phone" Type="String" />
                <asp:Parameter Name="Contract_PDF" Type="Int32" />
                <asp:Parameter Name="Auth_ProviderPortal" Type="String" />
                <asp:Parameter Name="SVC_Injectibles" Type="String" />
                <asp:Parameter Name="SVC_Injections" Type="Boolean" />
                <asp:Parameter Name="Contract_Alias4" Type="String" />
                <asp:Parameter Name="SVC_OfficeVisits" Type="Boolean" />
                <asp:Parameter Name="SVC_SX" Type="Boolean" />
                <asp:Parameter Name="SVC_Radiology" Type="Boolean" />
                <asp:Parameter Name="SVC_OT" Type="Boolean" />
                <asp:Parameter Name="SVC_PT" Type="Boolean" />
                <asp:Parameter Name="SVC_PainMgmt" Type="Boolean" />
                <asp:Parameter Name="SVC_Podiatry" Type="Boolean" />
                <asp:Parameter Name="SVC_DME" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AOID" Type="String" />
                <asp:Parameter Name="Amend_Count" Type="Int32" />
                <asp:Parameter Name="Amend_Comment" Type="String" />
                <asp:Parameter Name="Contract_Name" Type="String" />
                <asp:Parameter Name="Contract_Type" Type="String" />
                <asp:Parameter Name="Contract_Parent" Type="String" />
                <asp:Parameter Name="Contract_FC" Type="String" />
                <asp:Parameter Name="Contract_Alias3" Type="String" />
                <asp:Parameter Name="Contract_Alias2" Type="String" />
                <asp:Parameter Name="Contract_Alias1" Type="String" />
                <asp:Parameter DbType="Date" Name="Contract_UpdateDate" />
                <asp:Parameter DbType="Date" Name="Contract_TerminateDate" />
                <asp:Parameter DbType="Date" Name="Contract_EffectiveDate" />
                <asp:Parameter Name="Contract_Status" Type="String" />
                <asp:Parameter Name="Contract_Homepage" Type="String" />
                <asp:Parameter Name="Contract_Phone" Type="String" />
                <asp:Parameter Name="Contract_PDF" Type="Int32" />
                <asp:Parameter Name="Auth_ProviderPortal" Type="String" />
                <asp:Parameter Name="SVC_Injectibles" Type="String" />
                <asp:Parameter Name="SVC_Injections" Type="Boolean" />
                <asp:Parameter Name="Contract_Alias4" Type="String" />
                <asp:Parameter Name="SVC_OfficeVisits" Type="Boolean" />
                <asp:Parameter Name="SVC_SX" Type="Boolean" />
                <asp:Parameter Name="SVC_Radiology" Type="Boolean" />
                <asp:Parameter Name="SVC_OT" Type="Boolean" />
                <asp:Parameter Name="SVC_PT" Type="Boolean" />
                <asp:Parameter Name="SVC_PainMgmt" Type="Boolean" />
                <asp:Parameter Name="SVC_Podiatry" Type="Boolean" />
                <asp:Parameter Name="SVC_DME" Type="Boolean" />
                <asp:Parameter Name="ContractID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
