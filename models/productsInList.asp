<%
    Class productsInList 
    
        Private p_Id
        Private p_Name
        Private p_Price
        Private p_Img

        Public Property Get Id()
            Id = p_Id
        End Property
        Public Property Let Id(Value)
            p_Id = Value
        End Property

        Public Property Get Name()
            Name = p_Name
        End Property
        Public Property Let Name(Value)
            p_Name = Value
        End Property

        Public Property Get Price()
            Price = p_Price
        End Property
        Public Property Let Price(Value)
            p_Price = Value
        End Property

        Public Property Get Img()
            Img = p_Img
        End Property
        Public Property Let Img(Value)
            p_Img = Value
        End Property

    End Class
    
%>