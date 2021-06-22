using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data; 

namespace Sports_Management
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=LAPTOP-H392JPKB\SQLEXPRESS;Initial Catalog=Sports Management;Integrated Security=True;"))
            {
                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM AdminLogin WHERE UserEmail=@UserEmail AND UserPassword=@UserPassword";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@UserEmail", txtUserEmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["UserEmail"] = txtUserEmail.Text.Trim();
                    Response.Redirect("Games Management.aspx");
                }
                else { lblErrorMessage.Visible = true; }
            }
        }
    }
}