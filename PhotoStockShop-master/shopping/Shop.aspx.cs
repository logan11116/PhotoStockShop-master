﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.shopping
{
    public partial class Shop : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected string GetBooleanText(object booleanValue)
        {
            bool authorized = (bool)booleanValue;
            if (authorized)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
    }
}