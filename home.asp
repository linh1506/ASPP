<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="./bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="./stylelogin.css"
    />
    <script src="./jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <div class="container">
      <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="home.asp">ODBG</a>
          <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="">Shopping</a>
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
  </body>