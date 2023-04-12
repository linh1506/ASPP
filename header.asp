<div class="container">
    <%
        If (NOT isnull(Session("Success"))) AND (TRIM(Session("Success"))<>"") Then
    %>
            <div class="alert alert-success" role="alert">
                <%=Session("Success")%>
            </div>
    <%
            Session.Contents.Remove("Success")
        End If
    %>
    <%
        If (NOT isnull(Session("Error"))) AND (TRIM(Session("Error"))<>"") Then
    %>
        <div class="alert alert-danger" role="alert">
            <%= Session("Error") %>
        </div>
    <%
            Session.Contents.Remove("Error")
            End If
    %>
</div>