using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.Profile;
using Assignment_1.shopping;
using System.Linq;
using System.Collections.Generic;

namespace Assignment_1.shopping {
    public partial class Checkout : BasePage {
        SqlCommand cmd;
        public dynamic Profile;
        protected void Page_Load(object sender, EventArgs e) {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
            if (Context.User.IsInRole("Admin") || Context.User.IsInRole("Dealer") || Context.User.IsInRole("Member")) {
                Profile = ProfileBase.Create(Membership.GetUser().UserName);
            } else {
                Profile = ProfileBase.Create("Guest");
            }
            
            if (!Page.IsPostBack) {
                if (User.Identity.IsAuthenticated) {
                    if (Profile.Cart.isEmpty()) {
                        Wizard1.Visible = false;
                        NoCartSpan.Visible = true;
                    } else {
                        Wizard1.ActiveStepIndex = 1;
                        Button nextButton = ((Button)Wizard1.FindControl("StartNavigationTemplateContainerID").FindControl("StartNextButton"));
                        nextButton.Visible = true;
                    }
                } else {
                    Wizard1.ActiveStepIndex = 0;
                    Button nextButton = ((Button)Wizard1.FindControl("StartNavigationTemplateContainerID").FindControl("StartNextButton"));
                    nextButton.Visible = false;
                }
            }
        }
        protected void chkUseProfileAddress_CheckChanged(object sender, System.EventArgs e) {
            if (chkUseProfileAddress.Checked) {
                ((TextBox)Wizard1.FindControl("txtName")).Text = Profile.Name;
                ((TextBox)Wizard1.FindControl("txtAddress")).Text = Profile.Address;
                ((TextBox)Wizard1.FindControl("txtCity")).Text = Profile.City;
                ((TextBox)Wizard1.FindControl("txtPostCode")).Text = Profile.PostCode;
                ((TextBox)Wizard1.FindControl("txtCountry")).Text = Profile.Country;
                ((TextBox)Wizard1.FindControl("txtName")).DataBind();
                ((TextBox)Wizard1.FindControl("txtAddress")).DataBind();
                ((TextBox)Wizard1.FindControl("txtCity")).DataBind();
                ((TextBox)Wizard1.FindControl("txtPostCode")).DataBind();
                ((TextBox)Wizard1.FindControl("txtCountry")).DataBind();
            }
        }
        protected void Wizard1_FinishedButtonClick(object sender, WizardNavigationEventArgs e) {
            try {
                int s = addOrder();
                addOrderLines(s);
                Button nextButton = ((Button)Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishPreviousButton"));
                nextButton.Visible = false;
                nextButton = ((Button)Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishButton"));
                nextButton.Visible = false;
                finishedSpan.InnerHtml = "You're order has been placed successfully. Thankyou for our business.<br/><br/>You can return to our <a href=\"../ pages / Photographs.aspx\">products</a> page or view our <a href = \"../pages/Specials.aspx\" > specials.</ a ></ p >";
                Profile.Cart.Items.Clear();
                Profile.Name = ((TextBox)Wizard1.FindControl("txtName")).Text;
                Profile.Address = ((TextBox)Wizard1.FindControl("txtAddress")).Text;
                Profile.City = ((TextBox)Wizard1.FindControl("txtCity")).Text;
                Profile.PostCode = ((TextBox)Wizard1.FindControl("txtPostCode")).Text;
                Profile.Country = ((TextBox)Wizard1.FindControl("txtCountry")).Text;
                Profile.Save();
            } catch (Exception p) {
                CreateOrderErrorLabel.Text = p.ToString();
                CreateOrderErrorLabel.Visible = true;
            }

        }
        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e) {
            if (e.CurrentStepIndex == 0) {
                Login l = (Login)Wizard1.FindControl("Login1");
                if (Membership.ValidateUser(l.UserName, l.Password)) {
                    e.Cancel = false;
                } else {
                    l.InstructionText = "Your login attempt was not successful. Please try again.";
                    l.InstructionTextStyle.ForeColor = System.Drawing.Color.Red;
                    e.Cancel = true;
                }
            }
            }
        protected void Wizard1_ActiveStepChanged(object sender, EventArgs e) {
            if (!User.Identity.IsAuthenticated)
                Wizard1.ActiveStepIndex = 0;
            
        }
        private int addOrder() {
            using (SqlConnection cn = new SqlConnection((ConfigurationManager.ConnectionStrings["orders"].ConnectionString))) {
                cn.Open();
                using (SqlTransaction tr = cn.BeginTransaction()) {
                    cmd = new SqlCommand();
                    cmd.Connection = cn;
                    // set the order details
                    cmd.CommandText = "INSERT INTO Orders (OrderDate, Name, Address, PostCode, County, Total)" +
                                      "VALUES (@OrderDate, @Name, @Address, @PostCode, @Country, @Total)" +
                                      "SELECT CAST(scope_identity() AS int)";
                    // Add parameter definitions
                    cmd.Parameters.Add("@OrderDate", SqlDbType.DateTime);
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@Address", SqlDbType.VarChar, 255);
                    cmd.Parameters.Add("@PostCode", SqlDbType.VarChar, 5);
                    cmd.Parameters.Add("@Country", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@Total", SqlDbType.VarChar, 50);
                    // Add parameters
                    cmd.Parameters["@OrderDate"].Value = DateTime.Now;
                    cmd.Parameters["@Name"].Value = User.Identity.Name.ToString();
                    cmd.Parameters["@Address"].Value = ((TextBox)Wizard1.FindControl("txtAddress")).Text;
                    cmd.Parameters["@PostCode"].Value = ((TextBox)Wizard1.FindControl("txtPostCode")).Text;
                    cmd.Parameters["@Country"].Value = ((TextBox)Wizard1.FindControl("txtCountry")).Text;
                    cmd.Parameters["@Total"].Value = Profile.Cart.Total.ToString();
                    cmd.Transaction = tr;
                    int s = Convert.ToInt32(cmd.ExecuteScalar());
                    tr.Commit();
                    return s;
                }
            }
        }
        private void addOrderLines(int id) {
            using (SqlConnection cn = new SqlConnection((ConfigurationManager.ConnectionStrings["orders"].ConnectionString))) {
                cn.Open();
                using (SqlTransaction tr = cn.BeginTransaction()) {
                    cmd = new SqlCommand();
                    cmd.Connection = cn;
                    // set the order details
                    cmd.CommandText = "INSERT INTO OrderLines(OrderID, ProductID, Quantity, Price)" +
                        "VALUES (@OrderID, @ProductID, @Quantity, @Price)";
                    // Add parameter definitions
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@OrderID", SqlDbType.Int);
                    cmd.Parameters.Add("@ProductID", SqlDbType.Int);
                    cmd.Parameters.Add("@Quantity", SqlDbType.Int);
                    cmd.Parameters.Add("@Price", SqlDbType.Money);
                    // Add parameters
                    cmd.Transaction = tr;
                    foreach (SItem item in Profile.Cart.Items) {
                        //foreach (SItem item in items) {
                        cmd.Parameters["@OrderID"].Value = id;
                        cmd.Parameters["@ProductId"].Value = item.id;
                        cmd.Parameters["@Quantity"].Value = item.qty;
                        cmd.Parameters["@Price"].Value = item.price;
                        cmd.ExecuteNonQuery();
                        //}
                    }
                    tr.Commit();
                }
            }
        }
        protected void Wizard1_PreRender(object sender, EventArgs e) {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();

        }
        protected string GetClassForWizardStep(object wizardStep) {
            WizardStep step = wizardStep as WizardStep;
            if (step == null) {
                return "";
            }
            int stepIndex = Wizard1.WizardSteps.IndexOf(step);
            if (stepIndex < Wizard1.ActiveStepIndex) {
                return "prevStep";
            } else if (stepIndex > Wizard1.ActiveStepIndex) {
                return "nextStep";
            } else {
                return "currentStep";
            }
        }
    }
}
