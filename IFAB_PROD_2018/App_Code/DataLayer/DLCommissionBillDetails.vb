Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Public Class DLCommissionBillDetails
    Shared Function GetCommissionBillDetails(ByVal GrowerId As Integer) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
        para(2).Value = GrowerId
        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetCommissionBillDetails", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GenerateCommissionBillDetails(ByVal GrowerId As Integer) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(4) {}

        para(0) = New SqlParameter("@GrowerId", SqlDbType.Int)
        para(0).Value = GrowerId

        para(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("BranchCode")

        para(2) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(2).Value = HttpContext.Current.Session("Office")

        para(3) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(3).Value = HttpContext.Current.Session("EmpCode")

        para(4) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(4).Value = HttpContext.Current.Session("UserCode")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_GenerateCommisionBillDetails", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetCommissionBillPayment(ByVal GrowerId As Integer, ByVal NotPaid As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(3) {}


        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
        para(2).Value = GrowerId

        para(3) = New SqlParameter("@NotPaid", SqlDbType.VarChar)
        para(3).Value = NotPaid

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetCommissionBillPayment", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateCommissionBillAmount(ByVal CommissionBillId As Integer, ByVal Amount As Double) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(5) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@CommissionBillId", SqlDbType.Int)
        para(2).Value = CommissionBillId

        para(3) = New SqlParameter("@Amount", SqlDbType.Money)
        para(3).Value = Amount

        para(4) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(4).Value = HttpContext.Current.Session("EmpCode")

        para(5) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(5).Value = HttpContext.Current.Session("UserCode")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateCommissionBillPayment", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function

    Shared Function GetConfigEmail() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}


        para(0) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("Office")

        para(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "ConfigEmail", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function GetGrowerId(ByVal AuctionDate As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("Office")

        para(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("BranchCode")

        para(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        para(2).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "GetGrowerIdEmail", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
End Class
