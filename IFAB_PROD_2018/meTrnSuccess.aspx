<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meTrnSuccess.aspx.cs" Inherits="RequestAndResponse.meTrnSuccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div style="display: none">

            <table style="width: 100%">
                <tr align="center">
                    <td colspan="7">
                        <h2>Transaction Status</h2>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblTransRefNo" runat="server" Width="130">Transaction Ref No.:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtTransRefNo" runat="server" Width="200"></asp:Label></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblOrderId" runat="server" Width="130">Order ID:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtOrderId" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 10%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblRRN" runat="server" Width="150">RRN</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtRRN" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblZcode" runat="server" Width="150">AuthZCode:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtZcode" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblResponseCode" runat="server" Width="150">Response Code:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtResponseCode" runat="server" Width="200"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblTrnDateTime" runat="server" Width="150">Transaction Date & Time:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtDateTime" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblStatus" runat="server" Width="150">Transaction Status:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtStatus" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblDescription" runat="server" Width="150">Status Description:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtDescription" runat="server" Width="200"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd1" runat="server" Width="150">Additional Field 1:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtAdd1" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd2" runat="server" Width="150">Additional Field 2:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtAdd2" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd3" runat="server" Width="150">Additional Field 3:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtAdd3" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 10%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd4" runat="server" Width="150">Additional Field 4:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtAdd4" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd5" runat="server" Width="150">Additional Field 5:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtAdd5" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd6" runat="server" Width="150">Additional Field 6</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtAdd6" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 10%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd7" runat="server" Width="150">Additional Field 7:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtAdd7" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd8" runat="server" Width="150">Additional Field 8:</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtAdd8" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAmount" runat="server" Width="200">Transaction Amount</asp:Label>
                    </td>
                    <td style="width: 16.66%">
                        <asp:Label ID="txtAmount" runat="server" Width="150"></asp:Label>
                    </td>
                    <td style="width: 10%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                    <td style="width: 30%; height: 10px"></td>
                    <td style="width: 20%; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10%; height: 10px"></td>
                    <td style="width: 16.66%">
                        <asp:Label ID="lblAdd9" runat="server" Width="150">Additional Field 9:</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtAdd9" runat="server" Width="200"></asp:Label>
                    </td>
                    <td style="width: 16.66%">&nbsp;
                    </td>
                    <td style="width: 16.66%">&nbsp;
                    </td>
                    <td style="width: 16.66%"></td>
                    <td style="width: 16.66%">&nbsp;
                    </td>
                    <td style="width: 10%; height: 10px"></td>
                </tr>
            </table>
        </div>
        <center>
            <br />
            <h1 >Payment Receipt </h1>
          
            <div style="border: 1px solid black; height: 500px; width: 70%">
                <div style="align-items: center;">
                    <br />
                    <h2>International Flower Auction Center, Bangalore</h2>
                    
                    <br />
                    <h3>Payment Receipt</h3>
                    <br />
                  
                  

                    <table  >

                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lbl" Text="Buyer Name:" Style="font-weight:bolder" /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_buyername" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label3" Text="Cash Bill no:" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_Invoiceno" /></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label runat="server" ID="Label1" Text="Cash Bill Date:" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_Invoicedate" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label4" Text="Amount Received (INR):" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_Amountreceived" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label5" Text="UTR No:" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_utr" /></td>
                        </tr>
                      <%--<%--  <tr>
                            <td>
                                <asp:Label runat="server" ID="Label6" Text="Payment Mode:" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_paymode" /></td>
                       </tr>--%>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label7" Text="Payment Date:" Style="font-weight:bolder"  /></td>
                            <td>
                                <asp:Label runat="server" ID="lbl_paymentdate" /></td>
                        </tr>
                        
                                
                           

                    </table>
                    <br />
                      <asp:Button runat="server" CssClass="ButtonClass" OnClientClick="parent.window.close();" CausesValidation="true"  SkinID="btnrsz" TabIndex="18" Text="Close" ID="btn_close"  />
<br/>
<asp:Button ID="btnPrint" runat="server" Text="Print" onclientclick="window.print();"/>
                  </div>
            </div>
       
              </center>


       
       
    </form>
</body>
</html>
