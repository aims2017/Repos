Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLCCMonthlyRun
    Public Function Clientcontractmonthlyrun(ByVal EL As ELCCMonthlyRun) As DataTable
        Dim con As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Dim para() As SqlParameter = New SqlParameter(5) {}
        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        para(0).Value = EL.BranchCode
        para(1) = New SqlParameter("@FromMonth", SqlDbType.Int)
        para(1).Value = EL.FromMonth
        para(2) = New SqlParameter("@FromYear", SqlDbType.Int)
        para(2).Value = EL.FromYear
        para(3) = New SqlParameter("@ToMonth", SqlDbType.Int)
        para(3).Value = EL.ToMonth
        para(4) = New SqlParameter("@ToYear", SqlDbType.Int)
        para(4).Value = EL.ToYear
        para(5) = New SqlParameter("@ClientID", SqlDbType.VarChar, 50)
        para(5).Value = EL.ClientID
        Try
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Proc_Clientcontractmonthlyrun", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Public Function GetClientcontractmonthlyrun(ByVal EL As ELCCMonthlyRun) As DataTable
        Dim con As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Dim para() As SqlParameter = New SqlParameter(5) {}
        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        para(0).Value = EL.BranchCode
        para(1) = New SqlParameter("@FromMonth", SqlDbType.Int)
        para(1).Value = EL.FromMonth
        para(2) = New SqlParameter("@FromYear", SqlDbType.Int)
        para(2).Value = EL.FromYear
        para(3) = New SqlParameter("@ToMonth", SqlDbType.Int)
        para(3).Value = EL.ToMonth
        para(4) = New SqlParameter("@ToYear", SqlDbType.Int)
        para(4).Value = EL.ToYear
        para(5) = New SqlParameter("@ClientID", SqlDbType.VarChar, 50)
        para(5).Value = EL.ClientID
        Try
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Proc_GetClientcontractmonthlyrun", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Public Function UpdateClientcontractmonthlyrun(ByVal EL As ELCCMonthlyRun, ByVal status As String) As Integer
        Dim con As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim para() As SqlParameter = New SqlParameter(1) {}
        para(0) = New SqlParameter("@ID", SqlDbType.Int)
        para(0).Value = EL.id
        para(1) = New SqlParameter("@Status", SqlDbType.VarChar, 2)
        para(1).Value = status
        Try
            ds = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Proc_UpdateClientcontractmonthlyrun", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds
    End Function
End Class
