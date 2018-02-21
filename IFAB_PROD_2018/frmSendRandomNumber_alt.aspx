<%@ Page Title="Auction Lot" Language="VB" MasterPageFile="~/PopUp.master" AutoEventWireup="false"
    CodeFile="frmSendRandomNumber_alt.aspx.vb" Inherits="frmAuctionLot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type = "text/javascript">
    var GridId = "<%=GVAuctionLot.ClientID %>";
    var ScrollHeight = 300;
    function grid() {
        var grid = document.getElementById(GridId);
        var gridWidth = grid.offsetWidth;
        var gridHeight = grid.offsetHeight;
        var headerCellWidths = new Array();
        for (var i = 0; i < grid.getElementsByTagName("TH").length; i++) {
            headerCellWidths[i] = grid.getElementsByTagName("TH")[i].offsetWidth;
        }
        grid.parentNode.appendChild(document.createElement("div"));
        var parentDiv = grid.parentNode;

        var table = document.createElement("table");
        for (i = 0; i < grid.attributes.length; i++) {
            if (grid.attributes[i].specified && grid.attributes[i].name != "id") {
                table.setAttribute(grid.attributes[i].name, grid.attributes[i].value);
            }
        }
        table.style.cssText = grid.style.cssText;
        table.style.width = gridWidth + "px";
        table.appendChild(document.createElement("tbody"));
        table.getElementsByTagName("tbody")[0].appendChild(grid.getElementsByTagName("TR")[0]);
        var cells = table.getElementsByTagName("TH");

        var gridRow = grid.getElementsByTagName("TR")[0];
        for (var i = 0; i < cells.length; i++) {
            var width;
            if (headerCellWidths[i] > gridRow.getElementsByTagName("TD")[i].offsetWidth) {
                width = headerCellWidths[i];
            }
            else {
                width = gridRow.getElementsByTagName("TD")[i].offsetWidth;
            }
            cells[i].style.width = parseInt(width ) + "px";
            gridRow.getElementsByTagName("TD")[i].style.width = parseInt(width - 3) + "px";
        }
        parentDiv.removeChild(grid);

        var dummyHeader = document.createElement("div");
        dummyHeader.appendChild(table);
        parentDiv.appendChild(dummyHeader);
        var scrollableDiv = document.createElement("div");
        if (parseInt(gridHeight) > ScrollHeight) {
            gridWidth = parseInt(gridWidth) + 10;
        }
        scrollableDiv.style.cssText = "overflow:auto;height:" + ScrollHeight + "px;width:" + gridWidth + "px";
        scrollableDiv.appendChild(grid);
        parentDiv.appendChild(scrollableDiv);
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    AUCTION SEQUENCE NUMBER
                </h1>
            </center>
            &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblDate" runat="server" Text="DATE :&nbsp;" SkinID="lblRsz"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server" SkinID="txtRsz" TabIndex="3" Width="100px" Height="17px"></asp:TextBox>
            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtDate"
                Enabled="True">
            </ajaxToolkit:FilteredTextBoxExtender>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                Format="dd-MMM-yyyy" TargetControlID="txtDate" Enabled="True">
            </ajaxToolkit:CalendarExtender>
             <asp:Button ID="BtnView" runat="server" CausesValidation="False" CssClass="ButtonClass"
                SkinID="btnRsz" TabIndex="4" Text="VIEW" Width="80px" align="right" />
            <br />
            <br />
            <center>
                <div>
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="110%" Height="400px">
                        <asp:GridView ID="GVAuctionLot" runat="server" SkinID="GridView" Visible="true" AllowPaging="true"
                            AutoGenerateColumns="False" PageSize="100" CssClass="gridViewHeader" >
                            <Columns >

                                <asp:TemplateField HeaderText="Indock Date" ControlStyle-Width="110px">
                                    <ItemTemplate>
                                        <asp:Label ID="InDockDate" runat="server" Text='<%#Bind("IndockEntryDate", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Auction Date" ControlStyle-Width="110px">
                                    <ItemTemplate>
                                        <asp:Label ID="AuctionDate" runat="server" Text='<%#Bind("AuctionDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sl Number" ControlStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="SlNumber" runat="server" Text='<%#Bind("row_num") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Seq No" ControlStyle-Width="110px">
                                    <ItemTemplate>

                                        <asp:Label ID="SeqNo" runat="server" Text='<%#Bind("sequenceno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Grower" ControlStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany" runat="server" Text='<%#Bind("Supp_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                               
                            </Columns>
                            <%-- <PagerStyle CssClass="TableClass"></PagerStyle>--%>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </center>
            <center>
                <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                <asp:Label ID="lblgreen" runat="server" SkinID="lblGreen"></asp:Label>
            </center>
            <center>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="BtnRunSeq" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btnRsz" TabIndex="5" Text="SEND SEQ" Width="110px" />
                            <asp:Button ID="BtnSendSeq" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btnRsz" TabIndex="10" Text="SEND SEQ" Width="110px" />
                            <asp:Button ID="BtnClose" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btnRsz" TabIndex="11" Text="CLOSE" Width="110px" />
                        </td>
                    </tr>
                </table>
            </center>
            <asp:ObjectDataSource ID="objReason" runat="server" SelectMethod="GetReasonDDL" TypeName="DLAuctionLot">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjGrowerType" runat="server" SelectMethod="GetGrowerType"
                TypeName="DLAuctionLot"></asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
