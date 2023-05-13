
    <nav class="main-header navbar navbar-expand-lg navbar-dark bg-dark py-3">
        <div class="container-fluid">
          <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/"><span><i class='lni lni-cart'></i></span>Shopping</a>
              </li>
              <%
                if (Trim(Session("Role")) = "ADMIN") then
              %>
              <li class="nav-item">
                <a class="nav-link" id="current" href="management.asp">Management</a>
              </li>
              <%
              end if
              %>
            </ul>
            <div class="d-flex">
              <a href="../ShoppingFeature/myCart.asp" class="cart" title='Giỏ Hàng'>
                    <i class='lni lni-cart'></i>
                </a>
                <% if (IsNull(Session("Email")) or Trim(Session("Email"))="") then %>
                <a href="../login.asp" class='loginbtn'>Đăng nhập</a>
                <%
                        else 
                %>
                <a href="../GeneralFeature/profile.asp" class="nav-link username">Xin chào, <%=Session("Name")%></a>
                <a href="../logout.asp" title = 'Đăng xuất' class='extbtn' ><i class = 'lni lni-enter '></i></a>
                <%
                        End if
                        Response.codepage = 1252      
                %>
            </div>
          </div>
        </div>
    </nav>

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
<script>
  var localhostAddress = window.location.origin;
  var loginLink = document.getElementById("login_link");
  loginLink.href = localhostAddress + "/login.asp";
  var logout_link = document.getElementById("logout_link");
  logout_link.href = localhostAddress + "/logout.asp";
</script>