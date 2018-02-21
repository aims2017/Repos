<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meTrnPay.aspx.cs" Inherits="RequestAndResponse.meTrnPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type ="text/javascript">
        function PostData() {

            document.getElementById("form1").submit();
        }
    </script>
</head>
<body onload = "PostData()">
    <%--production--%>
    <form id="form1" action="https://ipg.in.worldline.com/doMEPayRequest" runat="server" method = "post">
    <%--demo url--%>
   <%-- <form id="form1" action="https://cgt.in.worldline.com/ipg/doMEPayRequest" runat="server" method = "post">--%>
    <div>
       <asp:Literal runat="server" ID="ltrPostData"></asp:Literal>
       <br />
       <asp:Label runat="server" ID= "lbl"> Please Do not close and Refresh Browser</asp:Label>
    </div>
    </form>
</body>
</html>
