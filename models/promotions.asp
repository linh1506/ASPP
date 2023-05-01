<%
    Class promotions
        Private p_Id
        Private p_CouponCode
        Private p_Is_Active
        Private p_Expired_At
        Private p_Name
        Private p_Discount_Value

        Public Property Get Id
            Id = p_Id
        End Property
        Public Property Let Id(Value)
            p_Id = Value
        End Property

        Public Property Get CouponCode
            CouponCode = p_CouponCode
        End Property
        Public Property Let CouponCode(Value)
            p_CouponCode = Value
        End Property

        Public Property Get Is_Active
            Is_Active = p_Is_Active
        End Property
        Public Property Let Is_Active(Value)
            p_Is_Active = Value
        End Property

        Public Property Get Expired_At
            Expired_At = p_Expired_At
        End Property
        Public Property Let Expired_At(Value)
            p_Expired_At = Value
        End Property

        Public Property Get Name
            Name = p_Name
        End Property
        Public Property Let Name(Value)
            p_Name = Value
        End Property

        Public Property Get Discount_Value
            Discount_Value = p_Discount_Value
        End Property
        Public Property Let Discount_Value(Value)
            p_Discount_Value = Value
        End Property
    End Class
    

%>