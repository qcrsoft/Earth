<%@ WebHandler Language="C#" Class="DeleteManager" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

public class DeleteManager : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        JsonResponse jsonResponse;
        try
        {
            string[] ids = Helper.RequestString("ids").Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

            if (ids.Length > 0)
            {
                DataContext db = new DataContext();
                int[] s = (from id in ids select int.Parse(id)).ToArray();

                List<Manager> managers = db.Managers.Where(p => s.Contains(p.Id)).ToList();
                managers.ForEach(p => p.Enabled = 0);
                db.SaveChanges();
            }

            jsonResponse = new JsonResponse();

        }
        catch (Exception ex)
        {
            jsonResponse = new JsonResponse(ex.Message);
        }

        string json = JsonConvert.SerializeObject(jsonResponse);
        context.Response.Write(json);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}