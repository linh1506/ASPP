<%
    Session.Contents.RemoveAll()
    Session("Id") = 1
    Response.redirect("/login.asp")
%>