<!--#include file="../connect.asp"-->
<%
dim codePromotion
codePromotion = ""
codePromotion = trim(request.form("promocode"))
Session("PromotionCode") = ""

if (not isempty(Session("Mycart"))) then 
      dim cmdPrep, result
      set cmdPrep = Server.CreateObject("ADODB.Command")
      cmdPrep.ActiveConnection = connDB
      cmdPrep.CommandType = 1  
      cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE COUPON_CODE ='" &codePromotion&"' and IS_ACTIVE = 1" 
      set result = cmdPrep.execute()
      if not result.EOF then
        Session("PromotionCode") = result("COUPON_CODE")
        result.close
        Session("Success") = "The Promotion code applied successfully"
        response.redirect("/ShoppingFeature/payment.asp")
      else
        result.close
        Session("Error") = "The Promo code is incorrect or has expired"
        response.redirect("/ShoppingFeature/myCart.asp")
      end if
else
    Session("Error") = "Try to buy something before applying the promoition code"
    response.redirect("/ShoppingFeature/myCart.asp")
end if

%>