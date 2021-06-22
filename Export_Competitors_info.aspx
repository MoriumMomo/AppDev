<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Export_Competitors_info.aspx.cs" Inherits="Sports_Management.Export_Competitors_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Export and Display Competitors Information</title>
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
<h2>Competitor Management Report </h2>
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
            <asp:GridView ID="GridView1" AutoGenerateColumns="false"  runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="365px" Width="554px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <Columns>
                    <asp:BoundField HeaderText="Competitor Name" DataField="Competitor_Name" /> 
                    <asp:BoundField HeaderText="Competitor Country" DataField="Competitor_Country" />
                    <asp:BoundField HeaderText="Competitor DoB" DataField="Competitor_DoB" />
                    <asp:BoundField HeaderText="Competitor Gender" DataField="Competitor_Gender" />
                    <asp:BoundField HeaderText="Competitor Description" DataField="Competitor_Description" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="45px" Text="Export To Word" Width="155px" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
    </div>
</body>
</html>
