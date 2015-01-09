using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using XCode;
using Rselect;
namespace RSelectWeb
{
    public partial class Analysis_bar : System.Web.UI.Page
    {
        //初始化页面
        public EntityList<Subject> SubjectList_ = new EntityList<Subject>();
        //public List<string> SubjectList_ = new List<string>();
        public List<string> YearList_ = new List<string>();
        public List<string> IndicatorNameList_ = new List<string>();
        public int TopCount = 0;

        public string selectYears = string.Empty;
        public string selectIndicatorName = string.Empty;
        public List<string> selectSubjectIds = new List<string>();

        public string IndicatorName = string.Empty;
        /// <summary>
        /// 用于显示柱状图
        /// </summary>
        public List<Indicator> IndicatorList = new List<Indicator>();
        public string SubjectListString = string.Empty;
        public string ValueListString = string.Empty;

        /// <summary>
        /// 用于显示散点图
        /// </summary>
        /// 
        public List<_SubjectIndicators> SubjectIndicatorsList = new List<_SubjectIndicators>();
        public int width = 0;
        public int height = 0;

        //折线图需要的数据  主题表，指标名称、图例、横坐标轴，纵坐标轴，数据
        /// <summary>
        /// 主题表
        /// </summary>
        public string DictionarySubject = string.Empty;
        /// <summary>
        /// 指标名列表
        /// </summary>
        public List<string> IndicatorNameList = new List<string>();
        /// <summary>
        /// 图例
        /// </summary>
        public string Lengend = string.Empty;
        /// <summary>
        /// 横坐标轴
        /// </summary>
        public string XString = string.Empty;
        /// <summary>
        /// 保存数据
        /// </summary>
        public List<List<string>> datalist = new List<List<string>>();
        /// <summary>
        /// 数据展示方式 0=柱状图 1 线图 2 散点图 
        /// </summary>
        public int PageType = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string domain = Session["domain"] as string;
                selectYears = Session["years"] as string;
                selectIndicatorName = Session["indicators"] as string;
                string subjects = Session["subjects"] as string;
                if (!string.IsNullOrEmpty(subjects))
                {
                    selectSubjectIds = subjects.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList<string>();
                    for (int i = 0; i < selectSubjectIds.Count; i++)
                    {
                        selectSubjectIds[i] = selectSubjectIds[i].Trim();
                    }
                }
                if (!string.IsNullOrEmpty(domain))
                {
                    IndicatorNameList = Entity.GetIndicatorNameListByDomainName(domain);
                }
                domainlist.Text = domain;
                if (string.IsNullOrEmpty(domain))
                {
                    ChangeDomain("化学");
                }
                else { ChangeDomain(domain); }


                //SetLine(subjects, indicators[0], years);

                //if (indicators.Count == 1 && years.Count == 1)
                //{
                //    PageType = 0;
                //    IndicatorName = indicators[0];
                //    IndicatorList = Entity.GetIndicatorListBySubjectList(subjects, IndicatorName, years[0]);
                //    for (int index = 0; index < IndicatorList.Count; index++)
                //    {
                //        SubjectListString += ",'" + IndicatorList[index].Subject + "'";
                //        ValueListString += "," + IndicatorList[index].Value.ToString();
                //    }
                //    height = IndicatorList.Count * 20 + 200;
                //    SubjectListString = SubjectListString.Substring(1);
                //    ValueListString = ValueListString.Substring(1);
                //}
                //else if (indicators.Count == 2 && years.Count == 1)
                //{
                //    PageType = 2;
                //    List<Indicator> il1 = Entity.GetIndicatorListBySubjectList(subjects, indicators[0], years[0]);
                //    List<Indicator> il2 = Entity.GetIndicatorListBySubjectList(subjects, indicators[1], years[0]);

                //    System.Text.StringBuilder content = new System.Text.StringBuilder();
                //    for (int index = 0; index < il2.Count && index < il1.Count; index++)
                //    {
                //        content.AppendFormat(",[{0},{1},'{2}']", il1[index].Value, il2[index].Value, il1[index].Subject);
                //    }
                //    ValueListString = content.ToString().Substring(1);
                //}
            }
            else
            {
                //postback

            }
        }
        private Tuple<List<string>, List<string>, List<string>, int, bool> GetList(string subject, string indicator, string year)
        {

            List<string> years = GetList(year);
            List<string> indicators = GetList(indicator);
            List<string> subjects = GetList(subject);
            int pagetype = 0;
            bool result = false;

            if (subjects != null && subjects.Count > 0 && indicators != null && years != null)
            {
                result = true;
                if (indicators.Count == 1)
                {
                    pagetype = 1;
                }
                else
                {
                    pagetype = 2;
                }

            }
            Tuple<List<string>, List<string>, List<string>, int, bool> tuple = new Tuple<List<string>, List<string>, List<string>, int, bool>(subjects, indicators, years, pagetype, result);
            return tuple;
        }
        /// <summary>
        /// 折线图
        /// </summary>
        /// <param name="subjectlist"></param>
        /// <param name="indicatorname"></param>
        /// <param name="yearlist"></param>
        protected void SetLine(List<string> subjectlist, string indicatorname, List<string> yearlist)
        {
            PageType = 1;
            IndicatorNameList.Clear();
            IndicatorNameList.Add(indicatorname);


            Dictionary<string, int> dict = new Dictionary<string, int>();
            //前端主题表
            StringBuilder sbsubjectlist = new StringBuilder();
            for (int index = 1; index < subjectlist.Count + 1; index++)
            {
                dict[subjectlist[index - 1]] = index;
                sbsubjectlist.AppendFormat(",{0}:'{1}'", index, subjectlist[index - 1]);
                XString += "," + index.ToString();
            }
            XString = XString.Substring(1);
            DictionarySubject = sbsubjectlist.ToString().Substring(1);

            //前端数据
            for (int index = 0; index < yearlist.Count; index++)
            {
                Lengend += ",'" + yearlist[index] + "'";
                List<string> data = new List<string>();
                List<Indicator> indicatorlist = Entity.GetIndicatorListBySubjectList(subjectlist, indicatorname, yearlist[index]);
                Dictionary<string, float> subjectvalue = new Dictionary<string, float>();
                indicatorlist.ForEach(p =>
                {
                    subjectvalue[p.Subject] = p.Value;
                });
                data.Add(yearlist[index]);
                StringBuilder sbdata = new StringBuilder();
                subjectlist.ForEach(p =>
                {
                    if (subjectvalue.ContainsKey(p))
                    {
                        sbdata.Append("," + subjectvalue[p]);
                    }
                    else
                    {
                        sbdata.Append(",'-'");
                    }
                });
                data.Add(sbdata.ToString().Substring(1));
                datalist.Add(data);
            }
            Lengend = Lengend.Substring(1);
        }
        protected void SetScatter(List<string> subjectlist, List<string> indicatornamelist, List<string> yearlist)
        {
            PageType = 2;
            for (int i = 0; i < yearlist.Count; i++)
            {
                Lengend += ",'" + yearlist[i] + "'";
                List<Indicator> il1 = Entity.GetIndicatorListBySubjectList(subjectlist, indicatornamelist[0], yearlist[i]);
                List<Indicator> il2 = Entity.GetIndicatorListBySubjectList(subjectlist, indicatornamelist[1], yearlist[i]);

                System.Text.StringBuilder content = new System.Text.StringBuilder();
                for (int index = 0; index < il2.Count && index < il1.Count; index++)
                {
                    content.AppendFormat(",[{0},{1},'{2}']", il1[index].Value, il2[index].Value, il1[index].Subject);
                }
                //ValueListString = content.ToString().Substring(1);
                List<string> data = new List<string>();
                data.Add(yearlist[i]);
                data.Add(content.ToString().Substring(1));
                datalist.Add(data);

            }
            Lengend = Lengend.Substring(1);
        }
        List<string> GetList(string input)
        {
            List<string> list = new List<string>();
            if (string.IsNullOrEmpty(input))
                return list;
            if (input.Contains(","))
            {
                string[] temp = input.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int index = 0; index < temp.Length; index++)
                {
                    list.Add(temp[index].Trim());
                }
            }
            else
            {
                list.Add(input.Trim());
            }
            return list;
        }
        private void ChangeDomain(string domain)
        {
            Domain _domain = Domain.Find("name", domain);
            if (_domain.id != 0)
            {
                SubjectList_ = Subject.FindAllByDomainId(_domain.id);
            }

            YearList_ = Entity.GetYearsListByDomainName(domain);
            IndicatorNameList_ = Entity.GetIndicatorNameListByDomainName(domain);
            UpdateTopCount();
        }
        private void UpdateTopCount()
        {
            if (SubjectList_.Count > 10)
            {
                TopCount = 10;
            }
            else
            {
                TopCount = SubjectList_.Count;
            }
        }
        protected void SearchSubject_Click(object sender, EventArgs e)
        {
            string subjectlikename = "[Name] like %" + SearchSubjectText.Text.Trim() + "%";

            SubjectList_ = Subject.Search(subjectlikename, null, 0, 0);
            //SubjectList_ = Entity.GetSubjectListLikeName(subjectlikename);
        }

        protected void domainlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            string domain = domainlist.Text;
            ChangeDomain(domain);
        }

        protected void submit_Click(object sender, EventArgs e)
        {

            if (Request.Form["year"] == null || Request.Form["subject"] == null || Request.Form["indicator"] == null)
            {

            }
            else
            {
                string years = Request.Form["year"];
                string subjects = Request.Form["subject"];
                string indicators = Request.Form["indicator"];


                Tuple<List<string>, List<string>, List<string>, int, bool> list = GetList(subjects, indicators, years);
                if (list.Item5)
                {
                    if (list.Item4 == 1)
                    {
                        SetLine(list.Item1, list.Item2[0], list.Item3);
                    }
                    else if (list.Item4 == 2)
                    {
                        SetScatter(list.Item1, list.Item2, list.Item3);
                    }
                }


            }
            string domain = domainlist.Text;
            ChangeDomain(domain);
        }


    }
    /// <summary>
    /// 用于显示散点图
    /// </summary>
    public class _SubjectIndicators
    {
        /// <summary>
        /// 主题名
        /// </summary>
        public string Name { set; get; }
        public List<_Indicator> Indicators = new List<_Indicator>();
    }
    /// <summary>
    /// 用于显示散点图
    /// </summary>
    public class _Indicator
    {
        /// <summary>
        /// 指标名
        /// </summary>
        public string Name { set; get; }
        /// <summary>
        /// 指标值
        /// </summary>
        public float Value { set; get; }
    }
}