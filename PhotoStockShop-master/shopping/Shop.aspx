<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Assignment_1.shopping.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' 
        SelectCommand="SELECT [_id] AS id, [Name], [Price], [Thumbnail], [Category] FROM [photoTable]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" DataKeyField="id" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <asp:Label Text='<%# Eval("id") %>' runat="server" Visible="false" ID="idLabel" /><br />
            <asp:ImageButton ImageUrl='<%# Eval("Thumbnail","{0}") %>' runat="server" ID="ThumbnailLabel"
                PostBackUrl='<%# Eval("id", "../shopping/ShoppingCartItem.aspx?id={0}") %>' /><br />
            Name:
            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" />
            <br />
            Price:
            <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /><br />
            Category:
            <asp:Label Text='<%# Eval("Category") %>' runat="server" ID="CategoryLabel" /><br />
            <br />
        </ItemTemplate>
    </asp:DataList>

</asp:Content>
