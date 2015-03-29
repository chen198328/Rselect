using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNet.Utilities;
using System.Data;
using Rselect;
using XCode;
namespace RSelectWeb
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Domain> DomainList = new List<Domain>();
        public EntityList<Subject> SubjectList = new EntityList<Subject>();
        public List<string> YearList = new List<string>();
        public List<string> IndicatorList = new List<string>();
        public int TopCount = 0;
        bool isSubmit = false;
        private string years = string.Empty;
        private string subjects = string.Empty;
        private string indicators = string.Empty;
        public string domain = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            DomainList = Domain.FindAll().ToList<Domain>();
            domain = Request.Form["domain"];
            if (IsPostBack)
            {
                if (Request.Form["years"] == null || Request.Form["subject"] == null || Request.Form["indicator"] == null) { isSubmit = false; }
                else
                {
                    years = Request.Form["years"];
                    subjects = Request.Form["subject"];
                    indicators = Request.Form["indicator"];


                    List<string> yearlist = GetList(years);
                    List<string> subjectlist = GetList(subjects);
                    List<string> indicatorlist = GetList(indicators);

                    if (indicatorlist.Count > 2 || (indicators.Contains("综合度") && indicatorlist.Count > 1) || (yearlist.Count == 0 || subjectlist.Count == 0 || indicatorlist.Count == 0))
                    {
                        isSubmit = false;
                    }
                    else
                    {
                        isSubmit = true;
                    }
                }
            }
            else
            {
                domain = "应用化学";
            }
            SetChecked(domain);
        }


        private void UpdateTopCount()
        {
            if (SubjectList.Count > 10)
            {
                TopCount = 10;
            }
            else
            {
                TopCount = SubjectList.Count;
            }
        }

        protected void SearchSubject_Click(object sender, EventArgs e)
        {
            string whereclause = "%" + SearchSubjectText.Text.Trim() + "%";
            SubjectList = Subject.FindAll(whereclause, "Name", "*", 0, 0);

        }
        #region 单选
        private void SetChecked(string domain)
        {
            Domain _domain = Domain.Find("Name", domain);
            if (_domain != null)
            {
                SubjectList = Subject.FindAll("DomainId", _domain.id);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //提交时间
            if (isSubmit)
            {
                Session["years"] = years;
                Session["subjects"] = subjects;
                Session["indicators"] = indicators;
                Session["domain"] = domain;
                Page.Response.Redirect("Analysis.aspx", true);
                // Server.Transfer("Analysis_bar.aspx");
            }
            else
            {
                string message = "主题、时间和分析维度不能全部多选，也不能全部为空";
                //alter.Text = string.Format("<script>alert('{0}');</script>", message);
                AlertMessage(message);
            }
        }
        private void AlertMessage(string message)
        {
            string scriptstrs = string.Format("<script>alert('{0}');</script>", message);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", scriptstrs, false);
            // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alter", scriptstrs);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", scriptstrs);

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
    }
        #endregion
}