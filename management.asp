<!--#include file="connect.asp"-->
<!--#include file="./Security/security.asp"-->
<!--#include file="./models/products.asp" -->
<!--#include file="./models/customersDTO.asp" -->
<!--#include file="./models/promotions.asp" -->
<!--#include file="./models/brands.asp" -->
<!--#include virtual="/ShoppingFeature/getOrderList.asp"-->
<!--#include virtual="/UIcomponents/product_card.asp"-->
<%
    ' ham lam tron so nguyen
    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function

    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function

    sorttype = Request.QueryString("sorttype")
    if (trim(sorttype) = "" or IsNull(sorttype)) then
        sorttype = 1
    end if

    if ( not IsNumeric(sorttype) ) then
        sorttype = 1
    end if
    sorttype = CInt(sorttype)

    
    Select Case sorttype 
        Case 1
            sortProducts = "ID"
        Case 2
            sortProducts = "NAME"
        Case 3
            sortProducts = "PRICE"
    End Select

    limit = 10

    strSQL = "SELECT COUNT(ID) AS count FROM PRODUCT"
    Set CountResult = connDB.execute(strSQL)
    totalRowsProducts = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesProducts = Ceil(totalRowsProducts/limit)
            
    strSQL = "SELECT COUNT(ID) AS count FROM PROMOTION"
    Set CountResult = connDB.execute(strSQL)
    totalRowsPromotions = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesPromotions = Ceil(totalRowsPromotions/limit)

    strSQL = "SELECT COUNT(ID) AS count FROM USERS WHERE ROLE='USER'"
    Set CountResult = connDB.execute(strSQL)
    totalRowsUsers = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesUsers = Ceil(totalRowsUsers/limit)

    strSQL = "SELECT COUNT(ID) AS count FROM BRAND"
    Set CountResult = connDB.execute(strSQL)
    totalRowsBrands = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesBrands = Ceil(totalRowsBrands/limit)

    strSQL = "SELECT COUNT(ID) AS count FROM ORDERS"
    Set CountResult = connDB.execute(strSQL)
    totalRowsOrders = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesOrders = Ceil(totalRowsOrders/limit)

    typeOfPage = Request.QueryString("type")
    if (trim(typeOfPage) = "") or (isnull(typeOfPage)) then
        ' type of page de trong thi set 1
        typeOfPage = 1
    end if
    typeOfPage = CInt(typeOfPage)
    page = Request.QueryString("page")

    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if
    page = CInt(page)
    Select Case typeOfPage
        Case 1
        ' Products
            pageProducts = page
            pageUsers = 1
            pagePromotions = 1
            pageBrands = 1
            pageOrders = 1

            if (CInt(pageProducts) > pagesProducts) then
                pageProducts = pagesProducts
            end if
        Case 2
            pageProducts = 1
            pageUsers = page
            pagePromotions = 1
            pageBrands = 1
            pageOrders = 1

            if (CInt(pageUsers) > pagesUsers) then
                pageUsers = pagesUsers
            end if

        Case 3
            pageProducts = 1
            pageUsers = 1
            pagePromotions = page
            pageBrands = 1
            pageOrders = 1

            if (CInt(pagePromotions) > pagesPromotions) then
                pagePromotions = pagesPromotions
            end if

        Case 4
            pageProducts = 1
            pageUsers = 1
            pagePromotions = 1
            pageBrands = page
            pageOrders = 1

            if (CInt(pageBrands) > pagesBrands) then
                pageBrands = pagesBrands
            end if

        Case 6
            pageProducts = 1
            pageUsers = 1
            pagePromotions = 1
            pageBrands = 1
            pageOrders = page

            if (CInt(pageOrders) > pagesOrders) then
                pageOrders = pagesOrders
            end if

        Case Else
            pageProducts = 1
            pageUsers = 1
            pagePromotions = 1
            pageBrands = 1
            pageOrders = 1
    End Select

    offsetProducts = (Clng(pageProducts) * Clng(limit)) - Clng(limit)
    offsetPromotions = (Clng(pagePromotions) * Clng(limit)) - Clng(limit)
    offsetUsers = (Clng(pageUsers) * Clng(limit)) - Clng(limit)
    offsetBrands = (Clng(pageBrands) * Clng(limit)) - Clng(limit)
    offsetOrders = (Clng(pageOrders) * Clng(limit)) - Clng(limit)
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/Resources/AdminLTE/dist/css/adminlte.min.css">
        <link rel="stylesheet" href="./Resources/web-font-files/lineicons.css">
        <link rel="stylesheet" href="/UIcomponents/ManagementHeader.css">
        <link rel="stylesheet" href="/css/getOrderList.css">
        <link rel="stylesheet" href="/UIcomponents/product_card.css">
        <link rel="stylesheet" href="/management.css">
        <link rel="stylesheet" href='/UIcomponents/notification.css'>
        <title>Quản lý cửa hàng</title>
    </head>
    <body>
    <!--#include file="./UIcomponents/pageLoader.asp"-->
    <!--#include file="./UIcomponents/notification.asp"-->
    <div class="wrapper">
        <!--#include file="./UIcomponents/ManagementHeader.asp"-->
        <aside class='main-sidebar sidebar-dark-primary elevation-4'>
            <a href="./home.asp" class="brand-link">
                ODBG
            </a>
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
                <div class="nav nav-pills nav-sidebar flex-column">
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'statistic')" id="OpenManageStatistic">Statistics</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'products')" id="OpenManageProduct">Manage Products</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'customers')" id="OpenManageCustomer">Manage Customers</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'promotions')" id="OpenManagePromotion">Manage Promotions</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'brands')" id="OpenManageBrand">Manage Brands</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'gallery')" id="OpenManageGallery">Store's Gallery</button>
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'order')" id="OpenManageOrder">Orders Management</button>  
                    <button class='nav-item btn text-white btn-block btn-lg-active tablinks py-3' onclick="openCity(event, 'categories')" id="OpenManageOrder">Manage Categories</button>  
                </div>
            </nav>
        </aside>
        <div class="content-wrapper">
            <div class="content">
                <div class="container-fluid">
                    <div id="products" class="tabcontent table-responsive">
                        <h1 class='content-header'>Manage Products</h1>
                        <div class="Product-Feature-row">
                            <a href="./ManagmentFeatures/addproduct.asp" class="btn btn-primary">ADD PRODUCT</a>
                            <a href="../management.asp?sorttype=1" class="btn btn-warning <%if sorttype=1 then %>disabled<%end if%>" role="button" aria-disabled="true">Sort by ID</a>
                            <a href="../management.asp?sorttype=2" class="btn btn-warning <%if sorttype=2 then %>disabled<%end if%>" role="button" aria-disabled="true">Sort by Name (Ascending)</a>
                            <a href="../management.asp?sorttype=3" class="btn btn-warning <%if sorttype=3 then %>disabled<%end if%>" role="button" aria-disabled="true"">Sort by Price (Asending)</a>
                        </div>
                        <%if (totalRowsProducts = 0) then%>
                            <h5>THERE'S NO ONE AT ALL</h5>
                        <%else%>
                            <div>
                                <table class="table table-dark table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">NAME</th>
                                            <th scope="col">PRICE</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">Edit</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Set listProducts = Server.CreateObject("Scripting.Dictionary")
                                            dim cmdPrep
                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                            cmdPrep.ActiveConnection = connDB
                                            cmdPrep.CommandType = 1
                                            cmdPrep.Prepared = True
                                            cmdPrep.commandText = "select * from PRODUCT order by "& sortProducts &" offset "& CLng(offsetProducts) &" rows fetch next "& CLng(limit) &" row only"
                                            set Result = cmdPrep.execute
                                            seq = 0
                                            do while not Result.EOF
                                                seq = seq + 1
                                                set product = New Products
                                                product.Id = Result("ID")
                                                product.Name = Result("NAME")
                                                product.Price = Result("PRICE")
                                                product.Status = Result("IS_AVAILABLE")
                                                listProducts.add seq,product
                                                Result.MoveNext
                                            Loop
                                            Result.Close
                                            set Result = nothing
                                        %>
                                        <% for each item in listProducts %>
                                            <tr>
                                                    <td><%=listProducts(item).Id%></td>
                                                    <td><%=listProducts(item).Name%></td>
                                                    <td><%=listProducts(item).Price%></td>
                                                    <td>
                                                        <button id="status<%=listProducts(item).Id%>" onClick="toggleProductStatus(<%=listProducts(item).Id%>)" class="<%if(listProducts(item).Status = true) then%>
                                                                btn btn-success
                                                            <%else%>
                                                                btn btn-danger
                                                            <%end if%>">
                                                            <%if(listProducts(item).Status = true) then%>
                                                                Open For Sale
                                                            <%else%>
                                                                Closed
                                                            <%end if%>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <a class="edit-product-button" href="./ManagmentFeatures/editProduct.asp?id=<%=listProducts(item).Id%>&page=<%=page%>&sorttype=<%=sorttype%>">
                                                            <i class = "lni lni-pencil-alt" style="margin:0;padding:0;color:#f3f3f3;font-size:1.5em"></i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="/ShoppingFeature/productDetail.asp?id=<%=listProducts(item).Id%>" class="redirect-product-page">
                                                            <i class = "lni lni-chevron-right-circle" style="margin:0;padding:0;color:#f3f3f3;font-size:1.5em"></i>
                                                        </a>
                                                    </td>
                                            </tr>
                                        <% Next %>
                                    </tbody>
                                </table>
                                <nav aria-label="Page Navigation">
                                    <ul class="pagination pagination-sm">
                                        <% if (pagesProducts > 1) then 
                                            for i= 1 to pagesProducts
                                        %>
                                            <li class="page-item <%=checkPage(Clng(i)=Clng(pageProducts),"active")%>"><a class="page-link" href="management.asp?page=<%=i%><% if (CInt(sorttype) <> 1) then Response.Write "&sorttype=" & sorttype%>"><%=i%></a></li>
                                        <%
                                            next
                                            end if
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        <%end if%>
                    </div>
                    <div id="customers" class="tabcontent">
                        <h1 class='content-header'>Manage Customers</h1>
                        <%if (totalRowsUsers = 0) then%>
                            <h5>THERE'S NO ONE AT ALL</h5>
                        <%else%>
                            <div>
                                <table class="table table-dark">
                                    <thead>
                                        <tr>
                                            <th scope="col">NAME</th>
                                            <th scope="col">EMAIL</th>
                                            <th scope="col">PHONE</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col"></th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Set listCustomersDTO = Server.CreateObject("Scripting.Dictionary")
                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                            cmdPrep.ActiveConnection = connDB
                                            cmdPrep.CommandType = 1
                                            cmdPrep.Prepared = True
                                            cmdPrep.commandText = "select * from users where ROLE = 'USER' order by id offset "& CLng(offsetUsers) &" rows fetch next "& CLng(limit) &" row only"
                                            set Result = cmdPrep.execute
                                            seq = 0
                                            do while not Result.EOF
                                                seq = seq + 1
                                                set cus = New customersDTO
                                                cus.Id = Result("ID")
                                                cus.Name = Result("NAME")
                                                cus.Email = Result("EMAIL")
                                                cus.Phone = Result("PHONE")
                                                cus.Status = Result("STATUS")
                                                listCustomersDTO.add seq,cus
                                                Result.MoveNext
                                            Loop
                                            Result.Close
                                            set Result = nothing
                                        %>
                                        <% for each item in listCustomersDTO %>
                                        <tr>
                                            <td><%=listCustomersDTO(item).Name%></td>
                                            <td><%=listCustomersDTO(item).Email%></td>
                                            <td><%=listCustomersDTO(item).Phone%></td>
                                            <td>
                                                <button id="UserStatus<%=listCustomersDTO(item).Id%>" onClick="toggleUserStatus(<%=listCustomersDTO(item).Id%>)" class="btn btn-<%if(listCustomersDTO(item).Status = true) then%>success<%else%>danger<%end if%>">
                                                    <%if(listCustomersDTO(item).Status = true) then%>
                                                        Active
                                                    <%else%>
                                                        Block
                                                    <%end if%>
                                                </button>
                                            </td>
                                            <td>
                                                <a href="./ManagmentFeatures/info_customer.asp?id=<%=listCustomersDTO(item).Id%>" class="redirect-product-page">
                                                    <i class = "lni lni-chevron-right-circle" style="margin:0;padding:0;color:#f3f3f3;font-size:1.5em"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <% Next %>
                                    </tbody>
                                </table>
                                <nav aria-label="Page Navigation">
                                    <ul class="pagination pagination-sm">
                                        <% if (pagesUsers>1) then 
                                            for i= 1 to pagesUsers
                                        %>
                                            <li class="page-item <%=checkPage(Clng(i)=Clng(pageUsers),"active")%>"><a class="page-link" href="management.asp?type=2&page=<%=i%>"><%=i%></a></li>
                                        <%
                                            next
                                            end if
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        <%end if%>
                    </div>
                    <div id="promotions" class="tabcontent">
                        <h1 class='content-header'>Manage Promotions</h1>
                        <a href="./ManagmentFeatures/addpromote.asp" class="btn btn-outline-primary">Add Promotion</a>
                        <%if (totalRowsPromotions = 0) then%>
                            <h5>THERE'S NO ONE AT ALL</h5>
                        <%else%>
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Coupon Code</th>
                                            <th scope="col">Discount Value</th>
                                            <th scope="col">Expired</th>
                                            <th scope="col">Active</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Set listPromotions = Server.CreateObject("Scripting.Dictionary")
                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                            cmdPrep.ActiveConnection = connDB
                                            cmdPrep.CommandType = 1
                                            cmdPrep.Prepared = True
                                            cmdPrep.commandText = "select * from PROMOTION order by id offset "& CLng(offsetPromotions) &" rows fetch next "& CLng(limit) &" row only"
                                            set Result = cmdPrep.execute
                                            seq = 0
                                            do while not Result.EOF
                                                seq = seq + 1
                                                set promotion = New promotions
                                                promotion.Id = Result("ID")
                                                promotion.Name = Result("NAME")
                                                promotion.CouponCode = Result("COUPON_CODE")
                                                promotion.Is_Active = Result("IS_ACTIVE")
                                                promotion.Expired_At = Result("EXPIRED_AT")
                                                promotion.Discount_Value = Result("DISCOUNT_VALUE")
                                                listPromotions.add seq,promotion
                                                Result.MoveNext
                                            Loop
                                            Result.Close
                                            set Result = nothing
                                        %>
                                        <% for each item in listPromotions %>
                                        <tr>
                                            <td><%=listPromotions(item).Id%></td>
                                            <td><%=listPromotions(item).Name%></td>
                                            <td><%=listPromotions(item).CouponCode%></td>
                                            <td><%=listPromotions(item).Discount_Value%></td>
                                            <td><%=listPromotions(item).Expired_At%></td>
                                            <td>
                                                <button id="PromotionStatus<%=listPromotions(item).Id%>" onClick="TogglePromotionStatus(<%=listPromotions(item).Id%>)" class="btn btn-<% if (listPromotions(item).Is_Active = True ) then %>success<% else %>danger<% end if %>">
                                                    <% if (listPromotions(item).Is_Active = True ) then %>
                                                        Enable
                                                    <% else %> 
                                                    Disable
                                                    <% end if %>
                                                </button>
                                            </td>
                                        </tr>
                                        <% Next %>
                                    </tbody>
                                </table>
                                <nav aria-label="Page Navigation">
                                    <ul class="pagination pagination-sm">
                                        <% if (pagesPromotions > 1) then 
                                            for i= 1 to pagesPromotions
                                        %>
                                            <li class="page-item <%=checkPage(Clng(i)=Clng(pagePromotions),"active")%>"><a class="page-link" href="management.asp?type=3&page=<%=i%>"><%=i%></a></li>
                                        <%
                                            next
                                            end if
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        <%end if%>
                    </div>
                    <div id="brands" class="tabcontent">
                        <h1 class='content-header'>Manage Brands</h1>
                        <form action="./ManagmentFeatures/addBrand.asp" method="POST">
                            <label for="nameBrand">Name Brand:</label>
                            <input type="text" name="nameBrand" id="nameBrand">
                            <label for="imgBrand">Link Image:</label>
                            <input type="text" name="imgBrand" id="imgBrand">
                            <button type="button" onClick="addOrEditBrand()" class="btn btn-outline-primary">Submit</button>
                        </form>
                        <%if (totalRowsBrands = 0) then%>
                            <h5>THERE'S NO ONE AT ALL</h5>
                        <%else%>
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Preview</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Set listBrands = Server.CreateObject("Scripting.Dictionary")
                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                            cmdPrep.ActiveConnection = connDB
                                            cmdPrep.CommandType = 1
                                            cmdPrep.Prepared = True
                                            cmdPrep.commandText = "select * from BRAND order by id offset "& CLng(offsetBrands) &" rows fetch next "& CLng(limit) &" row only"
                                            set Result = cmdPrep.execute
                                            seq = 0
                                            do while not Result.EOF
                                                seq = seq + 1
                                                set brand = new brands
                                                brand.Id = Result("ID")
                                                brand.Name = Result("NAME")
                                                brand.Image = Result("IMG")
                                                listBrands.add seq,brand
                                                Result.MoveNext
                                            loop
                                            Result.Close
                                            set Result = nothing
                                        %>
                                        <% for each item in listBrands %>
                                        <tr>
                                            <td><%=listBrands(item).Id%></td>
                                            <td><%=listBrands(item).Name%></td>
                                            <td><a href="<%=listBrands(item).Image%>" target="_blank"><%=listBrands(item).Image%></a></td>
                                        </tr>
                                        <% Next %>
                                    </tbody>
                                </table>
                                <nav aria-label="Page Navigation">
                                    <ul class="pagination pagination-sm">
                                        <% if (pagesBrands > 1) then 
                                            for i= 1 to pagesBrands
                                        %>
                                            <li class="page-item <%=checkPage(Clng(i)=Clng(pageBrands),"active")%>"><a class="page-link" href="management.asp?type=4&page=<%=i%>"><%=i%></a></li>
                                        <%
                                            next
                                            end if
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        <%end if%>
                    </div>
                    <div class="tabcontent" id="gallery">
                        <div class="mx-5 mt-5">
                            <!--#include virtual="models/gallery.asp"-->
                            <h2>Gallery:</h2>
                            <div class="goto_uploader">
                                <%
                                    Response.Write "<h4 class='goto_uploader__header'>Banner Location: </h4>" & Banner & "<br>"
                                %>
                                <a class="btn --btn-hv-red" href='/Images/BannerUpload.asp'>Change Banner</a>
                            </div> 
                            <div class="goto_uploader">
                                <h4 class='goto_uploader__header'>Store's carousel:</h4>
                                <%  Response.Write SlideImages.Count
                                    for each item in SlideImages
                                        Response.Write SlideImages(item)&"<br>"
                                    next
                                %>
                                <a class="btn --btn-hv-red" href='/Images/GalleryUpload.asp'>Carousel</a>
                            </div>
                        </div>
                    </div>
                    <div class="tabcontent" id="order">
                        <h1 class='content-header'>Orders Management</h1>
                        <%if (totalRowsOrders = 0) then%>
                            <h5>Nothing here</h5>
                        <%else%>
                            <form class="form-inline">
                            <div class="form-group mx-sm-3 mb-2">
                                <input type="text" class="form-control" id="search" placeholder="Input order number">
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">Search</button>
                            </form>
                            <div class="text-center">
                                <table class="table table-hover table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Create at</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Actions</th>
                                            <th scope="col">Order detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Set listOrders = Server.CreateObject("Scripting.Dictionary")
                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                            cmdPrep.ActiveConnection = connDB
                                            cmdPrep.CommandType = 1
                                            cmdPrep.Prepared = True
                                            cmdPrep.commandText = "select * from ORDERS order by id DESC offset "& CLng(offsetOrders) &" rows fetch next "& CLng(limit) &" row only"
                                            'offset "& CLng(offsetOrders) &" rows fetch next "& CLng(limit) &" row only
                                            set Result = cmdPrep.execute
                                            seq = 0
                                            do while not Result.EOF
                                                seq = seq + 1
                                                set order = New orders
                                                order.Id = Result("ID")
                                                order.Name = Result("RECEIVER_NAME")
                                                order.Phone = Result("RECEIVER_PHONE")
                                                order.Address = Result("RECEIVER_ADDRESS")
                                                order.CreateAt = Result("CREATED_AT")
                                                order.PromoValue = Result("PROMOTION_VALUE")
                                                order.Amount = Result("AMOUNT")
                                                order.Status = Result("STATUS")
                                                listOrders.add seq,order
                                                Result.MoveNext
                                            Loop
                                            Result.Close
                                            set Result = nothing
                                        %>
                                        <% for each item in listOrders %>
                                        <tr>
                                            <td><%=listOrders(item).Id%></td>
                                            <td><%=listOrders(item).Phone%></td>
                                            <td><%=listOrders(item).CreateAt%></td>
                                            <td class="current_format"><%=listOrders(item).Amount%></td>
                                            <td>
                                                <% 
                                                    if listOrders(item).Status = 0 then
                                                        %> <p id="OrderStatus<%=listOrders(item).Id%>" class="confirm">Processing</p> <%
                                                    elseif listOrders(item).Status = 1 then
                                                        %> <p id="OrderStatus<%=listOrders(item).Id%>" class="transit">Delivering</p> <%
                                                    elseif listOrders(item).Status = 2 then
                                                        %> <p id="OrderStatus<%=listOrders(item).Id%>" class="delivered">Delivered</p> <%
                                                    elseif listOrders(item).Status = 3 then
                                                        %> <p id="OrderStatus<%=listOrders(item).Id%>" class="cancel">Order cancelled</p> <%
                                                    end if
                                                %>
                                            </td>
                                            <td>
                                                <button class="btnAction" style="color:var()"
                                                <% 
                                                if (listOrders(item).Status = 2 or listOrders(item).Status = 3) then
                                                    %>disabled
                                                <%
                                                end if
                                                %> 
                                                id="ActionToggle<%=listOrders(item).Id%>" onClick="ToggleOrderStatus(<%=listOrders(item).Id%>)">
                                                    <i class="lni lni-spinner-arrow" style="margin:0;padding:0;font-size:1.5em"></i>
                                                </button>
                                                <button class="btnAction"
                                                <% 
                                                if (listOrders(item).Status = 2 or listOrders(item).Status = 3) then
                                                    %>disabled
                                                <%
                                                end if
                                                %> 
                                                id="ActionCancel<%=listOrders(item).Id%>" onClick="CancelOrder(<%=listOrders(item).Id%>)">
                                                    <i class="lni lni-cross-circle" style="margin:0;padding:0;font-size:1.5em"></i>
                                                </button>
                                            </td>
                                            <td class="text-center">
                                                <a style="color:black" href="./ManagmentFeatures/orderdetail.asp?id=<%=listOrders(item).Id%>"><i class = "lni lni-chevron-right-circle" style="margin:0;padding:0;font-size:1.5em"></i></a>
                                            </td>
                                        </tr>
                                        <% Next %>
                                    </tbody>
                                </table>
                                <nav aria-label="Page Navigation">
                                    <ul class="pagination pagination-sm">
                                        <% if (pagesOrders>1) then 
                                            for i= 1 to pagesOrders
                                        %>
                                            <li class="page-item <%=checkPage(Clng(i)=Clng(pageOrders),"active")%>"><a class="page-link" href="management.asp?type=6&page=<%=i%>"><%=i%></a></li>
                                        <%
                                            next
                                            end if
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        <%end if%> 
                    </div>
                    <div class="tabcontent" id="statistic">
                            <div class="top-products-wrapper">
                                <h4>Top product past 5 months</h4>
                                <div class="top-products">
                                    <%
                                        Set featuredProduct = Server.CreateObject("Scripting.Dictionary")
                                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                                        cmdPrep.ActiveConnection = connDB
                                        cmdPrep.CommandType = 1
                                        cmdPrep.Prepared = True
                                        'select 5 sản phẩm mới nhất theo ID và ảnh đầu tiên của nó
                                        cmdPrep.commandText = "select * from topProducts"
                                        set Result = cmdPrep.execute
                                        seq = 0
                                        do while not Result.EOF
                                            seq = seq + 1
                                            set product = New Products
                                            product.Id = Result("PRODUCT_ID")
                                            product.Name = Result("NAME")
                                            product.Price = Result("Frequency")
                                            product.Image = Result("img")
                                            featuredProduct.add seq,product
                                            Result.MoveNext
                                        Loop
                                        Result.Close
                                        set Result = nothing
                                    for each item in featuredProduct
                                    %> 
                                        <a class="new-product" href="/Security/productPageHandler.asp?id=<%=featuredProduct(item).Id%>">
                                            <%displaytopProduct featuredProduct(item)%>
                                        </a>
                                    <%next
                                    %>
                                </div>
                                <a class='ml-4 my-3 text-black' href="/ManagmentFeatures/productStatistics.asp">See more ></a>
                            </div>
                            <div id='orders' class="order_wrapper account__settings">
                                <div class="orderList">
                                    <h4>You have <%=getOrdersCount%> new order(s)</span></h4>
                                    <!--#include virtual="/UIcomponents/displayNewestOrders.asp"-->
                                </div>
                            </div>
                            <div class="chart">
                                <h4>Sales statistics for the last 5 months</h4>
                                <canvas id="chart"></canvas>
                                <a class='ml-3 my-3 text-black' href="/ManagmentFeatures/statistics.asp">See more ></a>
                            </div>
                    </div>
                    <div class="tabcontent" id="categories">
                        <h1 class='content-header'>Manage Categories</h1>
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Name</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                                        cmdPrep.ActiveConnection = connDB
                                        cmdPrep.CommandType = 1
                                        cmdPrep.Prepared = True
                                        cmdPrep.commandText = "SELECT * from CATEGORY"
                                        set Result = cmdPrep.execute
                                        do while not Result.EOF 
                                    %>  
                                            <tr>
                                                <td><%=Result("ID")%></td>
                                                <td><%=Result("NAME")%></td>
                                                <td><a class="btn btn-info" href="./ManagmentFeatures/editCategory.asp?id=<%=Result("ID")%>">Edit</a></td>
                                            </tr>
                                    <%
                                            Result.MoveNext
                                        loop
                                        Result.Close
                                        set Result = nothing
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
    <script src="/Resources/AdminLTE/dist/js/adminlte.min.js"></script>
    <script src="/Resources/chart.js-4.3.0/package/dist/chart.umd.js"></script>
    <script>
        function addOrEditBrand(){
            let nameBrand = document.getElementById('nameBrand').value;
            let imgBrand = document.getElementById('imgBrand').value;
            // if(!nameBrand){
            //     notification('empty brand name',"var(--bs-orange)")
            //     return;
            // }else{
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText == "Insert"){
                            notification('Insert Success',"var(--bs-green)")
                        }else{
                            if(this.responseText == "Update"){
                                notification('Update Success',"var(--bs-green)")
                            }else
                            notification('Submit Error, Brand name is not empty',"var(--bs-orange)")
                        }
                        setTimeout(() => {
                            window.location.href = "/management.asp?type=4";
                        }, 2000);
                    }
                };
                xmlhttp.open("POST", "/ManagmentFeatures/addOrEditBrand.asp?nameBrand="+nameBrand+"&imgBrand="+imgBrand, true);
                xmlhttp.send();
            // }

        }
    </script>
    <script>
        function openCity(evt, cityName) {
            // window.history.pushState("object or string", "Title", "/"+window.location.href.substring(window.location.href.lastIndexOf('/') + 1).split("?")[0]);
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" btn-active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " btn-active";
        }
        <%
            select case typeOfPage 
                case 1 
                %>
                document.getElementById("OpenManageProduct").click();
                <%
                case 2
                %>
                document.getElementById("OpenManageCustomer").click();
                <%
                case 3
                %>
                document.getElementById("OpenManagePromotion").click();
                <%
                case 4
                %>
                document.getElementById("OpenManageBrand").click();
                <%
                case 5
                %>
                  document.getElementById("OpenManageGallery").click();
                <%
                case 6
                %>
                  document.getElementById("OpenManageOrder").click();
                <%
                case 7
                %>
                  document.getElementById("OpenManageStatistic").click();
                <%
                case else
                %>
                    document.getElementById("OpenManageProduct").click();
                <%
            end select
        %>
    </script>
    <script>
        var localhostAddress = window.location.origin
        function toggleProductStatus(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText === "true") {
                        document.getElementById("status" + id).className = "btn btn-success";
                        document.getElementById("status" + id).innerHTML = "Open for sale";
                    } else {
                        document.getElementById("status" + id).className = "btn btn-danger";
                        document.getElementById("status" + id).innerHTML = "Closed";
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/ToggleProductAvailabilty.asp?id=" + id, true);
            xmlhttp.send();
        }
        function toggleUserStatus(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText === "true") {
                        document.getElementById("UserStatus" + id).className = "btn btn-success";
                        document.getElementById("UserStatus" + id).innerHTML = "Active";
                    } else {
                        document.getElementById("UserStatus" + id).className = "btn btn-danger";
                        document.getElementById("UserStatus" + id).innerHTML = "Block";
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/EditStatusUser.asp?id=" + id, true);
            xmlhttp.send();
        }
        function TogglePromotionStatus(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText === "true") {
                        document.getElementById("PromotionStatus" + id).className = "btn btn-success";
                        document.getElementById("PromotionStatus" + id).innerHTML = "Enable";
                    } else {
                        document.getElementById("PromotionStatus" + id).className = "btn btn-danger";
                        document.getElementById("PromotionStatus" + id).innerHTML = "Disable";
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/EditStatusPromotion.asp?id=" + id, true);
            xmlhttp.send();
        }
        function ToggleOrderStatus(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "1") {
                        document.getElementById("OrderStatus" + id).className = "transit";
                        console.log(document.getElementById("OrderStatus" + id));
                        document.getElementById("OrderStatus" + id).innerHTML = "Delivering";
                    } else if (this.responseText == "2" ){
                        document.getElementById("OrderStatus" + id).className = "delivered";
                        document.getElementById("OrderStatus" + id).innerHTML = "Delivered";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    } else if (this.responseText == "3" ){
                        document.getElementById("OrderStatus" + id).className = "cancel";
                        document.getElementById("OrderStatus" + id).innerHTML = "Order Cancelled";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/toggleOrderstatus.asp?id=" + id, true);
            xmlhttp.send();
        }
        function CancelOrder(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "3" ){
                        document.getElementById("OrderStatus" + id).className = "cancel";
                        document.getElementById("OrderStatus" + id).innerHTML = "Order cancelled";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/cancelOrder.asp?id=" + id, true);
            xmlhttp.send();
        }
        $(".showbtn").click(function () {
            $(this).toggleClass('rotate');
            $(this).closest(".order__header").next().next().slideToggle(300)
        })  
        $(document).ready(function() {
        $(".current_format").each(function() {
            var text = $(this).text();
            var formattedText = formatCurrencyVND(text);
            $(this).text(formattedText);
        });
        function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(amount)
        }
        });
    </script>
    <script>
        <%  Dim rowCount
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.Prepared = True
            'select 5 sản phẩm mới nhất theo ID và ảnh đầu tiên của nó
            cmdPrep.commandText = "select count(*) as rowcs from monthlySales"
            set Result = cmdPrep.execute
            if not Result.EOF then
                rowCount = Result("rowcs")
            end if
            set Result = nothing
            if rowCount > 0 then
        %>
            const chartdata = [
                <%
                    Set cmdPrep = Server.CreateObject("ADODB.Command")
                    cmdPrep.ActiveConnection = connDB
                    cmdPrep.CommandType = 1
                    cmdPrep.Prepared = True
                    'select 5 sản phẩm mới nhất theo ID và ảnh đầu tiên của nó
                    cmdPrep.commandText = "select top(5) * from monthlySales"
                    set Result = cmdPrep.execute
                    do while not Result.EOF
                        %> {months: <%=Result("Month")%> ,sales: <%=Result("TotalEarnings")%> }, <%
                        Result.MoveNext
                    loop
                    set Result = nothing
                %>
            ];
            new Chart(
                document.getElementById("chart"),{
                    type:'bar',
                    data:{  labels: chartdata.map(data=>data.months),
                            datasets: [{    label:"sales number",
                                            data: chartdata.map(data => data.sales),
                                            backgroundColor:'#a3000085', 
                                        }]}})
                                            
        <%end if%>
    </script>
  </body>
</html>