<%
    Class products
    
        Private p_Id
        Private p_Name
        Private p_Price
        Private p_Status

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

        Public Property Get Status()
            Status = p_Status
        End Property
        Public Property Let Status(Value)
            p_Status = Value
        End Property
        
        ' Private Sub Class_Initialize()
        ' End Sub
        ' Private Sub Class_Terminate()
        ' End Sub
    
    End Class
%>