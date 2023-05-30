<%
    Class order_items
    
        Private p_Id
        Private p_ProductName
        Private p_ProductID
        Private p_OrderID
        Private p_CreateAt
        Private p_TotalPrice
        Private p_Quantity
        Private p_Size
        Private p_UnitPrice

        Public Property Get Id()
            Id = p_Id
        End Property
        Public Property Let Id(Value)
            p_Id = Value
        End Property

        Public Property Get ProductName()
            ProductName = p_ProductName
        End Property
        Public Property Let ProductName(Value)
            p_ProductName = Value
        End Property

        Public Property Get ProductID()
            ProductID = p_ProductID
        End Property
        Public Property Let ProductID(Value)
            p_ProductID = Value
        End Property

        Public Property Get OrderID()
            OrderID = p_OrderID
        End Property
        Public Property Let OrderID(Value)
            p_OrderID = Value
        End Property

        Public Property Get CreateAt()
            CreateAt = p_CreateAt
        End Property
        Public Property Let CreateAt(Value)
            p_CreateAt = Value
        End Property

        Public Property Get TotalPrice()
            TotalPrice = p_TotalPrice
        End Property
        Public Property Let TotalPrice(Value)
            p_TotalPrice = Value
        End Property

        Public Property Get Quantity()
            Quantity = p_Quantity
        End Property
        Public Property Let Quantity(Value)
            p_Quantity = Value
        End Property

        Public Property Get Size()
            Size = p_Size
        End Property
        Public Property Let Size(Value)
            p_Size = Value
        End Property

        Public Property Get UnitPrice()
            UnitPrice = p_UnitPrice
        End Property
        Public Property Let UnitPrice(Value)
            p_UnitPrice = Value
        End Property
    
        ' Private Sub Class_Initialize()
        ' End Sub
        ' Private Sub Class_Terminate()
        ' End Sub
    
    End Class
%>