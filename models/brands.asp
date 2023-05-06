<%
    Class brands
        Private p_Id
        Private p_Name 

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
        ' Private Sub Class_Initialize()
        ' End Sub
        ' Private Sub Class_Terminate()
        ' End Sub
    
    End Class
%>