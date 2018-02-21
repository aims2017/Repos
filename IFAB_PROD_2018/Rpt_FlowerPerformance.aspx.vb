
Partial Class Rpt_FlowerPerformance
    Inherits BasePage

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Try
            Dim QS As String
            Dim FlowerId As Integer = ddlFlowerId.SelectedValue
            Dim FromDate, ToDate As DateTime

            If txtFromDate.Text = "" Then
                FromDate = "01/01/1900"
            Else
                FromDate = txtFromDate.Text
            End If
            If txtToDate.Text = "" Then
                ToDate = "01/01/1900"
            Else
                ToDate = txtToDate.Text
            End If

            QS = Request.QueryString.Get("QS")
            If txtFromDate.Text = "" And txtToDate.Text = "" Then
                lblErrorMsg.Text = "Please enter the Date."
            Else
                Dim qrystring As String = "Rpt_FlowerPerformanceV.aspx?" & QueryStr.Querystring() & "&FlowerId=" & FlowerId & "&FromDate=" & FromDate & "&ToDate=" & ToDate
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
                lblErrorMsg.Text = ""
            End If
        Catch ex As Exception
            lblErrorMsg.Text = "Please enter correct data."
        End Try
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtFromDate.Text = Today.ToString("dd-MMM-yyyy")
            txtToDate.Text = Today.ToString("dd-MMM-yyyy")
        End If
    End Sub
    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Report.aspx")
    End Sub

End Class
