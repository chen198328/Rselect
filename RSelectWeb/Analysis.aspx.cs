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
        #region 新增
        public ShowType showType;
        public BarChartModel barchartmodel = new BarChartModel();
        public LineModel linemodel = new LineModel();
        public ScatterModel scattermodel = new ScatterModel();
        public List<Subject> SelectedSubjectList = new List<Subject>();
        #endregion
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
                    //selectSubjectIds = subjects.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList<string>();
                    //for (int i = 0; i < selectSubjectIds.Count; i++)
                    //{
                    //    selectSubjectIds[i] = selectSubjectIds[i].Trim();
                    //}
                    selectSubjectIds = GetList(subjects);
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
                GetDataDraw(subjects, selectIndicatorName, selectYears);
            }
            else
            {
                //postback

            }
        }
        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="indicator"></param>
        /// <param name="year"></param>
        /// <returns>subjectlist,indicatorslist,yearslist,pagetype,result</returns>
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
        /// 折线图 单指标
        /// </summary>
        /// <param name="subjectlist"></param>
        /// <param name="indicatorname"></param>
        /// <param name="yearlist"></param>
        protected void SetLine(List<string> subjectlist, string indicatorname, List<string> yearlist)
        {
            #region 之前代码
            //PageType = 1;
            //IndicatorNameList.Clear();
            //IndicatorNameList.Add(indicatorname);


            //Dictionary<string, int> dict = new Dictionary<string, int>();
            ////前端主题表
            //StringBuilder sbsubjectlist = new StringBuilder();
            //for (int index = 1; index < subjectlist.Count + 1; index++)
            //{
            //    dict[subjectlist[index - 1]] = index;
            //    sbsubjectlist.AppendFormat(",{0}:'{1}'", index, subjectlist[index - 1]);
            //    XString += "," + index.ToString();
            //}
            //XString = XString.Substring(1);
            //DictionarySubject = sbsubjectlist.ToString().Substring(1);

            ////前端数据
            //for (int index = 0; index < yearlist.Count; index++)
            //{
            //    Lengend += ",'" + yearlist[index] + "'";
            //    List<string> data = new List<string>();
            //    List<Indicator> indicatorlist = Entity.GetIndicatorListBySubjectList(subjectlist, indicatorname, yearlist[index]);
            //    Dictionary<string, float> subjectvalue = new Dictionary<string, float>();
            //    indicatorlist.ForEach(p =>
            //    {
            //        subjectvalue[p.Subject] = p.Value;
            //    });
            //    data.Add(yearlist[index]);
            //    StringBuilder sbdata = new StringBuilder();
            //    subjectlist.ForEach(p =>
            //    {
            //        if (subjectvalue.ContainsKey(p))
            //        {
            //            sbdata.Append("," + subjectvalue[p]);
            //        }
            //        else
            //        {
            //            sbdata.Append(",'-'");
            //        }
            //    });
            //    data.Add(sbdata.ToString().Substring(1));
            //    datalist.Add(data);
            //}
            //Lengend = Lengend.Substring(1);
            #endregion

            LineModel model = new LineModel();
            model.Title = string.Format("{0}多维度数据", indicatorname);
            //多维度Legend
            StringBuilder sb = new StringBuilder();
            foreach (var item in yearlist)
            {
                sb.AppendFormat(",'{0}'", item);
            }
            model.Legend = sb.ToString().Substring(1);

            model.xAxisName = "主题";
            model.xAxisType = "category";

            sb.Clear();
            foreach (var item in subjectlist)
            {
                sb.Append("," + item);
            }
            string ids = sb.ToString().Substring(1);
            string where = string.Format("id in ({0})", ids);
            EntityList<Subject> subjects = Subject.FindAll(where, "Id", "*", 0, 0);

            sb.Clear();
            foreach (var item in subjects)
            {
                sb.AppendFormat(",'{0}'", item.Name);
            }
            model.xAxisData = sb.ToString().Substring(1);

            model.yAxisName = indicatorname;
            model.yAxisType = "value";

            List<LineyAxisData> datas = new List<LineyAxisData>();
            sb.Clear();
            foreach (var item in yearlist)
            {
                LineyAxisData data = new LineyAxisData();
                data.Name = item;
                data.Type = "line";

                Year y = Year.Find("Name", item);
                string _where = string.Format("SubjectId in ({0}) and Name='{1}' and YearId={2}", ids, indicatorname, y.id);
                EntityList<Rselect.Indicator> indicators = Rselect.Indicator.FindAll(_where, "SubjectId", "*", 0, 0);
                foreach (var _item in indicators)
                {
                    sb.AppendFormat(",{0}", _item.Value);
                }
                data.Data = sb.ToString().Substring(1);
                datas.Add(data);
            }
            model.yAxisDatas = datas;
            linemodel = model;
            showType = ShowType.Line;


        }
        /// <summary>
        /// 折线图 单年
        /// </summary>
        /// <param name="subjectlist"></param>
        /// <param name="indicatornamelist"></param>
        /// <param name="year"></param>
        protected void SetLine(List<string> subjectlist, List<string> indicatornamelist, string year)
        {
            LineModel model = new LineModel();
            model.Title = string.Format("{0}多维度数据", year);
            //多维度Legend
            StringBuilder sb = new StringBuilder();
            foreach (var item in indicatornamelist)
            {
                sb.AppendFormat(",'{0}'", item);
            }
            model.Legend = sb.ToString().Substring(1);

            model.xAxisName = "主题";
            model.xAxisType = "category";

            sb.Clear();
            foreach (var item in subjectlist)
            {
                sb.Append("," + item);
            }
            string ids = sb.ToString().Substring(1);
            string where = string.Format("id in ({0})", ids);
            EntityList<Subject> subjects = Subject.FindAll(where, "Id", "*", 0, 0);

            sb.Clear();
            foreach (var item in subjects)
            {
                sb.AppendFormat(",'{0}'", item.Name);
            }
            model.xAxisData = sb.ToString().Substring(1);

            model.yAxisName = "评价值";
            model.yAxisType = "value";

            List<LineyAxisData> datas = new List<LineyAxisData>();
            sb.Clear();
            Year y = Year.Find("Name", year);
            foreach (var item in indicatornamelist)
            {
                LineyAxisData data = new LineyAxisData();
                data.Name = item;
                data.Type = "line";

                string _where = string.Format("SubjectId in ({0}) and Name='{1}' and YearId={2}", ids, item, y.id);
                EntityList<Rselect.Indicator> indicators = Rselect.Indicator.FindAll(_where, "SubjectId", "*", 0, 0);
                foreach (var _item in indicators)
                {
                    sb.AppendFormat(",{0}", _item.Value);
                }
                data.Data = sb.ToString().Substring(1);
                datas.Add(data);
            }
            model.yAxisDatas = datas;
            linemodel = model;
            showType = ShowType.Line;
        }
        /// <summary>
        /// 折线图 单学科
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="indicatorlist"></param>
        /// <param name="years"></param>
        protected void SetLine(string subject, List<string> indicatornamelist, List<string> yearlist)
        {
            LineModel model = new LineModel();
            Subject s = Subject.Find("id", subject);
            model.Title = string.Format("{0}数据", s.Name);
            //多维度Legend
            StringBuilder sb = new StringBuilder();
            foreach (var item in indicatornamelist)
            {
                sb.AppendFormat(",'{0}'", item);
            }
            model.Legend = sb.ToString().Substring(1);

            model.xAxisName = "年份";
            model.xAxisType = "category";

            sb.Clear();
            foreach (var item in yearlist)
            {
                sb.AppendFormat(",'{0}'", item);
            }
            string ids = sb.ToString().Substring(1);
            string where = string.Format("Name in ({0})", ids);
            EntityList<Year> years = Year.FindAll(where, "Id", "*", 0, 0);

            sb.Clear();
            string yearids = string.Empty;
            foreach (var item in years)
            {
                sb.AppendFormat(",'{0}'", item.Name);
                yearids += "," + item.id;
            }
            yearids = yearids.Substring(1);
            model.xAxisData = sb.ToString().Substring(1);

            model.yAxisName = "评价值";
            model.yAxisType = "value";


            sb.Clear();
            List<LineyAxisData> datas = new List<LineyAxisData>();
            foreach (var item in indicatornamelist)
            {
                LineyAxisData data = new LineyAxisData();
                data.Name = item;
                data.Type = "line";

                string _where = string.Format("SubjectId={0} and Name='{1}' and YearId in ({2})", s.id, item, yearids);
                EntityList<Rselect.Indicator> indicators = Rselect.Indicator.FindAll(_where, "YearId", "*", 0, 0);
                foreach (var _item in indicators)
                {
                    sb.AppendFormat(",{0}", _item.Value);
                }
                data.Data = sb.ToString().Substring(1);
                datas.Add(data);
            }
            model.yAxisDatas = datas;
            linemodel = model;
            showType = ShowType.Line;
        }
        /// <summary>
        /// 散点图
        /// </summary>
        /// <param name="subjectlist"></param>
        /// <param name="indicatornamelist"></param>
        /// <param name="yearlist"></param>
        protected void SetScatter(List<string> subjectlist, List<string> indicatornamelist, List<string> yearlist)
        {
            #region 之前
            //PageType = 2;
            //for (int i = 0; i < yearlist.Count; i++)
            //{
            //    Lengend += ",'" + yearlist[i] + "'";
            //    List<Indicator> il1 = Entity.GetIndicatorListBySubjectList(subjectlist, indicatornamelist[0], yearlist[i]);
            //    List<Indicator> il2 = Entity.GetIndicatorListBySubjectList(subjectlist, indicatornamelist[1], yearlist[i]);

            //    System.Text.StringBuilder content = new System.Text.StringBuilder();
            //    for (int index = 0; index < il2.Count && index < il1.Count; index++)
            //    {
            //        content.AppendFormat(",[{0},{1},'{2}']", il1[index].Value, il2[index].Value, il1[index].Subject);
            //    }
            //    //ValueListString = content.ToString().Substring(1);
            //    List<string> data = new List<string>();
            //    data.Add(yearlist[i]);
            //    data.Add(content.ToString().Substring(1));
            //    datalist.Add(data);

            //}
            //Lengend = Lengend.Substring(1);
            #endregion
            ScatterModel model = new ScatterModel();
            model.Title = string.Format("{0}/{1}数据", indicatornamelist[0], indicatornamelist[1]);

            StringBuilder sb = new StringBuilder();
            foreach (var item in yearlist)
            {
                sb.AppendFormat(",'{0}'", item);
            }
            model.Legend = sb.ToString().Substring(1);
            sb.Clear();

            model.xAxisName = indicatornamelist[0];
            model.xAxisType = "value";
            model.yAxisName = indicatornamelist[1];
            model.yAxisType = "value";

            List<ScatterData> datas = new List<ScatterData>();

            foreach (var item in yearlist)
            {
                Year y = Year.Find("name", item);
                //年
                ScatterData data = new ScatterData();
                data.name = item;
                data.type = "scatter";
                sb.Clear();
                foreach (var _item in subjectlist)
                {
                    sb.AppendFormat(",{0}", _item);
                }
                string where = sb.ToString().Substring(1);
                EntityList<Subject> subjects = Subject.FindAll(string.Format("id in ({0})", where), null, "*", 0, 0);
                Dictionary<int, string> dict_subject = new Dictionary<int, string>();
                foreach (var _item in subjects)
                {
                    dict_subject[_item.id] = _item.Name;
                }
                EntityList<Rselect.Indicator> indicators1 = Rselect.Indicator.FindAll(string.Format("subjectid in ({0}) and Name='{1}' and YearId={2}", where, indicatornamelist[0], y.id), "subjectId", "*", 0, 0);
                EntityList<Rselect.Indicator> indicators2 = Rselect.Indicator.FindAll(string.Format("subjectid in ({0}) and Name='{1}' and YearId={2}", where, indicatornamelist[1], y.id), "subjectId", "*", 0, 0);

                Dictionary<int, double> _in1 = new Dictionary<int, double>();
                Dictionary<int, double> _in2 = new Dictionary<int, double>();
                foreach (var _item in indicators1)
                {
                    _in1[_item.SubjectId] = _item.Value;
                }
                foreach (var _item in indicators2)
                {
                    _in2[_item.SubjectId] = _item.Value;
                }
                sb.Clear();
                foreach (var _item in dict_subject.Keys)
                {
                    string s = dict_subject[_item];
                    string value1 = string.Empty;
                    string value2 = string.Empty;
                    if (_in1.ContainsKey(_item))
                    {
                        value1 = string.Format("{0:N3}", _in1[_item]);
                    }
                    else
                    {
                        value1 = "0";
                    }
                    if (_in2.ContainsKey(_item))
                    {
                        value2 = string.Format("{0:N3}", _in2[_item]);
                    }
                    else
                    {
                        value2 = "0";
                    }
                    sb.AppendFormat(",[{0},{1},'{2}']", value1, value2, s);
                }
                data.data = sb.ToString().Substring(1);
                datas.Add(data);
            }
            model.SeriesData = datas;
            scattermodel = model;
            showType = ShowType.Scatter;
        }

        protected void SetScatter(List<string> subjectlist, List<string> indicatornamelist, string year)
        {
            ScatterModel model = new ScatterModel();
            model.Title = string.Format("{0}/{1}数据", indicatornamelist[0], indicatornamelist[1]);

            StringBuilder sb = new StringBuilder();
            model.Legend = sb.ToString().Substring(1);
            sb.Clear();

            model.xAxisName = indicatornamelist[0];
            model.xAxisType = "value";
            model.yAxisName = indicatornamelist[1];
            model.yAxisType = "value";

            List<ScatterData> datas = new List<ScatterData>();
            Year y = Year.Find("name", year);
            //年
            ScatterData data = new ScatterData();
            data.name = year;
            data.type = "scatter";
            sb.Clear();
            foreach (var _item in subjectlist)
            {
                sb.AppendFormat(",{0}", _item);
            }
            string where = sb.ToString().Substring(1);
            EntityList<Subject> subjects = Subject.FindAll(string.Format("id in ({0})", where), null, "*", 0, 0);
            Dictionary<int, string> dict_subject = new Dictionary<int, string>();
            foreach (var _item in subjects)
            {
                dict_subject[_item.id] = _item.Name;
            }
            EntityList<Rselect.Indicator> indicators1 = Rselect.Indicator.FindAll(string.Format("subjectid in ({0}) and Name='{1}' and YearId={2}", where, indicatornamelist[0], y.id), "subjectId", "*", 0, 0);
            EntityList<Rselect.Indicator> indicators2 = Rselect.Indicator.FindAll(string.Format("subjectid in ({0}) and Name='{1}' and YearId={2}", where, indicatornamelist[1], y.id), "subjectId", "*", 0, 0);

            Dictionary<int, double> _in1 = new Dictionary<int, double>();
            Dictionary<int, double> _in2 = new Dictionary<int, double>();
            foreach (var _item in indicators1)
            {
                _in1[_item.SubjectId] = _item.Value;
            }
            foreach (var _item in indicators2)
            {
                _in2[_item.SubjectId] = _item.Value;
            }
            sb.Clear();
            foreach (var _item in dict_subject.Keys)
            {
                string s = dict_subject[_item];
                string value1 = string.Empty;
                string value2 = string.Empty;
                if (_in1.ContainsKey(_item))
                {
                    value1 = _in1[_item].ToString();
                }
                else
                {
                    value1 = "0";
                }
                if (_in2.ContainsKey(_item))
                {
                    value2 = _in2[_item].ToString();
                }
                else
                {
                    value2 = "0";
                }
                sb.AppendFormat(",[{0:N3},{1:N3},'{2}']", value1, value2, s);
            }
            data.data = sb.ToString().Substring(1);
            datas.Add(data);
            model.SeriesData = datas;
            scattermodel = model;
            showType = ShowType.Scatter;
        }
        /// <summary>
        /// 柱状图 多主题
        /// </summary>
        /// <param name="subjectlist"></param>
        /// <param name="indicator"></param>
        /// <param name="year"></param>
        protected void SetBarChart(List<string> subjectlist, string indicator, string year)
        {
            BarChartModel model = new BarChartModel();
            model.Title = string.Format("{0}{1}数据", year, indicator);
            model.Legend = year;
            model.xAxisName = "主题";
            model.xAxisType = "category";

            model.yAxisName = indicator;
            model.yAxisType = "value";

            StringBuilder sbcategory = new StringBuilder();
            StringBuilder sbvalue = new StringBuilder();
            //foreach (var id in subjectlist)
            //{
            //    Subject s = Subject.FindByid(int.Parse(id));
            //    sbcategory.AppendFormat(",'{0}'", s.Name);
            //    Year y = Year.Find("Name", year);
            //    Rselect.Indicator i = Rselect.Indicator.Find(new string[] { "SubjectId", "YearId", "Name" }, new object[] { id, y.id, indicator });
            //    sbvalue.AppendFormat(",{0}", i.Value);
            //}
            List<Indicator> indicators = Entity.GetIndicatorListBySubjectList(subjectlist, indicator, year);
            for (int index = 0; index < indicators.Count; index++)
            {
                sbcategory.AppendFormat(",'{0}'", indicators[index].Subject);
                sbvalue.AppendFormat(",{0:N3}", indicators[index].Value);
            }

            model.xAxisData = sbcategory.ToString().Substring(1);
            model.yAxisData = sbvalue.ToString().Substring(1);
            showType = ShowType.BarChart;

            barchartmodel = model;

        }
        /// <summary>
        /// 柱状图 多指标
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="indicatorlist"></param>
        /// <param name="year"></param>
        protected void SetBarChart(string subject, List<string> indicatorlist, string year)
        {
            BarChartModel model = new BarChartModel();
            Subject s = Subject.Find("Id", subject);
            model.Title = string.Format("{0}{1}维度数据", year, s.Name);
            model.Legend = year;
            //model.xAxisName = "分析维度";
            model.xAxisType = "category";

            model.yAxisName = subject;
            model.yAxisType = "value";

            StringBuilder sbcategory = new StringBuilder();
            StringBuilder sbvalue = new StringBuilder();
            foreach (var indicatorname in indicatorlist)
            {

                sbcategory.AppendFormat(",'{0}'", indicatorname);


                Year y = Year.Find("Name", year);

                Rselect.Indicator i = Rselect.Indicator.Find(new string[] { "SubjectId", "YearId", "Name" }, new object[] { s.id, y.id, indicatorname });
                sbvalue.AppendFormat(",{0:N3}", i.Value);
            }
            model.xAxisData = sbcategory.ToString().Substring(1);
            model.yAxisData = sbvalue.ToString().Substring(1);
            showType = ShowType.BarChart;
        }
        /// <summary>
        /// 柱状图 多年
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="indicator"></param>
        /// <param name="yearlist"></param>
        protected void SetBarChart(string subject, string indicator, List<string> yearlist)
        {
            BarChartModel model = new BarChartModel();
            Subject s = Subject.Find("Id", subject);
            model.Title = string.Format("{0}{1}数据", s.Name, indicator);
            model.Legend = indicator;
            model.xAxisName = "年份";
            model.xAxisType = "category";

            model.yAxisName = subject;
            model.yAxisType = "value";

            StringBuilder sbcategory = new StringBuilder();
            StringBuilder sbvalue = new StringBuilder();
            foreach (var year in yearlist)
            {
                sbcategory.AppendFormat(",'{0}'", year);
                Year y = Year.Find("Name", year);
                Rselect.Indicator i = Rselect.Indicator.Find(new string[] { "SubjectId", "YearId", "Name" }, new object[] { subject, y.id, indicator });
                sbvalue.AppendFormat(",{0:N3}", i.Value);
            }
            model.xAxisData = sbcategory.ToString().Substring(1);
            model.yAxisData = sbvalue.ToString().Substring(1);
            showType = ShowType.BarChart;

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
                    if (!list.Contains(temp[index].Trim()))
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
        private void AlertMessage(string message)
        {
            string scriptstrs = string.Format("<script>alert('{0}');</script>", message);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", scriptstrs, false);
            // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alter", scriptstrs);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", scriptstrs);

        }
        static string temp_year = string.Empty;
        static string temp_subject = string.Empty;
        static string temp_indicator = string.Empty;
        protected void submit_Click(object sender, EventArgs e)
        {
            string years = Request.Form["year"];
            string subjects = Request.Form["subject"];
            string indicators = Request.Form["indicator"];
            if (indicators.Contains("综合度") && GetList(indicators).Count > 1)
            {
                AlertMessage("综合度不能与其他维度同时选中");
                years = temp_year;
                subjects = temp_subject;
                indicators = temp_indicator;
            }
            else if (GetList(indicators).Count > 2)
            {
                AlertMessage("不能同时选择三个维度");
                years = temp_year;
                subjects = temp_subject;
                indicators = temp_indicator;
            }
            else
            {
                temp_year = years;
                temp_subject = subjects;
                temp_indicator = indicators;
            }
            if (!string.IsNullOrEmpty(years) && !string.IsNullOrEmpty(subjects) && !string.IsNullOrEmpty(indicators))
            {
                GetDataDraw(subjects, indicators, years);
            }
            //传递数据给前台
            selectSubjectIds = GetList(subjects);
            selectYears = years;
            selectIndicatorName = indicators;
            string domain = domainlist.Text;
            ChangeDomain(domain);
        }

        protected void SetSelectedSubjectList(List<string> subjectlist)
        {
            StringBuilder sb = new StringBuilder();
            foreach (var item in subjectlist)
            {
                sb.AppendFormat(",{0}", item);
            }
            string where = sb.ToString().Substring(1);
            EntityList<Subject> subjects = Subject.FindAll("id in (" + where + ")", null, "*", 0, 0);
            SelectedSubjectList = subjects.ToList<Subject>();
        }
        /// <summary>
        /// 根据参数获取相关信息
        /// </summary>
        /// <param name="subjects"></param>
        /// <param name="indicators"></param>
        /// <param name="years"></param>
        protected void GetDataDraw(string subjects, string indicators, string years)
        {
            List<string> yearlist = GetList(years);
            List<string> subjectlist = GetList(subjects);
            List<string> indicatorlist = GetList(indicators);

            SetSelectedSubjectList(subjectlist);




            if (indicatorlist.Count == 2 && subjectlist.Count > 0 && yearlist.Count > 0)
            {
                SetScatter(subjectlist, indicatorlist, yearlist);
                return;
            }
            if (yearlist.Count == 1 && indicatorlist.Count == 1)
            {
                SetBarChart(subjectlist, indicatorlist[0], yearlist[0]);
            }
            if (subjectlist.Count == 1 && yearlist.Count == 1)
            {
                SetBarChart(subjectlist[0], indicatorlist, yearlist[0]);
            }
            if (subjectlist.Count == 1 && indicatorlist.Count == 1)
            {
                SetBarChart(subjectlist[0], indicatorlist[0], yearlist);
            }
            if (subjectlist.Count == 1 && indicatorlist.Count > 1 && yearlist.Count > 1)
            {
                SetLine(subjectlist[0], indicatorlist, yearlist);
            }
            if (subjectlist.Count > 1 && indicatorlist.Count == 1 && yearlist.Count > 1)
            {
                SetLine(subjectlist, indicatorlist[0], yearlist);
            }
            if (subjectlist.Count > 1 && indicatorlist.Count > 1 && yearlist.Count == 1)
            {
                SetLine(subjectlist, indicatorlist, yearlist[0]);
            }
            if (subjectlist.Count > 1 && indicatorlist.Count > 1 && yearlist.Count > 1)
            {
                SetScatter(subjectlist, indicatorlist, yearlist);
            }
        }
    }

    public enum ShowType
    {
        BarChart = 1,
        Line = 2,
        Scatter = 3
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
    public class BarChartModel
    {
        public string Title { set; get; }
        public string Legend { set; get; }
        public string xAxisName { set; get; }
        public string xAxisType { set; get; }
        public string xAxisData { set; get; }
        public string yAxisName { set; get; }
        public string yAxisType { set; get; }
        public string yAxisData { set; get; }
    }
    public class LineModel
    {
        public string Title { set; get; }
        public string Legend { set; get; }

        public string xAxisName { set; get; }
        public string xAxisType { set; get; }
        public string xAxisData { set; get; }
        public string yAxisName { set; get; }
        public string yAxisType { set; get; }
        public List<LineyAxisData> yAxisDatas { set; get; }
    }
    public class ScatterModel
    {
        public string Title { set; get; }
        public string Legend { set; get; }

        public string xAxisName { set; get; }
        public string xAxisType { set; get; }
        public string yAxisName { set; get; }
        public string yAxisType { set; get; }
        public List<ScatterData> SeriesData { set; get; }
    }
    public class LineyAxisData
    {
        public string Name { set; get; }
        public string Type { set; get; }
        public string Data { set; get; }
    }
    public class ScatterData
    {
        public string name { set; get; }
        public string type { set; get; }
        public string data { set; get; }
    }
}