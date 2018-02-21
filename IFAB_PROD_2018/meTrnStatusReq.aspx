<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="meTrnStatusReq.aspx.vb"
    Inherits="RequestAndResponse.meTrnStatusReq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <div>
        <table style="width: 100%">
            <tr align="center">
                <td colspan="7">
                    <h2>
                        Transaction Status Request
                    </h2>
                </td>
            </tr>
            <tr>
                <td style="width: 10%; height: 10px">
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblMID" runat="server">Merchant ID</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtMID" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblEncryptKey" runat="server">Encryption Key</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtEncryptKey" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 10%; height: 10px">
                </td>
            </tr>
            <tr>
                <td style="width: 20%; height: 10px">
                </td>
                <td style="width: 20%; height: 10px">
                </td>
                <td style="width: 30%; height: 10px">
                </td>
                <td style="width: 20%; height: 10px">
                </td>
            </tr>
            <tr>
                <td style="width: 10%; height: 10px">
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblOrderId" runat="server" Width="130">Order ID</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtOrderId" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblTransRefNo" runat="server" Width="130">Transaction Ref No.</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtTransRefNo" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Button ID="btnCheckout" runat="server" Width="130" Text="Checkout" 
                        onclick="btnCheckout_Click" >
                    </asp:Button>
                </td>
                <td style="width: 10%; height: 10px">
                </td>
            </tr>
        </table>

        <div id="divlabel">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
