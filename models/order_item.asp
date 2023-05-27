<%
    Class orderItem
        Private p_productId
        Private p_quantity
        Private p_unitPrice
        Private p_size
        Private p_Name

        Public Property Get productId()
            productId = p_productId
        End Property
        Public Property Let productId(Value)
            p_productId = Value
        End Property

        Public Property Get name()
            name = p_Name
        End Property
        Public Property Let name(Value)
            p_Name = Value
        End Property

        Public Property Get price()
            price = p_unitPrice
        End Property
        Public Property Let price(Value)
            p_unitPrice = Value
        End Property

        Public Property Get quantity()
            quantity = p_quantity
        End Property
        Public Property Let quantity(Value)
            p_quantity = Value
        End Property

        Public Property Get size()
            size = p_size
        End Property
        Public Property Let size(Value)
            p_size = Value
        End Property
    End Class
%>