using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class management_ManagerList : ManagerPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataContext db = new DataContext();

        List<Manager> managers = db.Managers.Where(p => p.Enabled == 1).OrderByDescending(p => p.Timemark).ToList();
        grid.DataSource = managers;
        grid.DataBind();
    }

    protected override void OnLoad(EventArgs e)
    {
        this.VerifyLogin = true;
        base.OnLoad(e);
    }
}