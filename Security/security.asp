<%
    if (not trim(Session("Role")) = "ADMIN") then
    Response.Redirect("/home.asp")
    end if
%>