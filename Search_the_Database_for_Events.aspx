<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_the_Database_for_Events.aspx.cs" Inherits="Sports_Management.Search_the_Database_for_Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Event Info</title>
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
<h2>Event Search Management </h2>
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Feature_Event" HeaderText="Feature_Event" SortExpression="Feature_Event" />
                    <asp:BoundField DataField="Event_Venue" HeaderText="Event_Venue" SortExpression="Event_Venue" />
                    <asp:BoundField DataField="Event_Description" HeaderText="Event_Description" SortExpression="Event_Description" />
                    <asp:BoundField DataField="World_Record" HeaderText="World_Record" SortExpression="World_Record" />
                    <asp:BoundField DataField="Competitor_Position" HeaderText="Competitor_Position" SortExpression="Competitor_Position" />
                    <asp:BoundField DataField="Competitor_Medal" HeaderText="Competitor_Medal" SortExpression="Competitor_Medal" />
                    <asp:BoundField DataField="Event_Date" HeaderText="Event_Date" SortExpression="Event_Date" />
                </Columns>
            </asp:GridView>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sports ManagementConnectionString %>" SelectCommand="SELECT [Feature_Event], [Event_Venue], [Event_Description], [World_Record], [Competitor_Position], [Competitor_Medal], [Event_Date] FROM [Events_Management] WHERE ([Event_Venue] Like '%' +@Event_Venue+ '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Event_Venue" PropertyName="Text" Type="String" DefaultValue ="%" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    </div>
</body>
</html>
