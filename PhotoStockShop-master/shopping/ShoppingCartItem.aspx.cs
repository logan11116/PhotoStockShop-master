using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.shopping {
    public partial class ShoppingCartItem : BasePage {
        dynamic Profile;
        protected void Page_Load(object sender, EventArgs e) {
            if (Request.QueryString["id"] != null) {
                if (User.IsInRole("Admin") || User.IsInRole("Dealer")) {
                    DataList1.DataSource = SqlDataSource1;
                    Profile = ProfileBase.Create(Membership.GetUser().UserName);
                } else if (User.IsInRole("Member")) {
                    DataList1.DataSource = SqlDataSource2;
                    Profile = ProfileBase.Create(Membership.GetUser().UserName);
                } else {
                    DataList1.DataSource = SqlDataSource3;
                    Profile = ProfileBase.Create("Guest");
                }
                Profile.Save();
                DataList1.DataBind();
            } else {
                noItemLabel.Text = "Please go back to the products or specials page and select an item to view";
                addToCartButton.Visible = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e) {
            Double Price = double.Parse(((Label)DataList1.Controls[0].FindControl("PriceLabel")).Text, System.Globalization.NumberStyles.Currency);
            string Name = ((Label)DataList1.Controls[0].FindControl("NameLabel")).Text;
            string Image = ((Label)DataList1.Controls[0].FindControl("ImageLabel")).Text;
            int Id = int.Parse(Request.QueryString["id"]);
            if (Profile.Cart == null) {
                Profile.Cart = new Assignment_1.shopping.SCart();
            }
            Profile.Cart.Insert(Id, Price, 1, Name, Image);
            Profile.Save();
            Server.Transfer("ShoppingCart.aspx");
        }
     
    }
}