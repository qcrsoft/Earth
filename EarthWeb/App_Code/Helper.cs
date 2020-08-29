using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public static class Helper
{
    public static int RequestInt(string key)
    {
        int intValue;
        string strValue = HttpContext.Current.Request[key];
        int.TryParse(strValue, out intValue);
        return intValue;
    }

    public static string RequestString(string key)
    {
        string value = HttpContext.Current.Request[key];
        if (value == null)
            value = "";
        return value;
    }
}