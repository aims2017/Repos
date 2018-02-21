Imports System.Data.SqlClient
Imports System.Data
Imports Microsoft.VisualBasic
    Public Class BLFlowerCategory
    Dim DL As New DLFlowerCategory
    Public Function InsertFlowerCategory(ByVal EL As ELFlowerCategory) As Integer
        Return DL.InsertFlowerCategory(EL)
    End Function
    'Public Function DeleteHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
    '    Return DL.DeleteHandlingCharges(EL)
    'End Function
    Public Function DisplayGridview(ByVal EL As ELFlowerCategory) As DataTable
        Return DLFlowerCategory.DisplayGridview(EL)
    End Function

    Public Function UpdateFlowerCategory(ByVal EL As ELFlowerCategory) As Integer
        Return DLFlowerCategory.UpdateFlowerCategory(EL)
    End Function
    Public Function CheckDuplicate(ByVal EL As ELFlowerCategory) As System.Data.DataTable
        Return DLFlowerCategory.CheckDuplicate(EL)
    End Function
End Class