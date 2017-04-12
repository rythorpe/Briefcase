using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace AOBriefcase
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.Page.User.Identity.IsAuthenticated)
            //{
            //    FormsAuthentication.RedirectToLoginPage();
            //}
        }

        protected void ValidateUser(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["DemographicsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_Admin"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", Login1.UserName);
                    cmd.Parameters.AddWithValue("@Password", Login1.Password);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        Login1.FailureText = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        Login1.FailureText = "Exception catch - authentication issue.";
                        break;
                  // Use additional cases to debug login issues
                  //  case 1:
                  //      Login1.FailureText = "userId returned 1";
                  //      break;
                  //  case 0:
                  //      Login1.FailureText = "userId returned 0";
                  //      break;
                    default:
                        AttachRoleToUser();
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                        break;
                }
            }            
        }

        protected void AuthenticationRequest(Object sender, EventArgs e)
        {
            AttachRoleToUser();
        }

        private void AttachRoleToUser()
        {
            if (Context.Request.IsAuthenticated)
            {
                // Retrive user's information from context user (case for if user is already logged in somehow)
                FormsIdentity ident = (FormsIdentity)Context.User.Identity;

                // Pull role information from auth ticket
                string[] roles = ident.Ticket.UserData.Split('|');

                // Load roles?
                if (roles[0].Length == 0)
                {
                    // Hits database
                    roles = FetchRoles();
                }

                // Store roles inside the Forms ticket.
                FormsAuthenticationTicket newticket = new FormsAuthenticationTicket(ident.Ticket.Version, ident.Ticket.Name, ident.Ticket.IssueDate, ident.Ticket.Expiration, ident.Ticket.IsPersistent, String.Join("|", roles), ident.Ticket.CookiePath);

                // Create auth cookie.
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(newticket));
                authCookie.Path = FormsAuthentication.FormsCookiePath + "; HttpOnly; noScriptAccess";
                authCookie.Secure = FormsAuthentication.RequireSSL;

                if (newticket.IsPersistent)
                {
                    authCookie.Expires = newticket.Expiration;
                    Context.Response.Cookies.Add(authCookie);
                }

                // Create principal? and attach to user.
                Context.User = new System.Security.Principal.GenericPrincipal(ident, roles);
            }
        }

        private string[] FetchRoles()
        {
            // Fetch roles from database.
            ArrayList roleList = new ArrayList();
            SqlDataReader objRdr = null;

            SqlConnection objCon = new SqlConnection("DemographicsConnectionString");
            SqlCommand objCmd = new SqlCommand("spRoles", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.Parameters.AddWithValue("@Username", User.Identity.Name.ToString());
            try
            {
                objCon.Open();
                objRdr = objCmd.ExecuteReader();
                if (objRdr.HasRows)
                {
                    while (objRdr.Read())
                    {
                        roleList.Add(objRdr["Role"].ToString());
                    }
                }
                objRdr.Close();
            }
            catch
            {
                return null;
            }
            finally
            {
                objCon.Close();
                objCon.Dispose();
            }
            return (string[])roleList.ToArray(typeof(string));
        }
    }
}