﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNet.Utilities;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Collections.Generic;
namespace RSelectWeb
{
    public class Entity
    {
        readonly static string Conn = ConfigurationManager.ConnectionStrings["Rselect"].ConnectionString;
        /// <summary>
        /// 通过学科Id获取主题
        /// </summary>
        /// <param name="domain"></param>
        /// <returns></returns>
        public static List<string> GetSubjectListByDomainId(int id)
        {
            string sql = "select [Name] from [Subject] where DomainId=@Id";
            SqlParameter para = new SqlParameter("@Id", id);
            IDataReader iReader = SqlHelper.ExecuteReader(Conn, CommandType.Text, sql, para);
            List<string> SubjectList = new List<string>();
            while (iReader.Read())
            {
                SubjectList.Add(iReader[0].ToString());
            }
            return SubjectList;
        }
        /// <summary>
        /// 通过学科学科获取主题
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static List<string> GetSubjectListByDomainName(string name)
        {
            string sql = "select [Id] from [Domain] where [Name]=@name";
            SqlParameter para = new SqlParameter("@name", name);
            IDataReader iReader = SqlHelper.ExecuteReader(Conn, CommandType.Text, sql, para);
            int id = iReader.GetInt32(0);
            return GetSubjectListByDomainId(id);
        }
        public static List<Indicator> GetIndicatorListBySubjectList(List<string> subjecList, string indicatorname, string year)
        {
            StringBuilder sql = new StringBuilder();
            if (subjecList.Count == 0)
            {
                sql.AppendFormat("select [Subject],[IndicatorName],[Value],[Year] from [ViewIndicatorAll] where [Subject]='{0}' and [IndicatorName]='{1}' and [Year]='{2}'", subjecList[0], indicatorname, year);
            }
            else
            {
                sql.AppendFormat("select [Subject],[IndicatorName],[Value],[Year] from [ViewIndicatorAll] where [Subject]='{0}' and [IndicatorName]='{1}' and [Year]='{2}'", subjecList[0], indicatorname, year);
                for (int index = 1; index < subjecList.Count; index++)
                {
                    sql.AppendFormat("union select [Subject],[IndicatorName],[Value],[Year] from [ViewIndicatorAll] where [Subject]='{0}' and [IndicatorName]='{1}' and [Year]='{2}'", subjecList[index], indicatorname, year);

                }
            }
            IDataReader iReader = SqlHelper.ExecuteReader(Conn, CommandType.Text, sql.ToString(), null);
            List<Indicator> indicatorList = new List<Indicator>();
            while (iReader.Read())
            {
                Indicator indicator = new Indicator();
                indicator.Subject = iReader.GetString(0);
                indicator.Name = iReader.GetString(1);
                indicator.Value = (float)iReader.GetDouble(2);
                indicator.Year = iReader.GetString(3);
                indicatorList.Add(indicator);
            }

            return indicatorList;
        }
    }
    public class Indicator
    {

        public string Name { set; get; }
        public float Value { set; get; }
        public string Year { set; get; }
        public string Subject { set; get; }
    }
}