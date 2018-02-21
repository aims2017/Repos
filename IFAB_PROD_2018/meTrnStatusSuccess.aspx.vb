
Imports com.awl.MerchantToolKit
Imports System

Namespace RequestAndResponse

    Public Partial Class meTrnStatusSuccess
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            Try
                If Not IsPostBack Then
                    If Session("response") IsNot Nothing Then
                        Dim objResMsgDTO As ResMsgDTO = CType(Session("response"), ResMsgDTO)
                        txtAdd1.Text = objResMsgDTO.AddField1
                        txtAdd2.Text = objResMsgDTO.AddField2
                        txtAdd3.Text = objResMsgDTO.AddField3
                        txtAdd4.Text = objResMsgDTO.AddField4
                        txtAdd5.Text = objResMsgDTO.AddField5
                        txtAdd6.Text = objResMsgDTO.AddField6
                        txtAdd7.Text = objResMsgDTO.AddField7
                        txtAdd8.Text = objResMsgDTO.AddField8
                        txtAdd9.Text = objResMsgDTO.AddField9
                        txtZcode.Text = objResMsgDTO.AuthZCode
                        txtTransRefNo.Text = objResMsgDTO.PgMeTrnRefNo
                        txtAmount.Text = objResMsgDTO.TrnAmt
                        txtDateTime.Text = objResMsgDTO.TrnReqDate
                        txtRRN.Text = objResMsgDTO.Rrn
                        txtOrderId.Text = objResMsgDTO.OrderId
                        txtStatus.Text = objResMsgDTO.StatusCode
                        txtDescription.Text = objResMsgDTO.StatusDesc
                        txtResponseCode.Text = objResMsgDTO.ResponseCode
                    Else
                        lblMessage.ForeColor = System.Drawing.Color.Red
                        lblMessage.Text = "No Data Can be Displayed......Session is Null"
                    End If
                End If
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
