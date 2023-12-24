using GetDBScript.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Xml.Linq;

namespace GetDBScript
{

    public class DataSource
    {
        private static string _connectionString = "data source=.;initial catalog=AdventureWorks2019;integrated security=True;MultipleActiveResultSets=True;";

        public List<ListModel> GetAllTable()
        {
            string Query = GetSQL("GetTables");
            return SqlExecute.ExecuteQuery(Query);
        }
        public List<ListModel> GetAllSchema()
        {
            string Query = GetSQL("GetSchemas");
            return SqlExecute.ExecuteQuery(Query);
        }
        public List<ListModel> GetAllProcedures()
        {
            string Query = GetSQL("GetProcedures");
            return SqlExecute.ExecuteQuery(Query);
        }

        public List<ListModel> GetAllView()
        {
            string Query = GetSQL("GetViews");
            return SqlExecute.ExecuteQuery(Query);
        }
        public List<ListModel> GetAllSynonym()
        {
            string Query = GetSQL("GetSynonyms");
            SqlExecute.ExecuteQuery(Query, OnlyEcecute: true);
            List<ListModel> Result = new List<ListModel>();
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "GetSynonym";//Stored Procedure name
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Result.Add(new ListModel() { Name = rdr["Name"].ToString(), SchemaName = rdr["SchemaName"].ToString(), Refrence = rdr["Refrence"].ToString() });
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
            return Result;
        }
        public List<ListModel> GetAllFunction()
        {
            string Query = GetSQL("GetFunctions");
            return SqlExecute.ExecuteQuery(Query);
        }

        public string GetTableScript(string tableName, string schema)
        {
            string Query = GetSQL("GetTableScript");
             SqlExecute.ExecuteQuery(Query,true);
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[{schema}].[{tableName}]')) DROP Table [{schema}].[{tableName}]");
            sb.AppendLine("GO");
            var saf = sb.ToString();
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
            return sb.ToString();
        }
        public string GetProcedureScript(string procedureName, string schema)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[{schema}].[{procedureName}]')) DROP PROCEDURE [{schema}].[{procedureName}]");
            sb.AppendLine("GO");
            var saf = sb.ToString();
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
            return sb.ToString();
        }
        public string GetSchemaScript(string schemaName)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = '{schemaName}')");
            sb.AppendLine("BEGIN");
            sb.AppendLine($"EXEC('CREATE SCHEMA  {schemaName}')");
            sb.AppendLine("END");
            return sb.ToString();
        }
        public string GetViewScript(string viewName, string schema)
        {

            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[{schema}].[{viewName}]')) DROP VIEW [{schema}].[{viewName}]");
            sb.AppendLine("GO");
            var saf = sb.ToString();
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
            return sb.ToString();
        }
        
        public string GetSynonymScript(ListModel listModel)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.synonyms  WHERE[object_id] = OBJECT_ID('[{listModel.SchemaName}].[{listModel.Name}]')) DROP SYNONYM [{listModel.SchemaName}].[{listModel.Name}]");
            sb.AppendLine("GO");
            sb.AppendLine($"CREATE SYNONYM [{listModel.SchemaName}].[{listModel.Name}] FOR {listModel.Refrence}");
            return sb.ToString();
        }
        public string GetFunctionScript(string functionName, string schema)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"DROP FUNCTION IF EXISTS [{schema}].[{functionName}]");
            sb.AppendLine("GO");
            var saf = sb.ToString();
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
            return sb.ToString();
        }

        private static string GetSQL(string name)
        {
            return SQLQueries.SQLQueryFactory.Get(name);
        }

        private string GetResult(string name)
        {
            return SQLQueries.SQLQueryFactory.Get(name);
        }
    }

    public static class SqlExecute
    {
        private static string _connectionString = "data source=.;initial catalog=AdventureWorks2019;integrated security=True;MultipleActiveResultSets=True;";
        public static List<ListModel> ExecuteQuery(string query,bool OnlyEcecute=false)
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
    }
}
