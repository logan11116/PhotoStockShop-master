using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.Master_Pages {
    public partial class master : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            string selectedTheme = "";
            if (!Page.IsPostBack) {
                selectedTheme = Page.Theme;
                HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme");
                if (preferredTheme != null) {
                    selectedTheme = preferredTheme.Value;
                }
                if (!string.IsNullOrEmpty(selectedTheme)) {
                    ListItem item = Theme_DropDownList.Items.FindByValue(selectedTheme);
                    if (item != null) {
                        item.Selected = true;
                    }
                }
            }
        }

        protected void Theme_DropDownList_SelectedIndexChanged(object sender, EventArgs e) {
            HttpCookie preferredTheme = new HttpCookie("PreferredTheme");
            preferredTheme.Expires = DateTime.Now.AddMonths(3);
            preferredTheme.Value = Theme_DropDownList.SelectedValue;
            Response.Cookies.Add(preferredTheme);
            Response.Redirect(Request.Url.ToString());
        }
    }
}