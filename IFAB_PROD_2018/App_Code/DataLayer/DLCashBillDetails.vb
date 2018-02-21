Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DLCashBillDetails
    Shared Function GetCashBillDetails(ByVal BuyerId As Integer) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
        para(2).Value = BuyerId

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetCashBillDetails", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GenerateCashBillDetails(ByVal BuyerId As Integer) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(4) {}

        para(0) = New SqlParameter("@BuyerId", SqlDbType.Int)
        para(0).Value = BuyerId

        para(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("BranchCode")

        para(2) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(2).Value = HttpContext.Current.Session("Office")

        para(3) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(3).Value = HttpContext.Current.Session("EmpCode")

        para(4) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(4).Value = HttpContext.Current.Session("UserCode")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_GenerateCashBillDetails", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetCashBillPayment(ByVal BuyerId As Integer, ByVal NotPaid As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(3) {}


        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
        para(2).Value = BuyerId

        para(3) = New SqlParameter("@NotPaid", SqlDbType.VarChar)
        para(3).Value = NotPaid

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetCashBillPayment", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateCashBillAmount(ByVal CashBillId As Integer, ByVal Amount As Double) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(5) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@CashBillId", SqlDbType.Int)
        para(2).Value = CashBillId

        para(3) = New SqlParameter("@Amount", SqlDbType.Money)
        para(3).Value = Amount

        para(4) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(4).Value = HttpContext.Current.Session("EmpCode")

        para(5) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(5).Value = HttpContext.Current.Session("UserCode")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateCashBillPayment", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetpaymentView(ByVal Paydate As DateTime, ByVal BuyerId As Integer) As DataTable
        Dim connection As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Dim param() As SqlParameter = New SqlParameter(3) {}
        param(0) = New SqlParameter("@office", SqlDbType.VarChar)
        param(0).Value = HttpContext.Current.Session("office")
        param(1) = New SqlParameter("@Branchcode", SqlDbType.VarChar)
        param(1).Value = HttpContext.Current.Session("BranchCode")
        param(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
        param(2).Value = BuyerId
        param(3) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        param(3).Value = Paydate
        Try
            ds = SqlHelper.ExecuteDataset(connection, CommandType.StoredProcedure, "Proc_GetPaymentDetailsforCashier", param)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetCashierView(ByVal BuyerId As Integer, ByVal AucDate As DateTime) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(3) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
        para(2).Value = BuyerId
        para(3) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        para(3).Value = AucDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetCashBillDetailsforCashier", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetTotalpayment(ByVal Paydate As DateTime, ByVal BuyerId As Integer) As DataTable
        Dim connection As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Dim param() As SqlParameter = New SqlParameter(3) {}
        param(0) = New SqlParameter("@office", SqlDbType.VarChar)
        param(0).Value = HttpContext.Current.Session("office")
        param(1) = New SqlParameter("@Branchcode", SqlDbType.VarChar)
        param(1).Value = HttpContext.Current.Session("BranchCode")
        param(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
        param(2).Value = BuyerId
        param(3) = New SqlParameter("@Date", SqlDbType.DateTime)
        param(3).Value = Paydate
        Try
            ds = SqlHelper.ExecuteDataset(connection, CommandType.StoredProcedure, "Proc_GetTotalPayment", param)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
End Class
