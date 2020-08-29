using System;
using System.Data;
using Earth.Library.Template;
using Earth.Library;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        HtmlTemplate template = new HtmlTemplate("DbDoc.html");

        string sql = @"select extended_properties.value as description, * 
                        from sys.tables 
                        left join sys.extended_properties 
                        on sys.tables.object_id=extended_properties.major_id
                        and extended_properties.minor_id=0
                        where sys.tables.name!='sysdiagrams'
                        order by sys.tables.name";
        SqlCommand cmd = new SqlCommand(sql);
        DataTable dt = cmd.ExecuteDataTable();

        template.OpenBlock("tableList");
        foreach (DataRow dr in dt.Rows)
        {
            template.ReplaceVar("tableName", dr["name"].ToString());
            template.ReplaceVar("tableDescription", dr["description"].ToString());


            sql = @"select extended_properties.value AS description, 
                        columnType=(select name from systypes where systypes.xusertype=sys.all_columns.user_type_id),* 
                        from sys.all_columns 
                        left join sys.extended_properties on  sys.all_columns.object_id=extended_properties.major_id 
                        and sys.all_columns.column_id=extended_properties.minor_id
                        and minor_id>1
                        where object_id=@object_id";
            cmd = new SqlCommand(sql);
            cmd.Parameters.Add("@object_Id", SqlDbType.Int).Value = dr["object_id"];
            DataTable dtColumn = cmd.ExecuteDataTable();

            template.OpenBlock("columnList");

            int sequence = 1;
            foreach (DataRow drColumn in dtColumn.Rows)
            {
                template.ReplaceVar("sequence", sequence++);
                template.ReplaceVar("columnName", drColumn["name"]);
                template.ReplaceVar("columnType", drColumn["columnType"]);
                template.ReplaceVar("columnDescription", drColumn["description"]);
                template.Flush();
            }
            template.CloseBlock();

            template.Flush();
        }
        template.CloseBlock();

        Response.Write(template.Text);
    }
}