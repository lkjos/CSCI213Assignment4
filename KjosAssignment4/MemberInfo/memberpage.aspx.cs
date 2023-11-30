using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KjosAssignment4.MemberInfo
{
    public partial class memberpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Home.aspx", true);
        }
    }
}