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
    public partial class Events_Management : System.Web.UI.Page

       
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
            hfEventID.Value = "";
            txtFeature.Text = txtVenue.Text = txtDate.Text = txtStartTime.Text = txtEndTime.Text = txtDescription2.Text= txtRecord.Text = txtPosition.Text=txtMedal.Text= txtPhotoTags.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnAdd.Text = "Add";
            btnDelete.Enabled = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("Events_ManagementCreate", SqlConnection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@EventID", (hfEventID.Value == "" ? 0 : Convert.ToInt32(hfEventID.Value)));
            sqlCmd.Parameters.AddWithValue("@FeatureEvent", txtFeature.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventVenue", txtVenue.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventDate", txtDate.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventStartTime", txtStartTime.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventEndTime", txtEndTime.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventDescription", txtDescription2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@WorldRecord", txtRecord.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorPosition", txtPosition.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CompetitorMedal", txtMedal.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EventPhotoTags", txtPhotoTags.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            SqlConnection.Close();
            string Event_ID = hfEventID.Value;
            Clear();
            if (Event_ID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblErrorMessage.Text = "Unsccessful";
            FillGridView();

        }

        void FillGridView()
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Events_ManagementViewAll", SqlConnection);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            SqlConnection.Close();
            gvEventsManagement.DataSource = dtb1;
            gvEventsManagement.DataBind();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int Event_ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Events_ManagementViewByID", SqlConnection);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@EventID", Event_ID);
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            SqlConnection.Close();
            hfEventID.Value = Event_ID.ToString();
            txtFeature.Text = dtb1.Rows[0]["Feature_Event"].ToString();
            txtVenue.Text = dtb1.Rows[0]["Event_Venue"].ToString();
            txtDate.Text = dtb1.Rows[0]["Event_Date"].ToString();
            txtStartTime.Text = dtb1.Rows[0]["Event_Start_Time"].ToString();
            txtEndTime.Text = dtb1.Rows[0]["Event_End_Time"].ToString();
            txtDescription2.Text = dtb1.Rows[0]["Event_Description"].ToString();
            txtRecord.Text = dtb1.Rows[0]["World_Record"].ToString();
            txtPosition.Text = dtb1.Rows[0]["Competitor_Position"].ToString();
            txtMedal.Text = dtb1.Rows[0]["Competitor_Medal"].ToString();
            txtPhotoTags.Text = dtb1.Rows[0]["Event_Photo_Tags"].ToString();
            //btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (SqlConnection.State == ConnectionState.Closed)
                SqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("Events_ManagementDeleteByID", SqlConnection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@EventID", Convert.ToInt32(hfEventID.Value));
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
                    FileUpload1.SaveAs(Server.MapPath("~/Event_Photo/" + FileUpload1.FileName));
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