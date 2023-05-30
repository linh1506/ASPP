<%
    Class customersDTO
        Private p_Id
        Private p_Name
        Private p_Email
        Private p_Phone
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

        Public Property Get Email()
            Email = p_Email
        End Property
        Public Property Let Email(Value)
            p_Email = Value
        End Property

        Public Property Get Phone()
            Phone = p_Phone
        End Property
        Public Property Let Phone(Value)
            p_Phone = Value
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