using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // Added for auth module
using System.Configuration; // Added for auth module
using System.Data.SqlClient; // Added for auth module
using System.Web.Security; // Added for auth module

namespace AOBriefcase
{
    public partial class viewbilling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Should detect if user is signed in. Otherwise, user is redirected to login page.
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!Page.IsPostBack)
            {
                Response.Write("User Authenticated");
            }
            else
            {
                Response.Write("");
            }
        }

        protected void btnSub1_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewdetail.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub2_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewcredentialing.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub3_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewauthreq.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub4_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/BillingOnly/viewbilling.aspx?guid=" + btnViewGuid);
        }        
    }
}