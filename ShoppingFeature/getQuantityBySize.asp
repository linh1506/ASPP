<!--#include file="../connect.asp"-->
<%
    id_Product = Request.QueryString("id")
    id_Size = Request.QueryString("size")

    dim cmdPrep, result
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE PRODUCT_ID = " & id_Product & " AND SIZE = " & id_Size
    set result = cmdPrep.Execute
    Response.Write(result("QUANTITY"))
%>