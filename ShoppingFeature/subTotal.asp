
<%

    Function subTotal(cart, discountValue)
        dim total
        total = 0
        dim cmdPrep
        set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1

        For i = 0 To UBound(cart)-1
            cmdPrep.commandText = "SELECT PRICE FROM PRODUCT WHERE ID=" & cart(i)(0)
            set result = cmdPrep.execute
            total = total + result("PRICE")*cart(i)(2)
        next 

        total = total * (1-discountValue)
        subTotal = total
    End Function

%>