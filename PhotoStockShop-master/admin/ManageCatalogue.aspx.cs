using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.admin {
    public partial class ManageCatalogue : BasePage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Request.QueryString.Get("id") != null) {
                FormView1.DefaultMode = FormViewMode.Edit;
            }
        }
 
      public void updater(object sender, FormViewInsertedEventArgs e) {
            GridView GV2 = (GridView)UpdatePanel1.FindControl("GridView2");
            GV2.DataBind();
        }
    }
}