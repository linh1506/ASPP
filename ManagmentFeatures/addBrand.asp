<!--#include file="security.asp"-->
<!--#include file="../connect.asp"-->
<%
    if (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
        name = Request.form("nameBrand")
        if (trim(name) = "" or isnull(name)) then
            Session("Error") = "Invalid name"
            Response.Redirect("../management.asp?type=4")
        Else
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.Prepared = True
            cmdPrep.CommandText = "Insert into BRAND values ('" & name & "')"
            cmdPrep.execute
            Session("Success") = "Add successfully"
            Response.Redirect("../management.asp?type=4")
        end if
    else 
        Response.Redirect("../Errors/404.asp")
    end if
%>