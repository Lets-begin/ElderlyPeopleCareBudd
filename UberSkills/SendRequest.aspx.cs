using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class SendRequest : System.Web.UI.Page
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
            sendreqSQL = "INSERT INTO request (Id,title,description,date) VALUES (";
            sendreqSQL += "@Id,@title,@description,@date)";


            SqlConnection con = new SqlConnection(Common.common.strcon);
            SqlCommand cmd = new SqlCommand(sendreqSQL, con);

            cmd.Parameters.AddWithValue("@Id", (String)Session["userid"]);
            cmd.Parameters.AddWithValue("@title", TextBox1.Text);
            cmd.Parameters.AddWithValue("@description", TextBox2.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToShortDateString());


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                error_label.Text = "Request Created successfully";
            }
            catch (Exception err)
            {
                error_label.Text = "Error occured while sending request <br>account Please try after some time" + err;
            }
            finally
            {
                con.Close();
            }
        }
    }
}