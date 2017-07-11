<%@ Page Title="Welcome to Photo Stock Shop" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment_1.pages.Default" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content_Placeholder" runat="server">
     <h2>
        Welcome to the Photo Stock Shop catalogs
    </h2>

    <p>
        Please choose one of the links below to choose the items you wish to view.<br /><br />
        <asp:HyperLink ID="photo_catalog_hyperlink" NavigateUrl="../pages/Photographs.aspx" runat="server">Photograph catalog</asp:HyperLink><br />
        <asp:HyperLink ID="photo_specials_hyperlink" NavigateUrl="../pages/Specials.aspx" runat="server">Photographs on special</asp:HyperLink><br />
    </p>
</asp:Content>

