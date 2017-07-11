<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Assignment_1.shopping.ShoppingCart" %>

<%@ Register Src="~/shopping/Cart.ascx" TagPrefix="uc1" TagName="Carts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <uc1:Carts runat="server" id="Cart" />
</asp:Content>
