<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Home.master" CodeFile="frmOnlinePaymentScreen.aspx.vb" Inherits="frmOnlinePaymentScreen" Theme="MSN_Green" %>


<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
  
 <script type="text/javascript">
     
               function getData() {
       
                    var d = new Date();
                    var n = d.getTime();
                    var orderID = n + '' + randomFromTo(0, 1000);
                    document.getElementById('<%=txtOrderId.ClientID%>').value = orderID;
                }

                function randomFromTo(from, to) {
                    return Math.floor(Math.random() * (to - from + 1) + from);
                }
            
</script>
  <asp:UpdatePanel ID="Updatepanel1" runat="server">
      
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">ONLINE PAYMENT SCREEN
                </h1>
            </center>
            &nbsp;
            <center>
                <table>
        <tr>
            <td style="text-align:center;width:142px;"><asp:Label runat="server" ID="lbl_buyer" Text="Buyer" SkinID="btnRsz"  /> </td> 
            <td style="text-align:center;width:142px;"><asp:Label runat="server" ID="lbl_auctiondate" Text="Auction Date *" SkinID="btnRsz" /></td>
             <td style="text-align:center;width:142px;"><asp:Label runat="server" ID="lbl_invno" Text="Cash Bill No " SkinID="btnRsz" /></td> 
            <td style="text-align:center;width:142px;"><asp:Label runat="server" ID="lbl_invoiceamount" Text="Cash Bill Amount " SkinID="btnRsz" /></td> 
            <td style="text-align:center;width:142px;"><asp:Label runat="server" ID="lbl_amountpaid" Text="Amount Paid *" SkinID="btnRsz" /></td>
        </tr>
                    <tr>
                        <td></td>
                    </tr>
        <tr>
            <td >
            <asp:TextBox runat="server" ID="txt_buyerid" Text="1234" SkinID="txtRsz" Enabled="false" style="text-align:center;" width="145px"  /></td>
            <td ><asp:TextBox runat="server" ID="txt_Auctiondate" SkinID="txtRsz" width="145px" />
                 <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Animated="False"
                                                Format="dd-MMM-yyyy" TargetControlID="txt_Auctiondate">
                                            </ajaxToolkit:CalendarExtender>
            </td> 
            <td ><asp:TextBox runat="server" ID="txt_invoiceno" SkinID="txt" width="142px" /></td> 
            <td><asp:TextBox runat="server" ID="txt_invamount" SkinID="txt" width="142px" /></td> 
            <td><asp:TextBox runat="server" ID="txt_Amount" SkinID="txt" width="142px" /></td>
             <%-- <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="txt_invoiceno" ErrorMessage="Please enter a  number" />
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="txt_invamount" ErrorMessage="Please enter a invoice amount in number" />
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="txt_Amount" ErrorMessage="Please enter a amount in number " />--%>
        </tr>
                    
    </table>
            </center>
            <br />
            <center>
                <asp:Button runat="server" CssClass="ButtonClass"  CausesValidation="true" OnClientClick="getData()"  SkinID="btnrsz" TabIndex="18" Text="MAKE PAYMENT" ID="btn_payment" Width="180px" />
                <asp:Button runat="server" CssClass="ButtonClass" SkinID="btnrsz"  TabIndex="18" Text="VIEW PAYMENT" ID="btn_viewpay" Width="180px"  />
                <br />
                  <asp:TextBox ID="txtOrderId" runat="server" Width="200" style="display:none"></asp:TextBox>
                 <br />
                <asp:Label ID="lblerrmsg" runat="server" SkinID="lblRed" Visible="true"></asp:Label>
                <asp:Label ID="lblmsgifo" runat="server" SkinID="lblGreen" Visible="true"></asp:Label>
            </center>
            <br />
            <center>
             
                <br />
                <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Width="650px" Height="400px">
                    <table>
                         <asp:Label Text="Payment Made Till Date" runat="server" ID="lbl_txt" Style="text-decoration:underline" />
                        <tr>
                            <td>&nbsp;
                                <asp:GridView ID="GVFlower" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    PageSize="100" SkinID="GridView" Width="300px">

                                    <Columns>

                                         <asp:TemplateField HeaderText="Buyer Name">
                                             
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Buyername") %>'></asp:Label>
                                               
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Buyer_id") %>'></asp:Label>
                                               
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Transaction Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Transaction_Date", "{0:dd-MMM-yyyy}") %>' ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Invoice_No") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Invoice_Amount") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Amount Paid">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Amount_Paid") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Mode">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Pay_Mode") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Invoice Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfcategory" runat="server" Text='<%# Bind("Invoice_Date", "{0:dd-MMM-yyyy}") %>'  ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel id="paymentpanel" runat="server" visible="false">
                      <div>
  
    <table style="width: 100%">
            <tr align="center">
                <td colspan="7">
                    <h2>
                       Transaction Request
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
                    <asp:TextBox ID="txtMID" runat="server" Width="200">WL0000000000044</asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblEncryptKey" runat="server">Encryption Key</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtEncryptKey" runat="server" Width="229px">f9b5dc2a3d06068e0a843e6de8c7d39d</asp:TextBox>
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
                  
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblTransAmount" runat="server" Width="130">Transaction Amount</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtTransAmount" runat="server" Width="200">100</asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblCurrencyName" runat="server" Width="130">Currency Name</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtCurrencyName" runat="server" Width="200">INR</asp:TextBox>
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
                    <asp:Label ID="lblTransType" runat="server" Width="150">Transaction Type</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTransType" runat="server" Width="200">S</asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblRemarks" runat="server" Width="150">Transaction Remarks</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtRemarks" runat="server" Width="200">Test</asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblReccuring" runat="server" Width="150">Recurring Period</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtReccuring" runat="server" Width="200"></asp:TextBox>
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
                    <asp:Label ID="lblRecurDay" runat="server" Width="150">Recurring Day</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRecurDay" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblNoOfRecur" runat="server" Width="150">No.Of Recurring</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNoOfRecur" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblResponseUrl" runat="server" Width="150">Response Url</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtResponseUrl" runat="server" Width="200">http://localhost/meTrnSuccess.aspx</asp:TextBox>
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
                    <asp:Label ID="lblAdd1" runat="server" Width="150">Additional Field 1</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd1" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd2" runat="server" Width="150">Additional Field 2</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtAdd2" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd3" runat="server" Width="150">Additional Field 3</asp:Label>
                </td>
                <td style="width: 16.66%">
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
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd4" runat="server" Width="150">Additional Field 4</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd4" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd5" runat="server" Width="150">Additional Field 5</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtAdd5" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd6" runat="server" Width="150">Additional Field 6</asp:Label>
                </td>
                <td style="width: 16.66%">
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
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd7" runat="server" Width="150">Additional Field 7</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd7" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    <asp:Label ID="lblAdd8" runat="server" Width="150">Additional Field 8</asp:Label>
                </td>
                <td style="width: 16.66%">
                    <asp:TextBox ID="txtAdd8" runat="server" Width="200"></asp:TextBox>
                </td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 16.66%">
                    <asp:Button ID="btnCheckOut" runat="server" Width="150" Text="Checkout" Height="
                    30" ></asp:Button>
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
                </td>
                <td>
                    &nbsp;</td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 10%; height: 10px">
                </td>
            </tr>
            <tr>
                <td style="width: 10%; height: 10px">
                </td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 16.66%; height: 10px">
                </td>
                <td style="width: 16.66%">
                    &nbsp;</td>
                <td style="width: 10%; height: 10px">
                </td>
            </tr>
        </table>
    </div>
          <br />
        <br />
          <div id="div1">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
                </asp:Panel>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:content>
