<!--#include file="security.asp"-->
<!-- #include file="../connect.asp" -->
<%
On Error Resume Next
    dim page
    page = Request.QueryString("page")
    dim sorttype 
    sorttype = Request.QueryString("sorttype")
    If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
        response.redirect("../login.asp")
    else

    dim id
    id = Request.QueryString("id")

    If (isnull(id) OR trim(id) = "") then 
        id=0
    End if

    If (cint(id)<>0) Then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.CommandText = "SELECT * FROM PRODUCT WHERE ID=?"
        cmdPrep.Parameters(0)=id
        Set Result = cmdPrep.execute

        If not Result.EOF then
            status = not Result("IS_AVAILABLE")
        End If

        Result.Close
        cmdPrep.CommandText = "update PRODUCT set IS_AVAILABLE = ? where ID = ?"
        cmdPrep.Parameters(0) = status
        cmdPrep.Parameters(1)= id
        dim result
        set result = cmdPrep.execute
        If Err.Number = 0 Then 
            Session("Success") = "Availability changed Successfully"
            response.redirect("../management.asp?page="&page&"&type=1&sorttype="&sorttype)
        else
            Session("Error") = "something wrong, try again"
            response.redirect("../management.asp?page=1&type=1")
        End If
            result.Close
            connDB.Close
        else
            Session("Error") = "something wrong, try again"
            Response.redirect("../Errors/404.asp")
        end if
    
    End If

%>