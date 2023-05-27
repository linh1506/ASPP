<%

    Function insertOrderItems(cart, orderID)
    dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
        For i = 0 To UBound(cart)-1
            cmdPrep.commandText = "SELECT PRICE FROM PRODUCT WHERE ID=" & cart(i)(0)
            set result = cmdPrep.execute
            unitPrice = result("PRICE")
            price = unitPrice * cart(i)(2)
            cmdPrep.commandText = "INSERT INTO ORDER_ITEMS VALUES (" & cart(i)(0) & ", " & orderID & ", GETDATE(), " & price &", " & cart(i)(2) & ", " & cart(i)(1) & ", " & unitPrice & ")"
            cmdPrep.execute()
            cmdPrep.commandText = "UPDATE PRODUCT_SIZE SET QUANTITY = QUANTITY - " & cart(i)(2) & " WHERE PRODUCT_ID = " & cart(i)(0) & " AND SIZE = " & cart(i)(1)
            cmdPrep.execute()
        
        next 
    end function

%>