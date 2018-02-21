
Partial Class frmOnlinePaymentScreen
    Inherits System.Web.UI.Page
    Private objReqMsgDTO As com.awl.MerchantToolKit.ReqMsgDTO
    'Dim sda, sda1, sda2, sda5 As New OleDbDataAdapter()
    'Dim sdt, sdt1, sdt2, sdt5 As New DataTable()
    'Dim alt As String
    Dim objBusErrMesg As New busErrorMessage
    Dim Dm As New BLInvoice
    Dim Inv_Object As New Invoice
    Dim Department As New Department
    Dim dt As New DataTable
    Protected Sub btn_viewpay_Click(sender As Object, e As EventArgs) Handles btn_viewpay.Click

        If btn_viewpay.Text <> "BACK" Then
            lblmsgifo.Text = ValidationMessage(1014)
            lblerrmsg.Text = ValidationMessage(1014)
            ViewState("PageIndex") = 0
            GVFlower.PageIndex = 0
            DisplayGrid()
            GVFlower.Visible = True

        Else
            lblmsgifo.Text = ValidationMessage(1014)
            lblerrmsg.Text = ValidationMessage(1014)
            'btn_viewpay.Text = "VIEW"
            'btn_payment.Text = "ADD"
            GVFlower.Visible = True
            GVFlower.PageIndex = ViewState("PageIndex")
            DisplayGrid()
        End If
    End Sub
    Sub DisplayGrid()
        Dim dt As New DataTable
        'Department.Id = 0
        dt = Dm.BLDispGrid()
        GVFlower.DataSource = dt
        GVFlower.DataBind()
        GVFlower.Visible = True
        GVFlower.Enabled = True
        lbl_txt.Visible = True
        lblmsgifo.Visible = False
        lblerrmsg.Visible = False
        If dt.Rows.Count = 0 Then
            lblerrmsg.Text = ValidationMessage(1014)
            lblmsgifo.Text = ValidationMessage(1023)
        End If
    End Sub
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dt = Dm.BLGetKEy()
        Session("EncryptKey") = dt.Rows(0)("EncryptKey").ToString
        Session("Merchantid") = dt.Rows(0)("Merchantid").ToString
        txt_buyerid.Text = Session("BuyerName")
        txt_Auctiondate.Text = Today.ToString("dd-MMM-yyyy")
        lbl_txt.Visible = False

    End Sub

    Protected Sub btn_payment_Click(sender As Object, e As EventArgs) Handles btn_payment.Click
        Try
            objReqMsgDTO = New com.awl.MerchantToolKit.ReqMsgDTO()
            objReqMsgDTO.OrderId = txtOrderId.Text
            'objReqMsgDTO.Mid = Session("Merchantid")
            'objReqMsgDTO.Enckey = Session("EncryptKey")
            'production key
            objReqMsgDTO.Mid = "WL0000000006971"
            objReqMsgDTO.Enckey = "ca80f5570517c2dd18263fa7b8a4657f"

            'demo key
            'objReqMsgDTO.Mid = "WL0000000027698"
            'objReqMsgDTO.Enckey = "6375b97b954b37f956966977e5753ee6"
            objReqMsgDTO.MeTransReqType = "S"
            If txt_Amount.Text = "" Then
                lblerrmsg.Text = "Please Fill The Amount To Be Paid "
            Else
                objReqMsgDTO.TrnAmt = Convert.ToDouble((txt_Amount.Text * 100))
                Session("Amount_Paid") = Convert.ToDouble(objReqMsgDTO.TrnAmt)

            End If

            objReqMsgDTO.RecurrPeriod = ""
            objReqMsgDTO.RecurrDay = ""
            'objReqMsgDTO.ResponseUrl = "http://localhost:49230/meTrnSuccess.aspx"
            objReqMsgDTO.ResponseUrl = "http://ifabbengaluru.com/meTrnSuccess.aspx"
            'objReqMsgDTO.ResponseUrl = "http://localhost:54991/meTrnSuccess.aspx"
            objReqMsgDTO.TrnRemarks = "Buyer Payments at IFAB"
            objReqMsgDTO.TrnCurrency = "INR"
            objReqMsgDTO.AddField1 = ""
            objReqMsgDTO.AddField2 = ""
            objReqMsgDTO.AddField3 = ""
            objReqMsgDTO.AddField4 = ""
            objReqMsgDTO.AddField5 = ""
            objReqMsgDTO.AddField6 = ""
            objReqMsgDTO.AddField7 = ""
            objReqMsgDTO.AddField8 = ""
            Dim Message As String
            Dim objawlmerchantkit As com.awl.MerchantToolKit.AWLMEAPI = New com.awl.MerchantToolKit.AWLMEAPI()
            objawlmerchantkit.generateTrnReqMsg(objReqMsgDTO)
            Message = objReqMsgDTO.ReqMsg
            Session("Message") = Message
            Session("MID") = objReqMsgDTO.Mid
            txt_buyerid.Text = Session("Buyerid")


            If txt_invamount.Text = "" Then
                Session("Invoice_Amount") = "0"
            Else
                Session("Invoice_Amount") = Convert.ToDouble(txt_invamount.Text)
            End If
            If txt_invoiceno.Text = "" Then
                Inv_Object.Invoice_NO = "0"
            Else
                Inv_Object.Invoice_NO = (txt_invoiceno.Text)

            End If

            Session("Amount_Paid") = Convert.ToDouble(objReqMsgDTO.TrnAmt)
            Session("Invoice_NO") = Inv_Object.Invoice_NO
            Session("AuctionDate") = txt_Auctiondate.Text
            lbl_txt.Visible = False
            'Dim QS As String
            'QS = Request.QueryString.Get("QS")
            Dim qrystring As String = "meTrnPay.aspx"
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=700,height=500,left=40,top=20')</script>", False)
            'Response.Redirect("meTrnPay.aspx", False)
        Catch ex As Exception
            'ClsLogging.writefileE("Error:" & ex.Message, ClsLogging.LogType.Worldline)
            'ClsLogging.writefileE("Trace:" & ex.StackTrace, ClsLogging.LogType.Worldline)
            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "There Was Some Error Processing.....Please Check The Data you have Entered"
        End Try
        'If (Session("BranchCode") = Session("ParentBranch")) Then


        '    'If btn_payment.Text = "UPDATE" Then
        '    '    If dt.Rows.Count > 0 Then
        '    '        lblmsgifo.Text = ValidationMessage(1014)
        '    '        lblerrmsg.Text = ValidationMessage(1030)
        '    '    Else
        '    '        SB.UpdateRecord(SE)
        '    '        GVSupp.Visible = True
        '    '        btnAdd.Text = "ADD"
        '    '        btnView.Text = "VIEW"
        '    '        clear()
        '    '        ViewState("ImageTime") = ""
        '    '        msginfo.Text = ValidationMessage(1014)
        '    '        GVSupp.PageIndex = ViewState("PageIndex")
        '    '        display()
        '    '        lblmsg.Text = ValidationMessage(1017)
        '    '        'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
        '    '        display()
        '    '    End If
        '    If btn_payment.Text = "MAKE PAYMENT" Then

        '        Dm.Insert(C)
        '        btn_payment.Text = "ADD"
        '        DisplayGrid()
        '        'clear()
        '        ViewState("ImageTime") = ""
        '        lblmsgifo.Text = ValidationMessage(1014)
        '        ViewState("PageIndex") = 0
        '        GVFlower.PageIndex = 0
        '        lblmsgifo.Text = ValidationMessage(1020)
        '        'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
        '    End If
        'Else
        '    lblmsgifo.Text = ValidationMessage(1021)
        '    lblerrmsg.Text = ValidationMessage(1014)
        'End If
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
End Class
