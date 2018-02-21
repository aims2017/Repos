Imports Microsoft.Reporting.WebForms
Imports System.IO
Imports System.Net.Mail
Imports System.Net

Partial Class Ifab_RptCommissionBill
    Inherits BasePage
    Dim obj As New SelfDetailsB
    Dim dt2, dt, dt3 As New DataTable
    Dim FromEmail As String
    Dim FromPassword As String
    Dim SMSStr1 As String
    Dim SMSStr2 As String
    Dim SMSStr3 As String
    Dim EmailHost As String
    Dim EmailPort As String
    Dim EmailBody As String
    Dim SMSData As String
    Dim ToEmail As String
    Dim ToPhone As String
    Dim TimeforSMS As Integer
    Dim GrowerName As String
    Dim SuccessMsg As String = ""

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        msginfo.Text = ValidationMessage(1014)
        Dim QS As String
        Dim GrowerID As Integer
        Dim todate As Date
        Try
            GrowerID = ddlGrowerid.SelectedValue
            todate = txttodate.Text
            QS = Request.QueryString.Get("QS")
            Dim qrystring As String = "Ifab_RptCommissionBillV.aspx?" & QueryStr.Querystring() & "&todate=" & todate & "&GrowerID=" & GrowerID
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
        Catch ex As Exception
            msginfo.Text = ValidationMessage(1022)
        End Try

    End Sub
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txttodate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy")
            ChkMail.Checked = True
            ChkSMS.Checked = True
        End If
        dt2 = DLCommissionBillDetails.GetConfigEmail()
        Dim X As Integer = dt2.Rows.Count() - 1
        Dim str As String = " "
        For i As Integer = 0 To X
            If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String1") Then
                SMSStr1 = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String2") Then
                SMSStr2 = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String3") Then
                SMSStr3 = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "Email Host") Then
                EmailHost = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "Email Port") Then
                EmailPort = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "Email User Name") Then
                FromEmail = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "Email Password") Then
                FromPassword = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "Email Body") Then
                EmailBody = dt2.Rows(i).Item("Config_Value").ToString()
            End If
            If (dt2.Rows(i).Item("Config_Name").ToString() = "TimeforSMS") Then
                TimeforSMS = CInt(dt2.Rows(i).Item("Config_Value").ToString())
            End If
        Next
        msginfo.Text = ""
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Report.aspx")
    End Sub
    <System.Web.Services.WebMethod()> _
    Public Shared Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()

    End Sub
    Public Function ValidationMessage(ByVal ErrorCode As Integer) As String
        Dim dt2 As DataTable
        'Dim Message As String
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

    Protected Sub btnEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmail.Click
        If (ddlGrowerid.SelectedValue <> 0) Then
            EmailSMS(ddlGrowerid.SelectedValue)
        Else
            dt = DLCommissionBillDetails.GetGrowerId(txttodate.Text)
            Dim X As Integer = dt.Rows.Count() - 1
            For i As Integer = 0 To X
                EmailSMS(dt.Rows(i).Item(0))
                msginfo.Text = "Sending sms/ email " + dt.Rows(i).Item(0).ToString
            Next
        End If
    End Sub

    Sub SubreportProcessingEvent(ByVal sender As Object, ByVal e As Microsoft.Reporting.WebForms.SubreportProcessingEventArgs)
        Dim rptDataSource As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Proc_RPT_GetSelfDetailByUID", dt2)
        e.DataSources.Add(rptDataSource)
        Dim rptDataSource1 As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt3)
        e.DataSources.Add(rptDataSource1)
    End Sub

    Sub EmailSMS(ByVal GrowerId As Integer)
        Try
            dt2 = DLAuctionLot.SendSMSMailGrower(GrowerId, txttodate.Text)
            SMSData = dt2.Rows(0).Item(0).ToString()
            ToPhone = dt2.Rows(0).Item(1).ToString()
            ToEmail = dt2.Rows(0).Item(2).ToString()
            GrowerName = dt2.Rows(0).Item(3).ToString()
        Catch ex As Exception
        End Try

        Dim myReport As New LocalReport()
        Dim DL As New DLBuyerDetails
        Dim dt1 As New DataTable
        Dim ds As New DataSet()
        Dim dt, dr2 As New Microsoft.Reporting.WebForms.ReportDataSource
        If (ChkSMS.Checked = True) Then
            ''SMS
            Try
                Dim sURL As String
                Dim objReader As StreamReader
                sURL = SMSStr1 + ToPhone + SMSStr2 + SMSData + SMSStr3
                Dim sResponse As HttpWebRequest
                sResponse = HttpWebRequest.Create(sURL)
                Dim objStream As Stream
                objStream = sResponse.GetResponse.GetResponseStream()
                objReader = New StreamReader(objStream)
                objReader.Close()
                objStream.Close()
                objReader.Dispose()
                objStream.Dispose()
                'msginfo.Text = "SMS Send Sucessfully"
            Catch ex As Exception
                msginfo.Text = ex.ToString
            End Try
        End If
        Try
            If (ChkMail.Checked = True) Then
                ''Mail 
                dt1 = DL.RptGetCommissionBillDraftDate(GrowerId, "0000", txttodate.Text)
                dt3 = DLUnsoldFlower.GetUnsoldFlowerDetails(GrowerId, txttodate.Text, txttodate.Text)
                myReport.ReportPath = "Ifab_RptCommissionBillDraft.rdlc"
                dt = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_CommisionBillReportDraft", dt1)
                dr2 = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt3)
                myReport.DataSources.Clear()
                myReport.DataSources.Add(dt)
                myReport.DataSources.Add(dr2)

                ' dt2 = obj.RPT_GetSelfDeatilsByBranch(Request.QueryString(1))
                AddHandler myReport.SubreportProcessing, AddressOf SubreportProcessingEvent

                Dim deviceInfo As String = "<deviceinfo>" + "  <outputformat>PDF</outputformat>" + "  <pagewidth>8.5in</pagewidth>" + "  <pageheight>11in</pageheight>" + "  <margintop>0.5in</margintop>" + "  <marginleft>0.75in</marginleft>" + "  <marginright>0.5in</marginright>" + "  <marginbottom>0.5in</marginbottom>" + "</deviceinfo>"
                Dim warnings As Warning()
                Dim streamIds As String()
                Dim mimeType As String = String.Empty
                Dim encoding As String = String.Empty
                Dim extension As String = String.Empty
                Dim Sample As String = "Sample"
                Dim bytes As Byte() = myReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)
                Dim s As MemoryStream = New MemoryStream(bytes)
                s.Seek(0, SeekOrigin.Begin)


                Dim SendFrom As MailAddress = New MailAddress(FromEmail)
                Dim SendTo As MailAddress = New MailAddress(ToEmail)

                Dim MyMessage As MailMessage = New MailMessage(SendFrom, SendTo)

                MyMessage.Subject = "Commission Bill On " + CDate(txttodate.Text).ToLongDateString.ToString
                MyMessage.Body = "Dear Grower ," + Environment.NewLine + Environment.NewLine + EmailBody

                Dim attachFile As New Attachment(s, "CommissionBill.pdf")
                MyMessage.Attachments.Add(attachFile)

                Dim SmtpServer As New SmtpClient(EmailHost)

                SmtpServer.Port = EmailPort
                SmtpServer.Credentials = New System.Net.NetworkCredential(FromEmail, FromPassword)
                SmtpServer.EnableSsl = True
                Try
                    SmtpServer.Send(MyMessage)
                Catch ex As Exception
                    SuccessMsg = SuccessMsg + ex.ToString + GrowerName + "<br/>"
                    msginfo.Text = SuccessMsg
                End Try
            End If
        Catch ex As Exception
            SuccessMsg = SuccessMsg + ex.ToString + GrowerName + "<br/>"
            msginfo.Text = SuccessMsg
        End Try

        If (ChkMail.Checked = True Or ChkSMS.Checked = True) Then
            SuccessMsg = SuccessMsg + "Sent Successfully to " + GrowerName + "<br/>"
            msginfo.Text = SuccessMsg
        End If
    End Sub

    Protected Sub BtnAuto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAuto.Click
        'Turn on the timer
        Timer1.Enabled = True
        'Set the interval for each timer "tick"
        Timer1.Interval = (TimeforSMS * 60000)
        msginfo.Text = "Email and SMS will be send Automatically at every " + TimeforSMS.ToString + " minutes.<br/> Please keep this form open for Auto Sending."
    End Sub

    ''Actions to perform on each timer tick:
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        dt = DLAuctionLot.GetBidderId()
        If dt.Rows(0).Item(0) IsNot DBNull.Value Then
            If (dt.Rows(0).Item(0) <> 0) Then
                AutoEmailSMS(CInt(dt.Rows(0).Item(0)))
            End If
        End If
    End Sub

    Sub AutoEmailSMS(ByVal GrowerId As Integer)
        Try
            dt2 = DLAuctionLot.SendSMSMailGrower(GrowerId, Today.Date)
            SMSData = dt2.Rows(0).Item(0).ToString()
            ToPhone = dt2.Rows(0).Item(1).ToString()
            ToEmail = dt2.Rows(0).Item(2).ToString()
            GrowerName = dt2.Rows(0).Item(3).ToString()
        Catch ex As Exception
        End Try

        Dim myReport As New LocalReport()
        Dim DL As New DLBuyerDetails
        Dim dt1 As New DataTable
        Dim ds As New DataSet()
        Dim dt, dr2 As New Microsoft.Reporting.WebForms.ReportDataSource
        ''SMS
        Try
            Dim sURL As String
            Dim objReader As StreamReader
            sURL = SMSStr1 + ToPhone + SMSStr2 + SMSData + SMSStr3
            Dim sResponse As HttpWebRequest
            sResponse = HttpWebRequest.Create(sURL)
            Dim objStream As Stream
            objStream = sResponse.GetResponse.GetResponseStream()
            objReader = New StreamReader(objStream)
            objReader.Close()
            objStream.Close()
            objReader.Dispose()
            objStream.Dispose()
            'msginfo.Text = "SMS Send Sucessfully"
        Catch ex As Exception
            msginfo.Text = ex.ToString
        End Try
        Try
            ''Mail 
            dt1 = DL.RptGetCommissionBillDraftDate(GrowerId, "0000", Today.Date)
            dt3 = DLUnsoldFlower.GetUnsoldFlowerDetails(GrowerId, Date.Today, Date.Today)
            myReport.ReportPath = "Ifab_RptCommissionBillDraft.rdlc"
            dt = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_CommisionBillReportDraft", dt1)
            dr2 = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt3)
            myReport.DataSources.Clear()
            myReport.DataSources.Add(dt)
            myReport.DataSources.Add(dr2)

            dt2 = obj.RPT_GetSelfDeatilsByBranch(Request.QueryString(1))
            AddHandler myReport.SubreportProcessing, AddressOf SubreportProcessingEvent

            Dim deviceInfo As String = "<deviceinfo>" + "  <outputformat>PDF</outputformat>" + "  <pagewidth>8.5in</pagewidth>" + "  <pageheight>11in</pageheight>" + "  <margintop>0.5in</margintop>" + "  <marginleft>0.75in</marginleft>" + "  <marginright>0.5in</marginright>" + "  <marginbottom>0.5in</marginbottom>" + "</deviceinfo>"
            Dim warnings As Warning()
            Dim streamIds As String()
            Dim mimeType As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty
            Dim Sample As String = "Sample"
            Dim bytes As Byte() = myReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)
            Dim s As MemoryStream = New MemoryStream(bytes)
            s.Seek(0, SeekOrigin.Begin)


            Dim SendFrom As MailAddress = New MailAddress(FromEmail)
            Dim SendTo As MailAddress = New MailAddress(ToEmail)

            Dim MyMessage As MailMessage = New MailMessage(SendFrom, SendTo)

            MyMessage.Subject = "Commission Bill On " + CDate(Today.Date).ToLongDateString.ToString
            MyMessage.Body = "Dear Grower ," + Environment.NewLine + Environment.NewLine + EmailBody

            Dim attachFile As New Attachment(s, "CommissionBill.pdf")
            MyMessage.Attachments.Add(attachFile)

            Dim SmtpServer As New SmtpClient(EmailHost)

            SmtpServer.Port = EmailPort
            SmtpServer.Credentials = New System.Net.NetworkCredential(FromEmail, FromPassword)
            SmtpServer.EnableSsl = True
            Try
                SmtpServer.Send(MyMessage)
            Catch ex As Exception
                SuccessMsg = SuccessMsg + ex.ToString + GrowerName + "<br/>"
                msginfo.Text = SuccessMsg
            End Try
        Catch ex As Exception
            SuccessMsg = SuccessMsg + ex.ToString + GrowerName + "<br/>"
            msginfo.Text = SuccessMsg
        End Try
        If (ChkMail.Checked = True Or ChkSMS.Checked = True) Then
            SuccessMsg = SuccessMsg + "Sent Successfully to " + GrowerName + "<br/>"
            msginfo.Text = SuccessMsg
        End If
    End Sub

    Protected Sub btnStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStatus.Click
        Dim GrowerId As Integer
        Dim AuctionDate As Date
        Dim Name As String = ""
        GrowerId = ddlGrowerid.SelectedValue
        AuctionDate = txttodate.Text
        dt = DLAuctionLot.StatusMail(GrowerId, AuctionDate)
        Dim X As Integer = dt.Rows.Count() - 1

        If dt.Rows.Count > 0 Then
            Name = "Mail/SMS send Successfully to :" + "<br/>"
            For i As Integer = 0 To X
                Name = Name + dt.Rows(i).Item("Supp_Name").ToString + "<br/>"
            Next
        Else
            Name = "No records to display."

        End If
        msginfo.Text = Name
    End Sub
   
End Class
