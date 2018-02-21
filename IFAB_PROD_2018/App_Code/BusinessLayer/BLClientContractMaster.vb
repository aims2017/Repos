Imports Microsoft.VisualBasic

Public Class BLClientContractMaster
    Dim DLClientContractMaster As DLClientContractMaster

    Public Function GetClientContract(ByVal ClientContract As ClientCotract) As Data.DataTable
        Return DLClientContractMaster.GetClientContract(ClientContract)
    End Function
    Public Function GetExpiryDate(ByVal ClientContract As ClientCotract) As String
        Return DLClientContractMaster.GetExpiryDate(ClientContract)
    End Function
    Public Function InsertRecord(ByVal ClientContract As ClientCotract) As Integer
        Return DLClientContractMaster.InsertRecord(ClientContract)
    End Function
    Public Function UpdateRecord(ByVal ClientContract As ClientCotract) As Integer
        Return DLClientContractMaster.UpdateRecord(ClientContract)
    End Function
    Public Function ChangeFlag(ByVal id As Integer) As Integer
        Return DLClientContractMaster.ChangeFlag(id)
    End Function
    Public Function GetClientCombo() As Data.DataTable
        Return DLClientContractMaster.GetClientCombo()
    End Function
    Public Function GetBranchCombo(ByVal Mycode As String) As Data.DataTable
        Return DLClientContractMaster.GetBranchCombo(Mycode)
    End Function
    Public Function GetBillTypeCombo() As Data.DataTable
        Return DLClientContractMaster.GetBillTypeCombo()
    End Function
    Public Function LOckStatus(ByVal ClientContract As ClientCotract) As Integer
        Return DLClientContractMaster.LOckStatus(ClientContract)

    End Function
    Public Function UnLOckStatus(ByVal ClientContract As ClientCotract) As Integer
        Return DLClientContractMaster.UnLOckStatus(ClientContract)

    End Function
    Public Function ddlYear() As DataTable
        Return DLClientContractMaster.ddlYear()

    End Function

End Class
