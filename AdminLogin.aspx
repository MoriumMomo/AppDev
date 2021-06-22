<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Sports_Management.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-color:lightblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table style="margin:auto;border:5px solid white">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Admin Login"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="UserEmail"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUserEmail" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="UserPassword"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUserPassword" runat="server" TextMode="password"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    </td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect Admin Credentials" ForeColor="Red"></asp:Label></td>
            </tr>

        </table>
         

        </div>
    </form>
</body>
</html>
