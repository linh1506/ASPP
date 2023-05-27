<!--#include file="../connect.asp"-->
<%
    dim promoCode
    dim cmdPrep, result
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    Session("PromotionCode") = ""

    if not isempty(request.QueryString("promoCode")) then
        promoCode = request.QueryString("promoCode")
        cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE IS_ACTIVE = 1 and Coupon_code ='"& promoCode&"'"
        set result = cmdPrep.execute
        if not result.EOF then
            Session("PromotionCode") = promoCode
        end if
        else
            Session("PromotionCode") = ""
    end if
%>