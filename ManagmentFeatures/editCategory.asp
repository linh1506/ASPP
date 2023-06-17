<!--#include file="../connect.asp"-->
<%
    Dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True

    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        img = Request.Form("img")
        id = Request.Form("id")
        cmdPrep.CommandText = "UPDATE CATEGORY SET img='" & img & "' WHERE ID=" & id
        cmdPrep.execute
        Response.Redirect "../management.asp"
    end if

%>
<%
    id = Request.QueryString("id")
    
    cmdPrep.CommandText = "SELECT * FROM CATEGORY WHERE ID=" & id
    Dim Result
    set Result = cmdPrep.execute
%>
<div>
    <form method="post">
        <input type="hidden" value="<%=Result("ID")%>" name="id">
        <p>ID: <%=Result("ID")%></p>
        <p>NAME: <%=Result("NAME")%></p>
        <input type="text" name="img" value="<%=Result("img")%>">
        <input type="submit">
    </form>
</div>