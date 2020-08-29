using System;
using System.Linq;
using System.Web.UI;

public partial class management_ManagerEdit : ManagerPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsCallback && !Page.IsPostBack)
        {
            int managerId = Helper.RequestInt("managerId");

            if (managerId > 0)
            {
                DataContext db = new DataContext();
                Manager manager = db.Managers.FirstOrDefault(p => p.Id == managerId);
                if (manager != null)
                {
                    this.name.Text = manager.Name;
                    this.username.Text = manager.Username;

                    this.username.Enabled = false;
                    this.managerId.Value = manager.Id.ToString();
                }
                else
                {
                    throw new Exception("todo...");
                }

                btnConfirm.Enabled = CurrentManager.IsSys == 1;
            }
            else
            {
                this.password.Attributes.Add("required", "required");
                this.confirmPassword.Attributes.Add("required", "required");
            }
        }
        lblUsername.Visible = false;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        DataContext db = new DataContext();

        int managerId = int.Parse(this.managerId.Value);
        if (managerId == 0)
        {
            //检查用户名是否已存在
            if (db.Managers.FirstOrDefault(p => p.Enabled == 1 && p.Username == username.Text) != null)
            {
                lblUsername.Visible = true;
                return;
            }

            Manager manager = new Manager()
            {
                Name = name.Text,
                Enabled = 1,
                Username = username.Text,
                Password = password.Text
            };
            db.Managers.Add(manager);
        }
        else
        {
            Manager manager = db.Managers.FirstOrDefault(p => p.Id == managerId);
            if (manager == null)
                throw new Exception("parameters are invalid");

            manager.Name = name.Text;
            if (!string.IsNullOrEmpty(password.Text))
                manager.Password = password.Text;
        }
        db.SaveChanges();

        Response.Redirect("ManagerList.aspx");
    }

    protected override void OnLoad(EventArgs e)
    {
        this.VerifyLogin = true;
        base.OnLoad(e);
    }
}