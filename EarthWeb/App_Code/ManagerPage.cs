using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ManagerPage : System.Web.UI.Page
{
    protected Manager CurrentManager { get; set; }
    protected bool VerifyLogin { get; set; }

    protected override void OnLoad(EventArgs e)
    {
        if (Session["manager"] != null)
        {
            CurrentManager = (Manager)Session["manager"];
        }

        if (VerifyLogin && CurrentManager == null)
        {
            Response.Redirect("Default.aspx");
            Response.End();
        }

        base.OnLoad(e);
    }
}
