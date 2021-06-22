<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login Home.aspx.cs" Inherits="Sports_Management.Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sports Management System</title>
<style>
.myDiv {
  border: 1px outset black;
  background-color: lightblue;    
  text-align: left;
   padding-top: 50px;
  padding-right: 100px;
  padding-bottom: 50px;
  padding-left: 200px;
    margin-top: 100px;
  margin-bottom: 100px;
  margin-right: 400px;
  margin-left: 400px;
}


ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: lightskyblue;

}

li a {
  display: block;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
  text-align:center;
  font-size: 16px;
  font-weight:bold;
  border: 1px outset black;
}

/* Change the link color on hover */
li a:hover {
  background-color: #555;
  color: white;
}
</style>
</head>
<body style="background-color: gray ">
    <br />
    <br />
    <br />
    <br />
    <br />
<div class="myDiv">
<h2>Sports Management System</h2>

<ul>
  <li><a href="AdminLogin.aspx">Admin Login</a></li>
  <li><a href="Event Manager.aspx">Event Manager Login</a></li>
  
</ul>

		
			
</div>

</body>
</html>
