<%@ Page Title="Specials Listings" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Specials.aspx.cs" Inherits="Assignment_1.pages.Specials" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content_Placeholder" runat="server">

    <h2 id="top">Featured Photographs on Special
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

            <asp:TableRow ID="row_beaches2" runat="server">
                <asp:TableCell>Beaches 2</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                     <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../images/beaches2-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/beaches2-lg.jpg&price=$0.85&name=Beaches 2')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches3" runat="server">
                <asp:TableCell>Beaches 3</asp:TableCell>
                <asp:TableCell>$0.55</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/beaches3-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/beaches3-lg.jpg&price=$0.55&name=Beaches 3')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches4" runat="server">
                <asp:TableCell>Beaches 4</asp:TableCell>
                <asp:TableCell>$0.65</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../images/beaches4-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/beaches4-lg.jpg&price=$0.65&name=Beaches 4')">
                     </asp:ImageButton></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_beaches5" runat="server">
                <asp:TableCell>Beaches 5</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="../images/beaches5-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/beaches5-lg.jpg&price=$0.85&name=Beaches 5')">
                     </asp:ImageButton>
                </asp:TableCell>
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

            <asp:TableRow ID="row_cities3" runat="server">
                <asp:TableCell>Cities 3</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="../images/cities3-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/cities3-lg.jpg&price=$0.85&name=Cities 3')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_cities4" runat="server">
                <asp:TableCell>Cities 4</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="../images/cities4-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/cities4-lg.jpg&price=$0.85&name=Cities 4')">
                     </asp:ImageButton>
                </asp:TableCell>
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
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="../images/landscape1-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/landscape1-lg.jpg&price=$0.75&name=Landscape 1')">
                     </asp:ImageButton>
                </asp:TableCell>
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
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton16" runat="server" ImageUrl="../images/universe1-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/universe1-lg.jpg&price=$0.65&name=Space 1')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space2" runat="server">
                <asp:TableCell>Space 2</asp:TableCell>
                <asp:TableCell>$0.80</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton17" runat="server" ImageUrl="../images/universe2-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/universe2-lg.jpg&price=$0.80&name=Space 2')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space3" runat="server">
                <asp:TableCell>Space 3</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton18" runat="server" ImageUrl="../images/universe3-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/universe3-lg.jpg&price=$0.85&name=Space 3')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="row_space4" runat="server">
                <asp:TableCell>Space 4</asp:TableCell>
                <asp:TableCell>$0.85</asp:TableCell>
                <asp:TableCell>
                    <asp:ImageButton ID="ImageButton19" runat="server" ImageUrl="../images/universe4-sm.jpg"
                          OnClientClick="loadPopup('../pages/Popup.aspx?image=../images/universe4-lg.jpg&price=$0.85&name=Space 4')">
                     </asp:ImageButton>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>
        <br />
        <asp:HyperLink ID="top_hyperlink4" NavigateUrl="#top" runat="server">Back to Top</asp:HyperLink><br />
        <br />
    </div>
</asp:Content>
