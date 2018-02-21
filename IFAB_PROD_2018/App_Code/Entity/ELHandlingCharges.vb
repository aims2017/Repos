Imports Microsoft.VisualBasic

Public Class ELHandlingCharges
    Private _FromDate As DateTime
    Public Property FromDate() As DateTime
        Get
            Return _FromDate
        End Get
        Set(ByVal value As DateTime)
            _FromDate = value
        End Set
    End Property
    Private _ToDate As DateTime
    Public Property ToDate() As DateTime
        Get
            Return _ToDate
        End Get
        Set(ByVal value As DateTime)
            _ToDate = value
        End Set
    End Property
    Private _ChargesForBuyerPerc As Double
    Public Property ChargesForBuyerPerc() As Double
        Get
            Return _ChargesForBuyerPerc
        End Get
        Set(ByVal value As Double)
            _ChargesForBuyerPerc = value
        End Set
    End Property
    Private _ChargesForSellerPerc As Double
    Public Property ChargesForSellerPerc() As Double
        Get
            Return _ChargesForSellerPerc
        End Get
        Set(ByVal value As Double)
            _ChargesForSellerPerc = value
        End Set
    End Property
    Private _MinChargesForBuyer As Double
    Public Property MinChargesForBuyer() As Double
        Get
            Return _MinChargesForBuyer
        End Get
        Set(ByVal value As Double)
            _MinChargesForBuyer = value
        End Set
    End Property
    Private _PenaltyCharges As Double
    Public Property PenaltyCharges() As Double
        Get
            Return _PenaltyCharges
        End Get
        Set(ByVal value As Double)
            _PenaltyCharges = value
        End Set
    End Property
    Private _id As Double
    Public Property id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
End Class
