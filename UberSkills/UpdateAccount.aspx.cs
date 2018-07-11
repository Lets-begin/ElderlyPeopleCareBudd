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
    public partial class UpdateAccount : System.Web.UI.Page
    {
        //string userid = Common.common.sessionname;
        protected void Page_Load(object sender, EventArgs e)
        {


            if ((string)Session["userid"] == null)
            {
                Response.Redirect("~/LogIn.aspx");
            }
            if (IsPostBack)
            {
                //SqlConnection connection = new SqlConnection(Common.common.strcon);
                //SqlCommand command = new SqlCommand("SELECT dp FROM Member WHERE Id = @Id", connection);
                //command.Parameters.AddWithValue("@Id", (string)Session["userid"]);

                //SqlDataReader reader;
                //connection.Open();
                //reader = command.ExecuteReader();
                //reader.Read();
                //string url = "~/dp/" + reader["dp"];
                //Image1.ImageUrl = url;
               
                error_label.Text = "";


            }
            if (!IsPostBack)
            {
                if ((string)Session["newpassword"] != null)
                {
                    string args = "{email:" + '"' + Session["email"].ToString() + '"' + ",password:" + '"' + Session["password"].ToString() + '"' + ",newpassword:" + '"' + Session["newpassword"].ToString() + '"' + ",name:" + '"' + Session["name"].ToString() + '"' + "}";
                    Page.ClientScript.RegisterStartupScript(Button1.GetType(), "test", "accountupdate(" + args + ");", true);
                }
                SqlConnection connection = new SqlConnection(Common.common.strcon);
                SqlCommand command = new SqlCommand("SELECT * FROM Member WHERE Id = @Id", connection);
                command.Parameters.AddWithValue("@Id", (string)Session["userid"]);

                try
                {
                    SqlDataReader reader;
                    connection.Open();
                    reader = command.ExecuteReader();
                    reader.Read();
                    string url = "~/dp/" + reader["dp"];
                    Image1.ImageUrl = url;
                    TextBox1.Text = (string)reader["Name"];
                    Label11.Text = (string)reader["Email"];
                    TextBox3.Text = (string)reader["Phone"];
                    TextBox4.Text = (string)reader["status"];
                    TextBox5.Text = (string)reader["password"];
                    DropDownList1.Text = (string)reader["gender"];
                    TextBox8.Text = (string)reader["age"];

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
           

            //if (email_conflict() == true)
            //{ error_label.Text = "Email already Exist "; }

            //else
            //{

            string insertSQL;
            insertSQL = "UPDATE Member Set Name=@Name,Phone=@Phone,";
            insertSQL += "dp=@dp,status=@status,password=@password,gender=@gender,age=@age where Id=@Id";


            SqlConnection con = new SqlConnection(Common.common.strcon);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            string filename = FileUploadControl.FileName;
            string filename1 = (string)Session["userid"] + System.IO.Path.GetExtension(filename);

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

            else
            {

                SqlCommand command = new SqlCommand("SELECT dp FROM Member WHERE Id = @Id", con);
                command.Parameters.AddWithValue("@Id", (string)Session["userid"]);
                SqlDataReader reader;
                con.Open();
                reader = command.ExecuteReader();
                reader.Read();
                filename1 = (string)reader["dp"];
                con.Close();
            }


            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
            //cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
            cmd.Parameters.AddWithValue("@dp", filename1);
            cmd.Parameters.AddWithValue("@status", TextBox4.Text);
            cmd.Parameters.AddWithValue("@password", TextBox5.Text);
            cmd.Parameters.AddWithValue("@gender", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@age", TextBox8.Text);
            cmd.Parameters.AddWithValue("@Id", (string)Session["userid"]);
            Session["newpassword"] = TextBox5.Text;
            Session["name"] = TextBox1.Text;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

                error_label.Text = "Account Updated successfully";

            }
            catch (Exception err)
            {
                error_label.Text = "Error occured while updating <br>account Please try after some time" + err;
            }
            finally
            {
                con.Close();
                Response.Redirect(Request.RawUrl);

            }
        }



        //}

        //private bool email_conflict()
        //{
        //    SqlConnection connection = new SqlConnection(Common.common.strcon);
        //    SqlCommand cmd = new SqlCommand("SELECT Name FROM Member WHERE Email = @Email", connection);
        //    cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
        //    connection.Open();
        //    string a = (string)cmd.ExecuteScalar();
        //    connection.Close();

        //    if (a == null)
        //        return false;

        //    else
        //        return true;
        //}
    }
}