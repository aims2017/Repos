
Partial Class Ifab_RptFlowerwiseGrowerperformance
    Inherits System.Web.UI.Page
    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Try
            Dim QS As String
            Dim GrowerID As Integer
            Dim FlowerId As Integer = ddlFlowerId.SelectedValue
            GrowerID = ddlGrowerName.SelectedValue
            Dim FromDate, ToDate As DateTime
            If txtfromdate.Text <> "" And txttodate.Text <> "" Then
                If CType(txtfromdate.Text, Date) > CType(txttodate.Text, Date) Then
                    msginfo.Text = ValidationMessage(1075)
                    Exit Sub
                End If
            End If
            If txtfromdate.Text = "" Then
                FromDate = "01/01/1900"
            Else
                FromDate = txtfromdate.Text
            End If
            If txttodate.Text = "" Then
                ToDate = "01/01/1900"
            Else
                ToDate = txttodate.Text
            End If

            QS = Request.QueryString.Get("QS")
            If txtfromdate.Text = "" And txttodate.Text = "" Then
                msginfo.Text = "Please enter the Date."
            Else
                Dim qrystring As String = "Ifab_RptFlowerwiseGrowerperformanceV.aspx?" & QueryStr.Querystring() & "&FlowerId=" & FlowerId & "&FromDate=" & FromDate & "&ToDate=" & ToDate & "&GrowerID=" & GrowerID
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
                msginfo.Text = ""
            End If
        Catch ex As Exception
            msginfo.Text = "Please enter correct data."
        End Try
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtfromdate.Text = Today.ToString("dd-MMM-yyyy")
            txttodate.Text = Today.ToString("dd-MMM-yyyy")
        End If
    End Sub
    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Report.aspx")
    End Sub
    <System.Web.Services.WebMethod()>
    Public Shared Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()

    End Sub
    Public Function ValidationMessage(ByVal ErrorCode As Integer) As String
        Dim dt2 As DataTable
        'Dim Message As String
        dt2 = Session("ValidationTable")
        Dim X As Integer = dt2.Rows.Count() - 1
        Dim str As String = " "
        For i As Integer = 0 To X
            If (dt2.Rows(i).Item("MessageCode").ToString() = ErrorCode) Then
                Return dt2.Rows(i).Item("MessageText").ToString()
            End If
        Next
        Return 0
    End Function
End Class
