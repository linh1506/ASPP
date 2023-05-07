<!--#include file="./removeRow.asp"-->
<%
    dim id
    id=CInt(Request.QueryString("idProduct"))

    dim size
    size=CInt(Request.QueryString("size"))

    dim cart
    cart = Session("Mycart")

    Session("Mycart") = removeRow(id, size, cart)

    Response.Write("Delete successfully")

%>