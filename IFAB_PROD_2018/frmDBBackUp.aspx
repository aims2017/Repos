<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Home.master" CodeFile="frmDBBackUp.aspx.vb"
    Title="DataBase Backup" Inherits="frmDBBackUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <table>
                    <tr>
                        <td>
                            <h1 class="headingTxtRsz">
                                DATABASE BACKUP</h1>
                            <br />
                            Click here to take Database Back up
                            <br />
                            <br />
                            <asp:Button ID="btnBackupDatabase" runat="server" CssClass="ButtonClass" SkinID="btn1"
                                Text="DATABASE BACKUP" Width="175px" />
                            <br />
                            <br />
                        </td>
                        <td>
                            <h1 class="headingTxtRsz">
                                DATABASE COUNT</h1>
                            <br />
                            Click here to check Database Records No
                            <br />
                            <br />
                            <asp:Button ID="BtnDeleteCount" runat="server" CssClass="ButtonClass" SkinID="btn1"
                                Text="DATABASE COUNT" Width="175px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <h1 class="headingTxtRsz" style="height: 39px; margin-bottom: 2px">
                                VERSION NO</h1>
                            Click here to check Version No
                            <br />
                            <br />
                            <asp:Button ID="BtnVersionNo" runat="server" CssClass="ButtonClass" SkinID="btn1"
                                Text="VERSION NO" Width="175px" />
                            <br />
                            <br />
                        </td>
                        <td align="center">
                            <h1 class="headingTxtRsz" 
                                style="width: 382px; height: 37px; margin-bottom: 6px">
                                BIOMETRIC DATA SYNC</h1>
                            Click here to Synchronize Biometric and AIMS Data
                            <br />
                            <br />
                            <asp:Button ID="BtnBiometric" runat="server" CssClass="ButtonClass" SkinID="btnRsz"
                                Text="BIOMETRIC DATA SYNC" Width="210px" />
                            <br />
                            <br /></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <h1 class="headingTxtRsz" 
                                style="width: 640px; height: 37px; margin-bottom: 6px">
                                STUDENT BIOMETRIC DATA SYNC</h1>
                            Click here to Synchronize Student Biometric and AIMS Data&nbsp;<br />
                            <br />
                            <asp:Button ID="BtnBiometricStd" runat="server" CssClass="ButtonClass" 
                                SkinID="btnRsz" Text="STUDENT BIOMETRIC DATA SYNC" Width="250px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                <asp:Label ID="lblgreen" runat="server" SkinID="lblGreen"></asp:Label>
                <br>
                <asp:UpdateProgress ID="PageUpdateProgress" runat="server">
                    <ProgressTemplate>
                        Processing... Please Wait...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
