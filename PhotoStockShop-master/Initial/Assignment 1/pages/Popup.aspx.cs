using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.pages {
    public partial class Popup : BasePage {
        protected void Page_Load(object sender, EventArgs e) {

            image.ImageUrl = Request.QueryString.Get(0);
            price.Text = Request.QueryString.Get(1);
            name.Text = Request.QueryString.Get(2);



        }
    }
}