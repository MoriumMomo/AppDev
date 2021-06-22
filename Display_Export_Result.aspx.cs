using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace Sports_Management
{
    public partial class Display_Export_Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindgrid();
        }
        SqlConnection cn = new SqlConnection(@"Data Source=LAPTOP-H392JPKB\SQLEXPRESS;Initial Catalog=Sports Management;Integrated Security=True;");
        protected void bindgrid()
        {
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter("select Feature_Event, Event_Venue, Event_Date, Event_Description, World_Record from Events_Management", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            cn.Close();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content.disposition", string.Format("attachment;filename=(0)", "Event.docx"));
            Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document main ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            bindgrid();
            GridView1.HeaderRow.Style.Add("backgroud.color", "lightblue");
            for(int i=0;i<GridView1.HeaderRow.Cells.Count;i++)
            {
                GridView1.HeaderRow.Cells[i].Style.Add("background=color", "#df5015");
            }
            GridView1.RenderControl(hw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }
}