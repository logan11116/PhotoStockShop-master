<%@ Page Title="Register" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment_1.pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <h1>Welcome to Photo Stock Shop!</h1>
    <h1>We welcome your registration. Please fill out the form below to register.</h1>
    <asp:CreateUserWizard class="WizardForms" ID="CreateUserWizard1" ContinueDestinationPageUrl="~/pages/Specials.aspx" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard></asp:Content>
