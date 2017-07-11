using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.pages {
    public partial class Photographs : BasePage {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                DropDownList1.Items.Insert(0, new ListItem("-Select Category-", ""));
                GridView1.Visible = false;
            } else {
                GridView1.DataBind();
                GridView1.Visible = true;
                DropDownList1.Items.Remove((DropDownList1.Items.FindByText("-Select Category-")));
           }
        }
    }
}