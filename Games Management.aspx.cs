using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace Sports_Management
{
    public partial class Games_Management : System.Web.UI.Page
    {
        SqlConnection sqlCON = new SqlConnection(@"Data Source=LAPTOP-H392JPKB\SQLEXPRESS;Initial Catalog=Sports Management;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            hfGameID.Value = "";
            txtCode.Text = txtName.Text = txtDurationInHours.Text = txtDescription.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnAdd.Text = "Add";
            btnDelete.Enabled = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (sqlCON.State == ConnectionState.Closed)
                sqlCON.Open();
            SqlCommand sqlCmd = new SqlCommand("Games_ManagementCreateOrUpdate",sqlCON);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Game_ID",(hfGameID.Value==""?0:Convert.ToInt32(hfGameID.Value)));
            sqlCmd.Parameters.AddWithValue("@Game_Code",txtCode.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Game_Name",txtName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Game_DurationInHours",txtDurationInHours.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Game_Description",txtDescription.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlCON.Close();
            string GameID = hfGameID.Value;
            Clear();
            if (GameID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();

        }

        void FillGridView()
        {
            if (sqlCON.State == ConnectionState.Closed)
                sqlCON.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Games_ManagementViewAll", sqlCON);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            sqlCON.Close();
            gvGamesManagement.DataSource = dtb1;
            gvGamesManagement.DataBind();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int GameID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCON.State == ConnectionState.Closed)
                sqlCON.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Games_ManagementViewByID", sqlCON);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@Game_ID", GameID);
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            sqlCON.Close();
            hfGameID.Value = GameID.ToString();
            txtCode.Text = dtb1.Rows[0]["Game_Code"].ToString();
            txtName.Text = dtb1.Rows[0]["Game_Name"].ToString();
            txtDurationInHours.Text = dtb1.Rows[0]["Game_DurationInHours"].ToString();
            txtDescription.Text = dtb1.Rows[0]["Game_Description"].ToString();
            btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCON.State == ConnectionState.Closed)
                sqlCON.Open();
            SqlCommand sqlCmd = new SqlCommand("Games_ManagementDeleteByID", sqlCON);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Game_ID", Convert.ToInt32(hfGameID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCON.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileextension.ToLower() != ".pdf" && fileextension.ToLower() != ".docx")
                {

                    lbl.Text = "Allows only .pdf and .doc";
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/RulesBooklet/" + FileUpload1.FileName));
                    lbl.Text = "Uploaded files successfully";
                }
            }

            else
            {
                lbl.Text = "No files found";
            }
        }
    }
}