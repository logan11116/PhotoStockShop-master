<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cart.ascx.cs" Inherits="Assignment_1.shopping.Cart" %>
<asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowCancelingEdit="CartGrid_RowCancelingEdit" OnRowDeleting="CartGrid_RowDeleting" OnRowEditing="CartGrid_RowEditing" OnRowUpdating="CartGrid_RowUpdating">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval ( "image", "{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="name" HeaderText="Item" ReadOnly="True" />
        <asp:BoundField DataField="image" HeaderText="Image" ReadOnly="True" />
        <asp:BoundField DataField="qty" HeaderText="Quantity" />
        <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="Price" ReadOnly="True" />
        <asp:BoundField DataField="subTotal" DataFormatString="{0:C}" HeaderText="Total" ReadOnly="True" />
        <asp:BoundField DataField="id" HeaderText="Item" visible="false" ReadOnly="True" />
        <asp:CommandField ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
    <EmptyDataTemplate>
        <p>There is nothing in your shopping cart. Your can buy items from our 
        <a href="../pages/Photographs.aspx">products</a> or 
        <a href="../pages/Specials.aspx">specials</a>  catalogue.</p>
    </EmptyDataTemplate>
</asp:GridView>
<br /><br /><asp:Label ID="TotalLabel" runat="server" ></asp:Label>