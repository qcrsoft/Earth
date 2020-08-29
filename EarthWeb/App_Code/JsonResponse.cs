using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class JsonResponse
{
    public JsonResponse()
    {
        this.Result = true;
        this.Message = "";
    }
    public JsonResponse(string message)
    {
        this.Message = message;
        this.Result = false;
    }
    public bool Result { get; set; }
    public string Message { get; set; }
}
