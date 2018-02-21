<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmApprovalForm.aspx.vb"
    Inherits="frmApprovalForm" Title="Approval Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UP1" runat="server">
        <ContentTemplate>
            <a name="Top">
                <div align="right">
                    <a href="#Bottom">
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/down.png" Width="30px" Height="30px" /></a>
                </div>
                <%--  <center>
                    <h1 class="headingTxt">
                        APPROVAL FORM</h1>
                </center>--%>
                <center>
                    <h1 class="headingTxt">
                        <asp:Label ID="Lblheading" runat="server"></asp:Label>
                    </h1>
                </center>
                <center>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblTitle" runat="server" Text="Form Name* :&nbsp;&nbsp;" SkinID="lbl"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlform" runat="server" SkinID="ddl" TabIndex="1" AutoPostBack="true">
                                    <asp:ListItem Selected="True" Value="Select">Select</asp:ListItem>
                                    <asp:ListItem Value="84">Employee Transfer</asp:ListItem>
                                    <asp:ListItem Value="129">Leave Application</asp:ListItem>
                                    <asp:ListItem Value="131">Asset Transfer</asp:ListItem>
                                    <asp:ListItem Value="32">Student Transfer</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <asp:Button ID="btnadd" runat="server" Text="SUBMIT" SkinID="btnRSZ" TabIndex="2"
                                        CssClass="ButtonClass " OnClientClick="return Validate();" />
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
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
                <center>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" SkinID="GridView"
                        DataKeyNames="AID" AutoGenerateColumns="false" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Form Name">
                                <ItemTemplate>
                                    <asp:Label ID="LabelTableName" runat="server" Text='<%# Bind("TableName") %>'></asp:Label>
                                    <asp:HiddenField ID="HiddenId" runat="server" Value='<%# Bind("AID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approval Requested from" SortExpression="Emp_Name">
                                <ItemTemplate>
                                    <asp:Label ID="LabelContriName" runat="server" Text='<%# Bind("Emp_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date" SortExpression="EntryDate">
                                <ItemTemplate>
                                    <asp:Label ID="LabelEntryDate" runat="server" Text='<%# Bind("EntryDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Code/Student Code" SortExpression="Name">
                                <ItemTemplate>
                                    <asp:Label ID="LabelEnrollNo" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtrem" SkinID="txtRsz" Width="120px" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkView" runat="server" CausesValidation="false" CommandName="Delete"
                                        Style="text-decoration: underline; color: Blue;" Text="View"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkApproval" runat="server" CausesValidation="false" CommandName="Edit"
                                        Style="text-decoration: underline; color: Blue;" Text="Approve"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkReject" runat="server" CausesValidation="false" CommandName="Update"
                                        Style="text-decoration: underline; color: Blue;" Text="Reject"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" HeaderText="Contributor Name">
                                <ItemTemplate>
                                    <asp:Label ID="LabelFormName" runat="server" Text='<%# Bind("FormName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" HeaderText="Row id">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowId" runat="server" Text='<%# Bind("Row_No") %>'></asp:Label>
                                    <%--<asp:Label ID="lblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </center>
                <center>
                    <table>
                        <%--<tr>
                            <td colspan="2" align="right">
                                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                                    <ProgressTemplate>
                                        <div class="PleaseWait">
                                            Please Wait...........
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblmsg" runat="server" SkinID="lblgreen"></asp:Label>
                                <asp:Label ID="msginfo" runat="server" SkinID="lblred"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </center>
                <style type="text/css">
                    .completeListStyle
                    {
                        height: 100px;
                        width: 200px;
                        overflow: auto;
                        border: 1px solid DarkGray;
                        list-style-type: none;
                        margin: 0px;
                        background-color: #FFF;
                        text-align: left;
                        font-size: small;
                        vertical-align: middle;
                        color: black;
                    }
                </style>
                <table>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
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
