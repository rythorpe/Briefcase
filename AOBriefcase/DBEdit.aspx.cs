﻿using System;
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
        /// <summary>
        /// Page load with postback test. Temporary placeholders. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
               
        /// <summary>
        /// Triggered on 'Select' button. Pops up detailed view dialogue. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ChangeSelectedIndex(object sender, EventArgs e)
        {
            int viewPage = GridView1.PageIndex * 10;
            DetailsView1.Visible = true;
            int viewIndex = GridView1.SelectedIndex;
            int DetailIndex = viewPage + viewIndex;
            DetailsView1.PageIndex = DetailIndex;
            StatusLabel1.Text = "Detailed View enabled.";
            StatusLabel1.Visible = true;
            btnEditCred.Visible = true;
        }

        /// <summary>
        /// Button to change contract editing interface to provider credentialing 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditCred_Click(object sender, EventArgs e)
        {
            btnEditCred.Visible = false;
            DetailsView1.Visible = false;
            GridView2.Visible = true;
            btnEditCont.Visible = true;
        }
        
        /// <summary>
        /// Button to return back to contract detail editing from credentialing 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditCont_Click(object sender, EventArgs e)
        {
            btnEditCred.Visible = true;
            DetailsView1.Visible = true;
            btnEditCont.Visible = false;
            GridView2.Visible = false;
        }
                
        /// <summary>
        /// Debug trigger. Not currently used. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ChangingSelectedIndex(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow viewIndex = GridView1.Rows[e.NewSelectedIndex];
            StatusLabel1.Text = "The changing trigger was tripped + viewIndex.Cells[2].Text";
        }
        
        protected void DV1_AttachmentCheck(object sender, GridViewRowEventArgs e)
        {
            var lbtnContract_PDF = (LinkButton)e.Row.FindControl("lbtnContract_PDF");
            var fileU_Contract_PDF = (FileUpload)e.Row.FindControl("fileU_Contract_PDF");
            var btnContract_PDFUpload = (Button)e.Row.FindControl("btnContract_PDFUpload");

            if(lbtnContract_PDF == null)
            {
                lbtnContract_PDF.Visible = false;
                fileU_Contract_PDF.Visible = true;
                btnContract_PDFUpload.Visible = true;
            }
            else
            {
                lbtnContract_PDF.Visible = true;
                fileU_Contract_PDF.Visible = false;
                btnContract_PDFUpload.Visible = false;
            }
            //var lbtnContract_PDF = (LinkButton)e.Row.FindControl("lbtnContract_PDF");
            //var lbtnContract_PDFUpload = (LinkButton)e.Row.FindControl("lbtnContract_PDFUpload");
            //if (lbtnContract_PDF != null)                
            //{
            //    lbtnContract_PDF.Visible = true;
            //    lbtnContract_PDFUpload.Visible = false;
            //}
            //else
            //{
            //    lbtnContract_PDF.Visible = false;
            //    lbtnContract_PDFUpload.Visible = true;
            //}
        }


        protected void btnContract_PDFUpload_Click(object sender, GridViewRowEventArgs e)
        {
            var fileU_Contract_PDF = (FileUpload)e.Row.FindControl("fileU_Contract_PDF");

            if (fileU_Contract_PDF.HasFile)
            {
                fileU_Contract_PDF.PostedFile.SaveAs(Server.MapPath("~/App_Data/Attachments/Authorizations/") + fileU_Contract_PDF.FileName);
            }
        }

    }
}