<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment_1.shopping.Checkout" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Assignment_1.shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <%@ Register Src="~/shopping/Cart.ascx" TagPrefix="uc1" TagName="Carts" %>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <span id="NoCartSpan" runat="server" visible="false">
                <p>
                    There is nothing in your shopping cart. Your can buy items from our 
                <a href="../pages/Photographs.aspx">products</a> or 
                <a href="../pages/Specials.aspx">specials</a> catalogue.
                </p>
            </span>
            <asp:Label ID="CreateOrderErrorLabel" runat="server" Visible="false">FAILED.</asp:Label>
            <asp:Wizard ID="Wizard1" class="WizardFormsCheckout" runat="server" ActiveStepIndex="0" OnFinishButtonClick="Wizard1_FinishedButtonClick" OnActiveStepChanged="Wizard1_ActiveStepChanged" DisplaySideBar="False">
                <HeaderTemplate>
                    <div id="wizHead">
                        <ul id="wizHeader">
                            <asp:Repeater ID="SideBarList" runat="server">
                                <ItemTemplate>
                                    <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Title")%>">
                                        <%# Eval("Name")%></a> </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </HeaderTemplate>
                <FinishNavigationTemplate>
                    <asp:Button CssClass="WizardButton" ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                    <asp:Button CssClass="WizardButton" ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
                </FinishNavigationTemplate>
                <StartNavigationTemplate>
                    <asp:Button CssClass="WizardButton" ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" />
                </StartNavigationTemplate>
                <StepNavigationTemplate>
                    <asp:Button CssClass="WizardButton" ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                    <asp:Button CssClass="WizardButton" ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
                </StepNavigationTemplate>
                <WizardSteps>
                    <asp:WizardStep ID="LoginStep" runat="server" Title="Login">
                        <asp:LoginView ID="LoginView1" runat="server">
                            <AnonymousTemplate>
                                <div class="WizLogin">
                                    <asp:Login ID="Login1" runat="server" DisplayRememberMe="False">
                                        <LayoutTemplate>
                                            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0">
                                                            <tr>
                                                                <td align="center" colspan="2">Log In</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl06$Login1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl06$Login1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="2" style="color: Red;">
                                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" colspan="2">
                                                                    <asp:Button CssClass="WizardButton" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl06$Login1" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                    </asp:Login>
                                </div>
                                <div class="WizPasswordRecovery">
                                    <asp:PasswordRecovery ID="PasswordRecoveryl" runat="server">
                                        <UserNameTemplate>
                                            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0">
                                                            <tr>
                                                                <td align="center" colspan="2">Forgot Your Password?</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="2">Enter your User Name to receive your password.</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl06$PasswordRecoveryl">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="2" style="color: Red;">
                                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" colspan="2">
                                                                    <asp:Button CssClass="WizardButton" ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="ctl06$PasswordRecoveryl" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </UserNameTemplate>
                                    </asp:PasswordRecovery>
                                </div>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <p>You are already logged in</p>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </asp:WizardStep>
                    <asp:WizardStep ID="AddressStep" runat="server" Title="Delivery Address">
                        <asp:CheckBox ID="chkUseProfileAddress" runat="server" AutoPostBack="True" Text="Use membership address" OnCheckedChanged="chkUseProfileAddress_CheckChanged"></asp:CheckBox><br />
                        <br />
                        <table border="0">
                            <tr>
                                <td>Name   </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" runat="server" ErrorMessage="Please Enter a Name"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Address   </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtAddress" runat="server" ErrorMessage="Please Enter a Street Adress"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>City   </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtCity" runat="server" ErrorMessage="Please Enter a City"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Postcode   </td>
                                <td>
                                    <asp:TextBox ID="txtPostCode" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPostCode" runat="server" ErrorMessage="Please Enter a Post Code"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Country   </td>
                                <td>
                                    <asp:TextBox ID="txtCountry" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCountry" runat="server" ErrorMessage="Please Enter a Country"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="PaymentStep" runat="server" Title="Payment">

                        <table border="0">
                            <tr>
                                <td>Card Type  </td>
                                <td>
                                    <asp:DropDownList ID="lstCardType" runat="server">
                                        <asp:ListItem>MasterCard</asp:ListItem>
                                        <asp:ListItem>Visa</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Card Number   </td>
                                <td>
                                    <asp:TextBox ID="txtNumber" required="true" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtNumber" runat="server" ErrorMessage="Please Enter a Card Number"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Expiry Month   </td>
                                <td>
                                    <asp:TextBox ID="txtExpiresMonth" runat="server" Columns="2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtExpiresMonth" runat="server" ErrorMessage="Please Enter a Month">
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtExpiresMonth" ErrorMessage="Enter a valid month between 1 and 12" MaximumValue="12" MinimumValue="1" Type="Integer" />
                                    </asp:RequiredFieldValidator></td></tr><tr>
                                <td>Expiry Year </td><td>
                                    <asp:TextBox ID="txtExpiresYear" runat="server" Columns="4" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtExpiresYear" runat="server" ErrorMessage="Please Enter a Year">
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtExpiresYear" ErrorMessage="Enter a valid year" MaximumValue="9999" MinimumValue="2016" Type="Integer" />
                                    </asp:RequiredFieldValidator></td></tr></table></asp:WizardStep><asp:WizardStep ID="ConfirmationStep" runat="server" Title="Confirmation">
                        <uc1:Carts ID="Carts1" runat="server" />
                        <br />
                        Please confirm the amount you wish to have deducted from your credit card.</asp:WizardStep><asp:WizardStep ID="CompleteStep" runat="server" Title="Complete">
                        <span class="finishedSpan" id="finishedSpan" runat="server">Please Click 'Finish' To finalise your purchase</span></asp:WizardStep></WizardSteps></asp:Wizard></ContentTemplate></asp:UpdatePanel></asp:Content>