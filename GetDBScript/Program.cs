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
        
        static void Main(string[] args)
        { 
            new GenerateScript().Generate();
        }
        private static void SaveFile(string filenmame, string sql)
        {
            if (!string.IsNullOrWhiteSpace(filenmame))
            {
                using (var fs = new FileStream(filenmame, FileMode.Create))
                using (var writer = new StreamWriter(fs))
                    writer.Write(sql);
            }
        }
    }
}
