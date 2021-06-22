<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games Management.aspx.cs" Inherits="Sports_Management.Games_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Game Management System</title>
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
<h2>Games Management </h2>
<ul>
   <li><a class="active" href="Games Management.aspx">Games Management</a></li>
   <li><a href="Competitors Management.aspx">Competitor Management</a></li>
   <li><a href="Login Home.aspx">Login</a></li>
</ul>
<br />

    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfGameID" runat="server" />

            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Game Code"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCode" runat="server" ControlToValidate="txtCode" Display="Static" ErrorMessage="Game Code would be 7 char_4 uppercase_3 digit" ValidationExpression="^(?=.*[A-Z]){4}(?=.*\d){3}[A-Z\d]{7,}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Game Name"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Game Name cannot be blank"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Game Duration"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDurationInHours" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDurationInHours" ErrorMessage="Game Duration cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Game Description"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDescription" ErrorMessage="Game Description cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl" runat="server" Text="Rules Booklet"></asp:Label>
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
            <asp:GridView ID="gvGamesManagement" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Game_ID" HeaderText="GameID" />
                    <asp:BoundField DataField="Game_Code" HeaderText="GameCode" />
                    <asp:BoundField DataField="Game_Name" HeaderText="GameName" />
                    <asp:BoundField DataField="Game_DurationInHours" HeaderText="GameDurationInHours" />
                    <asp:BoundField DataField="Game_Description" HeaderText="GameDescription" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("Game_ID") %>' CausesValidation="false" OnClick="lnk_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
    </div>
</body>
</html>
