using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AOBriefcase
{
    public partial class AttachmentInterface : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                        
        }

        protected void btnAuthUpload_Click(object sender, EventArgs e)
        {
            if (AuthUpload1.HasFile)
            {
                string fileName = Path.GetFileName(AuthUpload1.PostedFile.FileName);
                string AuthMapPath = "~/App_Data/Attachments/Authorizations/";                
                AuthUpload1.PostedFile.SaveAs(Server.MapPath(AuthMapPath) + fileName);
                InsertAuthFilepath(fileName);                
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void btnBillUpload_Click(object sender, EventArgs e)
        {
            if (BillUpload1.HasFile)
            {
                string fileName = Path.GetFileName(BillUpload1.PostedFile.FileName);
                string BillMapPath = "~/App_Data/Attachments/Billing/";
                BillUpload1.PostedFile.SaveAs(Server.MapPath(BillMapPath) + fileName);
                InsertBillFilepath(fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void IndexSelected(object sender, EventArgs e)
        {
            AuthDoc.Visible = true;
            BillDoc.Visible = true;
        }
               

        private void InsertAuthFilepath(string filepath)
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());
            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateAuthFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.Int);
                param.Value = filepath;
                ChosenIndex.Value = GridView1.SelectedIndex + 1;                
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                string msg = "Error when inserting filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        private void InsertBillFilepath(string filepath)
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());
            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateBillFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.Int);
                param.Value = filepath;
                ChosenIndex.Value = GridView1.SelectedIndex + 1;
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Error when inserting filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        private string GetConnection()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

    }

    
}