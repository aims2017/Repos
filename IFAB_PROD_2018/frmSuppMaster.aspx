<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Home.master" CodeFile="frmSuppMaster.aspx.vb"
    Inherits="frmSuppMaster" Title="Grower Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">

        function Validate() {
            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=msginfo.ClientID%>").innerText = msg;
                    document.getElementById("<%=lblmsg.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=msginfo.ClientID%>").textContent = msg;
                    document.getElementById("<%=lblmsg.ClientID%>").textContent = "";
                    return false;
                }
                return true;
            }
        }

        //Function for Multilingual Validations
        //Created By Ajit Kumar Singh

        function Valid() {

            var msg, a;

            msg = Field50Mul(document.getElementById("<%=TxtName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=TxtName.ClientID %>").focus();
                a = document.getElementById("<%=Lblname.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = CodeFieldMul(document.getElementById("<%=txtcode.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtcode.ClientID %>").focus();
                a = document.getElementById("<%=lblcode.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = numericMulN(document.getElementById("<%=txttin.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txttin.ClientID %>").focus();
                a = document.getElementById("<%=lbltin.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }



            msg = numericMulN(document.getElementById("<%=txtcst.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtcst.ClientID %>").focus();
                a = document.getElementById("<%=lblcst.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = Field50Mul(document.getElementById("<%=TxtcntctP.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=TxtcntctP.ClientID %>").focus();
                a = document.getElementById("<%=LblcontactP.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = numericMul(document.getElementById("<%=txtcntct1.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtcntct1.ClientID %>").focus();
                a = document.getElementById("<%=lblcntct1.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = validateEmailMul(document.getElementById("<%=txtemail.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtemail.ClientID %>").focus();
                a = document.getElementById("<%=lblemail.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50Mul(document.getElementById("<%=txtGrowerType.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtGrowerType.ClientID %>").focus();
                a = document.getElementById("<%=Label1.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = Field250MulN(document.getElementById("<%=txtAddress.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtAddress.ClientID %>").focus();
                a = document.getElementById("<%=lbladdrs.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            //


            msg = Field50Mul(document.getElementById("<%=txtVillage.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtVillage.ClientID %>").focus();
                a = document.getElementById("<%=lblVillage.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = Field50Mul(document.getElementById("<%=txtTaluk.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtTaluk.ClientID %>").focus();
                a = document.getElementById("<%=lblTaluk.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = Field50Mul(document.getElementById("<%=txtDistrict2.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDistrict2.ClientID %>").focus();
                a = document.getElementById("<%=lblDistrict2.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = DropDownForZeroMul(document.getElementById("<%=ddlStateFarm.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=ddlStateFarm.ClientID %>").focus();
                a = document.getElementById("<%=lblState2.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = Field50Mul(document.getElementById("<%=txtcountry2.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtcountry2.ClientID %>").focus();
                a = document.getElementById("<%=lblCountry2.ClientID %>").innerHTML;
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
        <Triggers>
            <asp:PostBackTrigger ControlID="Upload" />
            <asp:AsyncPostBackTrigger ControlID="Btnadd" EventName="Click" />
        </Triggers>
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
                    <br />
                    <table class="custTable">
                        <tr>
                            <td align="left">
                                <asp:Label ID="LabelSupp" runat="server" Text="Personal Info" SkinID="lblBlackRsz"
                                    Width="150" Visible="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <center>
                        <hr />
                        <table class="custTable">
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="right" rowspan="4">
                                    <asp:Label ID="lblPhoto" runat="server" Text="Photo :&nbsp;" SkinID="lbl"></asp:Label>
                                </td>
                                <td align="right" rowspan="4">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/imageupload.gif" Width="90px"
                                        Height="90px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="Lblname" runat="server" Text="Company Name*^ :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="180"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtName" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblcode" runat="server" Text="Company Code*^ :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcode" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                                    <asp:TextBox ID="txtPath" runat="server" SkinID="txt" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="LblcontactP" runat="server" Text="Grower Name* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtcntctP" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblPani" runat="server" Text="PANI :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPani" runat="server" SkinID="txt" TabIndex="4"></asp:TextBox>
                                </td>
                                  <td align="right" colspan="2" rowspan="3">
                                    <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="White" SkinID="btn"
                                        TabIndex="13" CssClass="btnClass" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Upload" runat="server" CssClass="ButtonClass" SkinID="btn" TabIndex="14"
                                        Text="UPLOAD" Height="32px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbltin" runat="server" Text="TIN :&nbsp;&nbsp;" SkinID="lblRsz" Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txttin" runat="server" SkinID="txt" TabIndex="5" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblcst" runat="server" Text="CST No :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcst" runat="server" SkinID="txt" TabIndex="6" MaxLength="10"></asp:TextBox>
                                </td>
                              
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblSur" runat="server" Text="Survey No :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSur" runat="server" SkinID="txt" TabIndex="7" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="LblGreen" runat="server" Text="Green House Area :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGreen" runat="server" SkinID="txt" TabIndex="8" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblPan" runat="server" Text="PAN No :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPan" runat="server" SkinID="txt" TabIndex="9"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblConPer2" runat="server" Text="Contact Person 2 :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtConPer2" runat="server" SkinID="txt" TabIndex="15"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblcntct1" runat="server" Text="Contact No 1* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcntct1" runat="server" SkinID="txt" TabIndex="10"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789+,/\-" TargetControlID="txtcntct1">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblcntct2" runat="server" Text="Contact No 2 :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcntct2" runat="server" SkinID="txt" TabIndex="16"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789+,/\-" TargetControlID="txtcntct2">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblemail" runat="server" Text="Email 1* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtemail" runat="server" SkinID="txt" TabIndex="11"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblEmail2" runat="server" Text="Email 2 :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail2" runat="server" SkinID="txt" TabIndex="17"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblfaxno" runat="server" Text="Fax No :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtfaxno" runat="server" SkinID="txt" TabIndex="12"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789+,/\-" TargetControlID="txtfaxno">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label1" runat="server" Text="Grower Type* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGrowerType" runat="server" SkinID="txt" TabIndex="18"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelOA" runat="server" Text="Office Address" SkinID="lblBlackRsz"
                                        Width="150" Visible="True"></asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Label ID="LabelFA" runat="server" Text="Farm Address" SkinID="lblBlackRsz" Width="150"
                                        Visible="True"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <hr />
                        <table>
                            <tr>
                                <td align="right" style="height: 18px">
                                    <asp:Label ID="lbladdrs" runat="server" Text="Address :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td style="height: 18px">
                                    <asp:TextBox ID="txtAddress" runat="server" SkinID="txt" TextMode="MultiLine" TabIndex="19"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblVillage" runat="server" Text="City/Village Name* :&nbsp;&nbsp;"
                                        SkinID="lblRsz" Width="175"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVillage" runat="server" SkinID="txt" TabIndex="23" MaxLength="15"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblcity" runat="server" Text="City :&nbsp;&nbsp;" SkinID="lblRsz"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcity" runat="server" SkinID="txtRsz" TabIndex="19" Width="150"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblTaluk" runat="server" Text="Taluk* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTaluk" runat="server" SkinID="txt" TabIndex="24"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblDistrict" runat="server" Text="District :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDistrict" runat="server" SkinID="txt" TabIndex="20"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblDistrict2" runat="server" Text="District* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="200"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDistrict2" runat="server" SkinID="txt" TabIndex="25"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblstate" runat="server" Text="State :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlState" TabIndex="21" MaxLength="60" runat="server" SkinID="ddl"
                                        DataSourceID="ObjState" DataTextField="StateName" DataValueField="StateId" AppendDataBoundItems="true">
                                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjState" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetState" TypeName="SupplierDB">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="StateId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblState2" runat="server" Text="State* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="200"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlStateFarm" TabIndex="26" MaxLength="60" runat="server" SkinID="ddl"
                                        DataSourceID="ObjState2" DataTextField="StateName" DataValueField="StateId" AppendDataBoundItems="true">
                                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjState2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetState" TypeName="SupplierDB">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="StateId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblcountry1" runat="server" Text="Country :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcountry1" runat="server" SkinID="txt" TabIndex="22"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblCountry2" runat="server" Text="Country* :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="200"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCountry2" runat="server" SkinID="txt" TabIndex="27"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 18px" align="left" colspan="2">
                                    <asp:Label ID="LabelAI" runat="server" Text="Account Info" SkinID="lblBlackRsz" Width="150"
                                        Visible="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <hr />
                        <table>
                            <tr>
                                <td align="right" style="height: 18px">
                                    <asp:Label ID="lblBankNanme" runat="server" Text="Bank Name :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td style="height: 18px">
                                    <asp:TextBox ID="txtBankName" runat="server" SkinID="txt" TabIndex="28"></asp:TextBox>
                                </td>
                                <td align="right" style="height: 18px">
                                    <asp:Label ID="lblAcNo" runat="server" Text="Account Number :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td style="height: 18px">
                                    <asp:TextBox ID="txtAcNo" runat="server" SkinID="txt" TabIndex="31"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblBranchArea" runat="server" Text="Bank Branch :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td style="height: 18px">
                                    <asp:TextBox ID="txtBranchArea" runat="server" SkinID="txt" TabIndex="29"></asp:TextBox>
                                </td>
                                <td align="right" style="height: 18px">
                                    <asp:Label ID="lblTypeOfAccount" runat="server" Text="Type of Account :&nbsp;&nbsp;"
                                        SkinID="lblRsz" Width="150"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTypeAcct" runat="server" SkinID="ddl" DataSourceID="objAccountType"
                                        DataTextField="data" DataValueField="LookUPautoid" TabIndex="32">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource runat="server" ID="objAccountType" SelectMethod="GetDDlAccountType"
                                        TypeName="SupplierDB"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 18px">
                                    <asp:Label ID="lblIFSC" runat="server" Text="IFSC Code :&nbsp;&nbsp;" SkinID="lblRsz"
                                        Width="150"></asp:Label>
                                </td>
                                <td style="height: 18px">
                                    <asp:TextBox ID="txtIFSC" runat="server" SkinID="txt" TabIndex="30"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="ButtonClass"
                                        CommandName="ADD" OnClientClick="return Validate();" SkinID="btnRsz" TabIndex="33"
                                        Text="ADD" />
                                    <asp:Button ID="btnView" runat="server" CssClass="ButtonClass" SkinID="btnrsz" TabIndex="34"
                                        CommandName="VIEW" Text="VIEW" Visible="true" />
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
                                PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
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
                                    <asp:TemplateField HeaderText="Photo" ControlStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Image ID="LabelEmp_Photo" ImageUrl='<%# Bind("Photos") %>' runat="server"></asp:Image>
                                            <asp:Label Visible="false" ID="LabelPhotos" runat="server" Text='<%# Bind("Photos") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name" SortExpression="Supp_Name">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="IID" runat="server" Value='<%# Eval("Supp_Id_Auto") %>' />
                                            <asp:Label ID="l1" runat="server" Text='<%# Bind("Supp_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="left" />
                                        <ItemStyle HorizontalAlign="left" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Code" SortExpression="Supp_Code">
                                        <ItemTemplate>
                                            <asp:Label ID="ll1" runat="server" Text='<%# Bind("Supp_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PANI">
                                        <ItemTemplate>
                                            <asp:Label ID="l101" runat="server" Text='<%# Bind("Pani") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TIN">
                                        <ItemTemplate>
                                            <asp:Label ID="l4" runat="server" Text='<%# Bind("TIN") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CST No">
                                        <ItemTemplate>
                                            <asp:Label ID="l5" runat="server" Text='<%# Bind("CST_No") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Survey Number" SortExpression="SurveyNo">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblS" runat="server" Text='<%# Bind("SurveyNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Green House Area" SortExpression="GreenHouseArea">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblG" runat="server" Text='<%# Bind("GreenHouseArea") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grower Name" SortExpression="Contact_Person">
                                        <HeaderStyle Wrap="false" />
                                        <ItemTemplate>
                                            <asp:Label ID="l12" runat="server" Text='<%# Bind("Contact_Person") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PAN No">
                                        <ItemTemplate>
                                            <asp:Label ID="l100" runat="server" Text='<%# Bind("Pan") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact No.1">
                                        <ItemStyle Wrap="true" />
                                        <ItemTemplate>
                                            <asp:Label ID="l13" runat="server" Text='<%# Bind("Contact_Number1") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email 1">
                                        <ItemTemplate>
                                            <asp:Label ID="l16" runat="server" Text='<%# Bind("Email") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fax No.">
                                        <ItemTemplate>
                                            <asp:Label ID="l15" runat="server" Text='<%# Bind("Fax_Number") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact Person 2">
                                        <HeaderStyle Wrap="false" />
                                        <ItemTemplate>
                                            <asp:Label ID="NlblCP" runat="server" Text='<%# Bind("Contact_Person2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact No.2">
                                        <ItemTemplate>
                                            <asp:Label ID="l14" runat="server" Text='<%# Bind("Contact_Number2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email 2">
                                        <ItemTemplate>
                                            <asp:Label ID="l102" runat="server" Text='<%# Bind("Email2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grower Type" SortExpression="GrowerType">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblGT" runat="server" Text='<%# Bind("GrowerType") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemStyle Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="l6" runat="server" Text='<%# Bind("Supp_Address") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" Width="120" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="l7" runat="server" Text='<%# Bind("City") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblD" runat="server" Text='<%# Bind("District") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State" SortExpression="StateName">
                                        <ItemStyle Wrap="true" />
                                        <ItemTemplate>
                                            <asp:Label ID="l9" runat="server" Text='<%# Bind("StateName") %>' />
                                            <asp:Label ID="stateid" Visible="false" runat="server" Text='<%# Bind("state") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country" SortExpression="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="l10" runat="server" Text='<%# Bind("Country") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City/Village Name">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblV" runat="server" Text='<%# Bind("Village") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Taluk">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblT" runat="server" Text='<%# Bind("Taluk") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblD2" runat="server" Text='<%# Bind("District2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State" SortExpression="StateName2">
                                        <ItemStyle Wrap="true" />
                                        <ItemTemplate>
                                            <asp:Label ID="NlblStateID" Visible="false" runat="server" Text='<%# Bind("State2") %>' />
                                            <asp:Label ID="NlblS2" runat="server" Text='<%# Bind("StateName2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country" SortExpression="Country2">
                                        <ItemTemplate>
                                            <asp:Label ID="NlblC" runat="server" Text='<%# Bind("Country2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Name">
                                        <ItemTemplate>
                                            <asp:Label ID="l103" runat="server" Text='<%# Bind("BankName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch Name">
                                        <ItemTemplate>
                                            <asp:Label ID="l104" runat="server" Text='<%# Bind("BankArea") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AC/No">
                                        <ItemTemplate>
                                            <asp:Label ID="l105" runat="server" Text='<%# Bind("AcNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type of Account">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccttype" runat="server" Text='<%# Bind("Data") %>'></asp:Label>
                                            <asp:Label ID="l106" runat="server" Visible="false" Text='<%# Bind("TypeOfAc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IFSC Code">
                                        <ItemTemplate>
                                            <asp:Label ID="l107" runat="server" Text='<%# Bind("IFSC") %>'></asp:Label>
                                        </ItemTemplate>
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
