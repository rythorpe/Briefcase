using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class PathResolution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            char[] chs = { '.' };
            string[] strs = Request["ReturnUrl"].Split(chs);

            if(strs[1] == "Admin")
            {
                Response.Redirect(@"\DBEdit.aspx");
            }
            else if(strs[1] == "BillingUserLogin")
            {
                Guid btnViewGuid = Guid.Empty;
                Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
                Response.Redirect("~/BillingOnly/viewbilling.aspx?guid=" + btnViewGuid);
                //Response.Redirect(@"\viewbilling.aspx");
            }
            else
            {
                Response.Redirect(@"\disclaimer.aspx");
            }
        }
    }
}