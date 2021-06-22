<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_for_Competitor_info.aspx.cs" Inherits="Sports_Management.Search_for_Competitor_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Competitor Info</title>
<style>
.myDiv {
  border: 1px outset black;
  background-color: lightblue;    
  text-align: left;
   padding-top: 50px;
  padding-right: 10px;
  padding-bottom: 30px;
  padding-left: 100px;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
</style>
</head>
<body style="background-color: #ebf5f4">
    <div class="myDiv">
<h2>Competitor Search Management </h2>
<ul>
   <li><a class="active" href="Events Management.aspx">Event Management</a></li>
   <li><a href="Display_Export_Result.aspx">Event Management Report</a></li>
   <li><a href="Export_Competitors_info.aspx">Competitor Management Report</a></li>
   <li><a href="Search_for_Competitor_info.aspx"> Competitor Search Report</a></li>
   <li><a href="Search_the_Database_for_Events.aspx"> Event Search Report</a></li>
   <li><a href="Login Home.aspx">Login</a></li>
</ul>
<br />
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Competitor_Salutation" HeaderText="Competitor_Salutation" SortExpression="Competitor_Salutation" />
                    <asp:BoundField DataField="Competitor_Name" HeaderText="Competitor_Name" SortExpression="Competitor_Name" />
                    <asp:BoundField DataField="Competitor_DoB" HeaderText="Competitor_DoB" SortExpression="Competitor_DoB" />
                    <asp:BoundField DataField="Competitor_Email" HeaderText="Competitor_Email" SortExpression="Competitor_Email" />
                    <asp:BoundField DataField="Competitor_Country" HeaderText="Competitor_Country" SortExpression="Competitor_Country" />
                    <asp:BoundField DataField="Competitor_Gender" HeaderText="Competitor_Gender" SortExpression="Competitor_Gender" />
                    <asp:BoundField DataField="Competitor_Description" HeaderText="Competitor_Description" SortExpression="Competitor_Description" />
                    <asp:BoundField DataField="Competitor_ContactNo" HeaderText="Competitor_ContactNo" SortExpression="Competitor_ContactNo" />
                </Columns>
            </asp:GridView>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sports ManagementConnectionString %>" SelectCommand="SELECT [Competitor_Salutation], [Competitor_Name], [Competitor_DoB], [Competitor_Email], [Competitor_Country], [Competitor_Gender], [Competitor_Description], [Competitor_ContactNo] FROM [Competitors_Management] WHERE ([Competitor_Name] LIKE '%' +@Competitor_Name+ '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Competitor_Name" PropertyName="Text" Type="String" DefaultValue ="%" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    </div>
</body>
</html>
