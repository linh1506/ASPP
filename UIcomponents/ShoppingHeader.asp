<% 'Response.codepage = 65001 %>
<!--#include file="../models/category.asp"-->
<!--#include file="../models/brands.asp"-->
<!--#include file="../models/products.asp"-->
<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand brand-custom" href="/home.asp">ODBG</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active nav-custom" aria-current="page" href="../ShoppingFeature/listProducts.asp">PRODUCTS</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown-custom">
                        <a class="nav-link active nav-custom" aria-current="page" href="/">CATEGORIES</a>
                        <div class="dropdown-content">
                            <ul>
                                <% for each item in listCategory %>
                                <li>
                                    <div class="content-img" style="background-image:url('<%=listCategory(item).Image%>'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
                                    <h2 class="drp-content-text" ><%=CStr(listCategory(item).Name)%></h2>
                                    <a  class="drp-content-text" href="/ShoppingFeature/listProducts.asp?sendCategory=<%=trim(CStr(listCategory(item).Name))%>">Go to product list ></a> 
                                </li>
                                <% Next %>
                            </ul>
                            <a class='showmore' href="/">Checkout all categories</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="dropdown-custom">
                        <a class="nav-link active nav-custom" aria-current="page" href="/"  >BRANDS</a>
                        <div class="dropdown-content" id="dd2">
                            <ul>
                                <% for item  = 1 To 3 %>
                                <li>
                                    <div class="content-img" style="background-image:url('<%=allBrands(item).Image%>'); background-size:contain; background-repeat:no-repeat; background-position:right center"></div>
                                    <h2 class="drp-content-text" ><%=CStr(allBrands(item).Name)%></h2>
                                    <a  class="drp-content-text" href="/ShoppingFeature/listProducts.asp?sendBrand=<%=trim(CStr(allBrands(item).Name))%>">Go to product list ></a> 
                                </li>
                                <% Next %>
                            </ul>
                            <a class='showmore' href="/">Checkout all brands</a>
                        </div>
                    </div>
                </li>    
            </ul>
            <div class="d-flex">
                <% if (Trim(Session("Role")) = "ADMIN") then %>      
                        <a class="right-area" href="/management.asp">
                            <i class='lni lni-restaurant'></i>
                            <h5>Store Management</h5>
                        </a>
                        
                <% end if %>
                <a href="../ShoppingFeature/myCart.asp" class="cart" title='Giỏ Hàng'>
                    <i class='lni lni-cart'></i>
                </a>
                <% if (IsNull(Session("Email")) or Trim(Session("Email"))="") then %>
                <a href="/ShoppingFeature/TrackOrder.asp" class='loginbtn'><i class="lni lni-eye"></i>Track My Order</a>
                <a href="../login.asp" class='loginbtn'>Login</a>
                <%
                        else 
                %>
                <a href="../GeneralFeature/profile.asp" class="username">Hello, <%=Session("Name")%></a>
                <a href="../logout.asp" title = 'Đăng xuất' class='extbtn' ><i class = 'lni lni-enter '></i></a>
                <%
                        End if
                %>
            </div>
        </div>
    </div>
</nav>