using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UberSkills
{
    public partial class UserArea : System.Web.UI.Page
    {
        //string name = Common.common.sessionname;
        //string id = Common.common.sessionid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["userid"] == null)
            {
                Response.Redirect("~/LogIn.aspx");
            }
            //if (!IsPostBack)
            //{
            //    string args = "{email:" + '"' + Session["email"].ToString() + '"' + ",password:" + '"' + Session["password"].ToString() + '"' + "}";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "loginaccount(" + args + ");", true);
               
            //}

            //HiddenField1.Value = "opponent_id";
            

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (HiddenField1.Value != null)
        //    {
        //        string args = "{opponent_id:" + '"' + HiddenField1.Value + '"' + "}";
        //        Page.ClientScript.RegisterStartupScript(Button1.GetType(), "test", "sendMessageButton(" + args + ");", true);
        //    }
        //}

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    string arg = "{email:" + '"' + Session["email"].ToString() + '"' + ",password:" + '"' + Session["password"].ToString() + '"' + ",jid:" + '"' + TextBox4.Text + '"' + "}";
        //    Page.ClientScript.RegisterStartupScript(Button2.GetType(), "test", "addroster(" + arg + ");", true);
        //}
    }
}