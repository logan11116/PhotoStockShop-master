<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Assignment_1.pages.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <div>
      <h1>Change your password</h1>
      <asp:ChangePassword class="WizardForms" ID="ChangePassword1" runat="server">
          <ChangePasswordTemplate>
              <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;">
                  <tr>
                      <td>
                          <table cellpadding="2">
                              <tr>
                                  <td align="right">
                                      <asp:Label runat="server" AssociatedControlID="CurrentPassword" ID="CurrentPasswordLabel">Password:</asp:Label></td>
                                  <td>
                                      <asp:TextBox runat="server" TextMode="Password" ID="CurrentPassword" Width="250px"></asp:TextBox>
                                      <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ValidationGroup="ChangePassword1" ToolTip="Password is required." ID="CurrentPasswordRequired">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label runat="server" AssociatedControlID="NewPassword" ID="NewPasswordLabel">New Password:</asp:Label></td>
                                  <td>
                                      <asp:TextBox runat="server" TextMode="Password" ID="NewPassword" Width="250px"></asp:TextBox>
                                      <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ValidationGroup="ChangePassword1" ToolTip="New Password is required." ID="NewPasswordRequired">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword" ID="ConfirmNewPasswordLabel">Confirm New Password:</asp:Label></td>
                                  <td>
                                      <asp:TextBox runat="server" TextMode="Password" ID="ConfirmNewPassword" Width="250px"></asp:TextBox>
                                      <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ValidationGroup="ChangePassword1" ToolTip="Confirm New Password is required." ID="ConfirmNewPasswordRequired">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center" colspan="2">
                                      <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="The Confirm New Password must match the New Password entry." Display="Dynamic" ValidationGroup="ChangePassword1" ID="NewPasswordCompare"></asp:CompareValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center" colspan="2" style="color: Red;">
                                      <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                  </td>
                              </tr>
                              <tr><td></td>
                                  <td align="right">
                                      <asp:Button runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" ID="ChangePasswordPushButton"></asp:Button>
                                      <asp:Button runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ID="CancelPushButton"></asp:Button>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </table>
          </ChangePasswordTemplate>
      </asp:ChangePassword>
  </div>
</asp:Content>