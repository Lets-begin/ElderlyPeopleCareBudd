using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class DetailRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["userid"] == null)
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sendreqSQL;
            sendreqSQL = "INSERT INTO answer (Id,reqid,description,date) VALUES (";
            sendreqSQL += "@Id,@reqid,@description,@date)";


            SqlConnection con = new SqlConnection(Common.common.strcon);
            SqlCommand cmd = new SqlCommand(sendreqSQL, con);

            cmd.Parameters.AddWithValue("@Id", (String)Session["userid"]);
            cmd.Parameters.AddWithValue("@reqid", Request.QueryString["reqid"]);
            cmd.Parameters.AddWithValue("@description", TextBox1.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToShortDateString());


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                error_label.Text = "Comment Submitted successfully";
            }
            catch (Exception err)
            {
                error_label.Text = "Error occured while sending comment <br>account Please try after some time" + err;
            }
            finally
            {
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}