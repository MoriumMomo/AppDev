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
    public partial class Competitors_Management : System.Web.UI.Page
    {
        SqlConnection SqlConnection = new SqlConnection(@"Data Source=LAPTOP-H392JPKB\SQLEXPRESS;Initial Catalog=Sports Management;Integrated Security=True;");
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
            hfCompetitorID.Value = "";
            txtSalutation.Text = txtName1.Text = txtDoB.Text = txtEmail.Text = txtDescription1.Text = txtCountry.Text = txtGender.Text = txtContactNo.Text = txtWebsite.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnAdd.Text = "Add";
            btnDelete.Enabled = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("Competitors_ManagementCreateOrUpdate", SqlConnection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CompetitorID", (hfCompetitorID.Value == "" ? 0 : Convert.ToInt32(hfCompetitorID.Value)));
            sqlCmd.Parameters.AddWithValue("@CompetitorSalutation", txtSalutation.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorName", txtName1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorDoB", txtDoB.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorEmail", txtEmail.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorDescription", txtDescription1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorCountry", txtCountry.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorGender", txtGender.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorContactNo", txtContactNo.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorWebsite", txtWebsite.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            SqlConnection.Close();
            string Competitor_ID = hfCompetitorID.Value;
            Clear();
            if (Competitor_ID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();

        }

        void FillGridView()
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Competitors_ManagementViewAll", SqlConnection);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            SqlConnection.Close();
            gvCompetitorsManagement.DataSource = dtb1;
            gvCompetitorsManagement.DataBind();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int Competitor_ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Competitors_ManagementViewByID", SqlConnection);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@CompetitorID", Competitor_ID);
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            SqlConnection.Close();
            hfCompetitorID.Value = Competitor_ID.ToString();
            txtSalutation.Text = dtb1.Rows[0]["Competitor_Salutation"].ToString();
            txtName1.Text = dtb1.Rows[0]["Competitor_Name"].ToString();
            txtDoB.Text = dtb1.Rows[0]["Competitor_DoB"].ToString();
            txtEmail.Text = dtb1.Rows[0]["Competitor_Email"].ToString();
            txtDescription1.Text = dtb1.Rows[0]["Competitor_Description"].ToString();
            txtCountry.Text = dtb1.Rows[0]["Competitor_Country"].ToString();
            txtGender.Text = dtb1.Rows[0]["Competitor_Gender"].ToString();
            txtContactNo.Text = dtb1.Rows[0]["Competitor_ContactNo"].ToString();
            txtWebsite.Text = dtb1.Rows[0]["Competitor_Website"].ToString();
            btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("Competitors_ManagementDeleteByID", SqlConnection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CompetitorID", Convert.ToInt32(hfCompetitorID.Value));
            sqlCmd.ExecuteNonQuery();
            SqlConnection.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
                {

                    lbl.Text = "Allows only .jpeg and .png";
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Competitor_Photo/" + FileUpload1.FileName));
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