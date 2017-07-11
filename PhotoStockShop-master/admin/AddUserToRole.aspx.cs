using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_1.admin {
    public partial class WebForm1 : BasePage {
        String message = "";
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                // Bind the users and roles 
                BindUsersToUserList();
                BindRolesToList();
            }
        }
        protected void Button1_Click(object sender, EventArgs e) {
            // Get the currently selected user and role 
            string selectedUserName = ListBox1.SelectedValue;
            string selectedRoleName = ListBox2.SelectedValue;
            if (Roles.IsUserInRole(selectedUserName, selectedRoleName)) {
                message = string.Format("User {0} already is a member of role {1}.", selectedUserName, selectedRoleName);
                myspan.InnerHtml = message;
                return;
            }
            Roles.AddUserToRole(selectedUserName, selectedRoleName);
            message = string.Format("User {0} was added to role {1}.", selectedUserName, selectedRoleName);
            myspan.InnerHtml = message;
        }
        private void BindUsersToUserList() {
            // Get all of the user accounts 
            MembershipUserCollection users = Membership.GetAllUsers();
            ListBox1.DataSource = users;
            ListBox1.DataBind();
        }
        private void BindRolesToList() {
            // Get all of the roles 
            string[] roles = Roles.GetAllRoles();
            ListBox2.DataSource = roles;
            ListBox2.DataBind();
        }
      //  protected void Button2_Click(object sender, EventArgs e) {
      //   String role = TextBox1.Text;
      //      Roles.CreateRole(role);
      //  }
    }
}