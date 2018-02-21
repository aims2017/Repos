<%@ Page Title="Bidders List" Language="VB" MasterPageFile="~/PopUp.master" AutoEventWireup="false"
    CodeFile="frmBiddersList.aspx.vb" Inherits="frmBiddersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" language="javascript">
    var reloadTimer = null;
    window.onload = function() {
        setReloadTime(5); // In this example we'll use 5 seconds.
    }
    function setReloadTime(secs) {
        if (arguments.length == 1) {
            if (reloadTimer) clearTimeout(reloadTimer);
            reloadTimer = setTimeout("setReloadTime()", Math.ceil(parseFloat(secs) * 1000));
        }
        else {
            location.reload();
        }
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    BIDDERS LOGIN
                </h1>
            </center>
            <%--<br />--%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="lblStartStopStatus" Font-Size="XX-Large" runat="server" ></asp:Label>
            <center>
                <div>
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="600px" Height="330px">
                        <asp:GridView ID="GVBiddersList" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="300">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LKRemove" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="12" Font-Bold="true" Text="Remove" OnClientClick="return confirm('Are you sure to remove the selected record?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Login Date" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLoginDate" runat="server" Text='<%#Bind("LoginTime","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Device No." HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIMENo" runat="server" Text='<%#Bind("IMENo") %>'></asp:Label>
                                        <asp:Label ID="lblLogId" runat="server" Visible="false" Text='<%#Bind("LogId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidder" ControlStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyerName" runat="server" Text='<%#Bind("BidderUserId") %>'></asp:Label>
                                        <asp:Label ID="lblBidderId" Visible="false" runat="server" Text='<%#Bind("BidderId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Login Time" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLoginTime" runat="server" Text='<%#Bind("LoginTime","{0:hh:mm:ss tt}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Logout Time" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLogoutTime" runat="server" Text='<%#Bind("LogoutTime","{0:hh:mm:ss tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <%-- <PagerStyle CssClass="TableClass"></PagerStyle>--%>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </center>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalBidders" runat="server" SkinID="lblRsz" Text="Total Bidders :"></asp:Label>
            <asp:TextBox ID="txtTotalBidders" runat="server" SkinID="lblRsz" Width="100px"></asp:TextBox>
            
           
            <br />
            <br />
            <center>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="BtnRefresh" runat="server" CausesValidation="true" CssClass="ButtonClass"
                                SkinID="btn" Text="REFRESH" Width="82px" TabIndex="9" Visible="false" />
                            <asp:Button ID="BtnStart" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="10" Text="START" Width="84px" />
                            <asp:Button ID="BtnStop" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="10" Text="STOP" Width="84px" />
                            <asp:Button ID="BtnClose" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="10" Text="CLOSE" Width="84px" />
                        </td>
                    </tr>
                </table>
            </center>
             <br />
                <center>
                    <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                    <asp:Label ID="lblgreen" runat="server" SkinID="lblGreen"></asp:Label>
                </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
