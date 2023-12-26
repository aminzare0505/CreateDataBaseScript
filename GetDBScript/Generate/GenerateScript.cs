using GetDBScript.FileTools;
using GetDBScript.Services;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript
{
    public class GenerateScript: CreateScript
    {
        //private static string _connectionString; //= "data source=.;initial catalog=AdventureWorks2019;integrated security=True;MultipleActiveResultSets=True;";

        public void Generate()
        {
            CreateSchemaScript();
            CreateTypeScript();
            CreateTableScript();
            CreateSynonymsScript();
            CreateViewScript();
            CreateFunctionScript();
            CreateProcScript();
            CreateAllScript();
        }
       

       

    }
}
