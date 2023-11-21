using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  OIPD.Expense
{
    public partial class ajaxreturntodayincome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            double hospitalincome = IOPD.DataManager.Expense.ExpenseUtilities.GetTotalIncomeFromHospitalByDate(System.DateTime.Now.AddHours(12.5));
            double pathologyincome = IOPD.DataManager.Expense.ExpenseUtilities.GetTotalIncomeFromPathologyByDate(System.DateTime.Now.AddHours(12.5));
            double medicineincome = IOPD.DataManager.Expense.ExpenseUtilities.GetTotalIncomeFromMedicineByDate(System.DateTime.Now.AddHours(12.5));
            double extraincome = IOPD.DataManager.Expense.ExpenseUtilities.GetTotalExtraIncomeByDate(System.DateTime.Now.AddHours(12.5));
            double Alltotalincome = hospitalincome + pathologyincome + medicineincome + extraincome;
            Response.Write("" + Alltotalincome);

        }
    }
}