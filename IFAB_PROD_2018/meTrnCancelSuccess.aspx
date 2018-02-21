<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="meTrnCancelSuccess.aspx.vb" Inherits="RequestAndResponse.meTrnCancelSuccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table style = "width:100%">
            <tr align="center">
                <td colspan="7">                      
                    <h2>
                      Cancel Transaction Status</h2>
                    
                </td>
            </tr>
            <tr>
            <td style="width: 10%; height: 10px">
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="lblTransRefNo" runat="server" Width = "130" >Transaction Ref No.:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtTransRefNo" runat="server" Width="200"></asp:Label>
                    </td>
                  <td  style = "width:16.66%">
                    <asp:Label ID="lblOrderId" runat="server"  Width = "130">Order ID:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtOrderId" runat="server" Width="200"></asp:Label>
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
                    <asp:Label ID="lblStatus" runat="server" Width= "150">Cancel Transaction Status:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtStatus" runat="server" Width="200"></asp:Label>
                </td>
                <td   style = "width:16.66%">
                    <asp:Label ID="lblDescription" runat="server" Width= "150">Cancel Status Description:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtDescription" runat="server" Width="200"></asp:Label>
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
                    <asp:Label ID="lblAdd1" runat="server" Width= "150">Additional Field 1:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtAdd1" runat="server" Width="200"></asp:Label>
                </td>
                <td   style = "width:16.66%">
                    <asp:Label ID="lblAdd2" runat="server" Width= "150">Additional Field 2:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtAdd2" runat="server" Width="200"></asp:Label>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd3" runat="server" Width= "150">Additional Field 3:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtAdd3" runat="server" Width="200"></asp:Label>
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
                    <asp:Label ID="lblAdd4" runat="server" Width= "150">Additional Field 4:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtAdd4" runat="server" Width="200"></asp:Label>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd5" runat="server" Width= "150">Additional Field 5:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtAdd5" runat="server" Width="200"></asp:Label>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd6" runat="server" Width= "150">Additional Field 6</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtAdd6" runat="server" Width="200"></asp:Label>
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
                    <asp:Label ID="lblAdd7" runat="server" Width= "150">Additional Field 7:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtAdd7" runat="server" Width="200"></asp:Label>
                </td>
                <td  style = "width:16.66%">
                    <asp:Label ID="lblAdd8" runat="server" Width= "150">Additional Field 8:</asp:Label>
                </td>
                <td style = "width:16.66%">
                    <asp:Label ID="txtAdd8" runat="server" Width="200"></asp:Label>
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
                    <asp:Label ID="lblAdd9" runat="server" Width= "150">Additional Field 9:</asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtAdd9" runat="server" Width="200"></asp:Label>
                </td>
                <td  style = "width:16.66%">
                    &nbsp;
                </td>
                <td style = "width:16.66%">
                     &nbsp;
                </td>
                <td style = "width:16.66%">
                    
                </td>
                <td style = "width:16.66%">
                     &nbsp;
                </td>
                  <td style="width: 10%; height: 10px">
                </td>
            </tr>
            </table>
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
