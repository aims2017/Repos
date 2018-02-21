<%@ Page Title="Auction Sheet" Language="VB" MasterPageFile="~/PopUp.master" AutoEventWireup="false"
    CodeFile="frmAuctionSheet.aspx.vb" Inherits="frmAuctionSheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type = "text/javascript">
    var GridId = "<%=GVAuctionSheet.ClientID %>";
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
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    AUCTION SHEET
                </h1>
            </center>
            <%--<br />--%>
            <center>
                <asp:Button ID="BtnGrower" runat="server" CausesValidation="False" SkinID="btn3"
                    TabIndex="1" Text="Send SMS and Mail to Grower" Width="200px" Visible="false" />
                <%--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
                <asp:Button ID="BtnBuyer" runat="server" CausesValidation="False" SkinID="btn3" TabIndex="10"
                    Text="Send SMS and Mail to Buyer" Width="200px" Visible="false" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Grower Name :" SkinID="lbl"></asp:Label>
                <asp:DropDownList ID="ddlGrowerName" TabIndex="2" MaxLength="60" runat="server" SkinID="ddl"
                    DataSourceID="ObjGrowerName" DataTextField="Supp_Name" DataValueField="Supp_Id_Auto">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjGrowerName" runat="server" SelectMethod="GetGrowerCompanyCobmo"
                    TypeName="Mfg_BLBuyerDetails"></asp:ObjectDataSource>
                    <asp:Button ID="BtnView" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btnRsz" TabIndex="3" Text="VIEW" Width="84px" />
            </center>
            <br />
            <center>
                <div>
                    <asp:Panel ID="panel1" runat="server" ScrollBars="Vertical" Width="100%" Height="380px">
                        <asp:GridView ID="GVAuctionSheet" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="1000" ScrollBars="Vertical">
                            <Columns>
                                <asp:TemplateField HeaderText="Auction Date" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuctionDateTime" runat="server" Text='<%#Bind("AuctionDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" />
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
                                <asp:TemplateField HeaderText="Grower" ControlStyle-Width="110px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrower" runat="server" Text='<%#Bind("Supp_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item" HeaderStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFlowerId" runat="server" Text='<%#Bind("FlowerName") %>'></asp:Label>
                                        <asp:Label ID="lblAuctionId" Visible="false" runat="server" Text='<%#Bind("AuctionId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stem length">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStemLength" runat="server" Text='<%#Bind("StemLength") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" HeaderStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyer" runat="server" Text='<%#Bind("BuyerName") %>'></asp:Label>
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
                                        <asp:TextBox ID="txtQtyCancelled"  TabIndex="7" Width="40px" runat="server" Text='<%#Bind("QtyCancelled") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Net Qty">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNetQty" Width="40px" runat="server" Text='<%#Bind("NetQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount","{0:n2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reason">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReason" runat="server" Visible="false" Text='<%#Bind("Remarks") %>'></asp:Label>
                                        <asp:Label ID="lblReasonId" runat="server" Visible="false" Text='<%#Bind("ReasonId") %>'></asp:Label>
                                        <asp:DropDownList ID="ddlReason" runat="server" AppendDataBoundItems="true" DataSourceID="objReason"
                                            DataTextField="Reason" TabIndex="8" DataValueField="ReasonId" SkinID="ddlRsz" Width="150px">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="9" Font-Bold="true" Text="Cancel" OnClientClick="return confirm('Are you sure to Cancel the selected record?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
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
                            <asp:Button ID="BtnRefresh" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="4" Text="REFRESH" Width="84px" />
                        </td>
                        <td>
                            <asp:Button ID="BtnClose" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="5" Text="CLOSE" Width="84px" />
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <asp:ObjectDataSource ID="objReason" runat="server" SelectMethod="GetReasonDDL" TypeName="DLAuctionLot">
            </asp:ObjectDataSource>
            <asp:Timer ID="Timer1" runat="server">
            </asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
