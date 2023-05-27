<%
    Class orders
    
        Private p_Id
        Private p_Amount
        Private p_CreateAt
        Private p_CreateBy
        Private p_Address
        Private p_Phone
        Private p_Name
        Private p_Status
        Private p_PromoValue

        Public Property Get Id()
            Id = p_Id
        End Property
        Public Property Let Id(Value)
            p_Id = Value
        End Property

        Public Property Get Amount()
            Amount = p_Amount
        End Property
        Public Property Let Amount(Value)
            p_Amount = Value
        End Property

        Public Property Get CreateAt()
            CreateAt = p_CreateAt
        End Property
        Public Property Let CreateAt(Value)
            p_CreateAt = Value
        End Property

        Public Property Get CreateBy()
            CreateBy = p_CreateBy
        End Property
        Public Property Let CreateBy(Value)
            p_CreateBy = Value
        End Property

        Public Property Get Address()
            Address = p_Address
        End Property
        Public Property Let Address(Value)
            p_Address = Value
        End Property

        Public Property Get Phone()
            Phone = p_Phone
        End Property
        Public Property Let Phone(Value)
            p_Phone = Value
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

        Public Property Get PromoValue()
            PromoValue = p_PromoValue
        End Property
        Public Property Let PromoValue(Value)
            p_PromoValue = Value
        End Property
        
        
        ' Private Sub Class_Initialize()
        ' End Sub
        ' Private Sub Class_Terminate()
        ' End Sub
    
    End Class
%>