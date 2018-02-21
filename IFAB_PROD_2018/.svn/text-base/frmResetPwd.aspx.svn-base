<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmResetPwd.aspx.vb"
    Inherits="frmResetPwd" Title="Reset Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function Valid() {
            var msg;
            msg = validateStr(document.getElementById("<%=txtusername.ClientID %>"), 6, 'New Password')
            if (msg != "") {
                document.getElementById("<%=txtusername.ClientID %>").focus();
                return msg;
            }
            msg = minlength(document.getElementById("<%=txtNewPassword.ClientID %>"), 6, 'New Password')
            if (msg != "") {
                document.getElementById("<%=txtNewPassword.ClientID %>").focus();
                return msg;
            }
            msg = maxlength(document.getElementById("<%=txtConfmPassword.ClientID %>"), 15, 'New Password')
            if (msg != "") {
                document.getElementById("<%=txtConfmPassword.ClientID %>").focus();
                return msg;
                return true;
            }

            function Validate() {
                var msg = Valid();
                if (msg != true) {
                    if (navigator.appName == "Microsoft Internet Explorer") {
                        document.getElementById("<%=lblmsg.ClientID %>").innerText = msg;
                        return false;
                    }
                    else if (navigator.appName == "Netscape") {
                        document.getElementById("<%=lblmsg.ClientID %>").textContent = msg;
                        return false;
                    }
                }
                return true;
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div>
                <%--      <center>
            <h1 class="headingTxt">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RESET PASSWORD</h1>
        </center>--%>
                <center>
                    <h1 class="headingTxt">
                        <asp:Label ID="Lblheading" runat="server"></asp:Label>
                    </h1>
                </center>
            </div>
            <div>
                <center>
                    <table>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <center>
                                    <asp:RadioButtonList ID="RblLoginType" Width="350px" runat="server" AutoPostBack="true"
                                        RepeatDirection="Horizontal" TabIndex="1">
                                        <asp:ListItem Text="Employee" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Buyer Terminal" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="sPassword" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </center>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblusrname" runat="server" Width="150" SkinID="lblRSZ" Text="User Name* :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtusername" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblnpw" runat="server" Width="150" SkinID="lblRSZ" Text="New Password* :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNewPassword" runat="server" SkinID="txt" Style="margin-left: 0px"
                                    TextMode="Password" TabIndex="3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Lblcpw" runat="server" SkinID="lblRSZ" Width="200" Text="Confirm New Password* :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtConfmPassword" runat="server" SkinID="txt" TextMode="Password"
                                    TabIndex="4"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                <asp:Button ID="btnResetPassword" runat="server" SkinID="btn" Text="SUBMIT" TabIndex="5"
                                    CssClass="ButtonClass " />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="BACK" SkinID="btn" TabIndex="6"
                                    CssClass="ButtonClass " />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                <asp:Label ID="lblmsg" runat="server" BackColor="Red" ForeColor="White" Visible="False">Label</asp:Label>
                                <asp:Label ID="lblMsginfo" runat="server" SkinID="lblGreen"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </center>
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
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
