<%@ Page Title="Photograph Listings" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Photographs.aspx.cs" Inherits="Assignment_1.pages.Photographs" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content_Placeholder" runat="server">

    <h2 id="top">Photograph Listings
    </h2>

    <p id="hyperlinks">
        <asp:HyperLink ID="beaches_hyperlink" NavigateUrl="#btable" runat="server">Beaches</asp:HyperLink><br />
        <asp:HyperLink ID="cities_hyperlink" NavigateUrl="#ctable" runat="server">Cities</asp:HyperLink><br />
        <asp:HyperLink ID="landscapes_hyperlink" NavigateUrl="#ltable" runat="server">Landscapes</asp:HyperLink><br />
        <asp:HyperLink ID="space_hyperlink" NavigateUrl="#stable" runat="server">Space</asp:HyperLink><br />
        <br />
    </p>

    <div id="btable">
        <%--Beaches Table--%>
        <asp:Table ID="beaches_table" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Caption="Beaches" Width="450px">

            <asp:TableHeaderRow runat="server" CssClass="TableHeaderRow">
                <asp:TableHeaderCell Width="130px">Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="95px">Price</asp:TableHeaderCell>
                <asp:TableHeaderCell>Image</asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="row_beaches1" runat="server">
                <asp:TableCell>Beaches 1</asp:TableCell>
                <asp:TableCell>$0.99</asp:TableCell>
                <asp:TableCell><img src="../images/beaches1-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches2" runat="server">
                <asp:TableCell>Beaches 2</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/beaches2-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches3" runat="server">
                <asp:TableCell>Beaches 3</asp:TableCell>
                <asp:TableCell>$0.55</asp:TableCell>
                <asp:TableCell><img src="../images/beaches3-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches4" runat="server">
                <asp:TableCell>Beaches 4</asp:TableCell>
                <asp:TableCell>$0.65</asp:TableCell>
                <asp:TableCell><img src="../images/beaches4-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches5" runat="server">
                <asp:TableCell>Beaches 5</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/beaches5-sm.jpg" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:HyperLink ID="top_hyperlink1" NavigateUrl="#top" runat="server">Back to Top</asp:HyperLink><br />
        <br />
    </div>

    <div id="ctable">
        <%--Cities Table--%>
        <asp:Table ID="cities_table" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Caption="Cities" Width="450px">

            <asp:TableHeaderRow runat="server" CssClass="TableHeaderRow">
                <asp:TableHeaderCell Width="130px">Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="95px">Price</asp:TableHeaderCell>
                <asp:TableHeaderCell>Image</asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="row_cities1" runat="server">
                <asp:TableCell>Cities 1</asp:TableCell>
                <asp:TableCell>$1.05</asp:TableCell>
                <asp:TableCell><img src="../images/cities1-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_cities2" runat="server">
                <asp:TableCell>Cities 2</asp:TableCell>
                <asp:TableCell>$0.90</asp:TableCell>
                <asp:TableCell><img src="../images/cities2-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_cities3" runat="server">
                <asp:TableCell>Cities 3</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/cities3-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_cities4" runat="server">
                <asp:TableCell>Cities 4</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/cities4-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_cities5" runat="server">
                <asp:TableCell>Cities 5</asp:TableCell>
                <asp:TableCell>$1.05</asp:TableCell>
                <asp:TableCell><img src="../images/cities5-sm.jpg" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:HyperLink ID="top_hyperlink2" NavigateUrl="#top" runat="server">Back to Top</asp:HyperLink><br />
        <br />
    </div>

    <div id="ltable">
        <%--Landscape Table--%>
        <asp:Table ID="landscape_table" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Caption="Landscape" Width="450px">

            <asp:TableHeaderRow runat="server" CssClass="TableHeaderRow">
                <asp:TableHeaderCell Width="130px">Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="95px">Price</asp:TableHeaderCell>
                <asp:TableHeaderCell>Image</asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="row_landscape1" runat="server">
                <asp:TableCell>Landscape 1</asp:TableCell>
                <asp:TableCell>$0.75</asp:TableCell>
                <asp:TableCell><img src="../images/landscape1-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_landscape2" runat="server">
                <asp:TableCell>Landscape 2</asp:TableCell>
                <asp:TableCell>$1.00</asp:TableCell>
                <asp:TableCell><img src="../images/landscape2-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_landscape3" runat="server">
                <asp:TableCell>Landscape 3</asp:TableCell>
                <asp:TableCell>$1.05</asp:TableCell>
                <asp:TableCell><img src="../images/landscape3-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_landscape4" runat="server">
                <asp:TableCell>Landscape 4</asp:TableCell>
                <asp:TableCell>$1.05</asp:TableCell>
                <asp:TableCell><img src="../images/landscape4-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_landscape5" runat="server">
                <asp:TableCell>Landscape 5</asp:TableCell>
                <asp:TableCell>$1.15</asp:TableCell>
                <asp:TableCell><img src="../images/landscape5-sm.jpg" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:HyperLink ID="top_hyperlink3" NavigateUrl="#top" runat="server">Back to Top</asp:HyperLink><br />
        <br />
    </div>

    <div id="stable">
        <%--Space Table--%>
        <asp:Table ID="space_table" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Caption="Space" Width="450px">

            <asp:TableHeaderRow runat="server" CssClass="TableHeaderRow">
                <asp:TableHeaderCell Width="130px">Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="95px">Price</asp:TableHeaderCell>
                <asp:TableHeaderCell>Image</asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="row_space1" runat="server">
                <asp:TableCell>Space 1</asp:TableCell>
                <asp:TableCell>$0.65</asp:TableCell>
                <asp:TableCell><img src="../images/universe1-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space2" runat="server">
                <asp:TableCell>Space 2</asp:TableCell>
                <asp:TableCell>$0.80</asp:TableCell>
                <asp:TableCell><img src="../images/universe2-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space3" runat="server">
                <asp:TableCell>Space 3</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/universe3-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space4" runat="server">
                <asp:TableCell>Space 4</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell><img src="../images/universe4-sm.jpg" /></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space5" runat="server">
                <asp:TableCell>Space 5</asp:TableCell>
                <asp:TableCell>$0.95</asp:TableCell>
                <asp:TableCell><img src="../images/universe5-sm.jpg" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:HyperLink ID="top_hyperlink4" NavigateUrl="#top" runat="server">Back to Top</asp:HyperLink><br />
        <br />
    </div>
</asp:Content>
