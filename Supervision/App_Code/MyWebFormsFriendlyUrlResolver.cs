﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for MyWebFormsFriendlyUrlResolver
/// </summary>
public class MyWebFormsFriendlyUrlResolver : Microsoft.AspNet.FriendlyUrls.Resolvers.WebFormsFriendlyUrlResolver
{
    protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, Page page, String mobileSuffix)
    {
        if (mobileSuffix == "Mobile")
        {
            return false;
        }
        else
        {
            return base.TrySetMobileMasterPage(httpContext, page, mobileSuffix);
        }
    }
}