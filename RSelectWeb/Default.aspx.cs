﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNet.Utilities;
using System.Data;
namespace RSelectWeb
{
    public partial class Default : System.Web.UI.Page
    {
        public List<string> SubjectList = new List<string>();
        public List<string> YearList = new List<string>();
        public List<string> IndicatorList = new List<string>();
        public int TopCount = 0;
        bool isSubmit = false;
        private string years = string.Empty;
        private string subjects = string.Empty;
        private string indicators = string.Empty;
        private string domain = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                if (Request.Form["years"] == null || Request.Form["subject"] == null || Request.Form["indicator"] == null) { isSubmit = false; }
                else
                {
                    years = Request.Form["years"];
                    subjects = Request.Form["subject"];
                    indicators = Request.Form["indicator"];
                    domain = GetSelectedDomain();
                    isSubmit = true;
                }
            }
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
            string subjectlikename = "%" + SearchSubjectText.Text.Trim() + "%";
            SubjectList = Entity.GetSubjectListLikeName(subjectlikename);
        }
        #region 单选
        string GetSelectedDomain()
        {
            string domain = string.Empty;
            if (radioChemistry.Checked) { domain = "化学"; }
            if (radioChemistry.Checked) { domain = "工程技术"; }
            if (radioChemistry.Checked) { domain = "地学天文"; }
            if (radioChemistry.Checked)
            {
                domain = "医学";
            }

            if (radioChemistry.Checked)
            {
                domain = "农林科学";
            }
            if (radioChemistry.Checked)
            {
                domain = "管理科学";
            }
            if (radioChemistry.Checked)
            {
                domain = "物理";
            }
            if (radioChemistry.Checked)
            {
                domain = "环境科学与生态学";
            }
            if (radioChemistry.Checked)
            {
                domain = "地学";
            }
            return domain;
        }
        protected void radioChemistry_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "化学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }
        protected void radioEngineer_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "工程技术";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioDixuetianwen_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "地学天文";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioYixue_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "医学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioNonglinkexue_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "农林科学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioGuanlixue_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "管理科学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioWuli_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "物理";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioHuanjing_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "环境科学与生态学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName(domain);
                UpdateTopCount();
            }
        }

        protected void radioDixue_CheckedChanged(object sender, EventArgs e)
        {
            if (radioChemistry.Checked)
            {
                domain = "地学";
                SubjectList = Entity.GetSubjectListByDomainName(domain);
                YearList = Entity.GetYearsListByDomainName(domain);
                IndicatorList = Entity.GetIndicatorNameListByDomainName("domain");
                UpdateTopCount();
            }
        }
        #endregion

        protected void Submit_Click(object sender, EventArgs e)
        {
            //提交时间
            if (isSubmit)
            {
                Session["years"] = years;
                Session["subjects"] = subjects;
                Session["indicators"] = indicators;
                Session["domain"] = domain;
                Page.Response.Redirect("Analysis_bar.aspx",true);
               // Server.Transfer("Analysis_bar.aspx");
            }
            else
            {

            }
        }
    }
}