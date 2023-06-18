<!--#include file="../connect.asp"-->
<!--#include file="../Security/security.asp"-->
<%
    if (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
        name = Request.QueryString("nameBrand")
        url = Request.QueryString("imgBrand")
        ' response.write(name)
        if (trim(name) = "" or isnull(name)) then
            ' Session("Error") = "Invalid name"
            ' Response.Redirect("../management.asp?type=4")
            response.write("Error")
        Else
            dim cmdPrep
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.Prepared = True
            cmdPrep.commandText ="Select * from BRAND where Name ='"&name&"'"
            set result = cmdPrep.execute
            if result.EOF then
                cmdPrep.CommandText = "Insert BRAND values ('" & name & "','"& url &"')"
                cmdPrep.execute
                ' Session("Success") = "Add successfully"
                ' Response.Redirect("../management.asp?type=4")
                response.write("Insert")
            else
                cmdPrep.commandText ="Update BRAND set img ='"&url&"' where name='"&name&"'"
                cmdPrep.execute
                response.write("Update")
            end if
            result.Close
        end if
    else 
        Response.Redirect("../Errors/404.asp")
    end if
%>