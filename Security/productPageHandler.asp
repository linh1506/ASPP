<!--#include file="../connect.asp"-->
<%  
    Dim requested_id
    requested_id =  Request.QueryString("id")
    Dim url
    url  = "/ShoppingFeature/productDetail.asp?id="&requested_id
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText ="select * from product where id=? and IS_AVAILABLE = 1"
        cmdPrep.parameters.Append cmdPrep.createParameter("id",3,1, ,requested_id)
    set result = cmdPrep.execute
    If not result.EOF Then
        Response.redirect(url)
    Else
       Response.redirect("/Errors/404.asp") 
    End if
%>