<%@ Page Title="Manage Catalogue" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ManageCatalogue.aspx.cs" Inherits="Assignment_1.admin.ManageCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%--Table Selector--%>
                <h1>Manage Catalogue</h1>
                <h3>Select photograph catagory:</h3>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True" DataTextField="Category"></asp:DropDownList>
            <%--Table--%>
                <h3>Existing catalogue items.</h3>
                <asp:GridView ID="GridView2" DataKeyNames="_id" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowSorting="True" AllowPaging="True" RowStyle-HorizontalAlign="Right">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                        <asp:BoundField DataField="_id" HeaderText="ID" visible="false" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Price"></asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Thumbnail" DataFormatString="{0:C}"></asp:BoundField>
                        <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" SortExpression="PurchasePrice" DataFormatString="{0:C}"></asp:BoundField>
                        <asp:BoundField DataField="Featured" HeaderText="Featured" SortExpression="Featured"></asp:BoundField>
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"></asp:BoundField>
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image"></asp:BoundField>
                        <asp:BoundField DataField="Thumbnail" HeaderText="Thumbnail" SortExpression="Thumbnail"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <br /><br />
                <h3>Add a new item to the catalogue.</h3>
                <asp:FormView ID="FormView1" DataSourceID="SqlDataSource3" runat="server" AutoGenerateRows="False" DefaultMode="Insert" OnItemInserted="updater" DataKeyNames="_id" AllowPaging="True" CellPadding="2" CellSpacing="2" EditRowStyle-HorizontalAlign="Right">
                    <InsertItemTemplate>
                        Name:
                        <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /><br />
                        Price:
                        <asp:TextBox Text='<%# Bind("Price", "{0:C}") %>' runat="server" ID="PriceTextBox" /><br />
                        PurchasePrice:
                        <asp:TextBox Text='<%# Bind("PurchasePrice", "{0:C}") %>' runat="server" ID="PurchasePriceTextBox" /><br />
                        Featured:
                        <asp:TextBox Text='<%# Bind("Featured") %>' runat="server" ID="FeaturedTextBox" /><br />
                        Image:
                        <asp:TextBox Text='<%# Bind("Image") %>' runat="server" ID="ImageTextBox" /><br />
                        Thumbnail:
                        <asp:TextBox Text='<%# Bind("Thumbnail") %>' runat="server" ID="ThumbnailTextBox" /><br /><br />
                        <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="FormButtonClass" />
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="FormButtonClass" />
                    </InsertItemTemplate>
                </asp:FormView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT DISTINCT [Category] FROM [photoTable]"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
                SelectCommand="SELECT [_id], [Name], [Price], [PurchasePrice], [Thumbnail], [Image], [Category], [Featured] FROM [photoTable] WHERE ([Category] = @Category)"
                DeleteCommand="DELETE FROM [photoTable] WHERE [_id] = @_id"
                InsertCommand="INSERT INTO [photoTable] ([Name], [Price], [PurchasePrice], [Thumbnail], [Image], [Category], [Featured]) VALUES (@Name, @Price, @PurchasePrice, @Thumbnail, @Image, @Category, @Featured)"
                UpdateCommand="UPDATE [photoTable] SET [Name] = @Name, [Price] = @Price, [PurchasePrice] = @PurchasePrice, [Thumbnail] = @Thumbnail, [Image] = @Image, [Category] = @Category, [Featured] = @Featured WHERE [_id] = @_id">
                <DeleteParameters>
                    <asp:Parameter Name="_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PurchasePrice" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="Featured" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Category" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Thumbnail" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PurchasePrice" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="Featured" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Category" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Thumbnail" Type="String"></asp:Parameter>
                    <asp:Parameter Name="_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter Name="Category" ControlID="DropDownList1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>'
                InsertCommand="INSERT INTO [photoTable] ([Name], [Price], [PurchasePrice], [Featured], [Category], [Image], [Thumbnail]) VALUES (@Name, @Price, @PurchasePrice, @Featured, @Category, @Image, @Thumbnail)"
                SelectCommand="SELECT [Name], [Price], [PurchasePrice], [Featured], [Image], [Thumbnail], [_id] FROM [photoTable] WHERE ([Category] = @Category)"
                DeleteCommand="DELETE FROM [photoTable] WHERE [_id] = @_id"
                UpdateCommand="UPDATE [photoTable] SET [Name] = @Name, [Price] = @Price, [PurchasePrice] = @PurchasePrice, [Featured] = @Featured, [Image] = @Image, [Thumbnail] = @Thumbnail WHERE [_id] = @_id">
                <DeleteParameters>
                    <asp:Parameter Name="_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PurchasePrice" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="Featured" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Thumbnail" Type="String"></asp:Parameter>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Category" Type="String"></asp:ControlParameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Category" Type="String"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="PurchasePrice" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="Featured" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Thumbnail" Type="String"></asp:Parameter>
                    <asp:Parameter Name="_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
