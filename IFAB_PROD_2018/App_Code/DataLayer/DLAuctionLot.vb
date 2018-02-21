Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DLAuctionLot

    Shared Function GetAuctionLot(ByVal GrowerType As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerType", SqlDbType.VarChar)
        para(2).Value = GrowerType

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetAuctionLot", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetClockPath() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        'Dim Rowsaffected As String
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")


        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetClockPath", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetAuctionSheet(ByVal GrowerId As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerId", SqlDbType.VarChar)
        para(2).Value = GrowerId

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetAuctionSheet", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateMaxPrice(ByVal Id As Integer, ByVal MaxPrice As Double, ByVal Reason As Integer) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(4) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@MaxPrice", SqlDbType.Money)
        para(2).Value = MaxPrice

        para(3) = New SqlParameter("@Id", SqlDbType.Int)
        para(3).Value = Id

        para(4) = New SqlParameter("@Reason", SqlDbType.Int)
        para(4).Value = Reason

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateMaxPrice", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function CancelAuctionLot(ByVal Id As Integer, ByVal Remarks As String) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(3) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@Id", SqlDbType.Int)
        para(2).Value = Id

        para(3) = New SqlParameter("@Remarks", SqlDbType.VarChar)
        para(3).Value = Remarks

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_CancelAuctionLot", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function CancelAuctionSheetBid(ByVal Id As Integer, ByVal QtyCancelled As Integer, ByVal Remarks As String) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(4) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@Id", SqlDbType.Int)
        para(2).Value = Id

        para(3) = New SqlParameter("@QtyCancelled", SqlDbType.Int)
        para(3).Value = QtyCancelled

        para(4) = New SqlParameter("@Remarks", SqlDbType.VarChar)
        para(4).Value = Remarks

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_CancelAuctionSheetBid", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetReasonDDL() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetReasonDDL", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function CheckAuctionStatus(ByVal Id1 As Integer) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Id", SqlDbType.Int)
        para(1).Value = Id1

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_CheckIndockAuctionStatus", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function CheckAuctionBalance(ByVal Id1 As Integer) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Id", SqlDbType.Int)
        para(1).Value = Id1

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_CheckIndockAuctionBalance", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function GetGrowerType() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetGrowerType", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function SendSMSGrower() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As String
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Rpt_SMSGrower", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function SendSMSBuyer() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As String
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Rpt_SMSBuyer", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function GetDistinctGrowerAuctionLot(ByVal GrowerType As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerType", SqlDbType.VarChar)
        para(2).Value = GrowerType

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetDistinctGrowerAucLot", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function GetBidderId() As DataTable
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "GetGrowerId", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function SendSMSMailGrower(ByVal GrowerId As Integer, ByVal AuctionDate As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@GrowerId", SqlDbType.Int)
        para(1).Value = GrowerId

        para(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        para(2).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Rpt_SMSGrower", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function CancelRole(ByVal role As String) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        'Dim Rowsaffected As String
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@id", SqlDbType.VarChar, 4000)
        para(1).Value = role

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "GetAuctionCancelRole", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetAuctionLotView(ByVal GrowerType As String, ByVal AuctionDate As DateTime) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(3) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerType", SqlDbType.VarChar)
        para(2).Value = GrowerType

        para(3) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        para(3).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetAuctionLotView", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    '** This function is used by frmSendRandomNumber.aspx.vb for generating randm sequence numbers
    '** By Vijay Pandey : 15th May 2016

    Shared Function GetSequenceNumber(ByVal GrowerType As String, ByVal AuctionDate As Date) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        para(2).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetSequenceNumber", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetDistinctGrowerAuctionLotView(ByVal GrowerType As String, ByVal AuctionDate As DateTime) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(3) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        para(2) = New SqlParameter("@GrowerType", SqlDbType.VarChar)
        para(2).Value = GrowerType

        para(3) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        para(3).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetDistinctGrowerAucLotView", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function StatusMail(ByVal GrowerId As Integer, ByVal AuctionDate As Date) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@GrowerId", SqlDbType.Int)
        para(1).Value = GrowerId

        para(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        para(2).Value = AuctionDate

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "GetStatusEmail", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
End Class
