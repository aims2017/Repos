Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls.Button

Public Class Mfg_DLBuyerDetails
    Public Shared Function GridviewDetails(ByVal se As Mfg_ELBuyerDetails) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(4) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@id", SqlDbType.Int)
        arParms(2).Value = se.Supp_ID

        arParms(3) = New SqlParameter("@Company_Name", SqlDbType.NVarChar, 50)
        arParms(3).Value = se.Supp_Name

        arParms(4) = New SqlParameter("@Buyer_Code", SqlDbType.VarChar, 50)
        arParms(4).Value = se.Supp_Code

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetBuyerDetails", arParms)

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
    Public Shared Function Insert(ByVal SE As Mfg_ELBuyerDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(31) {}

        arParms(0) = New SqlParameter("@Company_Name", SqlDbType.NVarChar, 50)
        arParms(0).Value = SE.Supp_Name

        arParms(1) = New SqlParameter("@code", SqlDbType.NVarChar, 50)
        arParms(1).Value = SE.Supp_Code

        'arParms(2) = New SqlParameter("@DiscountLock", SqlDbType.NVarChar, 4)
        'arParms(2).Value = SE.DiscountLock

        If SE.Tin = "0" Then
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = DBNull.Value
        Else
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = SE.Tin
        End If

        If SE.CSTNo = "" Then
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = DBNull.Value

        Else
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = SE.CSTNo

        End If
        arParms(4) = New SqlParameter("@contact_Person", SqlDbType.NVarChar, 50)
        arParms(4).Value = SE.Contact_Person

        arParms(5) = New SqlParameter("@Pan", SqlDbType.VarChar, 50)
        arParms(5).Value = SE.PAN
        arParms(6) = New SqlParameter("@contact_Number1", SqlDbType.VarChar, 50)
        arParms(6).Value = SE.Contact_Number1

        arParms(7) = New SqlParameter("@email", SqlDbType.VarChar, 50)
        arParms(7).Value = SE.Email

        arParms(8) = New SqlParameter("@faxno", SqlDbType.VarChar, 50)
        arParms(8).Value = SE.FaxNO

        arParms(9) = New SqlParameter("@Introducer", SqlDbType.VarChar, 100)
        arParms(9).Value = SE.Introducer

        arParms(10) = New SqlParameter("@Photos", SqlDbType.VarChar, SE.Photos.Length())
        arParms(10).Value = SE.Photos

        arParms(11) = New SqlParameter("@ContactPerson2", SqlDbType.NVarChar, 50)
        arParms(11).Value = SE.ContactPerson2
        arParms(12) = New SqlParameter("@contact_Number2", SqlDbType.VarChar, 50)
        arParms(12).Value = SE.Contactno2
        arParms(13) = New SqlParameter("@Email2", SqlDbType.VarChar, 50)
        arParms(13).Value = SE.Email2

        arParms(14) = New SqlParameter("@Address", SqlDbType.NVarChar, 250)
        arParms(14).Value = SE.Supp_Address
        arParms(15) = New SqlParameter("@Address1", SqlDbType.NVarChar, 250)
        arParms(15).Value = SE.ResidenceAdd

        arParms(16) = New SqlParameter("@city ", SqlDbType.NVarChar, 50)
        arParms(16).Value = SE.City
        arParms(17) = New SqlParameter("@city1 ", SqlDbType.NVarChar, 50)
        arParms(17).Value = SE.ResCity
        arParms(18) = New SqlParameter("@District ", SqlDbType.NVarChar, 50)
        arParms(18).Value = SE.OfficeDist
        arParms(19) = New SqlParameter("@District1 ", SqlDbType.NVarChar, 50)
        arParms(19).Value = SE.ResidenceDist

        arParms(20) = New SqlParameter("@State", SqlDbType.Int)
        arParms(20).Value = SE.State

        arParms(21) = New SqlParameter("@State1", SqlDbType.Int)
        arParms(21).Value = SE.ResidenceState

        arParms(22) = New SqlParameter("@country", SqlDbType.NVarChar, 50)
        arParms(22).Value = SE.Country
        arParms(23) = New SqlParameter("@country1", SqlDbType.NVarChar, 50)
        arParms(23).Value = SE.ResCountry
      
        arParms(24) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(24).Value = HttpContext.Current.Session("BranchCode")

        arParms(25) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(25).Value = HttpContext.Current.Session("EmpCode")

        arParms(26) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(26).Value = HttpContext.Current.Session("UserCode")

        'If SE.OpBalanceDate = "01-01-9100" Then
       
        'Else
        'arParms(20) = New SqlParameter("@ob_date", SqlDbType.DateTime)
        'arParms(20).Value = SE.OpBalanceDate
        'End If

        arParms(27) = New SqlParameter("@BankName", SqlDbType.VarChar, 50)
        arParms(27).Value = SE.BankName

        arParms(28) = New SqlParameter("@BankArea", SqlDbType.VarChar, 50)
        arParms(28).Value = SE.BankArea

        arParms(29) = New SqlParameter("@IFSCCode", SqlDbType.VarChar, 50)
        arParms(29).Value = SE.IFSCCode

        arParms(30) = New SqlParameter("@AcNo", SqlDbType.VarChar, 50)
        arParms(30).Value = SE.AcNo

        arParms(31) = New SqlParameter("@ToAc", SqlDbType.Int)
        arParms(31).Value = SE.ToAc
       
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_SaveBuyerDetails]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function

    Public Shared Function Update(ByVal SE As Mfg_ELBuyerDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0

        Dim arParms() As SqlParameter = New SqlParameter(32) {}

        arParms(0) = New SqlParameter("@Company_Name", SqlDbType.NVarChar, 50)
        arParms(0).Value = SE.Supp_Name

        arParms(1) = New SqlParameter("@code", SqlDbType.NVarChar, 50)
        arParms(1).Value = SE.Supp_Code

        'arParms(2) = New SqlParameter("@DiscountLock", SqlDbType.NVarChar, 4)
        'arParms(2).Value = SE.DiscountLock

        If SE.Tin = "0" Then
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = DBNull.Value
        Else
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = SE.Tin
        End If

        If SE.CSTNo = "" Then
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = DBNull.Value

        Else
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = SE.CSTNo

        End If
        arParms(4) = New SqlParameter("@contact_Person", SqlDbType.NVarChar, 50)
        arParms(4).Value = SE.Contact_Person

        arParms(5) = New SqlParameter("@Pan", SqlDbType.VarChar, 50)
        arParms(5).Value = SE.PAN
        arParms(6) = New SqlParameter("@contact_Number1", SqlDbType.VarChar, 50)
        arParms(6).Value = SE.Contact_Number1

        arParms(7) = New SqlParameter("@email", SqlDbType.VarChar, 50)
        arParms(7).Value = SE.Email

        arParms(8) = New SqlParameter("@faxno", SqlDbType.VarChar, 50)
        arParms(8).Value = SE.FaxNO

        arParms(9) = New SqlParameter("@Introducer", SqlDbType.VarChar, 100)
        arParms(9).Value = SE.Introducer

        arParms(10) = New SqlParameter("@Photos", SqlDbType.VarChar, SE.Photos.Length())
        arParms(10).Value = SE.Photos

        arParms(11) = New SqlParameter("@ContactPerson2", SqlDbType.NVarChar, 50)
        arParms(11).Value = SE.ContactPerson2
        arParms(12) = New SqlParameter("@contact_Number2", SqlDbType.VarChar, 50)
        arParms(12).Value = SE.Contactno2
        arParms(13) = New SqlParameter("@Email2", SqlDbType.VarChar, 50)
        arParms(13).Value = SE.Email2

        arParms(14) = New SqlParameter("@Address", SqlDbType.NVarChar, 250)
        arParms(14).Value = SE.Supp_Address
        arParms(15) = New SqlParameter("@Address1", SqlDbType.NVarChar, 250)
        arParms(15).Value = SE.ResidenceAdd

        arParms(16) = New SqlParameter("@city ", SqlDbType.NVarChar, 50)
        arParms(16).Value = SE.City
        arParms(17) = New SqlParameter("@city1 ", SqlDbType.NVarChar, 50)
        arParms(17).Value = SE.ResCity
        arParms(18) = New SqlParameter("@District ", SqlDbType.NVarChar, 50)
        arParms(18).Value = SE.OfficeDist
        arParms(19) = New SqlParameter("@District1 ", SqlDbType.NVarChar, 50)
        arParms(19).Value = SE.ResidenceDist

        arParms(20) = New SqlParameter("@State", SqlDbType.Int)
        arParms(20).Value = SE.State

        arParms(21) = New SqlParameter("@State1", SqlDbType.Int)
        arParms(21).Value = SE.ResidenceState

        arParms(22) = New SqlParameter("@country", SqlDbType.NVarChar, 50)
        arParms(22).Value = SE.Country
        arParms(23) = New SqlParameter("@country1", SqlDbType.NVarChar, 50)
        arParms(23).Value = SE.ResCountry

        arParms(24) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(24).Value = HttpContext.Current.Session("BranchCode")

        arParms(25) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(25).Value = HttpContext.Current.Session("EmpCode")

        arParms(26) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(26).Value = HttpContext.Current.Session("UserCode")

        'If SE.OpBalanceDate = "01-01-9100" Then

        'Else
        'arParms(20) = New SqlParameter("@ob_date", SqlDbType.DateTime)
        'arParms(20).Value = SE.OpBalanceDate
        'End If

        arParms(27) = New SqlParameter("@BankName", SqlDbType.VarChar, 50)
        arParms(27).Value = SE.BankName

        arParms(28) = New SqlParameter("@BankArea", SqlDbType.VarChar, 50)
        arParms(28).Value = SE.BankArea

        arParms(29) = New SqlParameter("@IFSCCode", SqlDbType.VarChar, 50)
        arParms(29).Value = SE.IFSCCode

        arParms(30) = New SqlParameter("@AcNo", SqlDbType.VarChar, 50)
        arParms(30).Value = SE.AcNo

        arParms(31) = New SqlParameter("@ToAc", SqlDbType.Int)
        arParms(31).Value = SE.ToAc

        arParms(32) = New SqlParameter("@id", SqlDbType.Int)
        arParms(32).Value = SE.Supp_ID

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_UpdateBuyerDetails]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function Delete(ByVal id As Long) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim SE As New Supplier
        Dim rowsAffected As Integer = 0


        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("Buyer_Id", SqlDbType.Int)
        arParms(0).Value = id
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_DeleteBuyerDetails]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function GetSuppDuplicateType(ByVal SE As Mfg_ELBuyerDetails) As Data.DataTable
        Dim con As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        Dim ds As New DataSet

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@id", SqlDbType.Int)
        arParms(2).Value = SE.Supp_ID
        arParms(3) = New SqlParameter("@comp_Code", SqlDbType.Char, SE.Supp_Code.Length)
        arParms(3).Value = SE.Supp_Code
        Try

            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "[Proc_GetBuyerDuplicateType]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetBuyerCompanyCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[GetBuyerCombo]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetGrowerCompanyCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[GetGrowerCombo]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Public Function GetDDlAccountType() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetAccountTypeCombo", arParms)
        Return ds.Tables(0)
    End Function
End Class
