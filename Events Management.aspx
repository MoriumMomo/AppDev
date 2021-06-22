<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events Management.aspx.cs" Inherits="Sports_Management.Events_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events Management</title>
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
<h2>Events Management </h2>
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
            <asp:HiddenField ID="hfEventID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Feature Event"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtFeature" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFeature" ErrorMessage="Cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Event Venue"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtVenue" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVenue" ErrorMessage=" cannot be blank"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Event Date"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvDate" runat="server" ControlToValidate="txtDate" ValidationExpression="^((?:0[0-9])|(?:[1-2][0-9])|(?:3[0-1]))/((?:0[1-9])|(?:1[0-2]))/((?:19|20)\d{2})$" ErrorMessage="DD/MM/YYYY" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Event Start Time"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtStartTime" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvStartTime" runat="server" ControlToValidate="txtStartTime" ValidationExpression="^(?:[01]?\d|2[0-3])(?::[0-5]\d){1,2}$" ErrorMessage="24:00" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Event End Time"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEndTime" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvEndTime" runat="server" ControlToValidate="txtEndTime"  ValidationExpression="^(?:[01]?\d|2[0-3])(?::[0-5]\d){1,2}$" ErrorMessage="24:00" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Event Description"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription2" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDescription2" ErrorMessage="Cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="World Record"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtRecord" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvRecord" runat="server" ControlToValidate="txtRecord" ErrorMessage="You can only put Y for 'YES' & N for 'NO'" ValidationExpression="^(Y|N)$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Competitor Position"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPosition" runat="server"  ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPosition" ErrorMessage="Cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Competitor Medal"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtMedal" runat="server"  ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvMedal" runat="server" ControlToValidate="txtMedal" ErrorMessage="Put G for 'GOLD' & S for 'SILVER' & B for 'BRONZE'" ValidationExpression="^(G|S|B)$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                       <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Event Photo Tags"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPhotoTags" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhotoTags" ErrorMessage="This feild cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl" runat="server" Text="Event Photo"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="btn1" runat="server" Text="Upload" OnClick="btn1_Click" />
                  
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"  />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                         <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                         
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                   
            </table>
            <br />
            <asp:GridView ID="gvEventsManagement" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Event_ID" HeaderText="EventID" />
                    <asp:BoundField DataField="Feature_Event" HeaderText="FeatureEvent" />
                    <asp:BoundField DataField="Event_Venue" HeaderText="EventVenue" />
                    <asp:BoundField DataField="Event_Date" HeaderText="EventDate" />
                    <asp:BoundField DataField="Event_Start_Time" HeaderText="EventStartTime" />
                    <asp:BoundField DataField="Event_End_Time" HeaderText="EventEndTime" />
                    <asp:BoundField DataField="World_Record" HeaderText="WorldRecord" />
                    <asp:BoundField DataField="Competitor_Position" HeaderText="CompetitorPosition" />
                    <asp:BoundField DataField="Competitor_Medal" HeaderText="CompetitorMedal" />
                    <asp:BoundField DataField="Event_Photo_Tags" HeaderText="EventPhotoTags" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("Event_ID") %>' CausesValidation="false" OnClick="lnk_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </form>
    </div>
</body>
</html>
