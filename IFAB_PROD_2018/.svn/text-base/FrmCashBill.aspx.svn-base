<%@ Page Title="Generate Cash Bill" Language="VB" MasterPageFile="~/Home.master"
    AutoEventWireup="false" CodeFile="FrmCashBill.aspx.vb" Inherits="FrmCashBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    GENERATE CASH BILL
                </h1>
            </center>
            <center>
                <table class="custTable">
                    <tr>
                        <td style="width: 70px">
                            &nbsp;
                        </td>
                        <td style="width: 70px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblBuyer" runat="server" SkinID="lbl" Text="Buyer :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlBuyerId" runat="server" SkinID="ddlRsz" DataSourceID="ObjBuyer"
                                DataTextField="BuyerName" DataValueField="BuyerId" TabIndex="1" Width="200px"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjBuyer" SelectMethod="Proc_GetBuyerDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                        <td align="right">
                            <asp:Label ID="lblCashBill" runat="server" SkinID="lbl" Text="Cash Bill* :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlCashBillNo" runat="server" SkinID="ddlRsz" DataSourceID="ObjCashBillNo"
                                DataTextField="CashBill" DataValueField="CashBillNo" TabIndex="2" Width="150px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjCashBillNo" SelectMethod="GetCashBillNo"
                                TypeName="DLIfabReportsR">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlBuyerId" Name="BuyerId" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <%-- <tr>
                        <td align="right">
                            <asp:Label ID="lblDate" runat="server" Text="Date*:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtDate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtDate" Enabled="True">
                            </ajaxToolkit:CalendarExtender>
                    </tr>--%>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="btnTd" colspan="3" align="left">
                            <asp:Button ID="btnGenerate" TabIndex="9" runat="server" Text="GENERATE" SkinID="btnRsz"
                                CssClass="ButtonClass" Width="90px"></asp:Button>
                            <asp:Button ID="BtnView" TabIndex="9" runat="server" Text="VIEW" SkinID="btnRsz" Width="60px" CssClass="ButtonClass">
                            </asp:Button>
                             <asp:Button ID="BtnCashDraft" TabIndex="9" runat="server" Text="DRAFT CASH BILL" SkinID="btnRsz" Width="125px"
                                CssClass="ButtonClass"></asp:Button>
                        </td>
                        <td>
                       
                            <asp:Button ID="BtnPrint" TabIndex="9" runat="server" Text="PRINT BILL" SkinID="btn"
                                CssClass="ButtonClass"></asp:Button>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                <asp:Label ID="lblgreen" runat="server" SkinID="lblGreen"></asp:Label>
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
                <div>
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="750px" Height="380px">
                        <asp:GridView ID="GVCashBillDetails" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="200">
                            <Columns>
                                <%--<asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="12" Font-Bold="true" Text="Cancel" OnClientClick="return confirm('Are you sure to Cancel the selected record?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Auction Date" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionDateTime" runat="server" Text='<%#Bind("AuctionDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cash Bill No." ControlStyle-Width="70px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCashBillNo" runat="server" Text='<%#Bind("CashBillNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="110px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyer" runat="server" Text='<%#Bind("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               
                                <asp:TemplateField HeaderText="Item" HeaderStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFlowerId" runat="server" Text='<%#Bind("FlowerName") %>'></asp:Label>
                                        <%--   <asp:Label ID="lblAuctionId" Visible="false" runat="server" Text='<%#Bind("AuctionId") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stem length">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStemLength" runat="server" Text='<%#Bind("StemLength") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate","{0:n2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server" Text='<%#Bind("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty Cancelled">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQtyCancelled" Enabled ="false" Width="40px" runat="server" Text='<%#Bind("QtyCancelled") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount","{0:n2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Grower" ControlStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrower" runat="server" Text='<%#Bind("Supp_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Auction No" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionNo" runat="server" Text='<%#Bind("AuctionNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lot Number" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLotNumber" runat="server" Text='<%#Bind("LotNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Auction Time" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionDate" runat="server" Text='<%#Bind("AuctionDate","{0:hh:mm:ss tt}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TxtRemarks" Enabled ="false" Width="100px" runat="server" Text='<%#Bind("Remarks")  %>'></asp:TextBox>
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
