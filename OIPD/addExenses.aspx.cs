using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addExpenses : System.Web.UI.Page
{
    int totalExpenses = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        bool b = LoginManager.ProtectPage(Session, Response);
        if (!b)
            return;
        try
        {
            int patientno = Convert.ToInt32("" + Request.QueryString["patientno"]);
            this.BindExpensesGrid();
        }
        catch
        {
            Response.Redirect("ipdPatientsList.aspx");
        }
    }
    protected void bttnAddChrg_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtDate.Text.Equals(""))
                throw new Exception("Give Date of Expense");
            if (txtExpName.Text.Equals(""))
                throw new Exception("Give Expense Name");
            if (txtExpAmt.Text.Equals(""))
                throw new Exception("Give Amount of Expense");

            DateTime dat = System.DateTime.Now;
            dat = dat.AddHours(12.50);
            DateTime date = Convert.ToDateTime((txtDate.Text) + " " + dat.Hour + ":" + dat.Minute + dat.ToString("tt"));

            DataSet1TableAdapters.expensesTableAdapter dt = new DataSet1TableAdapters.expensesTableAdapter();
            dt.Insert(date, Convert.ToInt32("" + txtExpAmt.Text), txtExpName.Text, Convert.ToInt32(Request.QueryString["patientno"]), LoginManager.CurrentUser(Session));
            GridView.DataBind();
            this.BindExpensesGrid();
        }
        catch(Exception ex)
        {
           Validation.setError(lblMsg, ex);
        }
    }
    private void BindExpensesGrid()
    {
        DataSet1TableAdapters.expensesTableAdapter eta = new DataSet1TableAdapters.expensesTableAdapter();
        DataSet1.expensesDataTable edt = eta.GetDataByPatientNo(Convert.ToInt32("" + Request.QueryString["patientno"]));

        int total = 0;
        for (int x = 0; x < edt.Rows.Count; x++)
        {
            DataSet1.expensesRow er = (DataSet1.expensesRow)edt.Rows[x];
            total = total + Convert.ToInt32("" + er.amount);
        }
        totalExpenses = total;
        GridView.FooterRow.Cells[1].Text = "Total";
        GridView.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
        GridView.FooterRow.Cells[2].Text = "<i class=\"fa fa-inr\"/> <b>" + total.ToString() + "/-</b>";
        GridView.FooterRow.Cells[2].CssClass = "w3-large";
        DateTime dt = System.DateTime.Now;
        dt = dt.AddHours(12.50);
        GridView.FooterRow.Cells[3].Text = ""+dt;
    }
}