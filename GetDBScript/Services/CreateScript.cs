using GetDBScript.FileTools;
using GetDBScript.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript.Services
{
    public abstract class CreateScript
    {
       private StringBuilder _allScriptSb = new StringBuilder();
        Utility utility;
        string NewDataBaseName;
        string _folderPath;
        public CreateScript()
        {
            utility = new Utility(ConnectionString.Value);
            NewDataBaseName = $"CopyOf{new SqlConnectionStringBuilder(ConnectionString.Value).InitialCatalog}";
            _folderPath = utility.CheckPathAndCreate();
        }
        public void CreateTableScript()
        {
            StringBuilder TableSb = new StringBuilder();
            TableSb.AppendLine($"USE [{NewDataBaseName}]");
            TableSb.AppendLine($"GO");
            var Tables = new DataSource().GetAllTable();
            foreach (var Table in Tables)
            {
                var res = new DataSource().GetTableScript(Table.Name, Table.SchemaName);

                TableSb.AppendLine(res.ToString());
                TableSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(TableSb.ToString());
            utility.SaveFile(utility.GetFilePath("Tables", _folderPath), TableSb.ToString());
        }
        public void CreateSynonymsScript()
        {
            StringBuilder SynonymSb = new StringBuilder();
            SynonymSb.AppendLine($"USE [{NewDataBaseName}]");
            SynonymSb.AppendLine($"GO");
            var Synonyms = new DataSource().GetAllSynonym();
            foreach (var Synonym in Synonyms)
            {
                var res = new DataSource().GetSynonymScript(Synonym);

                SynonymSb.AppendLine(res.ToString());
                SynonymSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(SynonymSb.ToString());
            utility.SaveFile(utility.GetFilePath("Synonyms", _folderPath), SynonymSb.ToString());
        }
        public void CreateViewScript()
        {
            StringBuilder ViewSb = new StringBuilder();
            ViewSb.AppendLine($"USE [{NewDataBaseName}]");
            ViewSb.AppendLine($"GO");
            var Views = new DataSource().GetAllView();
            foreach (var View in Views)
            {
                var res = new DataSource().GetViewScript(View.Name, View.SchemaName);

                ViewSb.AppendLine(res.ToString());
                ViewSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(ViewSb.ToString());
            utility.SaveFile(utility.GetFilePath("Views", _folderPath), ViewSb.ToString());
        }
        public void CreateSchemaScript()
        {
            StringBuilder SchemaSb = new StringBuilder();
            SchemaSb.AppendLine($"USE [{NewDataBaseName}]");
            SchemaSb.AppendLine($"GO");
            var Schemas = new DataSource().GetAllSchema();
            foreach (var Schema in Schemas)
            {
                var res = new DataSource().GetSchemaScript(Schema.Name);

                SchemaSb.AppendLine(res.ToString());
                SchemaSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(SchemaSb.ToString());
            utility.SaveFile(utility.GetFilePath("Schemas", _folderPath), SchemaSb.ToString());
        }
        public void CreateProcScript()
        {
            StringBuilder ProceduresSb = new StringBuilder();
            ProceduresSb.AppendLine($"USE [{NewDataBaseName}]");
            ProceduresSb.AppendLine($"GO");
            var Sps = new DataSource().GetAllProcedures();
            foreach (var ps in Sps)
            {
                var res = new DataSource().GetProcedureScript(ps.Name, ps.SchemaName);

                ProceduresSb.AppendLine(res.ToString());
                ProceduresSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(ProceduresSb.ToString());
            utility.SaveFile(utility.GetFilePath("Procedures", _folderPath), ProceduresSb.ToString());
        }
        public void CreateFunctionScript()
        {
            StringBuilder FunctionSb = new StringBuilder();
            FunctionSb.AppendLine($"USE [{NewDataBaseName}]");
            FunctionSb.AppendLine($"GO");
            var Functions = new DataSource().GetAllFunction();
            foreach (var Function in Functions)
            {
                var res = new DataSource().GetFunctionScript(Function.Name, Function.SchemaName);

                FunctionSb.AppendLine(res.ToString());
                FunctionSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(FunctionSb.ToString());
            utility.SaveFile(utility.GetFilePath("Functions", _folderPath), FunctionSb.ToString());
        }
        public void CreateTypeScript()
        {
            StringBuilder TypeSb = new StringBuilder();
            TypeSb.AppendLine($"USE [{NewDataBaseName}]");
            TypeSb.AppendLine($"GO");
            var Types = new DataSource().GetAllType();
            foreach (var Type in Types)
            {
                TypeSb.AppendLine(Type.Refrence);
                TypeSb.AppendLine("GO");
            }
            _allScriptSb.AppendLine(TypeSb.ToString());
            utility.SaveFile(utility.GetFilePath("Types", _folderPath), TypeSb.ToString());
        }
        public void CreateAllScript()
        {
            utility.SaveFile(utility.GetFilePath("All", _folderPath), _allScriptSb.ToString());
        }
    }
}
