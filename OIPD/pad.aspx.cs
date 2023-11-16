using IOPD.DataManager;
using System;

namespace OIPD
{
    public partial class pad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;*/
            string dname = string.Empty;
            dname = "_";
            lblDocName.Text = "Doctor Name: &nbsp;<b>" + dname + "</b>";
            //if (Request.QueryString["docname"] != null || (Request.QueryString["docname"]).Trim() != "")
            //{
            //    //dname = "_";
            //    //lblDocName.Text = "Doctor Name: &nbsp;<b>" + dname + "</b>";
            //}
            //else
            lblDocName.Text = "&nbsp;";
            int sno = Convert.ToInt32(Request.QueryString["sno"]);
            if (sno == 0)
                return;
            IOPD.DataManager.Patient p = new Patient(sno);
            txtName.Text = "" + IOPD.DataManager.PatientUtilities.getpatientname(sno);
            lblAge.Text = "" + p.ageyears + "Y " + p.agemonths + "M " + p.agedays + "D";
            lblSex.Text = "" + p.gender;
            lblDt.Text = DateUtilities.onlyDateFormat("" + p.dateofentry);
            lblAddress.Text = p.address + "";
        }
    }
}