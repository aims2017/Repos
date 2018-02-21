<%@ Page Title="Auction Master Console" Language="VB" MasterPageFile="~/Home.master"
    AutoEventWireup="false" CodeFile="FrmAuctionMasterConsole.aspx.vb" Inherits="FrmAuctionMasterConsole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function RunExe() {
            var SesVar = '<%= Session("Path") %>';
            var oShell = new ActiveXObject("WScript.Shell");
            var prog = SesVar;
            oShell.Run('"' + prog + '"', 1);
        }  
      
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <%--  <h1 class="headingTxt">
                    <asp:Label ID="Lblheading" runat="server"></asp:Label>
                    AUCTION MASTER CONSOLE
                </h1>--%>
                <asp:Label ID="lblHead" Text="AUCTION MASTER CONSOLE" runat="server" Font-Names="Time New Roman"
                    Font-Size="XX-Large" Font-Italic="true" Font-Bold="true" ForeColor="Green"> </asp:Label>
            </center>
            <center>
                <table width="650px">
                    <%--<tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>--%>
                    
                    <tr>
                        <td align="left">
                            <%--<asp:Button ID="BtnBiddersList" TabIndex="2" runat="server" Text="BIDDERS LIST" SkinID="btnRsz"
                                Visible="true" CssClass="ButtonClass" Width="120px"></asp:Button>--%>
                            <asp:ImageButton ID="BtnBiddersList" BorderColor="Green" BorderStyle="Solid" BorderWidth="1px"
                                ImageUrl="~/Images/BLogin.JPG" Width="500px" Height="100px" runat="server" onMouseDown="this.src='Images/BLogindown.JPG';"
                                onMouseUp="this.src='Images/BLogin.JPG';" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<asp:Button ID="BtnAuctionLot" TabIndex="3" runat="server" Text="AUCTION LOTS" SkinID="btnRsz"
                                Visible="true" CssClass="ButtonClass" Width="120px"></asp:Button>--%>
                            <asp:ImageButton ID="BtnAuctionLot" BorderColor="Green" BorderStyle="Solid" BorderWidth="1px"
                                ImageUrl="~/Images/Lots.JPG" Width="500px" Height="100px" runat="server" onMouseDown="this.src='Images/Lotsdown.JPG';"
                                onMouseUp="this.src='Images/Lots.JPG';"  />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <%--<asp:Button ID="btnClock" TabIndex="1" runat="server" Text="CLOCK" SkinID="btnRsz" Visible="true"
                                CssClass="ButtonClass" Width="120px" OnClientClick="RunExe();"></asp:Button>--%>
                            <asp:ImageButton ID="btnClock" ImageUrl="~/Images/clock.JPG" Width="500px" Height="100px"
                                runat="server" BorderColor="Green" BorderStyle="Solid" BorderWidth="1px" OnClientClick="RunExe();" onMouseDown="this.src='Images/clockdown.JPG';"
                                onMouseUp="this.src='Images/clock.JPG';" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<asp:Button ID="BtnAuctionSheet" TabIndex="4" runat="server" Text="AUCTION SHEET"
                                SkinID="btnRsz" Visible="true" CssClass="ButtonClass" Width="120px"></asp:Button>--%>
                            <asp:ImageButton ID="BtnAuctionSheet" BorderColor="Green" BorderStyle="Solid" BorderWidth="1px"
                                ImageUrl="~/Images/Sheet.JPG" Width="500px" Height="100px" runat="server" onMouseDown="this.src='Images/Sheetdown.JPG';"
                                onMouseUp="this.src='Images/Sheet.JPG';" />
                        </td>
                    </tr>
                </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
