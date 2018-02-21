<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmParentManagement.aspx.vb"
    Inherits="frmParentManagement" Title="Buyer Terminal Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function Validate() {
            var msg = Valid();

            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblErrorMsg.ClientID%>").innerText = msg;
                    document.getElementById("<%=lblmsg.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                document.getElementById("<%=lblErrorMsg.ClientID%>").textContent = msg;
                document.getElementById("<%=lblmsg.ClientID%>").textContent = "";
                    return false;
                }
                return true;
            }
        }

        //Function for Multilingual Validations
        //Created by siddharth

        function Valid() {

            var msg, a;

            msg = NameField100Mul(document.getElementById("<%=txtuserid.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtuserid.ClientID %>").focus();
                a = document.getElementById("<%=lbluserid.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = minlengthMul(document.getElementById("<%=txtpassword.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtpassword.ClientID %>").focus();
                a = document.getElementById("<%=lblpassword.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = minlengthMul(document.getElementById("<%=txtverpass.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtverpass.ClientID %>").focus();
                a = document.getElementById("<%=lblverpass.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMul(document.getElementById("<%=txtExpDate.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtExpDate.ClientID %>").focus();
                a = document.getElementById("<%=lblverpass0.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = DropDownForZeroMul(document.getElementById("<%=ddlGrowerid.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=ddlGrowerid.ClientID %>").focus();
                a = document.getElementById("<%=lblstd.ClientID %>").innerHTML;
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
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
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
                        <h1 class="headingTxt"  >
                            
                         <asp:Label ID="lblHead" runat="server" Text=" BUYER TERMINAL MANAGEMENT FORM " Width="400px"></asp:Label>
                         </h1>
                    </center>
                  <%--  <center>
                        <h1 class="headingTxt">
                            <asp:Label ID="Lblheading" runat="server"></asp:Label>
                        </h1>
                    </center>--%>
                    <asp:Panel ID="addpanel" runat="server">
                        <center>
                            <table class="custTable">
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:RadioButtonList ID="RButton" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                            TabIndex="1" SkinID="RD" Visible="false">
                                            <asp:ListItem Value="G" >Grower</asp:ListItem>
                                            <asp:ListItem Value="B" Selected="True">Buyer</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px">
                                        <asp:HiddenField ID="HidId" runat="server" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #9EBA9F; width: 328px; height: 21px;" align="right">
                                        <asp:Label ID="lblstdcode" runat="server" SkinID="lblRsz" Text="Enter Buyer Code&nbsp;:&nbsp;&nbsp;"
                                            Width="200px"></asp:Label>
                                    </td>
                                    <td style="background-color: #9EBA9F; width: 400px; height: 21px;">
                                        <asp:TextBox ID="txtsrchstd" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                                    </td>
                                    <td style="background-color: #9EBA9F; width: 400px;" rowspan="2">
                                        <asp:Button ID="Btnsearch" runat="server" CausesValidation="true" CssClass="ButtonClass"
                                            SkinID="btn" TabIndex="2" Text="SEARCH" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #9EBA9F; width: 328px; height: 21px;" align="right">
                                        <asp:Label ID="Label1" runat="server" SkinID="lblRsz" Text="Buyer User Name&amp;nbsp;:&amp;nbsp;&amp;nbsp;"></asp:Label>
                                    </td>
                                    <td style="background-color: #9EBA9F; width: 400px; height: 21px;">
                                        <asp:TextBox ID="txtsrchuser" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="Label2" runat="server" Text="User Name Prefix*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"
                                            SkinID="lblRsz" Width="226px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPrefix" runat="server" SkinID="txt" TabIndex="4" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="lbluserid" runat="server" Text="User Name*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"
                                            SkinID="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtuserid" runat="server" SkinID="txt" TabIndex="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="lblpassword" runat="server" Text="Password*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"
                                            SkinID="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtpassword" runat="server" SkinID="txt" TextMode="Password" TabIndex="6"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="lblverpass" runat="server" Text="Verify Password*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"
                                            SkinID="lblRsz"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtverpass" runat="server" SkinID="txt" TextMode="Password" TabIndex="7"
                                            MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="lblverpass0" runat="server" SkinID="lblRsz" Text="Password Expiry*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExpDate" runat="server" SkinID="txt" TabIndex="8"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtExpDate_CalendarExtender" runat="server" TargetControlID="txtExpDate"
                                            Format="dd-MMM-yyyy" Animated="False">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 328px" align="right">
                                        <asp:Label ID="lblstd" runat="server" Text="Buyer Name* :&amp;nbsp;&amp;nbsp;" SkinID="lblRsz"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                            DataTextField="Name" DataValueField="Id" TabIndex="9" Width="250px">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="GetDDlGrowerName"
                                            TypeName="DLParentMngt">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="RButton" Name="RBId" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td align="right">
                                        <asp:Label ID="Label4" runat="server" SkinID="lbl" Text="Privileges*&amp;nbsp;:&amp;nbsp;&amp;nbsp;"></asp:Label>
                                    </td>
                                    <td rowspan="3" align="left">
                                        <asp:CheckBox ID="Chkread" runat="server" Text="Read" TabIndex="13" />
                                        <br />
                                        <asp:CheckBox ID="Chkwrite" runat="server" Text="Write" TabIndex="14" />
                                        <br />
                                        <asp:CheckBox ID="Chkprint" runat="server" Text="Print" TabIndex="15" />
                                    </td>
                                </tr>--%>
                                <tr>
                                        <td >
                                            &nbsp;
                                        </td>
                                    </tr>
                            </table>
                        </center>
                        <center>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnAddGrid" runat="server" CausesValidation="True" SkinID="btn" Text="ADD"
                                            ToolTip="Add" OnClientClick="return Validate();" CssClass="ButtonClass" TabIndex="16" />
                                        <asp:Button ID="BtnView" runat="server" CausesValidation="False" CssClass="ButtonClass "
                                            SkinID="btn" TabIndex="17" Text="VIEW" ToolTip="VIEW" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<asp:LinkButton ID="lkbtn_clrsession" runat="server" CausesValidation="False" 
                                        Font-Bold="True" Font-Underline="True" ForeColor="#30502E" Visible="false">Clear Session</asp:LinkButton>--%>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </asp:Panel>
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
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                                    <asp:Label ID="lblmsg" runat="server" SkinID="lblGreen"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
                <style type="text/css">
                    .completeListStyle
                    {
                        height: 100px;
                        width: 50px;
                        overflow: auto;
                        list-style-type: disc;
                        padding-left: 17px;
                        background-color: #FFF;
                        border: 1px solid DarkGray;
                        text-align: left;
                        font-size: small;
                        color: black;
                    }
                </style>
                <center>
                    <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Width="660px" Height="300px">
                        <asp:GridView ID="GVParentMngmnt" runat="server" SkinID="GridView" Visible="true"
                            AllowPaging="true" AutoGenerateColumns="False" PageSize="100" EnableSortingAndPagingCallbacks="True"
                            AllowSorting="True">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" TabIndex="18"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            TabIndex="19" Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grower Code" SortExpression="Code" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" Visible="false" runat="server" Text='<%# Bind("LoginType") %>' />
                                        <asp:Label ID="HidUDID" Visible="false" runat="server" Text='<%# Bind("UserDetailsID") %>' />
                                        <asp:Label ID="lblstdNo" runat="server" Visible="false" Text='<%#Bind("Code") %>'></asp:Label>
                                    </ItemTemplate>                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grower Name" SortExpression="Name" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstdName" runat="server" Visible="false" Text='<%#Bind("Name") %>'></asp:Label>
                                        <asp:Label ID="LblStdId" Visible="false"  runat="server" Text='<%#Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Buyer Code" SortExpression="Code">
                                    <ItemTemplate>
                                
                                        <asp:Label ID="lblBuyerCode" runat="server" Text='<%#Bind("Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyerName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                 
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grower Code" SortExpression="Code">
                                    <ItemTemplate>
                                
                                        <asp:Label ID="lblGrowerCode" runat="server" Text='<%#Bind("Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grower Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrowerName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                 
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPassword" Visible="false" runat="server" Text='<%# Bind("Password") %>' />
                                        <asp:Label ID="lblusrName" runat="server" Text='<%#Bind("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="Batch Name" SortExpression="Batch_No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBatchName" runat="server" Text='<%#Bind("Batch_No") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExpDate" runat="server" Text='<%#Bind("ExpDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                            <%--    <asp:TemplateField HeaderText="Privileges">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrivilages" runat="server" Text='<%#Bind("Privilages") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Login Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLoginType" runat="server" Text='<%#Bind("LoginType") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="Branch Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </center>
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
