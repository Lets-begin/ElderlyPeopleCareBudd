using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class PreferenceSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((string)Session["userid"] == null)
            {
                Response.Redirect("~/LogIn.aspx");
            }
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection(Common.common.strcon);
                SqlCommand command = new SqlCommand("SELECT * FROM Patient WHERE Id = @Id", connection);
                command.Parameters.AddWithValue("@Id", (string)Session["userid"]);

                try
                {
                    SqlDataReader reader;
                    connection.Open();
                    reader = command.ExecuteReader();
                    reader.Read();
                    if (reader.HasRows == false)
                    {
                        error_label.Text = "Please Set Your Preferences";
                    }
                    else
                    {
                        DropDownList1.Text = (string)reader["genderpref"];
                        DropDownList1.Text = (string)reader["agepref"];
                        DropDownList1.Text = (string)reader["languagepref"];
                        DropDownList1.Text = (string)reader["locationpref"];
                    }

                }
                catch (Exception err)
                {
                    error_label.Text = "Error occured while getting data<br>Please try after some time" + err;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(Common.common.strcon);
            SqlCommand command = new SqlCommand("SELECT * FROM Patient WHERE Id = @Id", connection);
            command.Parameters.AddWithValue("@Id", (string)Session["userid"]);

            try
            {
                SqlDataReader reader;
                connection.Open();
                reader = command.ExecuteReader();
                reader.Read();
                
                if (reader.HasRows == false)
                {
                    connection.Close();
                    //CreateAccount method
                    string insertSQL;
                    insertSQL = "INSERT INTO Patient (id,genderpref,agepref,languagepref,locationpref) VALUES (";
                    insertSQL += "@Id,@genderpref,@agepref,@languagepref,@locationpref)";

                    SqlCommand insertcommand = new SqlCommand(insertSQL, connection);
                    insertcommand.Parameters.AddWithValue("@Id", Session["userid"]);
                   insertcommand.Parameters.AddWithValue("@genderpref", DropDownList1.Text);
                   insertcommand.Parameters.AddWithValue("@agepref", DropDownList2.Text);
                   insertcommand.Parameters.AddWithValue("@languagepref", DropDownList3.Text);
                   insertcommand.Parameters.AddWithValue("@locationpref", DropDownList4.Text);
                   connection.Open();
                    insertcommand.ExecuteNonQuery();
                    error_label.Text = "Preferences set successfully";
                    connection.Close();
                    
                }
                else
                {
                    connection.Close();
                    //UpdateAccount method
                    string updateSQL;
                    updateSQL = "UPDATE Patient Set genderpref=@genderpref,agepref=@agepref,";
                    updateSQL += "languagepref=@languagepref,locationpref=@locationpref where Id=@Id";
                  
                    SqlCommand updatecommand = new SqlCommand(updateSQL, connection);
                    updatecommand.Parameters.AddWithValue("@Id", Session["userid"]);
                    updatecommand.Parameters.AddWithValue("@genderpref", DropDownList1.Text);
                    updatecommand.Parameters.AddWithValue("@agepref", DropDownList2.Text);
                    updatecommand.Parameters.AddWithValue("@languagepref", DropDownList3.Text);
                    updatecommand.Parameters.AddWithValue("@locationpref", DropDownList4.Text);
                    connection.Open();
                    updatecommand.ExecuteNonQuery();
                    error_label.Text = "Preferences Updated successfully";
                    connection.Close();
                }

            }
            catch (Exception err)
            {
                error_label.Text = "Error occured while updating data<br>Please try after some time" + err;
            }

        }
    }
}