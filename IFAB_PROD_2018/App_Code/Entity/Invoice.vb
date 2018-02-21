Imports Microsoft.VisualBasic

Public Class Invoice
    Private _Transactiondate As DateTime
    Public Property Transactiondate() As DateTime
        Get
            Return _Transactiondate
        End Get
        Set(ByVal value As DateTime)
            _Transactiondate = value
        End Set
    End Property
    Private _AuctionDate As DateTime
    Public Property AuctionDate() As DateTime
        Get
            Return _AuctionDate
        End Get
        Set(ByVal value As DateTime)
            _AuctionDate = value
        End Set
    End Property
    Private _Buyer_id As Integer
    Public Property Buyer_id() As Integer
        Get
            Return _Buyer_id
        End Get
        Set(ByVal value As Integer)
            _Buyer_id = value
        End Set
    End Property
    Private _Invoice_NO As Integer
    Public Property Invoice_NO() As Integer
        Get
            Return _Invoice_NO
        End Get
        Set(ByVal value As Integer)
            _Invoice_NO = value
        End Set
    End Property
    Private _Invoice_Amount As Double
    Public Property Invoice_Amount() As Double
        Get
            Return _Invoice_Amount
        End Get
        Set(ByVal value As Double)
            _Invoice_Amount = value
        End Set
    End Property
    Private _Amount_Paid As Double
    Public Property Amount_Paid() As Double
        Get
            Return _Amount_Paid
        End Get
        Set(ByVal value As Double)
            _Amount_Paid = value
        End Set
    End Property
    Private _UTR_NO As Integer
    Public Property UTR_NO() As Integer
        Get
            Return _UTR_NO
        End Get
        Set(ByVal value As Integer)
            _UTR_NO = value
        End Set
    End Property
    Private _Pay_Mode As String
    Public Property Pay_Mode() As String
        Get
            Return _Pay_Mode
        End Get
        Set(ByVal value As String)
            _Pay_Mode = value
        End Set
    End Property
End Class
