using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class Other_People_Need_Carebuddy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["userid"] == null)
            {
                Response.Redirect("~/LogIn.aspx");
            }

        }
    }
}