﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IOPD.DataManager;

namespace OIPD
{
    public partial class OpdPatientsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;
            if (!this.IsPostBack)
            {
                txtStartDate.Text = DateUtilities.dateFormat("1-1-2023 12:00");
                DateTime dt = System.DateTime.Now;
                txtEndDate.Text = "" + dt;
            }
            //Title = "" + RegistrationUtilities.GetRegistrationNo(5);
        }
        protected void searching(object sender, EventArgs e)
        {
            try
            {
                //int sno = Convert.ToInt32(RegistrationUtilities.GetPatientNo(txtPatientNumber.Text));
                string name = txtPatientNumber.Text;



                //Response.Redirect("patientData.aspx?patientno="+sno);
            }
            catch (Exception ex)
            {
                lblErrMsg.Text = "" + ex.Message;
            }
        }

    }
}