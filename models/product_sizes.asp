<%
    Class Sizes
        ' Add some properties or methods!
        Private p_Size
        Private p_Quantity
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
    End Class
    
%>