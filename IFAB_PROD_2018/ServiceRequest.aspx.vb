Partial Class ServiceRequest
    Inherits BasePage
    Dim entity As New ServiceRequestE
    Dim bal As New ServiceRequestB
    Dim dt As New Data.DataTable

    Protected Sub btnSendReq_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendReq.Click
        If (Session("BranchCode") = Session("ParentBranch")) Then
            entity.UserName = txtuserName.Text
            entity.RequestDate = txtDate.Text
            entity.Priority = ddlprority.SelectedItem.Text
            entity.DescOfRequest = txtDescription.Text
            entity.Email = txtEmailId.Text
            entity.PhNo = txtPhNo.Text
            entity.ModuleId = ddlModule.SelectedValue
            entity.ServReqId = txtSerReqId.Text
            ServiceRequestB.Insert(entity)
            msginfo.Text = ""
            lblmsg.Text = "Request Sent successfully."
            Dim dt1 As DataTable
            dt1 = ServiceRequestD.GetSerReqId()
            If dt1.Rows.Count > 0 Then
                txtSerReqId.Text = dt1.Rows(0).Item("Config_Value")
            Else
                txtSerReqId.Text = ""
            End If
            ddlprority.Focus()
            Gridview1.Visible = True
            clear()
            entity.Priority = "Select"
            DispGrid(entity)
        Else
            msginfo.Text = "You do not belong to this branch, Cannot send request."
            lblmsg.Text = ""
        End If
    End Sub

    Sub DispGrid(ByVal entity As ServiceRequestE)
        dt = ServiceRequestB.GetData(entity)
        If dt.Rows.Count <> 0 Then
            Gridview1.DataSource = dt
            Gridview1.DataBind()
            Gridview1.Visible = True
            clear()
        Else
            lblmsg.Text = ""
            msginfo.Text = "No records to display."
            Gridview1.Visible = False
        End If
    End Sub
    Sub clear()

        txtDescription.Text = ""

    End Sub
    Protected Sub btnCheckStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckStatus.Click
        LinkButton1.Focus()
        lblmsg.Text = ""
        msginfo.Text = ""
        entity.Priority = ddlprority.SelectedItem.Text
        'If ddlprority.SelectedValue <> "0" Then
        '    If ddlprority.SelectedValue = "1" Then
        '        b = ddlprority.SelectedValue
        '    End If
        '    If ddlprority.SelectedValue = "2" Then
        '        b = ddlprority.SelectedValue
        '    End If
        '    If ddlprority.SelectedValue = "3" Then
        '        b = ddlprority.SelectedValue
        '    End If
        'Else
        '    b = ddlprority.SelectedValue
        'End If
        ViewState("PageIndex") = 0
        Gridview1.PageIndex = 0
        DispGrid(entity)
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim heading As String
        Dim Empcode As String
        heading = Session("RptFrmTitleName")
        Me.Lblheading.Text = heading
        txtDate.Text = Today.ToString("dd-MMM-yyyy")
        txtuserName.Text = HttpContext.Current.Session("EmpName")
        Empcode = HttpContext.Current.Session("EmpCode")
        dt = ServiceRequestD.GetEmpData(Empcode)
        txtEmailId.Text = dt.Rows(0).Item("Email")
        txtPhNo.Text = dt.Rows(0).Item("ContactNo")
        If Not IsPostBack Then
            Dim dt1 As DataTable
            dt1 = ServiceRequestD.GetSerReqId()
            If dt1.Rows.Count > 0 Then
                txtSerReqId.Text = dt1.Rows(0).Item("Config_Value")
            Else
                txtSerReqId.Text = ""
            End If
        End If
       
        txtEmailId.Enabled = False
        txtPhNo.Enabled = False
        txtDate.Enabled = False
        txtuserName.Enabled = False
        ddlprority.Focus()
    End Sub

    Protected Sub Gridview1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Gridview1.PageIndexChanging
        Gridview1.Enabled = True
        Gridview1.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = Gridview1.PageIndex
        entity.Priority = "Select"
        DispGrid(entity)
    End Sub
    Protected Sub Gridview1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles Gridview1.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            ViewState("ID") = CType(Gridview1.Rows(e.RowIndex).FindControl("Label0"), Label).Text
            ServiceRequestB.Delete(ViewState("ID"))
            entity.Priority = "Select"
            Gridview1.PageIndex = ViewState("PageIndex")
            DispGrid(entity)
            msginfo.Text = ""
            lblmsg.Text = "Data deleted successfully."
            ddlprority.Focus()
        Else
            msginfo.Text = "You do not belong to this branch, Cannot delete data."
            lblmsg.Text = ""
        End If

    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub ddlprority_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlprority.Load
        ddlprority.Focus()
    End Sub
End Class
