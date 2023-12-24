using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript.FileTools
{
    public  class Utility
    {
        private static string _connectionString;
        public  Utility( string connectionString)
        {
            _connectionString = connectionString;
        }
        public  string GetFilePath(string name,string folderPath)
        {
            string FilePath = folderPath + $"\\{name}" + ".sql";
            return FilePath;
        }

        public  string CheckPathAndCreate()
        {
            var csb = new SqlConnectionStringBuilder(_connectionString);
            string initialCatalog = csb.InitialCatalog;
            string workingDirectory = Environment.CurrentDirectory;
            string projectDirectory = Directory.GetParent(workingDirectory).Parent.FullName;
            string FolderDirectory = Directory.GetParent(workingDirectory).Parent.Parent.FullName;
            string date = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
            string FolderPath = FolderDirectory + $"\\DBCreateScript\\{initialCatalog}_{date}";
            bool exists = System.IO.Directory.Exists(FolderPath);
            if (!exists)
                System.IO.Directory.CreateDirectory(FolderPath);
            return FolderPath;
        }

        public  void SaveFile(string fileName, string sql)
        {
            if (!string.IsNullOrWhiteSpace(fileName))
            {
                using (var fs = new FileStream(fileName, FileMode.Create))
                using (var writer = new StreamWriter(fs))
                    writer.Write(sql);
            }
        }
    }
}
