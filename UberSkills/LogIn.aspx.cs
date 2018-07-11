using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class LogIn : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                error_label.Text = "";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(Common.common.strcon);
            if (CheckForEmail() == false)
            {
                error_label.Text = "No Email-Id Exists, Please create account";
            }

            else
            {
                SqlCommand command = new SqlCommand("SELECT * FROM Member WHERE Email = @Email", connection);
                command.Parameters.AddWithValue("@Email", TextBox1.Text);

                try
                {
                SqlDataReader reader;
                connection.Open();
                reader = command.ExecuteReader();
                reader.Read();
                if (TextBox2.Text == (string)reader["password"])
                {
                    Session["userid"] = reader["Id"].ToString();
                    Session["email"] = reader["email"].ToString();
                    Session["password"] = reader["password"].ToString();
                    Session["name"] = reader["Name"].ToString();
                    Response.Redirect("~/UserArea.aspx");
                }
                else
                    error_label.Text = "password doesn't match";

                }
                catch (Exception err)
                {
                    error_label.Text = "Error occured while getting data<br>Please try after some time";
                }
                finally
                {
                    connection.Close();
                  
                }
            }
        }

        private bool CheckForEmail()
        {
            SqlConnection connection = new SqlConnection(Common.common.strcon);
            SqlCommand cmd = new SqlCommand("SELECT Email FROM Member WHERE Email = @Email", connection);
            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            connection.Open();
            string a = (string)cmd.ExecuteScalar();
            connection.Close();

            if (a == null)
                return false;

            else
                return true;
        }
    }
}