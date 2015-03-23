using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using R = Rselect;
using XCode;
namespace RSelectWeb
{
    public partial class Paper : System.Web.UI.Page
    {
        public List<R.Paper> paperlist = new List<R.Paper>();
        public string Cluster = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            R.Subject subject = R.Subject.Find("Id", sid);
            Cluster = subject.Name;
            EntityList<R.Paper> papers = R.Paper.FindAll("Cluster='" + subject.Name + "'", "citation desc", "top 10 *", 0, 0);

            paperlist = papers.ToList<R.Paper>();

        }
    }
}