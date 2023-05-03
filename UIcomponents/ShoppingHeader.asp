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
                                    <div class="content-img" style="background-image:url('<%=listCategory(item).Image%>'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
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
                                    <div class="content-img" style="background-image:url('<%=allBrands(item).Image%>'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
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
                        <a class="right-area" href="management.asp">
                            <i class='lni lni-restaurant'></i>
                            <h5>Quản Lý Cửa Hàng</h5>
                        </a>
                        
                <%
                    end if
                %>
                <%
                        if (IsNull(Session("Email")) or Trim(Session("Email"))="") then
                %>
                <a href="login.asp" class='loginbtn'>Đăng nhập</a>
                <%
                        else 
                %>
                <a href="" class="username">Xin chào, <%=Session("Name")%></a>
                <a href="" class="cart" title='Giỏ Hàng'>
                    <i class='lni lni-cart'></i>
                </a>
                <a href="logout.asp" title = 'Đăng xuất' class='extbtn' ><i class = 'lni lni-enter '></i></a>
                <%
                        End if
                %>
            </div>
        </div>
    </div>
</nav>
