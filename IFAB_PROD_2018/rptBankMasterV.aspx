<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rptBankMasterV.aspx.vb" Inherits="frmBankRptV" title="Bank Report"%>

   

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Bank Details</title>
   <link href="StyleCR.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script  src ="JScript.js"  type ="text/javascript" language="javascript"> 
      window.history.forward(1);
        //history.go(1);
   </script>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="499px" Width="929px" AsyncRendering="False">
            </rsweb:ReportViewer>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                       
                 </div>
    </form>
</body>
</html>
