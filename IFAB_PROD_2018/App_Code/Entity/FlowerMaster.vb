Imports Microsoft.VisualBasic

Public Class FlowerMaster
    Private _FlowerId As Integer
    Public Property FlowerId() As Integer
        Get
            Return _FlowerId
        End Get
        Set(ByVal value As Integer)
            _FlowerId = value
        End Set
    End Property
    Private _FlowerCode As String
    Public Property FlowerCode() As String
        Get
            Return _FlowerCode
        End Get
        Set(ByVal value As String)
            _FlowerCode = value
        End Set
    End Property
    Private _FlowerName As String
    Public Property FlowerName() As String
        Get
            Return _FlowerName
        End Get
        Set(ByVal value As String)
            _FlowerName = value
        End Set
    End Property
    Private _FlowerCategory As Integer
    Public Property FlowerCategory() As Integer
        Get
            Return _FlowerCategory
        End Get
        Set(ByVal value As Integer)
            _FlowerCategory = value
        End Set
    End Property
    Private _StemLength As String
    Public Property StemLength() As String
        Get
            Return _StemLength
        End Get
        Set(ByVal value As String)
            _StemLength = value
        End Set
    End Property
    Private _PackingDetails As String
    Public Property PackingDetails() As String
        Get
            Return _PackingDetails
        End Get
        Set(ByVal value As String)
            _PackingDetails = value
        End Set
    End Property
    Private _Grower As Integer
    Public Property Grower() As Integer
        Get
            Return _Grower
        End Get
        Set(ByVal value As Integer)
            _Grower = value
        End Set
    End Property
    Private _Company As Integer
    Public Property Company() As Integer
        Get
            Return _Company
        End Get
        Set(ByVal value As Integer)
            _Company = value
        End Set
    End Property
    Private _Unit As String
    Public Property Unit() As String
        Get
            Return _Unit
        End Get
        Set(ByVal value As String)
            _Unit = value
        End Set
    End Property
    Private _Remarks As String
    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
        End Set
    End Property
    Private _photo As String

    Public Property Photo() As String
        Get
            Return _photo
        End Get
        Set(ByVal value As String)
            _photo = value
        End Set
    End Property
End Class
