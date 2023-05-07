<!--#include file="./adjustRow.asp"-->
<%

    dim id
    id=CInt(Request.QueryString("idProduct"))

    dim size
    size=CInt(Request.QueryString("size"))

    dim quantity
    quantity=CInt(Request.QueryString("quantity"))


    
    dim cart
    cart = Session("Mycart")

    Session("Mycart") = adjustQuantity(id, size, quantity, cart)


%>
