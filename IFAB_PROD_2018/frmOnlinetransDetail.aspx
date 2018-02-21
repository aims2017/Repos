<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmOnlinetransDetail.aspx.vb" Inherits="frmOnlinetransDetail" MasterPageFile="~/Home.master" Theme="MSN_Green" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <table>
                    <tr>
                        <td align="center">
                            <h1 class="headingTxt">
                                <asp:Label ID="LabelEm" runat="server" Text="ONLINE PAYMENT RECEIVED " SkinID="lblRepRsz"
                                     Font-Size="Large"></asp:Label>
                            </h1>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <br />
            
                <center>
                    <table class="custTable">
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblDate" runat="server" Text="Date*^ :&nbsp;&nbsp;" SkinID="lblRsz" Width="100px"
                                    ></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" SkinID="txt" AutoPostBack="true" Width="140px" TabIndex="3"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDate"
                                    Format="dd-MMM-yyyy">
                                </ajaxToolkit:CalendarExtender>
                            </td>

                       
                            <td align="right">
                                <asp:Label ID="lblBuyer" runat="server" SkinID="lbl" Text="Buyer :&nbsp;&nbsp"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBuyerId" runat="server" SkinID="ddlRsz" DataSourceID="ObjBuyer" AppendDataBoundItems="true"
                                    DataTextField="BuyerName" DataValueField="BuyerId" TabIndex="1" Width="155px"
                                    AutoPostBack="true">
                                    <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjBuyer" SelectMethod="Proc_GetBuyerDDLALL"
                                    TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        </table>
                    <br />
                    <table>
                        <tr>
                            <td></td>
                            <td>
                            <asp:Button ID="btnView" TabIndex="9" runat="server" Text="VIEW RECEIPTS" SkinID="btnRsz"
                                CssClass="ButtonClass" width="150px"></asp:Button>
                            </td>
                        </tr>

                    </table>
                </center>
           <br />
            <div>
                <asp:Label ID="lblhead" runat="server"  Text="Payment Made till Date" SkinID="lblBlackRsz" Visible="false"></asp:Label>
            </div>
            <center>
                <div class="row">
                    <asp:Label ID="lblmsg" runat="server" SkinID="lblGreen" />
                    <asp:Label ID="msginfo" runat="server" SkinID="lblRed" />
                </div>
            </center>
            <br />
            <center>
                <asp:UpdateProgress runat="server" ID="UpdateProgress1">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            <asp:Label ID="lblprocess" runat="server" Text="Processing your request..Please wait..."
                                SkinID="lblBlackRsz" Width="300" Visible="True"></asp:Label>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </center>
           
                <div>
                    <asp:Label ID="lbltotal" runat="server" Text="Total Received(Rs):" SkinID="lblRsz" Width="150px"></asp:Label>
                    <asp:TextBox ID="txttotal" runat="server" SkinID="txtRsz"></asp:TextBox>
                </div>
            
            <br />
            <center>
                <div class="row">
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="750px" Height="380px">
                        <asp:GridView ID="GVCashBillDetails" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="200">
                            <Columns>
                                     <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="110px" SortExpression="Buyer">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("buyername") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="110px" visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("buyer_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Auction Date" ControlStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionDateTime" runat="server" Text='<%#Bind("invoice_date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Invoice No." ControlStyle-Width="70px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCashBillNo" runat="server" Text='<%#Bind("Invoice_No") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Invoice Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Invoice_Amount", "{0:n2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount Paid" ControlStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrower" runat="server" Text='<%#Bind("amount_Paid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UTR" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionNo" runat="server" Text='<%#Bind("UTR_no") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLotNumber" runat="server" Text='<%#Bind("Pay_mode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="Txn No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltxt" runat="server" Text='<%#Bind("TxnNo") %>'></asp:Label>
                                        <%--<asp:TextBox ID="TxtRemarks" Enabled ="false" Width="100px" runat="server" Text='<%#Bind("TxnNo")  %>'></asp:TextBox>--%>
                                    <%--</ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                            <%-- <PagerStyle CssClass="TableClass"></PagerStyle>--%>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </center>
            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
