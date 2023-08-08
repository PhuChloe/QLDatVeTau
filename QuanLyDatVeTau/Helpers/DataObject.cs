/*using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Collections;
using CRM.Models;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Web.UI.WebControls;

namespace CRM
{
    public static class DataObject
    {
        public static int GetUserRole(int iUserId, int BranchId, string ControlId)
        {
            try
            {

                string PageId = "CRM";
                //string ControlId = "ViewALLCRM";


                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("spCheckUserRole", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Branch", BranchId));
                    cmd.Parameters.Add(new SqlParameter("@controlID", ControlId));
                    cmd.Parameters.Add(new SqlParameter("@PageID", PageId));
                    cmd.Parameters.Add(new SqlParameter("@ModulID", "0"));
                    cmd.Parameters.Add(new SqlParameter("@UserID", iUserId));
                    cmd.Parameters.Add(new SqlParameter("@isBranchAll", "1"));

                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    dap.Fill(dt);
                    if (dt == null) return 0;
                    if (dt.Rows.Count > 0)
                    {
                        return int.Parse(dt.Rows[0]["Status"].ToString()) == 1 ? 1 : 0;
                    }
                }

            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("CheckPermission", ex.ToString());
                return 0;
            }
            return 0;
        }


        *//*Check result*//*
        public static int ExecStored(string proc, Hashtable param)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["connectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(proc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry de in param)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + de.Key.ToString(), de.Value.ToString()));
                    }

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            return int.Parse(rdr["RESULT"].ToString());
                        }
                    }

                    return -1;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("AddQuote/" + proc, ex.ToString());
                return -1;
            }

        }
        *//*Kiểm tra tiệc đã tạo*//*
        public static int CheckIsCreated(string proc, Hashtable param)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["connectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(proc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry de in param)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + de.Key.ToString(), de.Value.ToString()));
                    }

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            return int.Parse(rdr["RESULT"].ToString());
                        }
                    }

                    return -1;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("AddQuote/" + proc, ex.ToString());
                return -1;
            }

        }

        *//*Chức năng block sảnh tiệc*//*
        public static int BlockBanquetHall(string proc, Hashtable param)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["connectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(proc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry de in param)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + de.Key.ToString(), de.Value.ToString()));
                    }

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            return int.Parse(rdr["RESULT"].ToString());
                        }
                    }

                    return -1;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("AddQuote/" + proc, ex.ToString());
                return -1;
            }

        }


        public static AccountResponse Dologin(string username, string password)
        {

            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_app_LoginByUserAndPass", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@UserName", username));
                    cmd.Parameters.Add(new SqlParameter("@PassWord", password));
                    cmd.Parameters.Add(new SqlParameter("@OrgID", DBNull.Value));

                    AccountResponse item = new AccountResponse();
                    item.ObjectId = 0;
                    item.ObjectName = "";
                    item.ObjectUserName = "";
                    item.IsDefault = false;
                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            item.UserID = int.Parse(rdr["UserID"].ToString());
                            item.ObjectId = int.Parse(rdr["OBJ_AUTOID"].ToString());
                            item.ObjectName = rdr["OBJ_NAME"].ToString();
                            item.ObjectUserName = rdr["UserName"].ToString();
                            item.IsDefault = bool.Parse(rdr["IsDefault"].ToString());
                        }
                    }

                    return item;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("Dologin::" + username, ex.ToString());
                return null;
            }

        }

        public static DataTable GetTreeProductGroup()
        {
            return null;

        }



        //Báo cáo doanh thu theo nhân viên
        public static DataSet ReportRevenueOrderByEmployee(string from, string to, string type)
        {
            DataSet ds = new DataSet();
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_report_revenueByEmployee_CRM", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ORG_AUTOID", Helper.ORG_AUTOID()));
                    cmd.Parameters.Add(new SqlParameter("@FROMDATE", from));
                    cmd.Parameters.Add(new SqlParameter("@TODATE", to));
                    cmd.Parameters.Add(new SqlParameter("@TYPE", type));
                    cmd.Parameters.Add(new SqlParameter("@RoleId", MasterSession.UserLogin.RoleId));
                    cmd.Parameters.Add(new SqlParameter("@SaleMenId", MasterSession.UserLogin.ObjectId));
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    dap.Fill(ds);
                }

                return ds;

            }
            catch (Exception ex)
            {

                return null;
            }

        }


        public static string GetObjectAutoId()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SP_META_PUBOBJECT_AUTO_INCREMENT", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            return rdr[0].ToString();
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("GetObjectAutoId", ex.ToString());
            }
            return "";

        }

        public static DataTable getCompanyAndBranch()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("exec sp_META_getCompanyAndBranch", conn);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dataAdapt.Fill(dataTable);
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("getCompanyAndBranch", ex.ToString());
                return null;
            }
        }


        public static string getObjectName(int id)
        {
            try
            {
                if (id <= 0) return "";
                DataTable dt = new DataTable();
                dt = GetDataCommand("proc_CRM_GetObjectList '" + id + "'");
                if (dt == null) return "";
                if (dt.Rows.Count > 0)
                    return dt.Rows[0]["OBJ_NAME"].ToString();
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("getObjectName", ex.ToString());
            }
            return "";
        }

        public static DataTable getObjectInfo(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = GetDataCommand("proc_CRM_GetObjectList '" + id + "'");
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("getObjectInfo", ex.ToString());
            }
            return null;
        }

        public static DataTable GetDataCommand(string sql)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dataAdapt.Fill(dataTable);
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("GetDataCommand::" + sql, ex.ToString());
                return null;
            }
        }

        public static DataSet GetDataSetCommand(string sql)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("GetDataSetCommand::" + sql, ex.ToString());
                return null;
            }
        }

        public static bool ExecuteCommand(Hashtable param, string sp_proc)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sp_proc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry de in param)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + de.Key.ToString(), de.Value.ToString()));
                    }
                    cmd.ExecuteNonQuery();
                }
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("ExecuteCommand::" + sp_proc, ex.ToString());
                return false;
            }
        }
        public static DataTable ExecuteCommandAsDataTable(Hashtable param, string sp_proc)
        {
            try
            {
                DataTable dt = new DataTable();
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sp_proc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry de in param)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + de.Key.ToString(), de.Value.ToString()));
                    }
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(dt);
                    return dt;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("ExecuteCommand::" + sp_proc, ex.ToString());
                return null;
            }
        }

        public static UserInfo DoLogin(string email, string password)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                UserInfo info = new UserInfo();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_Dologin", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@email", email));
                    cmd.Parameters.Add(new SqlParameter("@password", password));

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            info.email = rdr["email"].ToString();
                            info.fullname = rdr["fullname"].ToString();
                            info.id = rdr["id"].ToString();
                        }
                    }
                }
                return info;
            }
            catch (Exception ex) { return null; }
        }
        public static List<UserControl> GetRoles(int userid, int branch)
        {
            List<UserControl> lst = new List<UserControl>();
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_CRM_GetListControlRole", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@UserId", userid));
                    cmd.Parameters.Add(new SqlParameter("@Branch", branch));

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            lst.Add(new UserControl
                            {
                                ControlId = rdr["ControlID"].ToString(),
                                PageAutoId = int.Parse(rdr["PageAutoID"].ToString()),
                                ControlAutoID = int.Parse(rdr["ControlAutoID"].ToString())
                            });
                        }
                    }
                }
                return lst;
            }
            catch (Exception ex) { return null; }
        }
        public static List<BI_Config> getBIConfigs()
        {
            List<BI_Config> lst = new List<BI_Config>();
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString_BI"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select * from BI_CONFIG", conn);
                    cmd.CommandType = CommandType.Text;
                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        // iterate through results, printing each to console
                        while (rdr.Read())
                        {
                            lst.Add(new BI_Config
                            {
                                Key = rdr["CONFIG_ID"].ToString(),
                                Value = rdr["CONFIG_VALUE"].ToString()
                            });
                        }
                    }
                }
                return lst;
            }
            catch (Exception ex) { return null; }
        }
        public static DataSet GetDataReportFOC(string branchs, string fromDate, string toDate)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString_BI"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_BI_FOC_Report", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@sBranchId", branchs));
                    cmd.Parameters.Add(new SqlParameter("@DateFrom", fromDate));
                    cmd.Parameters.Add(new SqlParameter("@DateTo", toDate));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex) { return null; }

        }
        public static DataSet GetDataReportMembers(string fromDate, string toDate, int type)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString_BI"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_BI_Members_Report", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@DateFrom", fromDate));
                    cmd.Parameters.Add(new SqlParameter("@DateTo", toDate));
                    cmd.Parameters.Add(new SqlParameter("@Type", type));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex) { return null; }

        }
        public static DataSet GetDataReportMembersUpLevel(string fromDate, string toDate)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionString_BI"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_BI_Report_Member_UpLevel", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@DateFrom", fromDate));
                    cmd.Parameters.Add(new SqlParameter("@DateTo", toDate));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex) { return null; }

        }

        #region TimeSheetDay
        public static TimeSheetModel GetTSheetData(string timeSheetDate, string branch)
        {
            TimeSheetModel timeSheetModel = new TimeSheetModel();
            try
            {
                int RECT_AUTOID = 3;
                int RSC_AUTOID = 0;
                string KeySearch = "";

                if (string.IsNullOrEmpty(branch)) return null;

                string strConnection = ConfigurationManager.AppSettings["ConnectionStringTS"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_POKER_TimeSheet_LoadList", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@RECT_AUTOID", RECT_AUTOID));
                    cmd.Parameters.Add(new SqlParameter("@ORG_AUTOID", branch));
                    cmd.Parameters.Add(new SqlParameter("@RSC_AUTOID", RSC_AUTOID));
                    cmd.Parameters.Add(new SqlParameter("@KeySearch", KeySearch));
                    cmd.Parameters.Add(new SqlParameter("@TSHEET_DATE", timeSheetDate));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[1];
                var data = Helper.DataTableToList<TimeSheetItem>(dataTable);
                timeSheetModel.TimeSheets = data;
                return timeSheetModel;

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static UpdateStatus UpdateTSWorkingDay(int TSHEET_AUTOID, decimal TSHEET_WORKING, int UPDATE_BY)
        {

            try
            {


                string strConnection = ConfigurationManager.AppSettings["ConnectionStringTS"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_POKER_TimeSheet_UpdateWorkingday", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@TSHEET_AUTOID", TSHEET_AUTOID));
                    cmd.Parameters.Add(new SqlParameter("@TSHEET_WORKING", TSHEET_WORKING));
                    cmd.Parameters.Add(new SqlParameter("@UPDATE_BY", UPDATE_BY));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;


                var updateSucess = Helper.DataTableClass<UpdateResponse>(ds.Tables[0]);
                var execSuccess = Helper.DataTableClass<UpdateResponse>(ds.Tables[1]);
                UpdateStatus updateStatus = new UpdateStatus
                {
                    updateSucess = updateSucess,
                    execSuccess = execSuccess
                };
                return updateStatus;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }

        }

        public static List<BranchItem> GetCompanyAndBranch()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["ConnectionStringTS"].ToString();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_META_getCompanyAndBranch", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    SqlDataAdapter dataAdapt = new SqlDataAdapter();
                    dataAdapt.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dataAdapt.Fill(dataTable);
                    var data = Helper.DataTableToList<BranchItem>(dataTable);
                    return data;
                }
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("getCompanyAndBranch", ex.ToString());
                throw new Exception(ex.Message, ex);
            }
        }
        #endregion

        #region TimeSheetMonth
        public static TimeSheetMonthModel GetTimeSheetMonth(int month, int year)
        {
            TimeSheetMonthModel timeSheetMonth = new TimeSheetMonthModel();
            timeSheetMonth.Employees = new List<EmployeeInfo>();
            timeSheetMonth.TimeSheets = new List<TimeSheetMonthItem>();
            try
            {

                string strConnection = ConfigurationManager.AppSettings["ConnectionStringTS"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_POKER_TimeSheet_LoadMasterList", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MONTH", month));
                    cmd.Parameters.Add(new SqlParameter("@YEAR", year));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;


                timeSheetMonth.Employees = Helper.DataTableToList<EmployeeInfo>(ds.Tables[0]);
                timeSheetMonth.TimeSheets = Helper.DataTableToList<TimeSheetMonthItem>(ds.Tables[1]);

                return timeSheetMonth;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }

        }


        public static TimeOffMonthModel GetTimeOffMonth(int month, int year)
        {
            TimeOffMonthModel timeOffMonthModel = new TimeOffMonthModel();
            timeOffMonthModel.TimeOffMonths = new List<TimeOffMonthItem>();
            try
            {

                string strConnection = ConfigurationManager.AppSettings["ConnectionStringTS"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("proc_POKER_TimeSheet_LoadTimeOff", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MONTH", month));
                    cmd.Parameters.Add(new SqlParameter("@YEAR", year));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

  
                timeOffMonthModel.TimeOffMonths = Helper.DataTableToList<TimeOffMonthItem>(ds.Tables[0]);


                return timeOffMonthModel;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }

        }
        #endregion

    }
    public class UserInfo
    {
        public string email { get; set; }
        public string id { get; set; }
        public string fullname { get; set; }
    }

    public class UpdateResponse
    {
        public string Status { get; set; }
    }

    public class UpdateStatus
    {
        public UpdateResponse updateSucess { get; set; }
        public UpdateResponse execSuccess { get; set; }
    }

}*/