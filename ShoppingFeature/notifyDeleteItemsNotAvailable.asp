<%
    If (NOT isnull(Session("NotAvailable"))) AND (TRIM(Session("NotAvailable"))<>"") Then
%>
        <div class="alert alert-warning mt-2" role="alert">
            <%=Session("NotAvailable")%>
        </div>
<%
        Session.Contents.Remove("NotAvailable")
    End If
%>
