Imports System.IO
Imports System.Collections.Generic
Imports System.Data
Imports System.Web.UI.WebControls.Button
Partial Class frmInDockEntry
    Inherits BasePage
    Dim Ind As New InDockEL
    Dim IndBL As New InDockBL
    Dim IndDL As New IndockDL
    Dim ThisDate As DateTime
    ''Code writen By Ajit Kumar Singh
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim currentDate As DateTime
        ThisDate = Now
        Dim TimePart As String = Format(ThisDate, "hh:mm tt")
        Dim dt As DataTable
        If Not IsPostBack Then
            Dim heading As String
            heading = Session("RptFrmTitleName")
            Me.Lblheading.Text = heading
            Dim dt1 As DataTable
            dt1 = IndBL.GetMaxQuantity()
            Dim MaxQuantity As Integer = dt1.Rows(0).Item("Config_Value").ToString()
            ViewState("MaxQuantity") = MaxQuantity
            txtEntryDate.Text = ThisDate.ToString("dd-MMM-yyyy")
            txtEntryTime.Text = TimePart
            currentDate = Convert.ToDateTime(txtEntryDate.Text)
            currentDate = currentDate.AddDays(1)
            txtAucDate.Text = currentDate.ToString("dd-MMM-yyyy")

            dt = IndBL.GetLotNumber()
            txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
        End If
        txtEntryTime.Text = TimePart
        currentDate = Convert.ToDateTime(txtEntryDate.Text)
        dt = IndBL.GetLotNumber()
        txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
        txtTotalQty.Font.Bold = True
        txtTotalQty.ReadOnly = True
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
    Sub clear()
        txtQuantity.Text = ""
        txtMinPrice.Text = ""
        txtGrade.Text = ""
        lblmsg.Text = ""
        msginfo.Text = ""
    End Sub
    Sub display()
        Dim dt As DataTable
        Ind.InDocID = 0
        Ind.CompanyName = ddlCompName.Text
        If txtAucDate.Text = "" Then
            Ind.AucDate = "01/01/1900"
        Else
            Ind.AucDate = txtAucDate.Text
        End If
        Ind.DCNo = txtDCNo.Text

        dt = IndBL.GetInDockDetails(Ind)
        If dt.Rows.Count <> 0 Then
            GVSupp.DataSource = dt
            GVSupp.DataBind()
            GVSupp.Visible = True
            GVSupp.Enabled = True
            Dim dt1 As DataTable
            dt1 = IndBL.GetLotNumber()
            txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
        Else
            lblmsg.Text = ValidationMessage(1014)
            msginfo.Text = ValidationMessage(1023)
            GVSupp.Visible = False
        End If
    End Sub
    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        LinkButton1.Focus()
        If btnView.Text <> "BACK" Then
            lblmsg.Text = ValidationMessage(1014)
            msginfo.Text = ValidationMessage(1014)
            ViewState("PageIndex") = 0
            GVSupp.PageIndex = 0
            display()
        Else
            lblmsg.Text = ValidationMessage(1014)
            msginfo.Text = ValidationMessage(1014)
            GVSupp.Enabled = True
            GVSupp.PageIndex = ViewState("PageIndex")
            clear()
            btnView.Text = "VIEW"
            btnAdd.Text = "ADD"
            display()
        End If
    End Sub
    Protected Sub GVSupp_PageIndexChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVSupp.PageIndexChanging
        GVSupp.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVSupp.PageIndex
        display()
        GVSupp.DataBind()
        GVSupp.Visible = True
    End Sub
    Protected Sub GVSupp_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVSupp.RowEditing
        lblmsg.Text = ValidationMessage(1014)
        msginfo.Text = ValidationMessage(1014)
        Dim id As Integer = CType(GVSupp.Rows(e.NewEditIndex).FindControl("Label1"), Label).Text
        Dim dt5 As DataTable
        dt5 = IndBL.GetAucStatusFlag(id)
        If dt5.Rows(0).Item("AuctionStatus").ToString = "Y" Then
            msginfo.Text = ValidationMessage(1096)
            Exit Sub
        End If

        txtLotNo.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1"), Label).Text
        txtDCNo.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l2"), Label).Text
        txtAucDate.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l10"), Label).Text
        txtEntryDate.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l11"), Label).Text
        txtEntryTime.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l12"), Label).Text
        txtQuantity.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l6"), Label).Text
        txtMinPrice.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l7"), Label).Text
       
        ddlCompName.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l55"), Label).Text
        ddlFlower.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l56"), Label).Text
        ViewState("IndockAutoId") = CType(GVSupp.Rows(e.NewEditIndex).FindControl("Label1"), Label).Text
        txtStemLength.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l5"), Label).Text
        ddlUnit.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l200"), Label).Text
        ddlPackaging.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l6001"), Label).Text
        txtGrade.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l61"), Label).Text

        Dim dt As DataTable
        Ind.InDocID = ViewState("IndockAutoId")
        Ind.CompanyName = ddlCompName.SelectedValue
        Ind.AucDate = txtAucDate.Text
        Ind.DCNo = txtDCNo.text

        dt = IndBL.GetInDockDetails(Ind)

        GVSupp.DataSource = dt
        GVSupp.DataBind()
        GVSupp.Visible = True
        GVSupp.Enabled = False
        btnView.Text = "BACK"
        btnAdd.Text = "UPDATE"
        btnView.Visible = True
    End Sub
    Protected Sub GVSupp_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVSupp.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Dim ID As Integer
            ID = CType(GVSupp.Rows(e.RowIndex).FindControl("Label1"), Label).Text
            IndBL.DeleteRecord(ID)
            lblmsg.Text = ValidationMessage(1028)
            display()
            GVSupp.PageIndex = ViewState("PageIndex")
            Dim dt As DataTable
            dt = IndBL.GetLotNumber()
            txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
        Else
            msginfo.Text = ValidationMessage(1029)
            lblmsg.Text = ValidationMessage(1014)
        End If

    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Try
                Dim MQty As Integer
                MQty = ViewState("MaxQuantity")
                If (txtQuantity.Text > MQty) Then
                    lblmsg.Text = ValidationMessage(1014)
                    msginfo.Text = ValidationMessage(1081)
                Else
                    Dim dt11 As DataTable
                    dt11 = IndBL.GetDateTime()
                    If ThisDate.ToString("MM/dd/yyyy") < dt11.Rows(0).Item("DateEntry").ToString() Then
                        lblmsg.Text = ""
                        msginfo.Text = "Please Correct System Date."
                        Exit Sub
                    End If
                    txtTotalQty.Text = CInt(txtTotalQty.Text) + CInt(txtQuantity.Text)
                    Ind.LotNo = txtLotNo.Text
                    If (txtDCNo.Text = Nothing) Then
                        Ind.DCNo = ""
                    Else
                        Ind.DCNo = txtDCNo.Text
                    End If

                    Ind.Packaging = ddlPackaging.SelectedValue
                    Ind.Grade = txtGrade.Text
                    Ind.CompanyName = ddlCompName.Text
                    Ind.AucDate = txtAucDate.Text
                    Ind.EntryDate = txtEntryDate.Text
                    Ind.EntryTime = txtEntryTime.Text
                    Ind.FlowerCode = ddlFlower.SelectedValue
                    Ind.Quantity = txtQuantity.Text
                    Ind.MinPrice = txtMinPrice.Text
                    Ind.StemLength = txtStemLength.Text
                    Ind.Unit = ddlUnit.SelectedValue

                    If btnAdd.Text = "UPDATE" Then
                        Ind.InDocID = ViewState("IndockAutoId")
                        IndBL.UpdateRecord(Ind)
                        btnAdd.Text = "ADD"
                        btnView.Text = "VIEW"
                        clear()
                        display()
                        Dim dt As DataTable
                        dt = IndBL.GetLotNumber()
                        txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
                        msginfo.Text = ValidationMessage(1014)
                        lblmsg.Text = ValidationMessage(1017)
                    ElseIf btnAdd.Text = "ADD" Then
                        IndBL.InsertRecord(Ind)
                        display()
                        clear()
                        msginfo.Text = ValidationMessage(1014)
                        lblmsg.Text = ValidationMessage(1020)
                        Dim dt As DataTable
                        dt = IndBL.GetLotNumber()
                        txtLotNo.Text = dt.Rows(0).Item("LotNumber").ToString()
                    End If
                End If
            Catch ex As Exception
                msginfo.Text = ValidationMessage(1022)
                lblmsg.Text = ValidationMessage(1014)
            End Try

        Else
            msginfo.Text = ValidationMessage(1021)
            lblmsg.Text = ValidationMessage(1014)
        End If
    End Sub

    Protected Sub ddlCompName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCompName.SelectedIndexChanged
        txtDCNo.Text = ""
        txtTotalQty.Text = 0
    End Sub

    Protected Sub btnRunSeq_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRunSeq.Click
        Dim AuctionDate, IndockDate As Date
        AuctionDate = txtAucDate.Text
        IndockDate = txtEntryDate.Text
        IndBL.RunSeq(AuctionDate, IndockDate)
        display()
        lblmsg.Text = "Random Sequence Allocated to Growers"
    End Sub
    Protected Sub btnSendSeq_Click(sender As Object, e As EventArgs) Handles btnSendSeq.Click
        Dim sepWin As String = ""
        sepWin = "frmSendRandomNumber.aspx?" & SeperateWindow.SepWindow()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "','mywin','toolbar=no,scrollbars=yes,location=no,resizable =yes,width=950,height=650,left=50,top=50')</script>", False)
    End Sub

    Private Sub btnClearSeq_Click(sender As Object, e As EventArgs) Handles btnClearSeq.Click
        Dim AuctionDate, IndockDate As Date
        AuctionDate = txtAucDate.Text
        IndockDate = txtEntryDate.Text
        IndBL.ClearSeq(AuctionDate, IndockDate)
        display()
        lblmsg.Text = "Random Sequence allocation cleared for the Auction Date."
    End Sub
End Class
