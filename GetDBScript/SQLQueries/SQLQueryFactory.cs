﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace GetDBScript.SQLQueries
{
    public static class SQLQueryFactory
    {
        private static Dictionary<string, string> queries = new Dictionary<string, string>();

        public static string Get(string queryFullName, Model.DatabaseInfo.SQLServerVersion version)
        {
            return Get($"{queryFullName}.{version}");
        }

        public static string Get(string queryClass)
        {
            var ns = typeof(SQLQueryFactory).Namespace;
            var qualifiedQueryClass = string.Concat(ns, '.', queryClass);

            if (queries.ContainsKey(qualifiedQueryClass))
            {
                return queries[qualifiedQueryClass];
            }
            else
            {
                string query = FetchQuery(qualifiedQueryClass);
                queries.Add(qualifiedQueryClass, query);
                return query;
            }
        }

        private static string FetchQuery(string queryFullName)
        {
            string resourceName = queryFullName + ".sql";
            string[] names = typeof(SQLQueryFactory).Assembly.GetManifestResourceNames();
            var assembly = Assembly.LoadFrom(Assembly.GetAssembly(typeof(SQLQueryFactory)).Location);
            string[] names1 = assembly.GetManifestResourceNames();
            var stream1 = assembly.GetManifestResourceStream(names[0]);
            using (System.IO.Stream stream = typeof(SQLQueryFactory).Assembly.GetManifestResourceStream(resourceName))
            {
                if (stream == null) throw new InvalidOperationException("The Query " + queryFullName + " cannot be found");
                using (System.IO.StreamReader reader = new System.IO.StreamReader(stream))
                {
                    return reader.ReadToEnd();
                }
            }
        }
    }
}
