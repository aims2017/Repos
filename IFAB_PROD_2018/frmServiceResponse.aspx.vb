Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Data
'Aurhor-->Ajit kumar singh.
'Date-->15-May-2012
Partial Class frmServiceResponse
    Inherits BasePage
    Dim en As New ServiceResponseE
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("BranchCode") <> "000000000000" Then
            Response.Redirect("AccessDenied.aspx")
        End If
        txtResponsedate.Text = Today.ToString("dd-MMM-yyyy")
        'txtResponsedate.Enabled = False
        btnUpdate.Enabled = False
        txtBranchname.Enabled = False
        txtInstitute.Enabled = False
        txtReqID.Enabled = False
        txtrequest.Enabled = False
        txtUsername.Enabled = False
    End Sub

    Protected Sub Gridview1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Gridview1.PageIndexChanging
        Gridview1.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = Gridview1.PageIndex
        en.Status = "Select"
        en.Priority = "Select"
        DispGrid(en)

    End Sub

    Protected Sub Gridview1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles Gridview1.RowEditing
        Dim status, priority As String
        btnUpdate.Enabled = True
        msginfo.Text = ""
        lblmsg.Text = ""
        status = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label8"), Label).Text
        priority = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label7"), Label).Text
        If status = "Open" Then
            ddlStatus.SelectedValue = 1
        Else
            ddlStatus.SelectedValue = 2
        End If
        If priority = "High" Then
            ddlpriority.SelectedValue = 1
        ElseIf priority = "Medium" Then
            ddlpriority.SelectedValue = 2
        Else
            ddlpriority.SelectedValue = 3
        End If
        txtReqID.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label2"), Label).Text
        txtUsername.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label4"), Label).Text
        txtInstitute.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label5"), Label).Text
        txtBranchname.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label6"), Label).Text
        txtrequest.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label10"), Label).Text
        txtResponse.Text = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label11"), Label).Text
        ViewState("ID") = CType(Gridview1.Rows(e.NewEditIndex).FindControl("Label0"), Label).Text
        btnUpdate.Enabled = True
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        en.Id = ViewState("ID")
        'en.ReqID = txtReqID.Text
        'en.UserName = txtUsername.Text
        'en.Institute = txtInstitute.Text
        'en.BranchName = txtBranchname.Text
        en.Status = ddlStatus.SelectedItem.Text
        en.ResponseDate = txtResponsedate.Text
        en.Priority = ddlpriority.SelectedItem.Text
        'en.DescOfRequest = txtrequest.Text
        en.DescOfResponse = txtResponse.Text
        ServiceResponseB.Update(en)
        msginfo.Text = ""
        lblmsg.Text = "Data Updated Sucessfully."
        'ddlpriority.ClearSelection()
        'ddlStatus.ClearSelection()
        clear()
        Gridview1.PageIndex = ViewState("PageIndex")
        en.Status = "Select"
        en.Priority = "Select"
        DispGrid(en)
    End Sub
    Sub DispGrid(ByVal en As ServiceResponseE)
        Dim dt As New Data.DataTable
        dt = ServiceResponseB.GetData(en)
        If dt.Rows.Count <> 0 Then
            Gridview1.DataSource = dt
            Gridview1.DataBind()
            Gridview1.Visible = True
        Else
            lblmsg.Text = ""
            msginfo.Text = "No records to display."
            Gridview1.Visible = False
        End If
    End Sub
    Sub clear()
        txtReqID.Text = ""
        txtBranchname.Text = ""
        txtInstitute.Text = ""
        txtrequest.Text = ""
        txtResponse.Text = ""
        txtUsername.Text = ""
    End Sub

    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        btnUpdate.Enabled = False
        lblmsg.Text = ""
        msginfo.Text = ""
        en.Priority = ddlpriority.SelectedItem.Text
        en.Status = ddlStatus.SelectedItem.Text
        ViewState("PageIndex") = 0
        Gridview1.PageIndex = 0
        DispGrid(en)
        clear()

    End Sub
End Class
