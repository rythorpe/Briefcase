//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Data;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Web.Security;
//using System.Collections.Specialized;

//namespace AOBriefcase
//{
//    public sealed class RoleManager : RoleProvider    
//    {
//        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
//        {

//        }
//        public override string[] GetRolesForUser(string username)
//        {
//            SqlConnection authcon = new SqlConnection(ConfigurationManager.ConnectionStrings["DemographicsConnectionString"].ConnectionString);
//            SqlCommand roleFind = new SqlCommand("spRoles", authcon);
//            roleFind.CommandType = CommandType.StoredProcedure;
//            SqlParameter userlookup = new SqlParameter("@userlookup", SqlDbType.VarChar, 50);
//            userlookup.Value = username;
//            roleFind.Parameters.Add(userlookup);
//            string[] pinRole;
//            try
//            {
//                authcon.Open();
//                SqlDataReader RoleReader = roleFind.ExecuteReader();
//                if (RoleReader.Read())
//                {
//                    pinRole = RoleReader["Role"].ToString();
//                }
//                else
//                {
//                    pinRole = string.Empty;
//                }
//            }
//            catch (Exception ex)
//            {
//                throw new Exception(ex.ToString());
//            }
//            finally
//            {
//                roleFind.Dispose();
//                authcon.Close();
//            }
//            return pinRole;
//        }
//        public override string[] GetUsersInRole(string roleName)
//        {

//        }
//        public override bool IsUserInRole(string username, string roleName)
//        {            
//                return GetUsersInRole(roleName).Contains(username);        
//        }
//    }
//}