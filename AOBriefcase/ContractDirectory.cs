using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace AOBriefcase
{
    public class ContractDirectory
    {
        //Declare database columns as global variables
        public Guid GUID { get; set; }
        public string AOCode { get; set; }
        public string AOID { get; set; }
        public string Amend_Count { get; set; }
        public string Amend_Comment { get; set; }
        public string Contract_Name { get; set; }
        public string Contract_Parent { get; set; }
        public string Contract_Type { get; set; }
        public string Contract_FC { get; set; }
        public string Contract_Phone { get; set; }
        public string Contract_Homepage { get; set; }
        public string Contract_Status { get; set; }
        public string Contract_EffectiveDate { get; set; }
        public string Contract_TerminateDate { get; set; }
        public string Contract_UpdateDate { get; set; }
        public string Contract_Alias1 { get; set; }
        public string Contract_Alias2 { get; set; }
        public string Contract_Alias3 { get; set; }
        public string Contract_Alias4 { get; set; }
        public string SVC_OfficeVisits { get; set; }
        public string SVC_SX { get; set; }
        public string SVC_Radiology { get; set; }
        public string SVC_PT { get; set; }
        public string SVC_OT { get; set; }
        public string SVC_PainMgmt { get; set; }
        public string SVC_DME { get; set; }
        public string SVC_Podiatry { get; set; }
        public string SVC_Injections { get; set; }
        public string SVC_Injectibles { get; set; }
        public string Contract_PDF { get; set; }

        //Method for handling search box queries
        public List<ContractDirectory>GetContractView(string aliaszero)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DemographicsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("dbo.spContractDirectoryViewDetail5", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parameterCName = new SqlParameter("@Alias1", SqlDbType.VarChar, 40);
            parameterCName.Value = aliaszero;
            cmd.Parameters.Add(parameterCName);
            List<ContractDirectory> contracts = new List<ContractDirectory>();
            try
            {
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ContractDirectory codi = new ContractDirectory();
                    codi.AOCode = rdr["AOCode"].ToString();
                    codi.GUID = new Guid(rdr["GUID"].ToString());
                    contracts.Add(codi);
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
            return contracts;
        }

        // Method for pulling contract based on reference GUID
        public void GetContractViewGuid(Guid guid)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DemographicsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("spContractDirectoryViewGuid0", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parameterGuid = new SqlParameter("@Guid", SqlDbType.UniqueIdentifier, 37);
            parameterGuid.Value = guid;            
            cmd.Parameters.Add(parameterGuid);
            try
            {
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if(rdr.Read())
                {
                    Contract_Name = rdr["Contract_Name"].ToString();
                    Contract_Parent = rdr["Contract_Parent"].ToString();
                    Contract_Type = rdr["Contract_Type"].ToString();
                    Contract_FC = rdr["Contract_FC"].ToString();
                    Contract_Status = rdr["Contract_Status"].ToString();
                    Contract_Phone = rdr["Contract_Phone"].ToString();
                    Contract_Homepage = rdr["Contract_Homepage"].ToString();                    
                    //Contract_EffectiveDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_EffectiveDate")).ToString("d");
                    //Contract_TerminateDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_TerminateDate")).ToString("d");
                    //Contract_UpdateDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_UpdateDate")).ToString("d");
                    Contract_PDF = rdr["Contract_PDF"].ToString();
                    SVC_OfficeVisits = rdr["SVC_OfficeVisits"].ToString();
                    SVC_SX = rdr["SVC_SX"].ToString();
                    SVC_Radiology = rdr["SVC_Radiology"].ToString();
                    SVC_PT = rdr["SVC_PT"].ToString();
                    SVC_OT = rdr["SVC_OT"].ToString();
                    SVC_PainMgmt = rdr["SVC_PainMgmt"].ToString();
                    SVC_Podiatry = rdr["SVC_Podiatry"].ToString();
                    SVC_DME = rdr["SVC_DME"].ToString();
                    SVC_Injections = rdr["SVC_Injections"].ToString();
                    SVC_Injectibles = rdr["SVC_Injectibles"].ToString();
                    // Trim datetime to date and handle null exceptions
                    if (rdr["Contract_EffectiveDate"] != DBNull.Value)
                    {
                        Contract_EffectiveDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_EffectiveDate")).ToString("d");
                    }
                    else
                    {
                        Contract_EffectiveDate = string.Empty;                        
                    }
                    if (rdr["Contract_TerminateDate"] != DBNull.Value)
                    {
                        Contract_TerminateDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_TerminateDate")).ToString("d");
                    }
                    else
                    {
                        Contract_TerminateDate = string.Empty;
                    }
                    if (rdr["Contract_UpdateDate"] != DBNull.Value)
                    {
                        Contract_UpdateDate = rdr.GetDateTime(rdr.GetOrdinal("Contract_UpdateDate")).ToString("d");
                    }
                    else
                    {
                        Contract_UpdateDate = string.Empty;
                    }
                }
            
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
        }

    }
}