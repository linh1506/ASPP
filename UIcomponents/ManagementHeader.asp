
    <nav class="main-header navbar navbar-expand-lg navbar-dark bg-dark py-3">
        <div class="container-fluid">
          <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="../home.asp"><span><i class='lni lni-cart'></i></span>Shopping</a>
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
                <a href="../login.asp" class='loginbtn'>Login</a>
                <%
                        else
                          response.codepage = 65001
                %>
                <a href="../GeneralFeature/profile.asp" class="nav-link username">Hello, <%=Session("Name")%></a>
                <a href="../logout.asp" title = 'Đăng xuất' class='extbtn' ><i class = 'lni lni-enter '></i></a>
                <%
                        End if     
                %>
            </div>
          </div>
        </div>
    </nav>