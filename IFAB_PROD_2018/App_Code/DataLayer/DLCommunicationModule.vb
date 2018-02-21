Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLCommunicationModule
    Shared Function GetNameCombo(ByVal GroupID As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(2) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@GroupID", SqlDbType.Int)
            Parms(2).Value = GroupID
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "New_SelectNameCommunication", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            'MsgBox(ex.ToString)
            Return Nothing
        End Try
    End Function
    Shared Function InsertCommunication(ByVal el As ELCommunication) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowseffected As New Integer
        Try
            Dim Parms() As SqlParameter = New SqlParameter(8) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
            Parms(1).Value = HttpContext.Current.Session("EmpCode")

            Parms(2) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
            Parms(2).Value = HttpContext.Current.Session("UserCode")

            Parms(3) = New SqlParameter("@Date", SqlDbType.Date)
            Parms(3).Value = el.date1

            Parms(4) = New SqlParameter("@Message", SqlDbType.VarChar, 8000)
            Parms(4).Value = el.Message

            Parms(5) = New SqlParameter("@From", SqlDbType.VarChar, 150)
            Parms(5).Value = el.From

            Parms(6) = New SqlParameter("@Group", SqlDbType.VarChar)
            Parms(6).Value = el.GroupType

            Parms(7) = New SqlParameter("@ID", SqlDbType.VarChar)
            Parms(7).Value = el.ID

            Parms(8) = New SqlParameter("@Mode", SqlDbType.VarChar)
            Parms(8).Value = el.Mode


            rowseffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_SaveCommunicationModule", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowseffected
    End Function
    Public Function GetViewStatus() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim parms() As SqlParameter = New SqlParameter(2) {}
        parms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        parms(0).Value = HttpContext.Current.Session("Office")
        parms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        parms(1).Value = HttpContext.Current.Session("BranchCode")
        parms(2) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        parms(2).Value = HttpContext.Current.Session("UserCode")
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_CommunicationViewStatus", parms)
        Return ds.Tables(0)
    End Function
    Shared Function GetSMSTemplate() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_SMSTemplateDDL", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            'MsgBox(ex.ToString)
            Return Nothing
        End Try
    End Function
    Shared Function GetSMSMessage(ByVal Id As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(2) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@Id", SqlDbType.Int)
            Parms(2).Value = Id

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_SMSTemplateMessage", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            'MsgBox(ex.ToString)
            Return Nothing
        End Try
    End Function
End Class
