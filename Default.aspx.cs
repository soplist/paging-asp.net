using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{
    private string CultureLang = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            dlBind();
            CultureLang = Session["PreferredCulture"].ToString().ToLower().Trim();
            switch (CultureLang)
            {
                case "zh-cn":
                    this.DropDownList1.Items.FindByText("简体中文").Selected = true;
                    Session["PreferredCulture"] = "zh-cn";
                    break;
                case "en-us":
                    this.DropDownList1.Items.FindByText("English").Selected = true;
                    Session["PreferredCulture"] = "en-us";
                    break;
                default:
                    break;
            }
        }
    }

    public void dlBind()
    {
        DB db = new DB();
        int curpage = Convert.ToInt32(this.labPage.Text);
        string strSql = "select * from tb_CounterInfo";
        DataTable dsTable = db.reDt(strSql);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 5;
        ps.CurrentPageIndex = curpage - 1;
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;
            this.lnkbtnUp.Enabled = false;
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;
            this.lnkbtnBack.Enabled = false;
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.visitor.DataSource = ps;
        this.visitor.DataKeyField = "ID";
        this.visitor.DataBind();

    }

    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.dlBind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.dlBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.dlBind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.dlBind();

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["PreferredCulture"] = DropDownList1.SelectedValue;
        Response.Redirect(Request.Url.PathAndQuery);
    }
    
}