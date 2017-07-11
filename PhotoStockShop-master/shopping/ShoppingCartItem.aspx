<%@ Page Title="Shopping Cart item" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ShoppingCartItem.aspx.cs" Inherits="Assignment_1.shopping.ShoppingCartItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <asp:Label ID="noItemLabel" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
        SelectCommand="SELECT [_id] AS id, IIF([Featured]='1',[Price] * 0.85,[Price]) AS [Price], [Name], [Category], [Image] FROM [photoTable] WHERE ([_id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
        SelectCommand="SELECT [_id] AS id, [Name], IIF([Featured]='1',[Price] * 0.85,[Price]) AS [Price], [Category], [Image] FROM [photoTable] WHERE ([_id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
        SelectCommand="SELECT [_id] AS id, [Name], [Price], [Category], [Image] FROM [photoTable] WHERE ([_id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList CssClass="DataList1" ID="DataList1" runat="server" DataKeyField="id">
        <ItemTemplate>
            <asp:Image ID="ImageImage" runat="server" Text='<%# Eval("Image", "{0}") %>' ImageUrl='<%# Eval("Image", "{0}") %>' />
            <asp:Label Text='<%# Eval("Image") %>' runat="server" visible="false" ID="ImageLabel" /><br />
            <br />
            Name:
            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
            Price:
            <asp:Label Text='<%# Eval("Price", "{0:C}") %>' ID="PriceLabel" runat="server" /><br />
            Category:
            <asp:Label Text='<%# Eval("Category") %>' runat="server" ID="CategoryLabel" />
            <br /><br />
        </ItemTemplate>
    </asp:DataList>
    <asp:Button ID="addToCartButton" runat="server" OnClick="Button1_Click" Text="Add to Cart" /><br />
    <br />
    <a href='javascript:window.history.back()' id="backHref">Return to Shop</a>
</asp:Content>
