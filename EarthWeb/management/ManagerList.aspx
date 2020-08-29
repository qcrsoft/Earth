<%@ Page Title="" Language="C#" MasterPageFile="~/management/ManagementSite.Master" AutoEventWireup="true" CodeFile="ManagerList.aspx.cs" Inherits="management_ManagerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #grid td:nth-child(1){width:40px;text-align:center}
        #grid td:nth-child(2){width:auto}
        #grid td:nth-child(3){width:auto}
        #grid td:nth-child(4){width:200px;text-align:center}

        #grid td{text-align:center}
        #grid th{text-align:center}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
        <h1 class="h2">Manager List</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='ManagerEdit.aspx';return false">Add new</button>
                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="del();return false;">Delete</button>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <asp:GridView ID="grid" ClientIDMode="Static" runat="server" CssClass="table table-striped table-sm" BorderWidth="0" AutoGenerateColumns="False" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="chk" value="<%# Eval("id")%>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="id" DataTextField="Username" HeaderText="Username" DataNavigateUrlFormatString="ManagerEdit.aspx?managerId={0}" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="timemark" HeaderText="Creation Time" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
<script>
    function del()
    {
	    var ids = ""; 
	    $("input[name='chk']:checked").each(function() { 
		    ids += "," + $(this).val(); 
	    });
	    if (ids=="")
	    {
            alert("no choice");
            return false;
        }

        ids = ids.substring(1);
        if (confirm("确认您的操作?"))
		{
			$.ajax({
				type: "POST",
				async: false,
				url: "Ajax/DeleteManager.ashx",
				dataType: "json",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data: {
					ids: ids
				},
				success: function (response)
				{
					if (response.Result)
					{
						location.reload();
					}
					else
					{
						alert(response.Message);
					}
				},
				error: function (XMLHttpRequest, textStatus, thrownError)
				{
					alert(thrownError);
					return false;
				}
			});
		}

    }
</script>
</asp:Content>

