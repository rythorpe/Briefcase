using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        ContractDirectory codi = new ContractDirectory();
        protected void Page_Load(object sender, EventArgs e)
        {

        //    /*if (!this.IsPostBack)
        //    {
        //    I don't know what this might be for
        //    }*/
        }

        protected void btnSearch_Click(object s, EventArgs e)
        {
            if (IsValid)
            {
                List<ContractDirectory> contracts = codi.GetContractView(txtName.Text);
                TogglePHVisibility();
                rpContractSearchView.DataSource = contracts;
                rpContractSearchView.DataBind();
            }
        }

        protected void TogglePHVisibility()
        {
            phContractSearch.Visible = true;
            phNoContractFound.Visible = false;
        }

        protected void FailedSearch()
        {
            phContractSearch.Visible = false;
            phNoContractFound.Visible = true;
        }

        /*private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdaptersda = new SqlDataAdapter())
                    {
                        cmd.CommandType = SqlDataSourceCommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        } */
    }
}