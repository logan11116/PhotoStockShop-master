<%@ Page Title="Add User To Role" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="AddUserToRole.aspx.cs" Inherits="Assignment_1.admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content_Placeholder" runat="server">
    <div>
        <h1>Add User To Role</h1>
        <h3>Select a user</h3>
        <asp:ListBox Width="150px" ID="ListBox1" runat="server"></asp:ListBox>
        <h3>Select a role</h3>
        <asp:ListBox Width="150px" ID="ListBox2" runat="server"></asp:ListBox>
    </div><br />
    <div>
        <h3>Click button to add user to role</h3>
        <asp:Button ID="Button1" runat="server" Text="Add user to role" OnClick="Button1_Click"/><br /><br />
        <span id="myspan" runat="server"></span>
    </div><br />
   <%-- Used to Create New Roles 
    <div>
        Create New Role : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Create" OnClick="Button2_Click" />
    </div>
    --%>
   </asp:Content>
