Imports System.Net.Mail
Imports System
Imports System.IO
Imports System.Net
Imports System.Text
Partial Class frmApprovalForm
    Inherits BasePage
    Dim approve As New ApprovalForm
    Dim BlApp As New BLApprovalForm
    Dim dt As New DataTable
    Dim strg As String
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        others()
    End Sub
    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Session("RowID") = CType(GridView1.Rows(e.RowIndex).FindControl("lblRowId"), Label).Text
        Dim from As String = CType(GridView1.Rows(e.RowIndex).FindControl("LabelFormName"), Label).Text
        If from = "frmleaveapplication.aspx" Then
            Dim sepWin As String = "frmleaveapplication.aspx?Type=" & 1 & "&RowId" & Session("RowID") & SeperateWindow.SepWindow()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=800,height=600,left=40,top=80')</script>", False)
        End If
        If from = "FrmEmpTransfer.aspx" Then
            Dim sepWin As String = "FrmEmpTransfer.aspx?Type=" & 1 & "&RowId" & Session("RowID") & SeperateWindow.SepWindow()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=800,height=600,left=40,top=80')</script>", False)
        End If
        If from = "frmAssetTransferNew.aspx" Then
            Dim sepWin As String = "frmAssetTransferNew.aspx?Type=" & 1 & "&RowId" & Session("RowID") & SeperateWindow.SepWindow()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=800,height=600,left=40,top=80')</script>", False)
        End If
        If from = "FrmRollOver.aspx" Then
            Dim sepWin As String = "FrmRollOver.aspx?Type=" & 1 & "&RowId" & Session("RowID") & SeperateWindow.SepWindow()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=800,height=600,left=40,top=80')</script>", False)
        End If
        'Session("RowID") = ""
    End Sub
Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Session("RowID") = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblRowId"), Label).Text
            Dim from As String = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelFormName"), Label).Text
            Dim dtE As New Data.DataTable
            Dim branch As String = HttpContext.Current.Session("BranchCode")
            strg = "Approve"
            Session("ApproveId") = CType(GridView1.Rows(e.NewEditIndex).FindControl("HiddenId"), HiddenField).Value
            approve.ApproveId = Session("ApproveId")
            approve.Remarks = CType(GridView1.Rows(e.NewEditIndex).FindControl("txtrem"), TextBox).Text
            If from <> "FrmRollOver.aspx" Then
                BlApp.Approval1(approve)
                BlApp.Approval(approve)
            Else
                BlApp.ApprovalStudent(approve)
            End If
            

            others()
            Session("RowID") = ""
            lblmsg.Text = "Record is approved."
            msginfo.Text = ""
        Else
            msginfo.Text = "You do not belong to this branch, Cannot approve data."
            lblmsg.Text = ""
        End If
    End Sub
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Dim dtE As New Data.DataTable
            strg = "Reject"
            Session("RowID") = CType(GridView1.Rows(e.RowIndex).FindControl("HiddenId"), HiddenField).Value
            Session("ApproveId") = CType(GridView1.Rows(e.RowIndex).FindControl("HiddenId"), HiddenField).Value
            Dim from As String = CType(GridView1.Rows(e.RowIndex).FindControl("LabelFormName"), Label).Text
            If CType(GridView1.Rows(e.RowIndex).FindControl("txtrem"), TextBox).Text <> "" Then
                If from = "frmleaveapplication.aspx" Then
                    Dim Remarks As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtrem"), TextBox).Text
                    BlApp.RRejection(Remarks)
                    others()
                    msginfo.Text = ""
                    lblmsg.Text = "Leave Application has been Rejected."
                    Session("RowID") = ""
                End If
                If from = "FrmEmpTransfer.aspx" Then
                    Dim Remarks As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtrem"), TextBox).Text
                    BlApp.RRejection(Remarks)
                    others()
                    msginfo.Text = ""
                    lblmsg.Text = "Employee Transfer has been Rejected."
                    Session("RowID") = ""
                End If
                If from = "frmAssetTransferNew.aspx" Then
                    Dim Remarks As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtrem"), TextBox).Text
                    BlApp.RRejection(Remarks)
                    others()
                    msginfo.Text = ""
                    lblmsg.Text = "Asset Transfer has been Rejected."
                    Session("RowID") = ""
                End If
                If from = "FrmRollOver.aspx" Then
                    Dim Remarks As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtrem"), TextBox).Text
                    BlApp.RRejection(Remarks)
                    others()
                    msginfo.Text = ""
                    lblmsg.Text = "Student Transfer has been Rejected."
                    Session("RowID") = ""
                End If
            Else
                msginfo.Text = "Remarks field is mandatory."
                lblmsg.Text = ""
            End If
        Else
            msginfo.Text = "You do not belong to this branch, Cannot reject data."
            lblmsg.Text = ""
        End If
    End Sub
    Protected Sub btnadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnadd.Click
        If (Session("BranchCode") = Session("ParentBranch")) Then
            LinkButton1.Focus()
            If ddlform.SelectedValue = "Select" Then
                msginfo.Text = "Select Form Name."
                ddlform.Focus()
                lblmsg.Text = ""
            Else
                others()
            End If
        Else
            msginfo.Text = "You do not belong to this branch, Cannot Submit."
            lblmsg.Text = ""
        End If
    End Sub
    Sub others()
        
        dt = BlApp.GetGrid(ddlform.SelectedItem.Value)


        If dt.Rows.Count <> 0 Then
            GridView1.DataSource = dt
            GridView1.DataBind()
            GridView1.Visible = True
            GridView1.Enabled = True
            msginfo.Text = ""
            lblmsg.Text = ""
        Else
            GridView1.Visible = False
            msginfo.Text = "No records to display."
            lblmsg.Text = ""
        End If
    End Sub

    Protected Sub ddlform_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlform.TextChanged
        ddlform.Focus()
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ddlform.Focus()
        Dim heading As String
        heading = Session("RptFrmTitleName")
        Me.Lblheading.Text = heading
    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub GridView1_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView1.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        dt = BlApp.GetGrid(ddlform.SelectedItem.Value)
        Dim sortedView As New DataView(dt)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GridView1.DataSource = sortedView
        GridView1.DataBind()
        GridView1.Visible = True
        GridView1.Enabled = True
    End Sub
    Public Property dir() As SortDirection
        Get
            If ViewState("dirState") Is Nothing Then
                ViewState("dirState") = SortDirection.Descending
            End If
            Return DirectCast(ViewState("dirState"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("dirState") = value
        End Set
    End Property
End Class


