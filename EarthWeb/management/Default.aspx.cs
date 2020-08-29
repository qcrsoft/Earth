using System;
using System.Linq;

public partial class management_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        using (DataContext db = new DataContext())
        {
            Manager manager = db.Managers.FirstOrDefault(p => p.Username == username.Text && p.Password == password.Text);
            if (manager!=null)
            {
                Session["manager"] = manager;
                Response.Redirect("ManagerList.aspx");
            }
            else
            {
                lblInfo.Text = "error";
            }

        }
    }
}