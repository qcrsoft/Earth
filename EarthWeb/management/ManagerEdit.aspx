<%@ Page Title="" Language="C#" MasterPageFile="~/management/ManagementSite.Master" AutoEventWireup="true" CodeFile="ManagerEdit.aspx.cs" Inherits="management_ManagerEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-8 order-md-1" style="margin-top:20px">
      <h4 class="mb-3">Edit Manager Information</h4>
        <div class="mb-3">
          <label for="username">Name</label>
          <div class="input-group">
            <asp:TextBox ID="name" ClientIDMode="Static" CssClass="form-control" runat="server" required />
          </div>
        </div>
        <div class="mb-3">
          <label for="username">Username</label>
          <div class="input-group">
            <asp:TextBox ID="username" ClientIDMode="Static" CssClass="form-control" runat="server" required />
            <div style="width: 100%">
                <asp:Label ID="lblUsername" ForeColor="#dd0404" Visible="false" runat="server" Text="this username already exists." />
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="username">Password</label>
          <div class="input-group">
            <asp:TextBox ID="password" ClientIDMode="Static" CssClass="form-control" TextMode="Password" runat="server" />
          </div>
        </div>

        <div class="mb-3">
          <label for="username">Confirm Password</label>
          <div class="input-group">
            <asp:TextBox ID="confirmPassword" ClientIDMode="Static" CssClass="form-control" TextMode="Password" runat="server" />
          </div>
        </div>

        <asp:Button ID="btnConfirm" CssClass="btn btn-primary btn-lg" Width="200" Text="Confirm" OnClick="btnConfirm_Click" runat="server" />
        <asp:Button CssClass="btn btn-primary btn-lg" Width="200" Text="Cancel" OnClientClick="history.back();return false" UseSubmitBehavior="false" runat="server" />
        <asp:HiddenField ID="managerId" runat="server" Value="0" />
    </div>
<script>
function validate()
{
    if ($('#password').val() != $('#confirmPassword').val())
    {
        $('#confirmPassword').focus();
        alert("not same");
        return false;
    }
    return true;

	$.ajax({
		type: "POST",
		async: false,
		url: "Ajax/SaveManager.ashx",
		data: new FormData($("#frm")[0]),
		cache: false,
		processData: false,
        contentType: false,
        dataType: "json", //针对返回数据
		success: function (response)
		{
    alert(24);
			if (response.result)
            {
                location.href = "ManagerList.aspx";
			}
			else
			{
				alert(response.message);
			}
		},
		error: function (XMLHttpRequest, textStatus, thrownError)
		{
    alert(22);
			alert(thrownError);
		}
	});
    return false;
}
</script>

</asp:Content>

