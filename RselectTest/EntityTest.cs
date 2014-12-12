using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RSelectWeb;
using System.Diagnostics;
using System.Collections.Generic;
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
            List<string> subjectList = new List<string>() { "污水和污泥中的全氟化合物研究", "银纳米材料在废水处理中的应用" };
            List<Indicator> indicatorList = Entity.GetIndicatorListBySubjectList(subjectList, "创新度", "2012-2014年");
            Assert.AreEqual(indicatorList.Count > 0, true);
        }
    }
}
