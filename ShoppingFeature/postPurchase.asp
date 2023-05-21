<!--#include file="../connect.asp"-->
<!--#include file="subTotal.asp"-->
<!--#include file="filterAvailable.asp"-->


<%
    name = trim(Request.Form("name"))

    phone = trim(Request.Form("phone"))

    address = trim(Request.Form("address"))

    discountCode = trim(Request.Form("discountCode"))

    id = trim(Request.Form("id"))

    dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE COUPON_CODE ='" & discountCode & "' and IS_ACTIVE = 1" 
    set result = cmdPrep.execute
    if not result.EOF then
        discountValue = result("DISCOUNT_VALUE")
    else
        discountValue = 0
    end if

    dim cart
    Session("Mycart") = filterAvailable(Session("Mycart"))
    cart = Session("Mycart")
    total = CLng(subTotal(cart, discountValue))
    Response.Write(total)

    
%>