using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Rselect;
using R = Rselect;
using XCode;
namespace RSelectWeb
{
    public partial class Institute : System.Web.UI.Page
    {
        public string Cluster = string.Empty;
        public List<R.Institute> institutelist = new List<R.Institute>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            Subject subject = Subject.Find("id", sid);
            Cluster = subject.Name;
            EntityList<R.Institute> institutes = R.Institute.FindAll("", "[Value] desc", "top 10 *", 0, 0);
            institutelist = institutes.ToList<R.Institute>();
        }
    }
}