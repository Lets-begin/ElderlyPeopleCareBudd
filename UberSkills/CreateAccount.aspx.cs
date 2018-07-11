using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        string randomname = Guid.NewGuid().ToString().Substring(0, 16);
        protected void Page_Load(object sender, EventArgs e)
        {
            Random name = new Random();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (email_conflict() == true)
            { error_label.Text = "Email already Exist "; }

            else
            {
                string args = "{email:"+'"'+TextBox2.Text+'"'+",password:"+'"'+TextBox5.Text+'"'+",full_name:"+'"'+TextBox1.Text+'"'+"}";
                Page.ClientScript.RegisterStartupScript(Button1.GetType(), "test","createaccount("+args+");", true);
                string insertSQL;
                insertSQL = "INSERT INTO Member (Name, Email,Phone,dp,status, password,gender,age) VALUES (";
                insertSQL += "@Name, @Email,@Phone,@dp,@status,@password,@gender,@age)";


                SqlConnection con = new SqlConnection(Common.common.strcon);
                SqlCommand cmd = new SqlCommand(insertSQL, con);

                string filename = FileUploadControl.FileName;
                string filename1 =randomname + System.IO.Path.GetExtension(filename);

                if (FileUploadControl.HasFile)
                {
                    string[] acceptedExtensions = new string[] { ".png", ".jpg", ".jpeg" };
                    if (acceptedExtensions.Contains(System.IO.Path.GetExtension(filename)))
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 1048576)
                        {
                            if (File.Exists("~/dp/" + filename1) == true)
                            {
                                File.Delete("~/dp/" + filename1);
                            }
                            FileUploadControl.SaveAs((Server.MapPath("~/dp/") + filename1));
                            error_label.Text = "Upload status: File uploaded!";
                        }
                        else
                            error_label.Text = "Upload status: The file has to be less than 4 MB!";
                    }
                    else
                        error_label.Text = "this extension is not allowed";
                }

                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Email",TextBox2.Text);
                cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
                cmd.Parameters.AddWithValue("@dp", filename1);
                cmd.Parameters.AddWithValue("@status", TextBox4.Text);
                cmd.Parameters.AddWithValue("@password", TextBox5.Text);
                cmd.Parameters.AddWithValue("@gender",DropDownList1.Text);
                cmd.Parameters.AddWithValue("@age", TextBox8.Text);


                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    error_label.Text = "Account Created successfully";
                }
                catch (Exception err)
                {
                    error_label.Text = "Error occured while creating <br>account Please try after some time" + err;
                }
                finally
                {
                    con.Close();
                    
                }
            }

        }

        private bool email_conflict()
        {
            SqlConnection connection = new SqlConnection(Common.common.strcon);
			SqlCommand cmd = new SqlCommand("SELECT Name FROM Member WHERE Email = @Email", connection);
            cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
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