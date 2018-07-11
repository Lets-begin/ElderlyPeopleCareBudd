using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace UberSkills.Common
{
    public class common
    {
        static public string strcon = ConfigurationManager.ConnectionStrings["uberdbstring"].ConnectionString;
        //static public string sessionid =getuserid();
        //static public string sessionname=getusername();
        //static public string strcon=getconnstring();

        //static public string getuserid()
        //{
        //    return HttpContext.Current.Session["userid"].ToString();
        //}
        //static public string getusername()
        //{
        //    return HttpContext.Current.Session["name"].ToString();
        //}
        //static public string getconnstring()
        //{
        //    return strcon = ConfigurationManager.ConnectionStrings["uberdbstring"].ConnectionString; 
        //}

        static public bool isauthenticated()
        {
            if (HttpContext.Current.Session["userid"].ToString() != null)
                return true;
            else
                return false;
        }

        static public void logout()
        {
            HttpContext.Current.Session.Abandon();


        }
    }
}