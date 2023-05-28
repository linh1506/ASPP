<!--#include file="./removeRow.asp"-->
<!--#include file="./adjustRow.asp"-->
<%
    'this function is remove all items which are not available or dont have any pairs of specific size
    Function filterAvailable(cart)

        dim cmdPrep, result, newCart
        newCart = cart
        set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        Session("NotAvailable") = ""


        For i = 0 To UBound(cart)-1
            cmdPrep.commandText = "SELECT IS_AVAILABLE, NAME FROM PRODUCT WHERE ID=" & cart(i)(0)
            set result = cmdPrep.execute
            if (result("IS_AVAILABLE") = false) then
                newCart = removeRow(cart(i)(0), cart(i)(1), newCart)
                Session("NotAvailable") = Session("NotAvailable") & "<p>" & result("NAME") & " has been deleted because it is NOT OPENNING for sale </p>"
            end if
        next 

        cart = newCart
        For i = 0 To UBound(cart)-1
            cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE PRODUCT_ID=" & cart(i)(0) & " AND SIZE=" & cart(i)(1)
            set result = cmdPrep.execute
            if (result("QUANTITY") = 0) then
                newCart = removeRow(cart(i)(0), cart(i)(1), newCart)
                cmdPrep.commandText = "SELECT NAME FROM PRODUCT WHERE ID=" & cart(i)(0)
                set result = cmdPrep.execute
                Session("NotAvailable") = Session("NotAvailable") & "<p>" & result("NAME") & " with size " & cart(i)(1) & " has been deleted because it is NOT LEFT</p>"
            end if
        next 

        cart = newCart
        For i = 0 To UBound(cart)-1
            cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE PRODUCT_ID=" & cart(i)(0) & " AND SIZE=" & cart(i)(1)
            set result = cmdPrep.execute
            if (result("QUANTITY") <= cart(i)(2)) then
                newCart = adjustQuantity(cart(i)(0), cart(i)(1), result("QUANTITY"), newCart)
            end if
        next 

        filterAvailable = newCart
    End Function
%>