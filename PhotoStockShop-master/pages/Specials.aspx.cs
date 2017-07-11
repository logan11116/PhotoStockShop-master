using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.pages {
    public partial class Specials : BasePage {
        protected void Page_Load(object sender, EventArgs e) {
            if (User.IsInRole("Dealer") || User.IsInRole("Admin") || User.IsInRole("Member")) {
                DropDownList DropDownList1 = (DropDownList)LoginView1.FindControl("DropDownList1");
                GridView GridView1 = (GridView)LoginView1.FindControl("GridView1");
                if (!IsPostBack) {
                    DropDownList1.Items.Insert(0, new ListItem("-Select Category-", ""));
                } else {
                    DropDownList1.Items.Remove((DropDownList1.Items.FindByText("-Select Category-")));
                    GridView1.DataBind();
                    GridView1.Visible = true;
                }
            }
        }
    }
}