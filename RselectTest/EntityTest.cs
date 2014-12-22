using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RSelectWeb;
using System.Diagnostics;
using System.Collections.Generic;
using System.Data;
using DotNet.Utilities;
using System.Configuration;
using Rselect;
namespace RselectTest
{
    [TestClass]
    public class EntityTest
    {
        [TestMethod]
        public void GetSubjectListByDomainIdTest()
        {
            List<string> subjectList = Entity.GetSubjectListByDomainId(1);
            Assert.AreEqual(subjectList.Count > 0, true);
        }
        [TestMethod]
        public void GetSubjectListByDomainNameTest()
        {
            List<string> subjectList = Entity.GetSubjectListByDomainId(1);
            Assert.AreEqual(subjectList.Count > 0, true);
        }
        [TestMethod]
        public void GetIndicatorListBySubjectListTest()
        {
            //List<string> subjectList = new List<string>() { "污水和污泥中的全氟化合物研究", "银纳米材料在废水处理中的应用" };
            //List<Indicator> indicatorList = Entity.GetIndicatorListBySubjectList(subjectList, "创新度", "2012-2014年");
            //Assert.AreEqual(indicatorList.Count > 0, true);
        }
        [TestMethod]
        public void InsertData()
        {
            string Conn = ConfigurationManager.ConnectionStrings["Rselect"].ConnectionString;
            string sql = "select [Name] from [Subject$]";

            IDataReader iReader = SqlHelper.ExecuteReader(Conn, CommandType.Text, sql);

            while (iReader.Read())
            {
                Subject subject = new Subject();
                subject.Name = iReader["Name"].ToString();
                subject.DomainId = int.Parse(iReader["domainid"].ToString());
                subject.ClusterId = int.Parse(iReader["clusterid"].ToString());
                subject.id = subject.Name.GetHashCode();
            }

        }
    }
}
