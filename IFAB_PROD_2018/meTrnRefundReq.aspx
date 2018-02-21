<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="meTrnRefundReq.aspx.vb" Inherits="RequestAndResponse.meTrnRefundReq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method = "post">
    <div>
    <table style = "width:100%">
            <tr align="center">
                <td colspan="7">                      
                    <h2>
                        Refund Transaction Request
                    </h2>
                    
                </td>
            </tr>
            <tr>
            <td style="width: 10%; height: 10px">
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="lblMID" runat="server">Merchant ID</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtMID" runat="server" Width="200"></asp:TextBox>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblEncryptKey" runat="server">Encryption Key</asp:Label>
                </td>
                <td style = "width:16.66%">
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
                <td  style = "width:16.66%">
                    <asp:Label ID="lblOrderId" runat="server"  Width = "130">Order ID</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtOrderId" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="lblTransRefNo" runat="server" Width = "130" >Transaction Ref No.</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtTransRefNo" runat="server" Width="200"></asp:TextBox>
                </td>
                 <td style = "width:16.66%">
                    <asp:Label ID="lblRefundAmount" runat="server" Width = "130" >Refund Amount</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtRefundAmount" runat="server" Width="200"></asp:TextBox>
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
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd1" runat="server" Width= "150">Additional Field 1</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd1" runat="server" Width="200"></asp:TextBox>
                </td>
                <td   style = "width:16.66%">
                    <asp:Label ID="lblAdd2" runat="server" Width= "150">Additional Field 2</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtAdd2" runat="server" Width="200"></asp:TextBox>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd3" runat="server" Width= "150">Additional Field 3</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtAdd3" runat="server" Width="200"></asp:TextBox>
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
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd4" runat="server" Width= "150">Additional Field 4</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd4" runat="server" Width="200"></asp:TextBox>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd5" runat="server" Width= "150">Additional Field 5</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd5" runat="server" Width="200"></asp:TextBox>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd6" runat="server" Width= "150">Additional Field 6</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtAdd6" runat="server" Width="200"></asp:TextBox>
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
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd7" runat="server" Width= "150">Additional Field 7</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd7" runat="server" Width="200"></asp:TextBox>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd8" runat="server" Width= "150">Additional Field 8</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:TextBox ID="txtAdd8" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style = "width:16.66%">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="150" 
                        Height = "35" onclick="btnSubmit_Click"></asp:Button>
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
        </table>
    </div>
        <br />
        <br />
          <div id="div1">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
