Imports Microsoft.VisualBasic

Public Class InDockBL
    Public Function InsertRecord(ByVal InD As InDockEL) As Integer
        Return InDockDL.Insert(InD)
    End Function
    Public Function UpdateRecord(ByVal InD As InDockEL) As Integer
        Return InDockDL.Update(InD)
    End Function
    Public Function DeleteRecord(ByVal ID As Integer) As Integer
        Return InDockDL.Delete(ID)
    End Function
    Public Function GetInDockDetails(ByVal InD As InDockEL) As System.Data.DataTable
        Return InDockDL.GridviewDetails(InD)
    End Function
    Public Function GetCompanyCobmo() As DataTable
        Return InDockDL.GetCompanyCobmo()
    End Function
    Public Function GetFlowerCobmo() As DataTable
        Return InDockDL.GetFlowerCobmo()
    End Function
    Public Function GetStemLength(ByVal a As Integer) As DataTable
        Return InDockDL.GetStemLength(a)
    End Function
    Public Function GetLotNumber() As DataTable
        Return InDockDL.GetLotNumber()
    End Function
    Public Function GetMaxQuantity() As DataTable
        Return InDockDL.GetMaxQuantity()
    End Function
    'Public Function GetDuplicateSupplierMaster(ByVal InD As InDockEL) As DataTable
    '    Return InDockDL.GetSuppDuplicateType(InD)
    'End Function
    Public Function GetUnitCobmo() As DataTable
        Return InDockDL.GetUnitCobmo()
    End Function
    Public Function GetPackagingCombo() As DataTable
        Return InDockDL.GetPackagingCombo()
    End Function
    Public Function GetAucStatusFlag(ByVal id As Integer) As System.Data.DataTable
        Return InDockDL.GetAucStatusFlag(id)
    End Function
    Public Function RunSeq(ByVal AuctionDate As Date, IndockDate As Date) As Integer
        Return InDockDL.RunSeq(AuctionDate, IndockDate)
    End Function
    Public Function ClearSeq(ByVal AuctionDate As Date, IndockDate As Date) As Integer
        Return InDockDL.ClearSeq(AuctionDate, IndockDate)
    End Function
    Public Function GetDateTime() As DataTable
        Return InDockDL.GetDateTime()
    End Function
    Public Function GetGrowerSequence(ByVal AuctionDate As Date) As String
        Return InDockDL.GetGrowerSequence(AuctionDate)
    End Function
End Class
