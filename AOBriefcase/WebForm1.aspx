<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AOBriefcase.WebForm1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Arrowhead Orthopaedics Contract Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="WebForm1.css" type="text/css"/>
<%--<style type="text/css" media="screen">
    @import "WebForm1.css";
</style>--%> <%--Why did we do it this way?--%>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image id="AOLogo" runat="server" ImageURL="~/Images/AOlogo.png" />

        <div id="NavigationBar">
            <h2 id="CRD"><span style="color:#79b9ef">C</span>ontract <span style="color:#79b9ef">R</span>eference <span style="color:#79b9ef">D</span>atabase</h2>      
            <a href="/disclaimer.aspx">Home</a>
            <a href="/WebForm1.aspx">Search for a Contract</a>
            <a href="/DBEdit.aspx">Edit Contracts</a>
            <a href="/Contact.aspx">Contact</a>

            <%--<asp:Menu ID="Navi" runat="server" EnableViewState="false" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/disclaimer.aspx" Text="Home" />
                    <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Search for a Contract" />
                    <asp:MenuItem NavigateUrl="~/DBEdit.aspx" Text="Edit Contracts" />
                    <asp:MenuItem NavigateUrl="~/Contact.aspx" Text="Contact" />
                </Items>
            </asp:Menu>--%>
        </div>

        <br />
        <h3>This tool is to help determine if we are contracted with a patient's particular insurance. Please enter all or a portion of the insurance name. You may also enter a known abbreviated name for the insurance (ie. BMG for Beaver Medical Group)</h3>
        
        <div id="results">
            <div id="search">
                <i class="glyphicon glyphicon-search" id="searchIcon"></i>      
                <asp:TextBox ID="txtName" runat="server"  placeholder="Search..."/>
                <asp:Button CssClass="btn1" runat="server" OnClick="btnSearch_Click" Text="Search" ValidationGroup="Search"/>            
                <asp:Button CssClass="btn1" runat="server" OnClick="btnViewall_Click" Text="View All" ValidationGroup="OmniView"/>
            </div>

            <div id="errorMsg">
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Blank entry, please try again" Display="Dynamic" ValidationGroup="Search"/>            
                <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ErrorMessage="Invalid search term, please try again" Display="Dynamic" ValidationGroup="Search"/>
            </div>
           
            <button id="btn2" type="button">Terminology Help</button> <!-- Open the hint box modal -->
        </div>

        <div id="searchResults">
            <asp:PlaceHolder ID="phContractSearch" runat="server" Visible="false">            
                <asp:Repeater ID="rpContractSearchView" runat="server" >
                    <ItemTemplate>
                        <p><asp:HyperLink ID="h1Link" runat="server" NavigateUrl='<%#Eval("guid", "viewdetail.aspx?guid={0}") %>' Text='<%#Eval("AOCode")%>'/></p>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phNoContractFound" runat="server" Visible="false">
                <p>No contract found. Please double-check your spelling</p>
            </asp:PlaceHolder>
        </div>

<%--The "hintBox" section is intended to be a "glossary window" in order to quickly inform users of important terminology related to contracts. Below is a snip of working CSS from unpushed commit to give an idea of what it looks like.--%>
<%--#hintBox{
    width:400px;
    margin-right:40%;
    margin-top: 1cm;
    float:right;
    padding: 10px 10px 10px 10px;    
    border: 3px dotted #D4D4D4;
    border-width: thick;
    border-radius: 10px;    
}--%>
       

        <!-- The Modal -->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="hintBox">
                <span class="closeBtn">&times;</span>

                <div id="hbHeading">Important Terminology</div>
                <h4>HMO</h4>
                <h5>"Health Management Organization" This type of health plan generally requires patients to obtain care from medical service providers who are both contracted and credentialed with the health plan in order to be eligible for coverage. Nearly all services covered by an HMO require authorization to be obtained.</h5>
                <h4>PPO</h4>
                <h5>"Preferred Provider Organization" A brief description about PPOs will be entered here. </h5>
                <h4>MPN</h4>
                <h5>"Medical Provider Network" A brief description about MPNs will be entered here.</h5>
            </div>
        </div>
        
        <asp:SqlDataSource ID="Demographics" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics]"></asp:SqlDataSource>
    </form>

    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("btn2");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("closeBtn")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>