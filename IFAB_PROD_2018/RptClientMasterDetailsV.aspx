<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RptClientMasterDetailsV.aspx.vb" Inherits="RptClientMasterDetailsV" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Master Details</title>
</head>
<body>
    <form id="form1" runat="server" >
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" AsyncRendering ="false" SizeToReportContent="true"  >
        </rsweb:ReportViewer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="lblMsg" runat="server" SkinID ="lblRed"></asp:Label>
    
    </div>
    </form>
</body>
</html>
