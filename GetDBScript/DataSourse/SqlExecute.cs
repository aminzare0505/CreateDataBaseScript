using GetDBScript.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript.DataSourse
{
    public static class SqlExecute
    {
        private static string _connectionString = ConnectionString.Value;
        public static List<ListModel> ExecuteQuery(string query, bool OnlyEcecute = false)
        {
            List<ListModel> Result = new List<ListModel>();
            SqlConnection conn = null;
            SqlCommand cmd = null;
            //  SqlParameter[] parameters = new SqlParameter[]
            using (conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (cmd = new SqlCommand(query, conn))
                {
                    //cmd.Parameters.AddRange(parameters);
                    //cmd.ExecuteNonQuery();
                    cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;
                    if (OnlyEcecute)
                        cmd.ExecuteNonQuery();
                    else
                    {

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            var res = reader.Read();
                            while (reader.Read())
                            {
                                Result.Add(new ListModel() { Name = reader["Name"].ToString(), SchemaName = reader["SchemaName"].ToString() });
                            }
                        }


                    }


                }
            }
            return Result;
        }

        public static List<ListModel> ExecuteProcedure(string spName, bool OnlyEcecute = false)
        {
            CreateProcedure(GetSQL(spName), spName);
            List<ListModel> Result = new List<ListModel>();

            //  SqlParameter[] parameters = new SqlParameter[]
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = spName;//Stored Procedure name
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Result.Add(new ListModel() { Name = rdr["Name"].ToString(), SchemaName = rdr["SchemaName"].ToString() });
                            //sb.AppendLine(rdr["Text"].ToString());
                            /* 
                                You will get the CREATE PROC text here
                                Do what you need to with it. For example, write
                                to a .sql file
                            */
                        }
                    }
                }
            }
            DropProcedure(spName);
            return Result;
        }


        public static void GetTableScript(string tableName, string schema, StringBuilder sb)
        {
            string Query = GetSQL("GetTableScript");
            SqlExecute.ExecuteQuery(Query, true);
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "spGetTableScript @TableName";//Stored Procedure name
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("TableName", $"[{schema}].[{tableName}]");

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            sb.AppendLine(rdr["Text"].ToString());
                            /* 
                                You will get the CREATE PROC text here
                                Do what you need to with it. For example, write
                                to a .sql file
                            */
                        }
                    }
                }
            }
        }

        public static void GetProcedureScript(string procedureName, string schema, StringBuilder sb)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "sp_helptext @procName";//Stored Procedure name
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("procName", $"[{schema}].[{procedureName}]");

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            sb.AppendLine(rdr["Text"].ToString());
                            /* 
                                You will get the CREATE PROC text here
                                Do what you need to with it. For example, write
                                to a .sql file
                            */
                        }
                    }
                }
            }
        }

        public static void GetViewScript(string viewName, string schema, StringBuilder sb)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "sp_helptext @viewName";//Stored Procedure name
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("viewName", $"[{schema}].[{viewName}]");

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            sb.AppendLine(rdr["Text"].ToString());
                            /* 
                                You will get the CREATE PROC text here
                                Do what you need to with it. For example, write
                                to a .sql file
                            */
                        }
                    }
                }
            }
        }

        public static void GetFunctionScript(string functionName, string schema, StringBuilder sb)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "sp_helptext @funName";//Stored Procedure name
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("funName", $"[{schema}].[{functionName}]");

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            sb.AppendLine(rdr["Text"].ToString());
                            /* 
                                You will get the CREATE PROC text here
                                Do what you need to with it. For example, write
                                to a .sql file
                            */
                        }
                    }
                }
            }
        }

        private static void CreateProcedure(string query, string spName)
        {
            StringBuilder CreateProceduresb = new StringBuilder();
            CreateProceduresb.AppendLine($"CREATE OR ALTER PROC {spName} ");
            CreateProceduresb.AppendLine("AS");
            CreateProceduresb.AppendLine("BEGIN");
            CreateProceduresb.AppendLine(query);
            CreateProceduresb.AppendLine("END");
            SqlExecute.ExecuteQuery(CreateProceduresb.ToString(), true);
        }

        private static void DropProcedure(string spName)
        {
            StringBuilder DropProceduresb = new StringBuilder();
            DropProceduresb.AppendLine($"DROP PROC {spName} ");
            SqlExecute.ExecuteQuery(DropProceduresb.ToString(), true);
        }
        private static string GetSQL(string name)
        {
            return SQLQueries.SQLQueryFactory.Get(name);
        }
    }
}
