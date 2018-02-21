
Partial Class frmSalaryScaleGradeMaster
    Inherits BasePage
    
    Dim BL As New BLSalaryScaleGrade
    Dim DT As New DataTable
    Dim DL As New DLSalaryScaleGrade
    Dim EL As New ELSalaryScaleGrade



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code written by siddharth
        EL.Grade = txtGrade.Text
        EL.ScaleRange = txtScaleRange.Text
        EL.id = CInt(ViewState("id"))
        Dim dt As New DataTable
        dt = BL.CheckDuplicate(EL)
        If dt.Rows.Count > 0 Then
            'lblRed.Visible = True
            lblerrmsg.Text = "Data already exists."
            lblmsgifo.Text = " "
            disp(0)
            Exit Sub
        End If
        If btnAdd.Text = "ADD" Then

            BL.InsertSalaryScale(EL)
            lblmsgifo.Text = " Data Saved Successfully."
            lblerrmsg.Text = ""
            disp(0)
            clear()
        Else
            EL.id = CInt(ViewState("id"))
            BL.UpdateSalaryScale(EL)
            lblmsgifo.Text = " Data Updated successfully."
            lblerrmsg.Text = ""
            clear()
            btnAdd.Text = "ADD"
            btnView.Text = "VIEW"


            disp(0)


        End If


    End Sub
    Sub clear()
        txtGrade.Text = ""
        txtScaleRange.Text = ""


    End Sub
    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        lblerrmsg.Text = ""
        lblmsgifo.Text = ""
        If btnView.Text <> "BACK" Then
            EL.id = 0
            'dt = BL.DisplayGridview(EL.id)
            disp(EL.id)
            GridView1.Visible = "true"

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
        DT = BL.DisplayGridview(id)
        If DT.Rows.Count > 0 Then
            GridView1.DataSource = DT
            GridView1.DataBind()
            GridView1.Visible = True
            GridView1.Enabled = True

        Else
            lblmsgifo.Text = ""
            lblerrmsg.Text = "No records to display."

        End If
    End Sub


    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim rowsaffected As Integer
        EL.id = (CType(GridView1.Rows(e.RowIndex).FindControl("lblid"), Label).Text)
        rowsaffected = BL.DeleteSalryScale(EL)
        lblmsgifo.Text = "Data deleted sucessfully."
        lblerrmsg.Text = ""
        disp(0)
        DT = BL.DisplayGridview(EL.id)
        GridView1.DataSource = DT
        GridView1.DataBind()
    End Sub
    

   
    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing

       
        txtGrade.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblGrade"), Label).Text
        txtScaleRange.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblScaleRange"), Label).Text

        ViewState("id") = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblid"), Label).Text
        btnAdd.Text = "UPDATE"
        btnView.Text = "BACK"
        EL.id = ViewState("id")
        DT = BL.DisplayGridview(EL.id)
        GridView1.DataSource = DT
        GridView1.DataBind()
        GridView1.Enabled = False
        lblmsgifo.Text = ""
        lblerrmsg.Text = ""
    End Sub
End Class
