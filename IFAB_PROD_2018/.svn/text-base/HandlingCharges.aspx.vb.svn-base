Imports System.Data.SqlClient
Partial Class HandlingCharges
    Inherits BasePage
    Dim BL As New BLHandlingCharges
    Dim DT As New DataTable
    Dim DL As New DLHandlingCharges
    Dim EL As New ELHandlingCharges
    Dim regDate As Date = Date.Today()
    Dim fromdate As Date
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            txtDate.Text = Today.ToString("dd-MMM-yyyy")
            txtenddate.Text = Today.ToString("dd-MMM-yyyy")
        End If
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code written by siddharth
        If (Session("BranchCode") = Session("ParentBranch")) Then
            'Dim FromDate As DateTime
            'Dim ToDate As DateTime
            Try
                lblmsgifo.Text = " "
                lblerrmsg.Text = ""
        If txtDate.Text = "" Then
            EL.FromDate = "1/1/1900"
        Else
            EL.FromDate = txtDate.Text
        End If
        If txtenddate.Text = "" Then
            EL.ToDate = "1/1/3000"
        Else
            EL.ToDate = txtenddate.Text
        End If
        EL.FromDate = txtDate.Text
        EL.ToDate = txtenddate.Text
                If EL.FromDate > EL.ToDate Then
                    lblerrmsg.Text = "Start date should not be greater than End date."
                    txtenddate.Focus()
                    Exit Sub
                End If
                If txtChargesByuer.Text = "" Then
                    EL.ChargesForBuyerPerc = 0
                Else
                    EL.ChargesForBuyerPerc = txtChargesByuer.Text
                End If

                If txtChargesSeller.Text = "" Then
                    EL.ChargesForSellerPerc = 0
                Else
                    EL.ChargesForSellerPerc = txtChargesSeller.Text
                End If
                If txtMinChargesByuer.Text = "" Then
                    EL.MinChargesForBuyer = 0
                Else
                    EL.MinChargesForBuyer = txtMinChargesByuer.Text
                End If
                If txtPenalityCharges.Text = "" Then
                    EL.PenaltyCharges = 0
                Else
                    EL.PenaltyCharges = txtPenalityCharges.Text
                End If



                'EL.id = CInt(ViewState("id"))
                EL.id = 0
                Dim dt As New DataTable
                'dt = BL.CheckDuplicate(EL)
                'If dt.Rows.Count > 0 Then

                '    lblerrmsg.Text = "Data already exists."
                '    lblmsgifo.Text = " "
                '    disp(0)
                '    Exit Sub
                'End If
                If btnAdd.Text = "ADD" Then
                    dt = BL.CheckDuplicate(EL)
                    If dt.Rows.Count > 0 Then

                        lblerrmsg.Text = "Data already exists."
                        lblmsgifo.Text = " "
                        disp(0)
                        Exit Sub
                    End If
                    BL.InsertHandlingCharges(EL)
                    lblmsgifo.Text = " Data Saved Successfully."
                    lblerrmsg.Text = ""
                    disp(0)
                    clear()
                Else
                    EL.id = CInt(ViewState("id"))
                    If EL.ToDate <= Date.Today() Then
                        'If fromdate = EL.ToDate Then
                        lblerrmsg.Text = "You Can not update."
                        lblmsgifo.Text = " "
                        Exit Sub
                        'End If
                End If
                If EL.FromDate <= Date.Today() And Date.Today() <= EL.ToDate Then
                    lblerrmsg.Text = "Please Change the From Date and To date."
                    lblmsgifo.Text = " "
                    Exit Sub
                End If

                dt = BL.CheckDuplicate(EL)
                If dt.Rows.Count > 0 Then

                    lblerrmsg.Text = "Data already exists."
                    lblmsgifo.Text = " "
                    disp(0)
                    Exit Sub
                End If

                BL.UpdateHandling(EL)
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
        'txtDate.Text = ""
        'txtenddate.Text = ""
        txtChargesByuer.Text = ""
        txtChargesSeller.Text = ""
        txtMinChargesByuer.Text = ""
        txtPenalityCharges.Text = ""


    End Sub


    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        lblerrmsg.Text = ""
        lblmsgifo.Text = ""
        If btnView.Text <> "BACK" Then
            EL.id = 0
            'dt = BL.DisplayGridview(EL.id)
            disp(EL.id)
            GVHandlingCharges.Visible = "true"

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
        DT = BL.DisplayGridview(EL)
        If DT.Rows.Count > 0 Then
            GVHandlingCharges.DataSource = DT

            GVHandlingCharges.DataBind()
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
            GVHandlingCharges.Visible = True
            GVHandlingCharges.Enabled = True

        Else
            lblmsgifo.Text = ""
            lblerrmsg.Text = "No records to display."

        End If
    End Sub

    Protected Sub GVHandlingCharges_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVHandlingCharges.RowDeleting
        Dim rowsaffected As Integer
        EL.id = (CType(GVHandlingCharges.Rows(e.RowIndex).FindControl("lblid"), Label).Text)

        rowsaffected = BL.DeleteHandlingCharges(EL)
        lblmsgifo.Text = "Data Deleted sucessfully."
        lblerrmsg.Text = ""
        disp(0)
        DT = BL.DisplayGridview(EL)
        GVHandlingCharges.DataSource = DT
        GVHandlingCharges.DataBind()
    End Sub



    Protected Sub GVHandlingCharges_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVHandlingCharges.RowEditing

        
        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblDate"), Label).Text = "" Then
            txtDate.Text = 0
        Else
            txtDate.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblDate"), Label).Text
        End If

        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblenddate"), Label).Text = "" Then
            txtenddate.Text = 0
        Else
            txtenddate.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblenddate"), Label).Text
        End If
        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblChargesByuer"), Label).Text = "" Then
            txtChargesByuer.Text = 0
        Else
            txtChargesByuer.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblChargesByuer"), Label).Text
        End If
        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblChargesSeller"), Label).Text = "" Then
            txtChargesSeller.Text = 0
        Else
            txtChargesSeller.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblChargesSeller"), Label).Text
        End If
        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblMinChargesByuer"), Label).Text = "" Then
            txtMinChargesByuer.Text = 0
        Else
            txtMinChargesByuer.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblMinChargesByuer"), Label).Text
        End If
        If CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblPenalityCharges"), Label).Text = "" Then
            txtPenalityCharges.Text = 0
        Else
            txtPenalityCharges.Text = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblPenalityCharges"), Label).Text
        End If
       
        ViewState("id") = CType(GVHandlingCharges.Rows(e.NewEditIndex).FindControl("lblid"), Label).Text
        btnAdd.Text = "UPDATE"
        btnView.Text = "BACK"
        EL.id = ViewState("id")
        DT = BL.DisplayGridview(EL)
        GVHandlingCharges.DataSource = DT
        GVHandlingCharges.DataBind()
        GVHandlingCharges.Enabled = False
        lblmsgifo.Text = ""
        lblerrmsg.Text = ""
        fromdate = txtDate.Text

    End Sub
    Protected Sub GVHandlingCharges_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVHandlingCharges.PageIndexChanging
        GVHandlingCharges.PageIndex = e.NewPageIndex
        Dim dt As New DataTable
        dt = BL.DisplayGridview(EL)
        GVHandlingCharges.DataSource = dt
        GVHandlingCharges.Visible = True
        GVHandlingCharges.DataBind()
    End Sub
    Protected Sub GVHandlingCharges_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GVHandlingCharges.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        If txtDate.Text = "" Then
            EL.FromDate = "1/1/2999"
        Else
            EL.FromDate = txtDate.Text
        End If
        If txtenddate.Text = "" Then
            EL.ToDate = "1/1/2999"
        Else
            EL.ToDate = txtenddate.Text
        End If


        DT = BL.DisplayGridview(EL)
        Dim sortedView As New DataView(DT)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GVHandlingCharges.DataSource = sortedView
        GVHandlingCharges.DataBind()
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





 