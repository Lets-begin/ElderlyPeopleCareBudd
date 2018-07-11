using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class theme : System.Web.UI.MasterPage
    {
        //string sessionname = Common.common.sessionname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["name"] != null)
            {
                name.Text = (string)Session["name"];
                HiddenField2.Value = Session["email"].ToString();
                HiddenField3.Value = Session["password"].ToString();
            }
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Common.common.logout();
            Response.Redirect("~/LogIn.aspx");
        }
    }
}