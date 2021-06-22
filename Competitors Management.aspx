<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Competitors Management.aspx.cs" Inherits="Sports_Management.Competitors_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Competitors Management</title>
    <style>
.myDiv {
  border: 1px outset black;
  background-color: lightblue;    
  text-align: left;
   padding-top: 50px;
  padding-right: 0px;
  padding-bottom: 30px;
  padding-left: 100px;
  width:1600px;

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
<h2>Competitors Management </h2>
<ul>
    <li><a class="active" href="Games Management.aspx">Games Management</a></li>
    <li><a href="Competitors Management.aspx">Competitor Management</a></li>
    <li><a href="Login Home.aspx">Login</a></li>
</ul>
<br />
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfCompetitorID" runat="server" />

            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Competitor Salutation"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtSalutation" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSalutation" ErrorMessage="Cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Competitor Name"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtName1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName1" ErrorMessage="Competitor Name cannot be blank"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Competitor Date of Birth"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDoB" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDoB" ErrorMessage="Date of Birth is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Competitor Email"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email should be in correct format" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Competitor Description"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription1" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescription1" ErrorMessage="This feild cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Competitor Country"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCountry" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCountry" ErrorMessage="This feild cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Competitor Gender"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtGender" runat="server"  Width="73px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvGender" runat="server" ControlToValidate="txtGender"  ErrorMessage="Gender can only 'Male' or 'Female'" ValidationExpression="^(Female|Male)$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Competitor Contact No"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtContactNo" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtContactNo" ErrorMessage=" Cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Competitor Website"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtWebsite" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:Label ID="Label10" runat="server" Text="Optional"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl" runat="server" Text="Competitor Photo"></asp:Label>
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
            <asp:GridView ID="gvCompetitorsManagement" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Competitor_ID" HeaderText="CompetitorID" />
                    <asp:BoundField DataField="Competitor_Salutation" HeaderText="GameSalutation" />
                    <asp:BoundField DataField="Competitor_Name" HeaderText="CompetitorName" />
                    <asp:BoundField DataField="Competitor_DoB" HeaderText="CompetitorDoB" />
                    <asp:BoundField DataField="Competitor_Email" HeaderText="CompetitorEmail" />
                    <asp:BoundField DataField="Competitor_Description" HeaderText="CompetitorDescription" />
                    <asp:BoundField DataField="Competitor_Country" HeaderText="CompetitorCountry" />
                    <asp:BoundField DataField="Competitor_Gender" HeaderText="CompetitorGender" />
                    <asp:BoundField DataField="Competitor_ContactNo" HeaderText="CompetitorContactNo" />
                    <asp:BoundField DataField="Competitor_Website" HeaderText="CompetitorWebsite" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("Competitor_ID") %>' CausesValidation="false" OnClick="lnk_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
        </div>
</body>
</html>
