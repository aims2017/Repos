Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class DLClientContractMaster

    Shared Function InsertRecord(ByVal ClientContract As ClientCotract) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(17) {}

        arParms(0) = New SqlParameter("@MyCo_Code", SqlDbType.VarChar, 100)
        arParms(0).Value = ClientContract.MyCo_Code

        arParms(1) = New SqlParameter("@Branch_Code", SqlDbType.VarChar, 100)
        arParms(1).Value = ClientContract.Branch_Code

        arParms(2) = New SqlParameter("@BillType", SqlDbType.VarChar)
        arParms(2).Value = ClientContract.BillType

        arParms(3) = New SqlParameter("@PerStudent", SqlDbType.Money)
        arParms(3).Value = ClientContract.PerStudent

        arParms(4) = New SqlParameter("@SetupCharge", SqlDbType.Money)
        arParms(4).Value = ClientContract.SetupChrge


        If ClientContract.StartDate = CDate("1/1/1900") Then
            arParms(5) = New SqlParameter("@StartDate", SqlDbType.DateTime)
            arParms(5).Value = DBNull.Value
        Else
            arParms(5) = New SqlParameter("@StartDate", SqlDbType.DateTime)
            arParms(5).Value = ClientContract.StartDate
        End If

        If ClientContract.ExpiryDate = CDate("1/1/1900") Then
            arParms(6) = New SqlParameter("@ExpiryDate", SqlDbType.DateTime)
            arParms(6).Value = DBNull.Value
        Else
            arParms(6) = New SqlParameter("@ExpiryDate", SqlDbType.DateTime)
            arParms(6).Value = ClientContract.ExpiryDate
        End If

        arParms(7) = New SqlParameter("@OtherCharges", SqlDbType.Money)
        arParms(7).Value = ClientContract.OtherCharges

        arParms(8) = New SqlParameter("@Advance", SqlDbType.Money)
        arParms(8).Value = ClientContract.Advance

        arParms(9) = New SqlParameter("@Adjusted", SqlDbType.Money)
        arParms(9).Value = ClientContract.Adjusted

        arParms(10) = New SqlParameter("@Balance", SqlDbType.Money)
        arParms(10).Value = ClientContract.Balance

        arParms(11) = New SqlParameter("@SmsCharge", SqlDbType.Money)
        arParms(11).Value = ClientContract.SmsChrge

        arParms(12) = New SqlParameter("@EmailCharge", SqlDbType.Money)
        arParms(12).Value = ClientContract.EmailChrge

        arParms(13) = New SqlParameter("@StdCount", SqlDbType.Int)
        arParms(13).Value = ClientContract.StdCount

        arParms(14) = New SqlParameter("@Discount", SqlDbType.Float)
        arParms(14).Value = ClientContract.Discount

        arParms(15) = New SqlParameter("@OpenStatus", SqlDbType.Int)
        arParms(15).Value = ClientContract.OpenStatus

        arParms(16) = New SqlParameter("@SmsCount", SqlDbType.Int)
        arParms(16).Value = ClientContract.SmsCount

        arParms(17) = New SqlParameter("@EmailCount", SqlDbType.Int)
        arParms(17).Value = ClientContract.EmailCount



        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_SaveClientContract", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function

    Shared Function UpdateRecord(ByVal ClientContract As ClientCotract) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(18) {}

        arParms(0) = New SqlParameter("@MyCo_Code", SqlDbType.VarChar, 100)
        arParms(0).Value = ClientContract.MyCo_Code

        arParms(1) = New SqlParameter("@Branch_Code", SqlDbType.VarChar, 100)
        arParms(1).Value = ClientContract.Branch_Code

        arParms(2) = New SqlParameter("@BillType", SqlDbType.VarChar)
        arParms(2).Value = ClientContract.BillType

        arParms(3) = New SqlParameter("@PerStudent", SqlDbType.Money)
        arParms(3).Value = ClientContract.PerStudent

        arParms(4) = New SqlParameter("@SetupCharge", SqlDbType.Money)
        arParms(4).Value = ClientContract.SetupChrge

        If ClientContract.StartDate = CDate("1/1/1900") Then
            arParms(5) = New SqlParameter("@StartDate", SqlDbType.DateTime)
            arParms(5).Value = DBNull.Value
        Else
            arParms(5) = New SqlParameter("@StartDate", SqlDbType.DateTime)
            arParms(5).Value = ClientContract.StartDate
        End If

        If ClientContract.ExpiryDate = CDate("1/1/1900") Then
            arParms(6) = New SqlParameter("@ExpiryDate", SqlDbType.DateTime)
            arParms(6).Value = DBNull.Value
        Else
            arParms(6) = New SqlParameter("@ExpiryDate", SqlDbType.DateTime)
            arParms(6).Value = ClientContract.ExpiryDate
        End If

        arParms(7) = New SqlParameter("@id", SqlDbType.Int)
        arParms(7).Value = ClientContract.PKID

        arParms(8) = New SqlParameter("@OtherCharges", SqlDbType.Money)
        arParms(8).Value = ClientContract.OtherCharges

        arParms(9) = New SqlParameter("@Advance", SqlDbType.Money)
        arParms(9).Value = ClientContract.Advance

        arParms(10) = New SqlParameter("@Adjusted", SqlDbType.Money)
        arParms(10).Value = ClientContract.Adjusted

        arParms(11) = New SqlParameter("@Balance", SqlDbType.Money)
        arParms(11).Value = ClientContract.Balance

        arParms(12) = New SqlParameter("@SmsCharge", SqlDbType.Money)
        arParms(12).Value = ClientContract.SmsChrge

        arParms(13) = New SqlParameter("@EmailCharge", SqlDbType.Money)
        arParms(13).Value = ClientContract.EmailChrge

        arParms(14) = New SqlParameter("@StdCount", SqlDbType.Int)
        arParms(14).Value = ClientContract.StdCount

        arParms(15) = New SqlParameter("@Discount", SqlDbType.Float)
        arParms(15).Value = ClientContract.Discount

        arParms(16) = New SqlParameter("@EmailCount", SqlDbType.Int)
        arParms(16).Value = ClientContract.EmailCount

        arParms(17) = New SqlParameter("@OpenStatus", SqlDbType.Int)
        arParms(17).Value = ClientContract.OpenStatus

        arParms(18) = New SqlParameter("@SmsCount", SqlDbType.Int)
        arParms(18).Value = ClientContract.SmsCount

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_UpdateClientContract", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function

    Shared Function GetClientContract(ByVal ClientContract As ClientCotract) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@MyCo_Code", SqlDbType.VarChar, 50)
        arParms(0).Value = ClientContract.MyCo_Code

        arParms(1) = New SqlParameter("@id", SqlDbType.Int)
        arParms(1).Value = ClientContract.PKID

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetClientContract", arParms)
        Return ds.Tables(0)
    End Function
    Shared Function GetExpiryDate(ByVal ClientContract As ClientCotract) As String
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}
        Dim rowseffected As String

        arParms(0) = New SqlParameter("@MycoCode", SqlDbType.VarChar, 50)
        arParms(0).Value = ClientContract.MyCo_Code

        rowseffected = SqlHelper.ExecuteScalar(connectionString, CommandType.StoredProcedure, "Proc_GetExpiryDateFromSelfDetails", arParms)
        Return rowseffected
    End Function
    Shared Function ChangeFlag(ByVal id As Integer) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim arParms As SqlParameter = New SqlParameter
        arParms = New SqlParameter("@id", SqlDbType.Int)
        arParms.Value = id
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteClientContract", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    'Code For Fill Client Combo By Nitin 12/06/2012
    Shared Function GetClientCombo() As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Ds As New DataSet

        Try
            Ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetClientName")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Ds.Tables(0)
    End Function

    'Code For Fill Branch Combo By Nitin 12/06/2012
    Shared Function GetBranchCombo(ByVal Mycode As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Ds As New DataSet

        Dim arParms As SqlParameter = New SqlParameter
        arParms = New SqlParameter("@MyCo_Code", SqlDbType.VarChar)
        arParms.Value = Mycode
        Try
            Ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetBranchName", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Ds.Tables(0)
    End Function
    'Code For Fill Bill Type Combo By Nitin 12/06/2012
    Shared Function GetBillTypeCombo() As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Ds As New DataSet

        Try
            Ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetBillType")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Ds.Tables(0)
    End Function


    'Code For Lock Status By Nitin 12/06/2012
    Shared Function LOckStatus(ByVal ClientContract As ClientCotract) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim arParms As SqlParameter = New SqlParameter
        arParms = New SqlParameter("@id", SqlDbType.Int)
        arParms.Value = ClientContract.PKID
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_LockClientContract", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function

    'Code For UnLock Status By Nitin 12/06/2012
    Shared Function UnLOckStatus(ByVal ClientContract As ClientCotract) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim arParms As SqlParameter = New SqlParameter
        arParms = New SqlParameter("@id", SqlDbType.Int)
        arParms.Value = ClientContract.PKID
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_UnLockClientContract", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function

    'Code For  Client Report By Nitin 12/06/2012
    Shared Function RptGetClientContract(ByVal MyCo_Code As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(0) {}
        para(0) = New SqlParameter("@MyCo_Code", SqlDbType.VarChar, 5)
        para(0).Value = MyCo_Code
        Try
            Ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_GetClientContract", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Ds.Tables(0)
    End Function

    'code for sale invoice report by Nakul Bharadwaj 3/08/2012
    Public Function GetSaleInvoice(ByVal Branch_Code As String, ByVal SetUp As String, ByVal ID As Integer, ByVal Fromdate As Integer, ByVal ToDate As Integer, ByVal Yearfrom As Integer, ByVal Yearto As Integer, ByVal InvoiceNo As String, ByVal SetUpFlag As String, ByVal Invdate As Date) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(9) {}

            arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(0).Value = Branch_Code
            arParms(1) = New SqlParameter("@SetupCost", SqlDbType.Real)
            arParms(1).Value = SetUp
            arParms(2) = New SqlParameter("@ID", SqlDbType.Int)
            arParms(2).Value = ID
            arParms(3) = New SqlParameter("@Fromdate", SqlDbType.VarChar, 20)
            arParms(3).Value = Fromdate
            arParms(4) = New SqlParameter("@ToDate", SqlDbType.VarChar, 20)
            arParms(4).Value = ToDate
            arParms(5) = New SqlParameter("@Yearfrom", SqlDbType.VarChar, 20)
            arParms(5).Value = Yearfrom
            arParms(6) = New SqlParameter("@YearTo", SqlDbType.VarChar, 20)
            arParms(6).Value = Yearto
            arParms(7) = New SqlParameter("@InvoiceNo", SqlDbType.VarChar, 50)
            arParms(7).Value = InvoiceNo
            arParms(8) = New SqlParameter("@SetUpFlag", SqlDbType.VarChar, 2)
            If SetUpFlag = "True" Then
                SetUpFlag = "Y"
                arParms(8).Value = SetUpFlag
            Else
                SetUpFlag = "N"
                arParms(8).Value = SetUpFlag
            End If
            arParms(9) = New SqlParameter("@Invdate", SqlDbType.Date)
            arParms(9).Value = Invdate



            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "RPT_GetSaleinvoice", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Public Function Getstudcount(ByVal Branch_Code As String, ByVal Fromdate As Integer, ByVal ToDate As Integer, ByVal Yearfrom As Integer, ByVal Yearto As Integer) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(4) {}

            arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(0).Value = Branch_Code
            'arParms(1) = New SqlParameter("@SetupCost", SqlDbType.VarChar, 50)
            'arParms(1).Value = SetUp
            'arParms(2) = New SqlParameter("@ID", SqlDbType.Int)
            'arParms(2).Value = ID
            arParms(1) = New SqlParameter("@Fromdate", SqlDbType.Int)
            arParms(1).Value = Fromdate
            arParms(2) = New SqlParameter("@ToDate", SqlDbType.Int)
            arParms(2).Value = ToDate
            arParms(3) = New SqlParameter("@Yearfrom", SqlDbType.Int)
            arParms(3).Value = Yearfrom
            arParms(4) = New SqlParameter("@YearTo", SqlDbType.Int)
            arParms(4).Value = Yearto

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "getstudentcountbymonthwise", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Public Function Getsmscount(ByVal Branch_Code As String, ByVal Fromdate As Integer, ByVal ToDate As Integer, ByVal Yearfrom As Integer, ByVal Yearto As Integer) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(4) {}

            arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(0).Value = Branch_Code
            'arParms(1) = New SqlParameter("@SetupCost", SqlDbType.VarChar, 50)
            'arParms(1).Value = SetUp
            'arParms(2) = New SqlParameter("@ID", SqlDbType.Int)
            'arParms(2).Value = ID
            arParms(1) = New SqlParameter("@Fromdate", SqlDbType.Int)
            arParms(1).Value = Fromdate
            arParms(2) = New SqlParameter("@ToDate", SqlDbType.Int)
            arParms(2).Value = ToDate
            arParms(3) = New SqlParameter("@Yearfrom", SqlDbType.Int)
            arParms(3).Value = Yearfrom
            arParms(4) = New SqlParameter("@YearTo", SqlDbType.Int)
            arParms(4).Value = Yearto

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "getsmscountbymonthwise", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function


    Public Function Getemailcount(ByVal Branch_Code As String, ByVal Fromdate As Integer, ByVal ToDate As Integer, ByVal Yearfrom As Integer, ByVal Yearto As Integer) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(4) {}

            arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(0).Value = Branch_Code
            'arParms(1) = New SqlParameter("@SetupCost", SqlDbType.VarChar, 50)
            'arParms(1).Value = SetUp
            'arParms(2) = New SqlParameter("@ID", SqlDbType.Int)
            'arParms(2).Value = ID
            arParms(1) = New SqlParameter("@Fromdate", SqlDbType.Int)
            arParms(1).Value = Fromdate
            arParms(2) = New SqlParameter("@ToDate", SqlDbType.Int)
            arParms(2).Value = ToDate
            arParms(3) = New SqlParameter("@Yearfrom", SqlDbType.Int)
            arParms(3).Value = Yearfrom
            arParms(4) = New SqlParameter("@YearTo", SqlDbType.Int)
            arParms(4).Value = Yearto

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "getemailcountbymonthwise", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    'code To get Email and Sms Rate
    Shared Function GetEmailSmsRate(ByVal Branchcode As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = Branchcode

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_EmailSmsRate]", arParms)
        Return ds.Tables(0)
    End Function

    Shared Function ddlYear() As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_DDLYear]")
        Return ds.Tables(0)
    End Function

    Public Function GetInvoiceData(ByVal Branch_Code As String, ByVal InvoiceNo As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(1) {}

            arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(0).Value = Branch_Code
           
            arParms(1) = New SqlParameter("@InvoiceNo", SqlDbType.VarChar, 50)
            arParms(1).Value = InvoiceNo



            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[RPT_GetinvoiceData]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function ClearInvoiceData(ByVal InvoiceNo As String) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@InvoiceNo", SqlDbType.VarChar, 50)
        arParms(0).Value = InvoiceNo


        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[RPT_ClearInvoiceData]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function

    Shared Function ChkDuplicateData(ByVal InvoiceNo As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(0) {}

            arParms(0) = New SqlParameter("@InvoiceNo", SqlDbType.VarChar, 50)
            arParms(0).Value = InvoiceNo



            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[RPT_ChkDuplicateData]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function PostData(ByVal InvoiceNo As String, ByVal Id As Integer, ByVal SetUp As String) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(2) {}

        arParms(0) = New SqlParameter("@InvoiceNo", SqlDbType.VarChar, 50)
        arParms(0).Value = InvoiceNo

        arParms(1) = New SqlParameter("@ID", SqlDbType.Int)
        arParms(1).Value = Id

        arParms(2) = New SqlParameter("@SetUp", SqlDbType.VarChar, 20)
        arParms(2).Value = SetUp

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[RPT_PostData]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function

End Class
