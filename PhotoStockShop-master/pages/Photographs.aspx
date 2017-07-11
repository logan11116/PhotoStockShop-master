<%@ Page Title="Photograph Listings" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Photographs.aspx.cs" Inherits="Assignment_1.pages.Photographs" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <h1>Photograph Listings</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%--Table Selector--%>
            <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True" DataTextField="Category"></asp:DropDownList>
            <%--Table--%>
            <div>
                <br />
                <asp:GridView CssClass="GridView" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" RowStyle-HorizontalAlign="Right">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}"></asp:BoundField>
                        <asp:BoundField DataField="Image" HeaderText="Image" Visible="false" SortExpression="Image"></asp:BoundField>
                        <asp:BoundField DataField="Category" HeaderText="Category" Visible="false" SortExpression="Category"></asp:BoundField>
                        <asp:BoundField DataField="_id" HeaderText="_id" Visible="false" SortExpression="_id"></asp:BoundField>
                        <asp:ImageField DataImageUrlField="Thumbnail" ControlStyle-Width="275" ControlStyle-Height="175" HeaderText="Thumbnail" />
                        <asp:TemplateField Visible="true">
                            <ItemTemplate>
                                <asp:Button Text="Add to Cart" runat="server" PostBackUrl='<%# Eval("_id", "../shopping/ShoppingCartItem.aspx?id={0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
                    SelectCommand="SELECT [Name], [Category], [Price], [Thumbnail], [_id] FROM [photoTable] WHERE ([Category] = @Category)">
                    <SelectParameters>
                        <asp:ControlParameter Name="Category" ControlID="DropDownList1" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT DISTINCT [Category] FROM [photoTable]"></asp:SqlDataSource>
                <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
