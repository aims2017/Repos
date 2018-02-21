
Imports System

Namespace RequestAndResponse

    Public Partial Class meTrnStatusReq
        Inherits System.Web.UI.Page

        Private objReqMsgDTO As com.awl.MerchantToolKit.ReqMsgDTO

        Private objResMsgDTO As com.awl.MerchantToolKit.ResMsgDTO

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            If Not IsPostBack Then
            End If
        End Sub

        Protected Sub btnCheckout_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                objReqMsgDTO = New com.awl.MerchantToolKit.ReqMsgDTO()
                objReqMsgDTO.OrderId = txtOrderId.Text
                objReqMsgDTO.Mid = txtMID.Text
                objReqMsgDTO.Enckey = txtEncryptKey.Text
                objReqMsgDTO.PgMeTrnRefNo = txtTransRefNo.Text
                Dim objawlmerchantkit As com.awl.MerchantToolKit.AWLMEAPI = New com.awl.MerchantToolKit.AWLMEAPI()
                objResMsgDTO = objawlmerchantkit.getTransactionStatus(txtMID.Text, txtOrderId.Text, txtTransRefNo.Text, txtEncryptKey.Text)
                Session("response") = objResMsgDTO
                Response.Redirect("meTrnStatusSuccess.aspx", False)
            Catch ex As Exception
                ClsLogging.writefileE("Error:" & ex.Message, ClsLogging.LogType.Worldline)
                ClsLogging.writefileE("Trace:" & ex.StackTrace, ClsLogging.LogType.Worldline)
                lblMessage.ForeColor = System.Drawing.Color.Red
                lblMessage.Text = "There Was Some Error Processing.....Please Check The Data you have Entered"
            End Try
        End Sub
    End Class
End Namespace

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by Refactoring Essentials.
'Twitter: @telerik
'Facebook: facebook.com/telerik
'=======================================================
