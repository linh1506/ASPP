<%
    Class product_cart
        Private p_Idproduct
        Private p_Name
        Private p_Size
        Private p_Quantity
        Private p_LimitQuantity
        Private p_Img
        Private p_Status
        Private p_Price

        Public Property Get Id()
            Id = p_Idproduct
        End Property
        Public Property Let Id(Value)
            p_Idproduct = Value
        End Property

        Public Property Get Size()
            Size = p_Size
        End Property
        Public Property Let Size(Value)
            p_Size = Value
        End Property

        Public Property Get Quantity()
            Quantity = p_Quantity
        End Property
        Public Property Let Quantity(Value)
            p_Quantity = Value
        End Property
    
        Public Property Get LimitQuantity()
            LimitQuantity = p_LimitQuantity
        End Property
        Public Property Let LimitQuantity(Value)
            p_LimitQuantity = Value
        End Property

        Public Property Get Image()
            Image = p_Img
        End Property
        Public Property Let Image(Value)
            p_Img = Value
        End Property

        Public Property Get Name()
            Name = p_Name
        End Property
        Public Property Let Name(Value)
            p_Name = Value
        End Property

        Public Property Get Status()
            Status = p_Status
        End Property
        Public Property Let Status(Value)
            p_Status = Value
        End Property

        Public Property Get Price()
            Price = p_Price
        End Property
        Public Property Let Price(Value)
            p_Price = Value
        End Property

        
    End Class
%>