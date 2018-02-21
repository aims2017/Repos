Imports Microsoft.VisualBasic
Imports System.Data.SqlClient


Public Class DLRpt_AuctionCatlogReport
    Shared Function GetAuctionCatalog(ByVal Growerid As Integer, ByVal StartDate As DateTime) As System.Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlClient.SqlParameter = New SqlClient.SqlParameter(3) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        para(0).Value = HttpContext.Current.Session("BranchCode")
        para(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        para(1).Value = HttpContext.Current.Session("Office")
        para(2) = New SqlParameter("@Growerid", SqlDbType.Int)
        para(2).Value = Growerid
        para(3) = New SqlParameter("@StartDate ", SqlDbType.DateTime)
        para(3).Value = StartDate

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "IFAB_AuctionCatalogReport", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Public Function GetDDlGrowerName() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetGrowerNameDDLReport", arParms)
        Return ds.Tables(0)
    End Function
End Class

