<%@ Page Title="Commission Bill Payment" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="FrmCommissionBillPayment.aspx.vb" Inherits="FrmCommissionBillPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    COMMISSION BILL PAYMENT STATUS
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
                            <asp:Label ID="lblGrowerName" runat="server" SkinID="lbl" Text="Grower Name :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" TabIndex="1" Width="220px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="Proc_GetGrowerNameDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                    
                        <td align="right">
                            <asp:Label ID="LblNotPaid" runat="server" SkinID="lbl" Text="Not Paid :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td><asp:CheckBox ID="ChkNotPaid" runat="server" /> </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="btnTd" colspan="4">
                            <asp:Button ID="BtnView" TabIndex="9" runat="server" Text="VIEW" SkinID="btn"
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
             <center>
                <div>
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="680px" Height="380px">
                        <asp:GridView ID="GVCommissionBillPayment" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="200">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="12" Font-Bold="true" Text="Paid" OnClientClick="return confirm('Are you sure to Pay?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bill Date" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBillDate" runat="server" Text='<%#Bind("AuctionDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cash Bill No" ControlStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCommissionBillNo" runat="server" Text='<%#Bind("CommissionBillNo") %>'></asp:Label>
                                        <asp:Label ID="lblCommissionBillId" runat="server" Visible="false" Text='<%#Bind("ComId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                       
                                <asp:TemplateField HeaderText="Grower" ControlStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrower" runat="server" Text='<%#Bind("GrowerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Paid">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaid" runat="server" Text='<%#Bind("Paid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Paid Date" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaidDate" runat="server" Text='<%#Bind("PaidDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Paid Amount">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TxtPaidAmount" Width="80px"  runat="server"  Text='<%#Bind("PaidAmount","{0:n2}")  %>'></asp:TextBox>
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

