<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="Assignment_1.pages.Popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Details</title>
</head>
<body id="popup_body">
    <form id="form1" runat="server">
    <div id="popup_image">
        <asp:Image ID="image" runat="server" ImageAlign="Middle" />
    </div>
    <div id="popup_text">
        <ul>
            <li><strong>Picture :</strong>
                <asp:Label ID="name" runat="server"></asp:Label>
            </li>
            <li>
                <strong>Price :</strong>
                <asp:Label ID="price" runat="server"></asp:Label>
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
