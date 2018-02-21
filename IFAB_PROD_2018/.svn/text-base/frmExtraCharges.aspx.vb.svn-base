
Partial Class frmExtraCharges
    Inherits BasePage

    Dim BL As New BLExtraCharges
    Dim DT As New DataTable
    Dim DL As New DLExtraCharges
    Dim EL As New ELExtraCharges

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            txtDate.Text = Today.ToString("dd-MMM-yyyy")

        End If
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code written by siddharth
        If (Session("BranchCode") = Session("ParentBranch")) Then

            Try
                EL.Growerid = ddlGrowerid.SelectedValue
                EL.StartDate = txtDate.Text
                If txtFreight.Text = "" Then
                    EL.Freight = 0
                Else
                    EL.Freight = txtFreight.Text
                End If

                If txtChemical.Text = "" Then
                    EL.Chemical = 0
                Else
                    EL.Chemical = txtChemical.Text
                End If
                If txtFretilizer.Text = "" Then
                    EL.Fertilizer = 0
                Else
                    EL.Fertilizer = txtFretilizer.Text
                End If
                If txtFlowerPurchase.Text = "" Then
                    EL.FlowerPurchase = 0
                Else
                    EL.FlowerPurchase = txtFlowerPurchase.Text
                End If
                If txtOther.Text = "" Then
                    EL.OtherCharges = 0
                Else
                    EL.OtherCharges = txtOther.Text
                End If
                EL.id = CInt(ViewState("id"))
                Dim dt As New DataTable
                dt = BL.CheckDuplicate(EL)
                If dt.Rows.Count > 0 Then
                    lblerrmsg.Text = "Data already exists."
                    lblmsgifo.Text = " "
                    disp(0)
                    Exit Sub
                End If
                If btnAdd.Text = "ADD" Then

                    BL.InsertExtraCharges(EL)
                    lblmsgifo.Text = " Data Saved Successfully."
                    lblerrmsg.Text = ""
                    disp(0)
                    clear()
                Else
                    EL.id = CInt(ViewState("id"))
                    BL.UpdateExtraCharges(EL)
                    lblmsgifo.Text = " Data Updated successfully."
                    lblerrmsg.Text = ""
                    clear()
                    btnAdd.Text = "ADD"
                    btnView.Text = "VIEW"
                    disp(0)
                End If
            Catch ex As Exception
                lblmsgifo.Text = "Date is not valid."
                lblerrmsg.Text = ""
            End Try
        Else
            lblmsgifo.Text = "You do not belong to this branch, Cannot add/update data."
            lblerrmsg.Text = ""
        End If

    End Sub
    Sub clear()
        txtDate.Text = ""
        txtFreight.Text = ""
        txtChemical.Text = ""
        txtFretilizer.Text = ""
        txtFlowerPurchase.Text = ""
        txtOther.Text = ""

    End Sub


    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        lblerrmsg.Text = ""
        lblmsgifo.Text = ""
        If btnView.Text <> "BACK" Then
            EL.id = 0
            'dt = BL.DisplayGridview(EL.id)
            disp(EL.id)
            GVExtraCharges.Visible = "true"

        Else
            clear()
            btnAdd.Text = "ADD"
            btnView.Text = "VIEW"
            disp(0)



        End If


    End Sub
    Sub disp(ByVal id As Integer)

        ' Display the data-- by Siddharth(25-4-2013)

        EL.id = 0
        EL.Growerid = ddlGrowerid.SelectedValue
       
        DT = BL.DisplayGridview(EL)
        If DT.Rows.Count > 0 Then
            GVExtraCharges.DataSource = DT
            
            GVExtraCharges.DataBind()
            'For Each rows As GridViewRow In GVExtraCharges.Rows
            '    If CType(rows.FindControl("lblFreight"), Label).Text = "0" Then
            '        CType(rows.FindControl("lblFreight"), Label).Text = ""
            '    End If
            '    If CType(rows.FindControl("lblChemical"), Label).Text = "0" Then
            '        CType(rows.FindControl("lblChemical"), Label).Text = ""
            '    End If
            '    If CType(rows.FindControl("lblFretilizer"), Label).Text = "0" Then
            '        CType(rows.FindControl("lblFretilizer"), Label).Text = ""
            '    End If
            '    If CType(rows.FindControl("lblFlowerPurchase"), Label).Text = "0" Then
            '        CType(rows.FindControl("lblFlowerPurchase"), Label).Text = ""
            '    End If
            '    If CType(rows.FindControl("lblOther"), Label).Text = "0" Then
            '        CType(rows.FindControl("lblOther"), Label).Text = ""
            '    End If


            'Next
            GVExtraCharges.Visible = True
            GVExtraCharges.Enabled = True

        Else
            lblmsgifo.Text = ""
            lblerrmsg.Text = "No records to display."

        End If
    End Sub

    Protected Sub GVExtraCharges_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVExtraCharges.RowDeleting
        Dim rowsaffected As Integer
        EL.id = (CType(GVExtraCharges.Rows(e.RowIndex).FindControl("lblid"), Label).Text)
      
        rowsaffected = BL.DeleteExtraCharges(EL)
        lblmsgifo.Text = "Data Deleted sucessfully."
        lblerrmsg.Text = ""
        disp(0)
        DT = BL.DisplayGridview(EL)
        GVExtraCharges.DataSource = DT
        GVExtraCharges.DataBind()
    End Sub



    Protected Sub GVExtraCharges_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVExtraCharges.RowEditing

        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblGrowID"), Label).Text = "" Then
            ddlGrowerid.SelectedValue = 0
        Else
            ddlGrowerid.SelectedValue = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblGrowID"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblDate"), Label).Text = "" Then
            txtDate.Text = 0
        Else
            txtDate.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblDate"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFreight"), Label).Text = "" Then
            txtFreight.Text = 0
        Else
            txtFreight.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFreight"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblChemical"), Label).Text = "" Then
            txtChemical.Text = 0
        Else
            txtChemical.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblChemical"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFretilizer"), Label).Text = "" Then
            txtFretilizer.Text = 0
        Else
            txtFretilizer.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFretilizer"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFlowerPurchase"), Label).Text = "" Then
            txtFlowerPurchase.Text = 0
        Else
            txtFlowerPurchase.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblFlowerPurchase"), Label).Text
        End If
        If CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblOther"), Label).Text Then
            txtOther.Text = 0
        Else
            txtOther.Text = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblOther"), Label).Text
        End If
        ViewState("id") = CType(GVExtraCharges.Rows(e.NewEditIndex).FindControl("lblid"), Label).Text
        btnAdd.Text = "UPDATE"
        btnView.Text = "BACK"
        EL.id = ViewState("id")
        DT = BL.DisplayGridview(EL)
        GVExtraCharges.DataSource = DT
        GVExtraCharges.DataBind()
        GVExtraCharges.Enabled = False
        lblmsgifo.Text = ""
        lblerrmsg.Text = ""
    End Sub
    Protected Sub GVExtraCharges_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVExtraCharges.PageIndexChanging
        GVExtraCharges.PageIndex = e.NewPageIndex
        Dim dt As New DataTable
        dt = BL.DisplayGridview(EL)
        GVExtraCharges.DataSource = dt
        GVExtraCharges.Visible = True
        GVExtraCharges.DataBind()
    End Sub
    Protected Sub GVExtraCharges_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GVExtraCharges.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
       
        If ddlGrowerid.SelectedValue = "" Then
            EL.Growerid = 0
        Else
            EL.Growerid = ddlGrowerid.SelectedValue
        End If
      

        If txtDate.Text = "" Then
            EL.StartDate = "1/1/2999"
        Else
            EL.StartDate = txtDate.Text
        End If
       

        DT = BL.DisplayGridview(EL)
        Dim sortedView As New DataView(DT)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GVExtraCharges.DataSource = sortedView
        GVExtraCharges.DataBind()
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



