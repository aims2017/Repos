<%@ Page Title="Flower Master" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false"
    CodeFile="FrmFlowerMaster.aspx.vb" Inherits="FrmFlowerMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function Validate() {
        var msg = Valid();

        if (msg != true) {
            if (navigator.appName == "Microsoft Internet Explorer") {
                document.getElementById("<%=lblErrorMsg.ClientID%>").innerText = msg;
                document.getElementById("<%=lblgreen.ClientID%>").innerText = "";
                return false;
            }
            else if (navigator.appName == "Netscape") {
                document.getElementById("<%=lblErrorMsg.ClientID%>").textContent = msg;
                document.getElementById("<%=lblgreen.ClientID%>").textContent = "";
                return false;
            }
            return true;
        }
    }

    //Function for Multilingual Validations
    //Created By Ajit Kumar Singh


    function Valid() {

        var msg, a;
        msg = DropDownForZeroMul(document.getElementById("<%=ddlFlowerCategory.ClientID %>"));
        if (msg != "") {
            document.getElementById("<%=ddlFlowerCategory.ClientID %>").focus();
            a = document.getElementById("<%=lblFlowerCategory.ClientID %>").innerHTML;
            msg = Spliter(a) + " " + ErrorMessage(msg);
            return msg;
        }

        msg = Field50Mul(document.getElementById("<%=txtFlowerName.ClientID %>"));
        if (msg != "") {
            document.getElementById("<%=txtFlowerName.ClientID %>").focus();
            a = document.getElementById("<%=lblFlowerName.ClientID %>").innerHTML;
            msg = Spliter(a) + " " + ErrorMessage(msg);
            return msg;
        }
        msg = Field50Mul(document.getElementById("<%=txtFlowerCode.ClientID %>"));
        if (msg != "") {
            document.getElementById("<%=txtFlowerCode.ClientID %>").focus();
            a = document.getElementById("<%=lblFlowerCode.ClientID %>").innerHTML;
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
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnUpload" />
            <asp:AsyncPostBackTrigger ControlID="Btnadd" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <div>
                <%--  <center>
                        <h1 class="headingTxt">
                            ROLE MASTER</h1>
                    </center>--%>
                <center>
                    <h1 class="headingTxt">
                        <asp:Label ID="Lblheading" runat="server"></asp:Label>
                    </h1>
                </center>
                <center>
                    <table class="custTable">
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td >
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                             <td>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td >
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblFlowerCategory" runat="server" SkinID="lblRsz" Width="200px" Text="Flower Category*^ :&nbsp;"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFlowerCategory" runat="server" SkinID="ddl" TabIndex="1" DataSourceID="ObjFlowerCategory"
                                DataTextField="FlowerCategory" DataValueField="FlowerCategoryId"></asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjFlowerCategory" runat="server" SelectMethod="GetFlowerCategoryDDL"
                                TypeName="DLFlowerType"></asp:ObjectDataSource>
                            </td>
                            
                            <td align="right" rowspan="4">
                            <%--<asp:Button ID="btnUpload" TabIndex="8" runat="server" Text="UPLOAD"
                                    SkinID="btn" Visible="true" CssClass="ButtonClass" ></asp:Button>--%>
                              </td>
                              <td align="right" rowspan="4">
                              
                              <asp:Image ID="ImageMap1" runat="server" ImageUrl="~/Images/Flowerimageupload.gif" BorderWidth="1" BorderColor="Black" Style="width: 120px; 
                                    height: 120px;" />
                                </td>
                                  
                        </tr>
                        <tr>
                        <td align="right">
                                <asp:Label ID="lblFlowerName" runat="server" SkinID="lbl" Text="Flower Name*^ :&nbsp;"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFlowerName" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblFlowerCode" runat="server" SkinID="lbl" Text="Flower Code*^ :&nbsp;"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFlowerCode" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                               <asp:Label ID="Label1" runat="server" SkinID="lblRsz" Text="Photo :&nbsp;"></asp:Label>
                            </td>
                            <td align="right">
                                <%--<asp:DropDownList ID="ddlFlowerType" runat="server" SkinID="ddl" DataSourceID="ObjFlowerType"
                                    DataValueField="FlowerTypeId" DataTextField="FlowerType" TabIndex="3">
                                </asp:DropDownList>--%>
                                <%-- <asp:Image ID="ImageMap1" runat="server" ImageUrl="~/Images/imageupload.gif" Style="width: 120px;
                                    height: 120px;" />--%>
                                     
                                <asp:FileUpload ID="FileUpload2" TabIndex="7" runat="server"  BorderColor="White"
                                    SkinID="btn" Width="155px"></asp:FileUpload>
                                 
                                
                            </td>
                            <td align="right">
                              
                            </td>
                        </tr>
                        <tr>
                        <td>
                        </td>
                        <td align="right">
                           <asp:Button ID="btnUpload" TabIndex="8" runat="server" Text="UPLOAD"
                                    SkinID="btn" Visible="true" CssClass="ButtonClass" ></asp:Button>
                        </td>
                        </tr>
                        
                       
                        
                        <tr>
                            <td>
                            </td>
                            <%--<td>
                                <br />
                                <asp:Image ID="ImageMap1" runat="server" ImageUrl="~/Images/imageupload.gif" Style="width: 100px;
                                    height: 100px;" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpload" TabIndex="8" runat="server" Width="85px" Text="UPLOAD"
                                    SkinID="btn" Visible="true" CssClass="ButtonClass"></asp:Button><br />
                                <br />
                                <asp:FileUpload ID="FileUpload2" TabIndex="7" runat="server" Width="265px" BorderColor="White"
                                    SkinID="btn"></asp:FileUpload>
                            </td>--%>
                        </tr>
                        <tr>
                            <td style="width: 70px">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </center>
                <center>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="Btnadd" runat="server" CausesValidation="true" CssClass="ButtonClass"
                                    OnClientClick="return Validate();" SkinID="btn" Text="ADD" Width="82px" TabIndex="9" />
                                <asp:Button ID="BtnView" runat="server" CausesValidation="False" CssClass="ButtonClass "
                                    SkinID="btn" TabIndex="10" Text="VIEW" Width="84px" />
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
                        <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="600px" Height="300px">
                            <asp:GridView ID="GVFlowerMaster" runat="server" SkinID="GridView" Visible="true"
                                AllowPaging="true" AutoGenerateColumns="False" PageSize="100">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                TabIndex="11" Text="Edit" Font-Bold="true"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                TabIndex="12" Font-Bold="true" Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Photo" ControlStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Image ID="lblPhoto" ImageUrl='<%# Bind("FPhoto") %>' runat="server"></asp:Image>
                                            <asp:HiddenField ID="lbphoto" runat="server" Value='<%# Bind("FPhoto") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flower Category" HeaderStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFlowerCategory" runat="server" Text='<%#Bind("FlowerCategory") %>'></asp:Label>
                                            <asp:Label ID="lblFlowerCategoryId" Visible="false" runat="server" Text='<%#Bind("FlowerCategoryId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flower Code" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFlowerCode" runat="server" Text='<%#Bind("FlowerCode") %>'></asp:Label>
                                            <asp:Label ID="lblFlowerId" Visible="false" runat="server" Text='<%#Bind("FlowerId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flower Name" HeaderStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFlowerName" runat="server" Text='<%#Bind("FlowerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <%-- <PagerStyle CssClass="TableClass"></PagerStyle>--%>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </center>
                <asp:ObjectDataSource ID="ObjFlowerType" runat="server" TypeName="BLFlowerType" SelectMethod="GetFlowerTypeDDL"
                    OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
            </div>
            <center>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" Visible="true" runat="server" SkinID="lblRsz" Width="720px"></asp:Label>
                            <asp:TextBox ID="txtpath" runat="server" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
