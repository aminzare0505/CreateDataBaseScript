using GetDBScript.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript
{
    internal class Program
    {
       // private static string _connectionString= ;
        static void Main(string[] args)
        {
            ConnectionString.Value = "data source=.;initial catalog=AdventureWorks2019;integrated security=True;MultipleActiveResultSets=True;";
            new GenerateScript().Generate();
        }
    }
}
