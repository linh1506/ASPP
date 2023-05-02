<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand brand-custom" href="home.asp">ODBG</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active nav-custom" aria-current="page" href="/">SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown-custom">
                        <a class="nav-link active nav-custom" aria-current="page" href="/">DANH MỤC</a>
                        <div class="dropdown-content">
                            <ul>
                                <% for each item in listCategory %>
                                <li>
                                    <div class="content-img" style="background-image:url('https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
                                    <h2 class="drp-content-text" ><%=CStr(listCategory(item).Name)%></h2>
                                    <a  class="drp-content-text" href="#">Xem danh sách sản phẩm ></a> 
                                </li>
                                <% Next %>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="dropdown-custom">
                        <a class="nav-link active nav-custom" aria-current="page" href="/"  >NHÃN HIỆU</a>
                        <div class="dropdown-content" id="dd2">
                            <ul>
                                <% for item  = 1 To 3 %>
                                <li>
                                    <div class="content-img" style="background-image:url('https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
                                    <h2 class="drp-content-text" ><%=CStr(allBrands(item).Name)%></h2>
                                    <a  class="drp-content-text" href="#">Xem danh sách sản phẩm ></a> 
                                </li>
                                <% Next %>
                            </ul>
                            <a class='showmore' href="/">Xem tất cả các nhãn hiệu</a>
                        </div>
                    </div>
                </li>    
            </ul>
            <div class="d-flex">
                <%
                    if (Trim(Session("Role")) = "ADMIN") then
                %>
                        <a href="management.asp">Management</a>
                <%
                    end if
                %>
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
