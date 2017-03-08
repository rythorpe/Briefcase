<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="disclaimer.aspx.cs" Inherits="AOBriefcase.disclaimer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css" media="screen">
@import "disclaimer.css";
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Wrapper">
        <h1>Disclaimer Notice for Employee Use of Internal Resources</h1>
        <p>
            <b>Please read the text below and then select 'Accept' at the bottom of the page to indicate your acceptance of the disclaimer. Users are required to accept this disclaimer prior to using the Contract Reference Database Tool.</b>
        </p>
        <p>This website contains contracting information for the internal use of Arrowhead Orthopaeidcs employees only. It is intended to provide a brief summary of each contract agreement for the purposes of scheduling a patient appointment, obtaining authorization for services, or to confirm credentialed providers. Please refer to the Employee Manual on Internet and Electronic Communication for our corporatet policy on these matters. Any misuse of this information may result in disciplinary action, including termination.</p>
        <p>The information provided may be modified as necessary and every attempt will be made to inform employees of these changes as they occur. If additional information or clarification is needed, please send your request to <a href="mailto:Contracting@Arrowheadortho.com">Contracting@Arrowheadortho.com</a>.</p>    
        <div>                   
            <asp:Button ID="btnAccept" runat="server" class="FancyButtonOrange" Text="Accept" color="#fff" OnClick="btnAccept_Click"/>
            <asp:Button ID="btnNoAccept" runat="server" class="FancyButtonBlue" Text="Don't Accept" color="#fff" OnClick="btnNoAccept_Click"/>
        </div>
    </div>
    </form>
</body>
</html>
