<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Home.master" CodeFile="frmPaymentStateCashier.aspx.vb" Inherits="frmPaymentStateCashier" Theme="MSN_Green" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <table>
                    <tr>
                        <td align="center">
                            <h1 class="headingTxt">
                                <asp:Label ID="LabelEm" runat="server" Text="CASH BILL STATUS" SkinID="lblRepRsz"
                                    Width="350px" Font-Size="Large"></asp:Label>
                            </h1>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <br />
            <div class="row">
                <center>
                    <table class="custTable">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblAucDate" runat="server" Text="Auction Date*^ :&nbsp;&nbsp;" SkinID="lblRsz" Width="135px"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:TextBox ID="txtAucDate" runat="server" SkinID="txt" AutoPostBack="true" TabIndex="3" Width="200px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtAucDate"
                                    Format="dd-MMM-yyyy">
                                </ajaxToolkit:CalendarExtender>
                            </td>

                            <td align="right" >
                                <asp:Label ID="lblBuyer" runat="server" SkinID="lbl" Text="&nbsp;&nbsp;Buyer :&nbsp;&nbsp;"  ></asp:Label>
                            </td>
                            <td align="right">
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
                </center>
            </div>
            <br />
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
            <center>
                <div class="row">
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="800px" Height="380px">
                        <asp:GridView ID="GVCashBillDetails" runat="server" SkinID="GridView" Visible="true" EnableSortingAndPagingCallbacks="True" AllowSorting="True"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="200">
                            <Columns>
                                <%--<asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="12" Font-Bold="true" Text="Cancel" OnClientClick="return confirm('Are you sure to Cancel the selected record?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>
                                 <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="110px" SortExpression="buyername">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyer" runat="server" Text='<%#Bind("buyername") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="110px" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyer" runat="server" Text='<%#Bind("buyerid") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Auction Date" ControlStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionDateTime" runat="server" Text='<%#Bind("Auc_Date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Invoice No." ControlStyle-Width="70px" SortExpression="cashbillno">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCashBillNo" runat="server" Text='<%#Bind("cashbillno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Invoice Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Inv_Amt", "{0:n2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount Paid" ControlStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrower" runat="server" Text='<%#Bind("amtPaid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UTR" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionNo" runat="server" Text='<%#Bind("UTR") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLotNumber" runat="server" Text='<%#Bind("mode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Txn No." ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltxt" runat="server" Text='<%#Bind("TxnNo") %>'></asp:Label>
                                        <%--<asp:TextBox ID="TxtRemarks" Enabled ="false" Width="100px" runat="server" Text='<%#Bind("TxnNo")  %>'></asp:TextBox>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <%-- <PagerStyle CssClass="TableClass"></PagerStyle>--%>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
