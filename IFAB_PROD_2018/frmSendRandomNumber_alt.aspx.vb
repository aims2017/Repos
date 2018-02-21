
'Imports System.Web.UI.WebControls
'Imports System.Web.UI
Imports System.Net.Mail
Imports System.Data.SqlClient

Partial Class frmAuctionLot
    Inherits BasePage
    Dim dt As DataTable
    Dim dt1, dt2 As DataTable
    Dim count, count1 As Integer
    Dim Gl As New Globals
    Dim GrowerType As String
    Dim Remarks As String
    Dim FromEmail As String
    Dim FromPassword As String
    'Dim SMSStr1 As String
    'Dim SMSStr2 As String
    'Dim SMSStr3 As String
    Dim EmailHost As String
    Dim EmailPort As String
    Dim EmailBody As String
    Dim SMSData As String
    Dim ToEmail As String
    Dim ToPhone As String
    Dim TimeforSMS As Integer
    Dim GrowerName As String
    Dim SuccessMsg As String = ""
    Dim IndBL As New InDockBL

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BtnClose.Attributes.Add("onclick", "self.close();")
            txtDate.Text = Today.ToString("dd-MMM-yyyy")
            DisplayGridView()
        End If
        '** Added by Vijay Pandey, 17-06-206; to send random sequence by mail
        '** This part picks the email and sms credentials from the COnfiguration Table
        dt2 = DLCommissionBillDetails.GetConfigEmail()
        Dim X As Integer = dt2.Rows.Count() - 1
        Dim str As String = " "
        For i As Integer = 0 To X
            'If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String1") Then
            '    SMSStr1 = dt2.Rows(i).Item("Config_Value").ToString()
            'End If
            'If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String2") Then
            '    SMSStr2 = dt2.Rows(i).Item("Config_Value").ToString()
            'End If
            'If (dt2.Rows(i).Item("Config_Name").ToString() = "SMS_String3") Then
            '    SMSStr3 = dt2.Rows(i).Item("Config_Value").ToString()
            'End If
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
        lblgreen.Text = ""

    End Sub

    Protected Sub BtnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnClose.Click
        Response.Write("<script language='javascript'> { self.close() }</script>")
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
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        Dim AuctionDate As DateTime
        If txtDate.Text = "" Then
            AuctionDate = "01/01/1900"
        Else
            AuctionDate = txtDate.Text
        End If
        'For Selected Date display Auction Lots
        DisplayGridView()
    End Sub
    Sub DisplayGridView()
        'If Not IsPostBack Then
        '    GrowerType = "ALL"
        'Else
        '    GrowerType = ddlGrowerType.SelectedItem.Text
        'End If
        Dim AuctionDate As Date
        If txtDate.Text = "" Then
            AuctionDate = Today()
        Else
            AuctionDate = txtDate.Text
        End If

        dt1 = DLAuctionLot.GetSequenceNumber(GrowerType, AuctionDate)
        If dt1.Rows.Count > 0 Then
            GVAuctionLot.DataSource = dt1
            GVAuctionLot.DataBind()
            GVAuctionLot.Visible = True
            GVAuctionLot.Enabled = True
            lblErrorMsg.Text = ""
            lblgreen.Text = ""
        Else
            lblErrorMsg.Text = "No Records to display."
            lblgreen.Text = ""
            GVAuctionLot.Visible = False
        End If
    End Sub

    Protected Sub GVAuctionLot_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVAuctionLot.Load
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "callFunctionsStartupScript", "grid();", True)
    End Sub
    Protected Sub BtnSendSeq_Click(sender As Object, e As EventArgs) Handles BtnSendSeq.Click
        'Get the random sequence of growers in Emailbody as text
        lblgreen.Text = "Sending Auction Sequence List. It may take few minutes. Please wait... "
        EmailBody = IndBL.GetGrowerSequence(txtDate.Text)

        'Get the list of growers scheduled for auction on the selected date & Send them the sequnece list by mail.
        dt = DLCommissionBillDetails.GetGrowerId(txtDate.Text)
        Dim X As Integer = dt.Rows.Count() - 1
        For i As Integer = 0 To X
            EmailSMS(dt.Rows(i).Item(0))
        Next
        lblgreen.Text = "Sending Auction Sequence List Completed. Sent to  " & dt.Rows.Count() & " Growers"
    End Sub
    Sub EmailSMS(ByVal GrowerId As Integer)
        Try

            GetGrowerEmail(GrowerId)
        Catch ex As Exception
            lblgreen.Text = ex.Message.ToString
            Exit Sub
        End Try

        Dim SendFrom As MailAddress = New MailAddress(FromEmail)
        Dim SendTo As MailAddress = New MailAddress(ToEmail)
        Dim MyMessage As MailMessage = New MailMessage(SendFrom, SendTo)

        'Get the email body message

        Try

            MyMessage.Subject = "Random Sequence Generated for Auction Date: " + CDate(txtDate.Text).ToLongDateString.ToString
            MyMessage.Body = "Dear Grower ," + Environment.NewLine + "Please find attached the Random Sequence List:" + Environment.NewLine + EmailBody

            Dim SmtpServer As New SmtpClient(EmailHost)
            SmtpServer.Port = EmailPort
            SmtpServer.Credentials = New System.Net.NetworkCredential(FromEmail, FromPassword)
            SmtpServer.EnableSsl = True
            Try
                SmtpServer.Send(MyMessage)
            Catch ex As Exception
                lblgreen.Text = ex.ToString
            End Try
            'End If
        Catch ex As Exception
            lblgreen.Text = ex.Message
        End Try

    End Sub
    Sub GetGrowerEmail(ByVal GrowerId As Integer)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Advant").ConnectionString)
        Dim reader As SqlDataReader
        Try
            Dim cmd As New SqlCommand("Select Email from suppliermaster where Supp_Id_Auto=" & GrowerId, con)
            con.Open()

            ' Execute Query    '
            reader = cmd.ExecuteReader()
            While reader.Read()
                ToEmail = reader(0).ToString
            End While
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            con.Close() 'Whether there is error or not. Close the connection.    '
        End Try
        'Return reader { note: reader is not valid after it is closed }          '
    End Sub

End Class
