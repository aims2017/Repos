 <%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmInDockEntry.aspx.vb"
    Inherits="frmInDockEntry" Title="InDockMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function Validate() {
            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=msginfo.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblmsg.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=msginfo.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblmsg.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }

        //Function for Multilingual Validations
        //Created By Ajit Kumar Singh


        function Valid() {

            var msg, a;

            msg = NameField100Mul(document.getElementById("<%=txtLotNo.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtLotNo.ClientID %>").focus();
                a = document.getElementById("<%=lblLotNo.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = DropDownMul(document.getElementById("<%=ddlCompName.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=ddlCompName.ClientID %>").focus();
                a = document.getElementById("<%=lblCName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = ValidateDateMul(document.getElementById("<%=txtEntryDate.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtEntryDate.ClientID %>").focus();
                a = document.getElementById("<%=lblEntryDate.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = NameField100Mul(document.getElementById("<%=txtDcNo.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDcNo.ClientID %>").focus();
                a = document.getElementById("<%=lblDcNo.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = ValidateDateMul(document.getElementById("<%=txtAucDate.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtAucDate.ClientID %>").focus();
                a = document.getElementById("<%=lblAucDate.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = validateTimeDurationMul(document.getElementById("<%=txtEntryTime.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtEntryTime.ClientID %>").focus();
                a = document.getElementById("<%=lblEntryTime.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = DropDownForZero(document.getElementById("<%=ddlFlower.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=ddlFlower.ClientID %>").focus();
                a = document.getElementById("<%=lblFlowerCode.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = numericMul(document.getElementById("<%=txtStemLength.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtStemLength.ClientID %>").focus();
                a = document.getElementById("<%=lblStemLength.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = numericMul(document.getElementById("<%=txtQuantity.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtQuantity.ClientID %>").focus();
                a = document.getElementById("<%=lblQuantity.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = FeesFieldAcceptDecimalMul(document.getElementById("<%=txtMinPrice.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtMinPrice.ClientID %>").focus();
                a = document.getElementById("<%=lblMinPrice.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }


        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n;
            n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <a name="Top">
                <div align="right">
                    <a href="#Bottom">
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/down.png" Width="30px" Height="30px" /></a>
                </div>
                <div>
                    <center>
                        <h1 class="headingTxt">
                            <asp:Label ID="Lblheading" runat="server"></asp:Label>
                        </h1>
                    </center>
                    <br />
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblGD" runat="server" Text="Grower Details" SkinID="lblBlackRsz" Width="150"
                                    Visible="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <center>
                        <table>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblLotNo" runat="server" Text="Lot Number* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="180"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLotNo" runat="server" SkinID="txt" Enabled="false" ></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblDCNo" runat="server" Text="DC Number*^ :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDCNo" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblCName" runat="server" Text="Company Name*^ :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="180"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCompName" TabIndex="1" MaxLength="60" runat="server" SkinID="ddl"
                                        DataSourceID="ObjCompName" DataTextField="Supp_Name" DataValueField="Supp_Id_Auto"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjCompName" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetCompanyCobmo" TypeName="InDockBL"></asp:ObjectDataSource>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblAucDate" runat="server" Text="Auction Date*^ :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAucDate" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtAucDate"
                                        Format="dd-MMM-yyyy">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblEntryDate" runat="server" Text="Entry Date* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEntryDate" Enabled="true" runat="server" SkinID="txt"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEntryDate"
                                        Format="dd-MMM-yyyy">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblEntryTime" runat="server" Text="Entry Time* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEntryTime" Enabled="false" runat="server" SkinID="txt"></asp:TextBox>
                                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptAMPM="true"
                                        AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                        Mask="99:99" MaskType="Time" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtEntryTime" />
                                </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                            <td>
                            <td align="right">
                                    <asp:Label ID="lblTotalQty" runat="server" Text="Total Qty :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTotalQty" Text="0"  runat="server" SkinID="txt" ForeColor="Black"></asp:TextBox>                                    
                                </td>
                            </td>
                            </tr>
                        </table>
                    </center>
                    <br />
                    <table>
                        <tr align="right">
                            <td>
                                <asp:Label ID="lblPD" runat="server" Text="Product Details" SkinID="lblBlackRsz"
                                    Width="150" Visible="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <center>
                        <table>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblFlowerCode" runat="server" Text="Flower Code* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="160"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlFlower" TabIndex="7" MaxLength="60" runat="server" SkinID="ddlrsz"
                                        Width="200" DataSourceID="ObjFlower" DataTextField="Flower" DataValueField="FlowerID"
                                        AppendDataBoundItems="true" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjFlower" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetFlowerCobmo" TypeName="InDockBL"></asp:ObjectDataSource>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQuantity" Style="text-align: right"  runat="server" SkinID="txt" TabIndex="11"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <asp:Label ID="lblStemLength" runat="server"  Text="Stem Length* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="160"></asp:Label>
                                    <asp:TextBox ID="txtStemLength" runat="server" Style="text-align: right"  MaxLength="8" SkinID="txtRsz" Width="76"
                                        TabIndex="9"></asp:TextBox>
                                  
                                    <asp:Label ID="lblUnit" runat="server" Text="Unit :&nbsp;&nbsp;" Width="40" SkinID="lblRsz"></asp:Label>
                                    <asp:DropDownList ID="ddlUnit" TabIndex="9" Width="70" MaxLength="60" runat="server"
                                        SkinID="ddlRsz" DataSourceID="ObjectDataSource1" DataTextField="Unit" DataValueField="Unit_ID"
                                        AppendDataBoundItems="true" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetUnitCobmo" TypeName="InDockBL"></asp:ObjectDataSource>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblMinPrice" runat="server" Text="Min Price* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMinPrice" Style="text-align: right"  runat="server" SkinID="txt" TabIndex="12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblPackaging" runat="server" Text="Packaging :&nbsp;&nbsp;" SkinID="lbl"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlPackaging" runat="server" AppendDataBoundItems="true" DataSourceID="objPackaging"
                                        TabIndex="10" DataTextField="data" DataValueField="LookUPautoid" SkinID="ddlRsz"
                                        Width="200">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="objPackaging" runat="server" SelectMethod="GetPackagingCombo"
                                        TypeName="IndockBL"></asp:ObjectDataSource>
                                    <%--<asp:TextBox ID="txtpackaging" runat="server" SkinID="txtRsz" Width="196" TabIndex="12"></asp:TextBox>--%>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblGrade" runat="server" Text="Grade :&nbsp;&nbsp;" SkinID="lbl"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGrade" runat="server" SkinID="txt" TabIndex="13"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnAdd" runat="server" Text="ADD" CssClass="ButtonClass" OnClientClick="return Validate();"
                                        SkinID="btnRsz" TabIndex="15" />
                                    <asp:Button ID="btnView" runat="server" CssClass="ButtonClass" SkinID="btnrsz" TabIndex="16"
                                        Text="VIEW" Visible="true" />
                                    <asp:Button ID="btnRunSeq" runat="server" CssClass="ButtonClass" SkinID="btnrsz" TabIndex="17"
                                        Text="RUN SEQ" Visible="true" />
                                    <asp:Button ID="btnSendSeq" runat="server" CssClass="ButtonClass" SkinID="btnrsz" TabIndex="18"
                                        Text="SEND SEQ NO" Visible="true" />
                                    <asp:Button ID="btnClearSeq" runat="server" CssClass="ButtonClass" SkinID="btnrsz" TabIndex="19"
                                        Text="CLEAR SEQ" Visible="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsg" runat="server" SkinID="lblGreen" />
                                    <asp:Label ID="msginfo" runat="server" SkinID="lblRed" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </center>
                    <center>
                        <asp:Panel ID="GVPanel" runat="server" ScrollBars="Auto" Width="650px" Height="300px">
                            <asp:GridView ID="GVSupp" runat="server" SkinID="GridView" AllowPaging="true" AutoGenerateColumns="False"
                                PageSize="500" CssClass="fixedHeader"  AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                <Columns>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" />
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')" />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sequence No.">
                                        <ItemTemplate>
                                            <asp:Label ID="l0" runat="server" Text='<%# Bind("SeqNo") %>'></asp:Label>
                                            
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lot Number">
                                        <ItemTemplate>
                                            <asp:Label ID="l1" runat="server" Text='<%# Bind("LotNumber") %>'></asp:Label>
                                            <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("IndockAutoId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DC Number">
                                        <ItemTemplate>
                                            <asp:Label ID="l2" runat="server" Text='<%# Bind("DCNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Auction Date">
                                        <ItemTemplate>
                                            <asp:Label ID="l10" runat="server" Text='<%# Bind("AuctionDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name">
                                        <ItemTemplate>
                                            <asp:Label ID="l3" runat="server" Text='<%# Bind("Supp_Name") %>'></asp:Label>
                                            <asp:Label ID="l55" Visible="false" runat="server" Text='<%# Bind("GrowerId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flower Name">
                                        <ItemTemplate>
                                            <asp:Label ID="l4" runat="server" Text='<%# Bind("FlowerName") %>' />
                                            <asp:Label ID="l56" Visible="false" runat="server" Text='<%# Bind("FlowerId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stem Length">
                                        <ItemTemplate>
                                            <asp:Label ID="l5" runat="server" Text='<%# Bind("StemLength") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit">
                                        <ItemTemplate>
                                            <asp:Label ID="l200" Visible="false" runat="server" Text='<%# Bind("Unit") %>' />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitName") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemStyle Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="l6" runat="server" Text='<%# Bind("Quantity") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" Width="120" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Min Price">
                                        <ItemTemplate>
                                            <asp:Label ID="l7" runat="server" Text='<%# Bind("MinPrice","{0:n2}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Packaging">
                                        <ItemStyle Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="l60" runat="server" Text='<%# Bind("Data") %>' />
                                            <asp:Label ID="l6001" Visible="false" runat="server" Text='<%# Bind("Packaging") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" Width="120" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grade">
                                        <ItemTemplate>
                                            <asp:Label ID="l61" runat="server" Text='<%# Bind("Grade") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry date">
                                        <ItemTemplate>
                                            <asp:Label ID="l11" runat="server" Text='<%# Bind("IndockEntryDate","{0:dd-MMM-yyyy}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry Time">
                                        <ItemTemplate>
                                            <asp:Label ID="l12" runat="server" Text='<%# Bind("IndockEntryTime","{0:hh:mm tt}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </center>
                </div>
                <a name="Bottom">
                    <div align="right">
                        <a href="#Top">
                            <asp:Image ID="Image2" runat="server" ImageUrl="Images/top.png" Width="30px" Height="30px" /></a>
                        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    </div>
                </a>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
