<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProviderEdit.aspx.cs" Inherits="AOBriefcase.ProviderEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Provider Configuration</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProviderListID" DataSourceID="ProviderDB">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="true"/>
                <asp:BoundField DataField="ProviderListID" HeaderText="ProviderListID" InsertVisible="False" ReadOnly="True" SortExpression="ProviderListID" />
                <asp:BoundField DataField="Provider_FullName" HeaderText="Provider_FullName" SortExpression="Provider_FullName" />
                <asp:BoundField DataField="Provider_PLUS" HeaderText="Provider_PLUS" SortExpression="Provider_PLUS" />
                <asp:BoundField DataField="Provider_Facilities" HeaderText="Provider_Facilities" SortExpression="Provider_Facilities" />
                <asp:BoundField DataField="Provider_Specialty" HeaderText="Provider_Specialty" SortExpression="Provider_Specialty" />
                <asp:CheckBoxField DataField="Provider_Status" HeaderText="Provider_Status" SortExpression="Provider_Status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ProviderDB" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" DeleteCommand="DELETE FROM [ProviderList] WHERE [ProviderListID] = @ProviderListID" InsertCommand="INSERT INTO [ProviderList] ([Provider_FullName], [Provider_PLUS], [Provider_Facilities], [Provider_Specialty], [Provider_Status]) VALUES (@Provider_FullName, @Provider_PLUS, @Provider_Facilities, @Provider_Specialty, @Provider_Status)" SelectCommand="SELECT * FROM [ProviderList]" UpdateCommand="UPDATE [ProviderList] SET [Provider_FullName] = @Provider_FullName, [Provider_PLUS] = @Provider_PLUS, [Provider_Facilities] = @Provider_Facilities, [Provider_Specialty] = @Provider_Specialty, [Provider_Status] = @Provider_Status WHERE [ProviderListID] = @ProviderListID">
            <DeleteParameters>
                <asp:Parameter Name="ProviderListID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Provider_FullName" Type="String" />
                <asp:Parameter Name="Provider_PLUS" Type="String" />
                <asp:Parameter Name="Provider_Facilities" Type="String" />
                <asp:Parameter Name="Provider_Specialty" Type="String" />
                <asp:Parameter Name="Provider_Status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Provider_FullName" Type="String" />
                <asp:Parameter Name="Provider_PLUS" Type="String" />
                <asp:Parameter Name="Provider_Facilities" Type="String" />
                <asp:Parameter Name="Provider_Specialty" Type="String" />
                <asp:Parameter Name="Provider_Status" Type="Boolean" />
                <asp:Parameter Name="ProviderListID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
