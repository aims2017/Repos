Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DLBiddersList
    Shared Function GetBiddersList() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetBiddersList", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateConfigStart() As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateConfigStart", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function UpdateConfigStop() As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateConfigStop", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function RemoveBidder(ByVal Id As Integer) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@Id", SqlDbType.Int)
        para(0).Value = Id

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_RemoveBidderFromList", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetStartStopStatus() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetStartStopStatus", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
End Class
