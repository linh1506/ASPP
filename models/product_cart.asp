<%
    Class product_cart
        Private p_Idproduct
        Private p_Size
        Private p_Soluong

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

        Public Property Get Soluong()
            Soluong = p_Soluong
        End Property
        Public Property Let Size(Value)
            p_Soluong = Value
        End Property
    
    End Class
%>