using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class DBEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangeSelectedIndex(object sender, EventArgs e)
        {
            int viewPage = GridView1.PageIndex * 10;
            DetailsView1.Visible = true;
            int viewIndex = GridView1.SelectedIndex;
            int DetailIndex = viewPage + viewIndex;
            DetailsView1.PageIndex = DetailIndex;
            StatusLabel1.Text = "You tripped the changed trigger";
        }

        protected void ChangingSelectedIndex(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow viewIndex = GridView1.Rows[e.NewSelectedIndex];
            StatusLabel1.Text = "The changing trigger was tripped + viewIndex.Cells[2].Text";
        }
    }
}