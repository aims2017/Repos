Partial Class frmFlowerCategory
    Inherits BasePage

    Dim BL As New BLFlowerCategory
    Dim DT As New DataTable
    Dim DL As New DLFlowerCategory
    Dim EL As New ELFlowerCategory



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code written by siddharth
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Try


                EL.FlowerCategory = txtfcategory.Text

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

                    BL.InsertFlowerCategory(EL)
                    lblmsgifo.Text = " Data Saved Successfully."
                    lblerrmsg.Text = ""
                    disp(0)
                    clear()
                Else
                    EL.id = CInt(ViewState("id"))
                    BL.UpdateFlowerCategory(EL)
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
        txtfcategory.Text = ""



    End Sub
    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        lblerrmsg.Text = ""
        lblmsgifo.Text = ""
        If btnView.Text <> "BACK" Then
            EL.id = 0
            'dt = BL.DisplayGridview(EL.id)
            disp(EL.id)
            GVFlower.Visible = "true"

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
        EL.FlowerCategory = txtfcategory.Text
        DT = BL.DisplayGridview(EL)
        If DT.Rows.Count > 0 Then
            GVFlower.DataSource = DT
            GVFlower.DataBind()
            GVFlower.Visible = True
            GVFlower.Enabled = True

        Else
            lblmsgifo.Text = ""
            lblerrmsg.Text = "No records to display."

        End If
    End Sub
    Protected Sub GVFlower_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVFlower.RowEditing


        txtfcategory.Text = CType(GVFlower.Rows(e.NewEditIndex).FindControl("lblfcategory"), Label).Text


        ViewState("id") = CType(GVFlower.Rows(e.NewEditIndex).FindControl("lblid"), Label).Text
        btnAdd.Text = "UPDATE"
        btnView.Text = "BACK"
        EL.id = ViewState("id")
        EL.FlowerCategory = txtfcategory.Text
        DT = BL.DisplayGridview(EL)
        GVFlower.DataSource = DT
        GVFlower.DataBind()
        GVFlower.Enabled = False
        lblmsgifo.Text = ""
        lblerrmsg.Text = ""
    End Sub
End Class
