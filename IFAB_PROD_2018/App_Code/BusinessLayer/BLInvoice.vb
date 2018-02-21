Imports Microsoft.VisualBasic

Public Class BLInvoice
    Public Function BLDispGrid() As DataTable
        Return DLInvoice.DispGrid()
    End Function
    Public Function BLGetKEy() As DataTable
        Return DLInvoice.GetKey()
    End Function
    Public Function Insert(ByVal c As Invoice) As Integer
        Return DLInvoice.InsertInvoice(c)
    End Function
    Public Function Update(ByVal c As Invoice) As Integer
        Return DLInvoice.UpdateInvoice(c)
    End Function

End Class
