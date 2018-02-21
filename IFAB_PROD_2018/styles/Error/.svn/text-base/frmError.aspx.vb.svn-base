Imports System.Configuration
Imports System.Web.Configuration
Imports System.Net.Configuration

Partial Class Error_frmError
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ViewState("ErrorPage") = Request.QueryString.Get("aspxerrorpath")
        Server.ClearError()
    End Sub
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        ' Response.Redirect(Session("ErrorPageLink").ToString)
        Try
            Mail()
            Response.Redirect("../Default.aspx", False)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    'Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
    '    ErrorMessage.Text = Session("ErrorMsg")
    'End Sub
    Sub Mail()
        Try
            'SendMail.MailtoSend("Error on page:" & ViewState("ErrorPage").ToString & Session("UserName").ToString, "Error page link:" & Session("ErrorPageLink") & vbCrLf & "Error Message:" & Session("ErrorMsg"))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        UserDetailsDB.InsertError()
    End Sub
End Class
