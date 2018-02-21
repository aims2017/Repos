Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Data

Public Class BLFlowerMaster
    Public Function InsertFlowerMaster(ByVal ELFlower As FlowerMaster) As Integer
        Return DLFlowerMaster.InsertFlowerMaster(ELFlower)
    End Function
    Public Function UpdateFlowerMaster(ByVal ELFlower As FlowerMaster) As Integer
        Return DLFlowerMaster.UpdateFlowerMaster(ELFlower)
    End Function
    Public Function GetGridFlowerMaster(ByVal ELFlower As FlowerMaster) As DataTable
        Return DLFlowerMaster.GetGridFlowerMaster(ELFlower)
    End Function
    Public Function DeleteRecord(ByVal ELFlower As FlowerMaster) As Integer
        Return DLFlowerMaster.DeleteRecord(ELFlower)
    End Function
    Public Function CheckDuplicate(ByVal ELFlower As FlowerMaster) As DataTable
        Return DLFlowerMaster.CheckDuplicate(ELFlower)
    End Function
End Class
