using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class viewdetail : System.Web.UI.Page
    {
        ContractDirectory codi = new ContractDirectory();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Guid myguid = Guid.Empty;
            //if (Guid.TryParse(Request.QueryString["GUID"], out myguid))
            //{/*myguid = new Guid(Request.QueryString["GUID"]);*/
            //    if (myguid != null)
            //    {
            //        GetData(myguid);
            //        viewGUID.Text = myguid.ToString();
            //        //viewGUID2.Text = parameterGuid                                        
            //    }
            //    else
            //    {
            //        phNoViewDetail.Visible = true;
            //        phViewDetail.Visible = false;
            //    }
            //}
        }

        protected void GetData(Guid myguid)
        {
            // Legacy detail view; Uncomment to allow view
            //phViewDetail.Visible = true;
            codi.GetContractViewGuid(myguid);
            lblCName.Text = codi.Contract_Name.ToString();
            lblCParent.Text = codi.Contract_Parent.ToString();
            lblCType.Text = codi.Contract_Type.ToString();
            lblCFC.Text = codi.Contract_FC.ToString();
            lblCStatus.Text = codi.Contract_Status.ToString();
            lblEffDate.Text = codi.Contract_EffectiveDate.ToString();
            lblTermDate.Text = codi.Contract_TerminateDate.ToString();
            lblUpdDate.Text = codi.Contract_UpdateDate.ToString();
            lblCPhone.Text = codi.Contract_Phone.ToString();
            lblCWeb.Text = codi.Contract_Homepage.ToString();
            lblOffice.Text = codi.SVC_OfficeVisits.ToString();
            lblSX.Text = codi.SVC_SX.ToString();
            lblXray.Text = codi.SVC_Radiology.ToString();
            lblPT.Text = codi.SVC_PT.ToString();
            lblOT.Text = codi.SVC_OT.ToString();
            lblPainMgmt.Text = codi.SVC_PainMgmt.ToString();
            lblPodiatry.Text = codi.SVC_Podiatry.ToString();
            lblDME.Text = codi.SVC_DME.ToString();
            lblInject.Text = codi.SVC_Injections.ToString();
            lblDrug.Text = codi.SVC_Injectibles.ToString();
            lblPDF.Text = codi.Contract_PDF.ToString();
        }

        // viewdetail page view submenu button methods
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
            Response.Redirect("~/PlaceholderPage.aspx?guid=" + btnViewGuid);
        }
    }
}