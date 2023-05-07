<div class="container-fluid">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="home.asp">ODBG</a>
          <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/">Shopping</a>
              </li>
              <%
                if (Trim(Session("Role")) = "ADMIN") then
              %>
              <li class="nav-item">
                <a class="nav-link" href="management.asp">Management</a>
              </li>
              <%
              end if
              %>
            </ul>
            <div class="d-flex">
              <%
                if (IsNull(Session("Email")) or Trim(Session("Email"))="") then
              %>
              <a href="login.asp">Login</a>
              <%
                else 
              %>
              <a href="" class="link-success"><%=Session("Name")%></a>
              <a href="" class="link-info">My Cart</a>
              <a href="logout.asp" class="link-danger">Log out</a>
              <%
                End if
              %>
            </div>
          </div>
        </div>
    </nav>
</div>
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