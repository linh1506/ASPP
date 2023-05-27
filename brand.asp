<!--#include file="connect.asp"-->

<%
    
    dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True

    dim brandId
    brandId = CInt(Request.QueryString("brandid"))
    if (brandId <> 0) then
        
        cmdPrep.CommandText = "SELECT COUNT(*) AS count FROM BRAND WHERE ID = " & brandId   
        Set Result = cmdPrep.execute
        
        if (Result("count") = 0) then
            brandId = 0
        end if

    end if
    Response.Write(brandId)
%>