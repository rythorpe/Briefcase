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
    public partial class DBEdit : System.Web.UI.Page
    {
        // Page load with postback test. Temporary placeholders.
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

        // Triggered on 'Select' button. Pops up detailed view dialogue.
        protected void ChangeSelectedIndex(object sender, EventArgs e)
        {
            int viewPage = GridView1.PageIndex * 10;
            DetailsView1.Visible = true;
            int viewIndex = GridView1.SelectedIndex;
            int DetailIndex = viewPage + viewIndex;
            DetailsView1.PageIndex = DetailIndex;
            StatusLabel1.Text = "Detailed View enabled.";
            StatusLabel1.Visible = true;
        }

        // Debug trigger. Not currently used.
        protected void ChangingSelectedIndex(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow viewIndex = GridView1.Rows[e.NewSelectedIndex];
            StatusLabel1.Text = "The changing trigger was tripped + viewIndex.Cells[2].Text";
        }        
    }
}