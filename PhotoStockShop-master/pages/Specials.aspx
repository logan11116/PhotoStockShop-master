<%@ Page Title="Specials Listings" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Specials.aspx.cs" Inherits="Assignment_1.pages.Specials" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <h1>Welcome to our specials!</h1>
                    <br />
                    <h3>To be eligible to see and purchase listed specials, you must register as a member</h3>
                    <br />
                    <h3>To become a member, <a href='Register.aspx'>register now.</a></h3>
                </AnonymousTemplate>
                <RoleGroups>
                    <asp:RoleGroup Roles="Admin,Dealer">
                        <ContentTemplate>
                            <h1>Welcome to our Admin specials!</h1>
                            <br/>
                            <h3> Here at Photo Stock Shop we sell items at 15 % off their regular listed price to dealers.</h3>
                            <br />
                            <%--Table Selector--%>
                            <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True"
                                DataTextField="Category">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT DISTINCT [Category] FROM [photoTable]"></asp:SqlDataSource>
                            <%--Tables--%>
                            <div>
                                <br />
                                <asp:GridView ID="GridView1" DataSourceID="SqlDataSource3" runat="server" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Right">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField DataField="Image" HeaderText="Image" Visible="false" SortExpression="Image"></asp:BoundField>
                                        <asp:BoundField DataField="Category" HeaderText="Category" Visible="false" SortExpression="Category"></asp:BoundField>
                                        <asp:BoundField DataField="_id" HeaderText="_id" Visible="false" SortExpression="_id"></asp:BoundField>
                                        <asp:ImageField DataImageUrlField="Thumbnail" ControlStyle-Width="275" ControlStyle-Height="175" HeaderText="Thumbnail" />
                                        <asp:TemplateField Visible="true">
                                            <ItemTemplate>
                                                <asp:Button Text="Add to Cart" runat="server"
                                                    PostBackUrl='<%# String.Format("../shopping/ShoppingCartItem.aspx?id={0}", DataBinder.Eval(Container.DataItem, "_id"), DataBinder.Eval(Container.DataItem, "Price"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT [Name], [Price] * 0.85 AS [Price], [Thumbnail], [Image], [Category], [_id] FROM [photoTable] WHERE (([Category] = @Category) AND ([Featured] = 1))">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="Category" ControlID="DropDownList1" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
                <RoleGroups>
                    <asp:RoleGroup Roles="Member">
                        <ContentTemplate>
                            <h1>Welcome to our member specials!</h1><br/><h3>Here at Photo Stock Shop we feature a number of photographs on special.</h3>
                            <br/>
                            <h3>Featured photographs are available at 10% off their regular listed sale price to members.</h3>
                            <br/>
                            <%--Table Selector--%>
                            <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True"
                                DataTextField="Category">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT DISTINCT [Category] FROM [photoTable]"></asp:SqlDataSource>
                            <%--Tables--%>
                            <div>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Right">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField DataField="Image" HeaderText="Image" Visible="false" SortExpression="Image"></asp:BoundField>
                                        <asp:BoundField DataField="Category" HeaderText="Category" Visible="false" SortExpression="Category"></asp:BoundField>
                                        <asp:BoundField DataField="_id" HeaderText="_id" Visible="false" SortExpression="_id"></asp:BoundField>
                                        <asp:ImageField DataImageUrlField="Thumbnail" ControlStyle-Width="275" ControlStyle-Height="175" HeaderText="Thumbnail" />
                                        <asp:TemplateField Visible="true">
                                            <ItemTemplate>
                                                <asp:Button Text="Add to Cart" runat="server"
                                                    PostBackUrl='<%# String.Format("../shopping/ShoppingCartItem.aspx?id={0}", DataBinder.Eval(Container.DataItem, "_id"), DataBinder.Eval(Container.DataItem, "Price"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:photostockshopstring %>' SelectCommand="SELECT [Name], [Price] * 0.9 AS [Price], [Thumbnail], [Image], [Category], [_id] FROM [photoTable] WHERE (([Category] = @Category) AND ([Featured] = 1))">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="Category" ControlID="DropDownList1" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
