
Partial Class frmBiddersList
    Inherits BasePage
    Dim dt, dt1 As DataTable
    Dim RowsAffetected As Integer

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DisplayGrid()
            BtnClose.Attributes.Add("onclick", "self.close();")
        End If
        txtTotalBidders.ReadOnly = True
        dt1 = DLBiddersList.GetStartStopStatus()
        lblStartStopStatus.Text = dt1.Rows(0).Item("StartStopStatus").ToString()
    End Sub

    Protected Sub BtnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnRefresh.Click
        DisplayGrid()
    End Sub
    Sub DisplayGrid()
        dt = DLBiddersList.GetBiddersList()
        If dt.Rows.Count > 0 Then
            GVBiddersList.DataSource = dt
            GVBiddersList.DataBind()
            GVBiddersList.Visible = True
            GVBiddersList.Enabled = True
            lblErrorMsg.Text = ""
            lblgreen.Text = ""
            txtTotalBidders.Text = dt.Rows.Count
            lblStartStopStatus.Text = dt.Rows(0).Item("StartStopStatus").ToString()
            txtTotalBidders.ReadOnly = True
        Else
            lblErrorMsg.Text = ValidationMessage(1023)
            lblgreen.Text = ""
            GVBiddersList.Visible = False
        End If
    End Sub

    Protected Sub BtnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnClose.Click

        Response.Write("<script language='javascript'> { self.close() }</script>")
        'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "myCloseScript", "window.close()", True)
    End Sub

    Protected Sub BtnStart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnStart.Click
        RowsAffetected = DLBiddersList.UpdateConfigStart()
        lblStartStopStatus.Text = "STARTED"
    End Sub

    Protected Sub BtnStop_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnStop.Click
        RowsAffetected = DLBiddersList.UpdateConfigStop()
        lblStartStopStatus.Text = "STOPPED"
    End Sub

    Protected Sub GVBiddersList_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVBiddersList.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Dim Id As Integer
            Id = CType(GVBiddersList.Rows(e.RowIndex).FindControl("lblLogId"), Label).Text
            DLBiddersList.RemoveBidder(Id)
            'lblErrorMsg.Visible = True
            'lblgreen.Visible = True
            DisplayGrid()
            lblgreen.Text = ValidationMessage(1084)
            lblErrorMsg.Text = ""
        Else
            lblErrorMsg.Text = ValidationMessage(1029)
            lblgreen.Text = ""
        End If
    End Sub
    Public Function ValidationMessage(ByVal ErrorCode As Integer) As String
        Dim dt2 As DataTable
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
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub
End Class
