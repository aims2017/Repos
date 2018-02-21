
Partial Class frmAuctionSheet
    Inherits BasePage
    Dim dt As DataTable
    Dim Flag As String = "False"
    Dim GrowerId As String
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DisplayGrid()
            BtnClose.Attributes.Add("onclick", "self.close();")
        End If
    End Sub
    Protected Sub BtnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnClose.Click
        Response.Write("<script language='javascript'> { self.close() }</script>")
    End Sub
    Sub DisplayGrid()
        GrowerId = ddlGrowerName.SelectedValue
        dt = DLAuctionLot.GetAuctionSheet(GrowerId)
        If dt.Rows.Count > 0 Then
            GVAuctionSheet.DataSource = dt
            GVAuctionSheet.DataBind()
            GVAuctionSheet.Visible = True
            GVAuctionSheet.Enabled = True
            lblErrorMsg.Text = ""
        Else
            lblErrorMsg.Text = "No Records to display."
            lblgreen.Text = ""
            GVAuctionSheet.Visible = False
        End If
        If GVAuctionSheet.Rows.Count > 0 Then
            For Each Grid As GridViewRow In GVAuctionSheet.Rows
                CType(Grid.FindControl("ddlReason"), DropDownList).SelectedValue = CType(Grid.FindControl("lblReasonId"), Label).Text
            Next
        End If
    End Sub

    Protected Sub BtnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnRefresh.Click
        DisplayGrid()
    End Sub

    Protected Sub GVAuctionSheet_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVAuctionSheet.Load
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "callFunctionsStartupScript", "grid();", True)
    End Sub

    Protected Sub GVAuctionSheet_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVAuctionSheet.PageIndexChanging
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        GVAuctionSheet.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVAuctionSheet.PageIndex
        DisplayGrid()
    End Sub

    Protected Sub GVAuctionSheet_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVAuctionSheet.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            dt = DLAuctionLot.CancelRole(Session("UserRole"))
            If dt.Rows.Count > 0 Then
                Dim Id, QtyCancelled, ActualQty As Integer
                Dim Remarks As String
                Id = CType(GVAuctionSheet.Rows(e.RowIndex).FindControl("lblAuctionId"), Label).Text
                ActualQty = CType(GVAuctionSheet.Rows(e.RowIndex).FindControl("lblQuantity"), Label).Text
                QtyCancelled = CType(GVAuctionSheet.Rows(e.RowIndex).FindControl("txtQtyCancelled"), TextBox).Text
                Remarks = CType(GVAuctionSheet.Rows(e.RowIndex).FindControl("ddlReason"), DropDownList).SelectedValue
                If Remarks = "0" Or QtyCancelled = 0 Then
                    lblErrorMsg.Text = ValidationMessage(1092)
                    lblgreen.Text = ""
                    Exit Sub
                End If
                If QtyCancelled > ActualQty Then
                    lblErrorMsg.Text = "Quantity Cancelled cannot be greater than Actual Quantity."
                    lblgreen.Text = ""
                    Exit Sub
                End If
                DLAuctionLot.CancelAuctionSheetBid(Id, QtyCancelled, Remarks)
                'lblErrorMsg.Visible = True
                'lblgreen.Visible = True
                DisplayGrid()
                lblgreen.Text = ValidationMessage(1090)
                lblErrorMsg.Text = ""
            Else
                lblErrorMsg.Text = "You do not have permission to cancel lot."
                lblgreen.Text = ""
            End If
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnGrower_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGrower.Click
        'DLAuctionLot.SendSMSGrower()
        'Turn on the timer
        Timer1.Enabled = True
        'Set the interval for each timer "tick"
        Timer1.Interval = 120000
    End Sub

    Protected Sub BtnBuyer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnBuyer.Click
        DLAuctionLot.SendSMSBuyer()
        lblErrorMsg.Text = ""
        lblgreen.Text = "Auto Sending of Email and SMS"
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
      
    End Sub

    ''Actions to perform on each timer tick:
    'Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
    '    dt = DLAuctionLot.GetBidderId()

    '    If dt.Rows(0).Item(0) IsNot DBNull.Value Then
    '        If (dt.Rows(0).Item(0) <> 0) Then
    '            DLAuctionLot.SendSMSMailGrower(CInt(dt.Rows(0).Item(0)))
    '        End If
    '    End If

    'End Sub
    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        DisplayGrid()
    End Sub
End Class
