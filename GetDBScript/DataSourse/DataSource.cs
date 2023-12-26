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
using System.Data.SqlTypes;
using GetDBScript.DataSourse;

namespace GetDBScript
{

    public class DataSource
    {
        public List<ListModel> GetAllTable()
        {
            return SqlExecute.ExecuteProcedure("GetTables");
        }
        public List<ListModel> GetAllSchema()
        {
            return SqlExecute.ExecuteProcedure("GetSchemas");
        }
        public List<ListModel> GetAllProcedures()
        {
            return SqlExecute.ExecuteProcedure("GetProcedures");
        }

        public List<ListModel> GetAllView()
        {

            return SqlExecute.ExecuteProcedure("GetViews");
        }
        public List<ListModel> GetAllSynonym()
        {
            return SqlExecute.ExecuteProcedure("GetSynonyms");
        }
        public List<ListModel> GetAllFunction()
        {
            return SqlExecute.ExecuteProcedure("GetFunctions");
        }
        public List<ListModel> GetAllType()
        {
            return SqlExecute.ExecuteProcedure("GetTypes");
        }

        public string GetTableScript(string tableName, string schema)
        {

            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[{schema}].[{tableName}]')) DROP Table [{schema}].[{tableName}]");
            sb.AppendLine("GO");
            var saf = sb.ToString();
            SqlExecute.GetTableScript(tableName, schema, sb);
            return sb.ToString();
        }



        public string GetProcedureScript(string procedureName, string schema)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine($"IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[{schema}].[{procedureName}]')) DROP PROCEDURE [{schema}].[{procedureName}]");
            sb.AppendLine("GO");
            SqlExecute.GetProcedureScript(procedureName, schema, sb);
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
            SqlExecute.GetViewScript(viewName, schema, sb);
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
            SqlExecute.GetFunctionScript(functionName, schema, sb);
            return sb.ToString();
        }

        //public string GetTypeScript(string typeName, string schema)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.AppendLine($"DROP FUNCTION IF EXISTS [{schema}].[{functionName}]");
        //    sb.AppendLine("GO");
        //    SqlExecute.GetFunctionScript(functionName, schema, sb);
        //    return sb.ToString();
        //}




    }

    //public static class SqlExecute
    //{
    //    private static string _connectionString = "data source=.;initial catalog=AdventureWorks2019;integrated security=True;MultipleActiveResultSets=True;";
    //    public static List<ListModel> ExecuteQuery(string query,bool OnlyEcecute=false)
    //    {
    //        List<ListModel> Result = new List<ListModel>();
    //        SqlConnection conn = null;
    //        SqlCommand cmd = null;
    //        //  SqlParameter[] parameters = new SqlParameter[]
    //        using (conn = new SqlConnection(_connectionString))
    //        {
    //            conn.Open();
    //            using (cmd = new SqlCommand(query,conn))
    //            {
    //                //cmd.Parameters.AddRange(parameters);
    //                //cmd.ExecuteNonQuery();
    //                cmd.CommandText= query;
    //                cmd.CommandType = CommandType.Text;
    //                if (OnlyEcecute)
    //                    cmd.ExecuteNonQuery();
    //                else
    //                {

    //                        using (SqlDataReader reader = cmd.ExecuteReader())
    //                        {
    //                            var res = reader.Read();
    //                            while (reader.Read())
    //                            {
    //                                Result.Add(new ListModel() { Name = reader["Name"].ToString(), SchemaName = reader["SchemaName"].ToString() });
    //                            }
    //                        }


    //                }


    //            }
    //        }
    //        return Result;
    //    }

    //    public static List<ListModel> ExecuteSp(string query,string spName, bool OnlyEcecute = false)
    //    {
    //        CreateProcedure(query, spName);
    //        List<ListModel> Result = new List<ListModel>();

    //        //  SqlParameter[] parameters = new SqlParameter[]
    //        using (SqlConnection con = new SqlConnection(_connectionString))
    //        {
    //            using (SqlCommand cmd = con.CreateCommand())
    //            {
    //                cmd.CommandText = "spGetSchema";//Stored Procedure name
    //                cmd.CommandType = CommandType.StoredProcedure;

    //                con.Open();

    //                using (SqlDataReader rdr = cmd.ExecuteReader())
    //                {
    //                    while (rdr.Read())
    //                    {
    //                        Result.Add(new ListModel() { Name = rdr["Name"].ToString(), SchemaName = rdr["SchemaName"].ToString() });
    //                        //sb.AppendLine(rdr["Text"].ToString());
    //                        /* 
    //                            You will get the CREATE PROC text here
    //                            Do what you need to with it. For example, write
    //                            to a .sql file
    //                        */
    //                    }
    //                }
    //            }
    //        }
    //        DropProcedure(spName);
    //        return Result;
    //    }

    //    private static void CreateProcedure(string query, string spName)
    //    {
    //        StringBuilder CreateProceduresb = new StringBuilder();
    //        CreateProceduresb.AppendLine($"CREATE OR ALTER PROC {spName} ");
    //        CreateProceduresb.AppendLine("AS");
    //        CreateProceduresb.AppendLine("BEGIN");
    //        CreateProceduresb.AppendLine(query);
    //        CreateProceduresb.AppendLine("END");
    //        SqlExecute.ExecuteQuery(CreateProceduresb.ToString(), true);
    //    }

    //    private static void DropProcedure( string spName)
    //    {
    //        StringBuilder DropProceduresb = new StringBuilder();
    //        DropProceduresb.AppendLine($"DROP PROC {spName} ");
    //        SqlExecute.ExecuteQuery(DropProceduresb.ToString(), true);
    //    }
    //}
}
