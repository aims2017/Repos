
Partial Class frmClientContractMonthlyRun
    Inherits BasePage
    Dim DL As New DLCCMonthlyRun
    Dim EL As New ELCCMonthlyRun
    Dim DT As New DataTable
    Protected Sub btnGen_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGen.Click
        If DdlSelectClient.SelectedValue = "0" Or DdlSelectBranch.SelectedValue = "0" Then
            lblRed.Text = "Select Mandatory Fields."
            lblGreen.Text = ""
            Exit Sub
        End If
        If ddlfrmMonth.SelectedValue > ddltomonth.SelectedValue Then
            lblRed.Text = "From Month Cannot be greater than to month."
            lblGreen.Text = ""
            Exit Sub
        End If
        If ddlFrmYear.SelectedValue > ddltoYear.SelectedValue Then
            lblRed.Text = "From Year Cannot be greater than to Year."
            lblGreen.Text = ""
            Exit Sub
        End If
        EL.ClientID = DdlSelectClient.SelectedValue
        EL.BranchCode = DdlSelectBranch.SelectedValue
        EL.FromMonth = ddlfrmMonth.SelectedValue
        EL.FromYear = ddlFrmYear.SelectedItem.Text
        EL.ToMonth = ddltomonth.SelectedValue
        EL.ToYear = ddltoYear.SelectedItem.Text

        If DL.GetClientcontractmonthlyrun(EL).Rows.Count <= 0 Then
            DT = DL.Clientcontractmonthlyrun(EL)
            If DT.Rows.Count <> 0 Then
                GridView1.DataSource = DT
                GridView1.DataBind()
                GridView1.Visible = True
                lblRed.Text = ""
                lblGreen.Text = ""
            Else
                lblRed.Text = "Data already Exists."
                lblGreen.Text = ""
                GridView1.Visible = False
            End If
        Else
            lblRed.Text = "Data already Exists."
            lblGreen.Text = ""
            GridView1.Visible = False
        End If
    End Sub

    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        EL.ClientID = DdlSelectClient.SelectedValue
        EL.BranchCode = DdlSelectBranch.SelectedValue
        EL.FromMonth = ddlfrmMonth.SelectedValue
        EL.FromYear = ddlFrmYear.SelectedItem.Text
        EL.ToMonth = ddltomonth.SelectedValue
        EL.ToYear = ddltoYear.SelectedItem.Text

        DT = DL.GetClientcontractmonthlyrun(EL)
        If DT.Rows.Count <> 0 Then
            GridView1.DataSource = DT
            GridView1.DataBind()
            For Each grid As GridViewRow In GridView1.Rows
                If CType(grid.FindControl("lblPreAudit"), Label).Text = "Y" Then
                    CType(grid.FindControl("ChkBx"), CheckBox).Checked = True
                End If
            Next
            GridView1.Visible = True
            lblRed.Text = ""
            lblGreen.Text = ""
        Else
            lblRed.Text = "No records to display."
            lblGreen.Text = ""
            GridView1.Visible = False
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        For Each grid As GridViewRow In GridView1.Rows
            If CType(grid.FindControl("ChkBx"), CheckBox).Checked = True Then
                EL.id = CType(grid.FindControl("lblPKID"), Label).Text
                DL.UpdateClientcontractmonthlyrun(EL, "Y")
                lblGreen.Text = "Records Updated Successfully."
                ViewState("Updated") = "True"
                lblRed.Text = ""
            Else
                EL.id = CType(grid.FindControl("lblPKID"), Label).Text
                DL.UpdateClientcontractmonthlyrun(EL, "N")
                lblGreen.Text = "Records Updated Successfully."
                ViewState("Updated") = "True"
                lblRed.Text = ""
            End If
        Next
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        EL.ClientID = DdlSelectClient.SelectedValue
        EL.BranchCode = DdlSelectBranch.SelectedValue
        EL.FromMonth = ddlfrmMonth.SelectedValue
        EL.FromYear = ddlFrmYear.SelectedItem.Text
        EL.ToMonth = ddltomonth.SelectedValue
        EL.ToYear = ddltoYear.SelectedItem.Text
        GridView1.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GridView1.PageIndex
        DT = DL.GetClientcontractmonthlyrun(EL)
        GridView1.DataSource = DT
        GridView1.DataBind()
        GridView1.Visible = True
    End Sub
End Class
