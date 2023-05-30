<!--#include file="../connect.asp"-->
<!--#include file="subTotal.asp"-->
<!--#include file="filterAvailable.asp"-->
<!--#include file="insertOrderItems.asp"-->

<%
    name = trim(Request.Form("name"))

    phone = trim(Request.Form("phone"))

    address = trim(Request.Form("address"))

    discountCode = (Request.Form("discountCode"))

    id = CLng(Request.Form("id"))

    ' discountCode = ""
        
    ' name = "Son"

    ' phone =  "Son"

    ' address = "Son"

    ' id = 1

    if (discountCode = "") then

            discountValue = 0
    Else
        
        dim cmdPrep
        set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE COUPON_CODE ='" & discountCode & "' and IS_ACTIVE = 1" 
        set result = cmdPrep.execute
        if not result.EOF then
            discountValue = result("DISCOUNT_VALUE")
        end if

    end if

    ' Tính tiền
    dim cart
    Session("Mycart") = filterAvailable(Session("Mycart"))
    cart = Session("Mycart")
    total = CLng(subTotal(cart, discountValue))

    ' cmdPrep.commandText = "SELECT ID FROM PROMOTION WHERE COUPON_CODE = '" & discountCode & "'"
    ' set result = cmdPrep.execute
    ' if not result.EOF then
    '     discountId = CLng(result("ID"))
    ' end if

    ' result.close()
    ' set result = Nothing

    Set cmd = Server.CreateObject("ADODB.Command")

    With cmd
    .ActiveConnection = strConnection
    .Commandtext = "spAddOrders"
    .CommandType = 4
    .Parameters("@Total") = total
    .Parameters("@CreatedBy") = id
    .Parameters("@PromotionValue") = discountValue
    .Parameters("@Address") = address
    .Parameters("@Phone") = phone
    .Parameters("@Name") = name
    End with

    Set rst = cmd.Execute(,,adCmdStoredProc)
    idOrder = rst("Orders")

    call insertOrderItems(cart, idOrder)

    Session.Contents.Remove("Mycart")

    ' Response.Write("OK")
    Response.Write(idOrder)

%>