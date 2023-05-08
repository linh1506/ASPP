<!--#include file="../connect.asp"-->
<%  Dim requested_id
    requested_id = Request.QueryString("id")
%>
<%  'Lay anh san pham
    dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.CommandText = "SELECT j.[key], j.[value] FROM PRODUCT t CROSS APPLY OPENJSON(t.PRODUCT_IMAGE) j where ID = ?"
    cmdPrep.parameters.Append cmdPrep.createParameter("id",3,1, ,requested_id)
    set Result = cmdPrep.execute
    Dim product_Images()
    dim array_length_counter
    array_length_counter = 0
    do while not Result.EOF
        Redim Preserve product_Images(array_length_counter)
        product_Images(array_length_counter) = Result("value")
        array_length_counter = array_length_counter + 1
        Result.MoveNext
    loop
    Result.Close
    set Result = nothing
%>
<%  'Lay size san pham
    Dim  available_sizes()
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.CommandText = "select SIZE from PRODUCT_SIZE where PRODUCT_ID= ? and QUANTITY > 0 "
    cmdPrep.parameters.Append cmdPrep.createParameter("id",3,1, ,requested_id)
    set Result = cmdPrep.execute
    dim sizes_count
    sizes_count = 0
    do while not Result.EOF
        Redim Preserve available_sizes(sizes_count)
        available_sizes(sizes_count) = Result("SIZE")
        sizes_count = sizes_count + 1
        Result.MoveNext
    loop
    Result.Close
    set Result = nothing
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/bootstrap-5.2.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/Resources/swiper-9.2.4/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="/UIcomponents/ShoppingHeader.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/ShoppingFeature/productDetail.css">
    <link rel="stylesheet" href='../UIcomponents/notification.css'>

    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Thong tin san pham</title>
</head>
<body>
<%  'Lấy thông tin sản phẩm
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.commandText = "select * from (SELECT ID,BRAND_ID as brand,CATEGORY_ID as category,DESCRIPTION, PRICE, NAME, IS_AVAILABLE,  JSON_VALUE(PRODUCT_IMAGE, '$.""0""') AS img FROM PRODUCT) subquery where ID =?"
    cmdPrep.parameters.Append cmdPrep.createParameter("id",3,1, ,requested_id)
    set Result = cmdPrep.execute
    seq = 0
    dim brandId
    dim categoryId
    dim product_description
    do while not Result.EOF
        set product = New Products
        product.Id = Result("ID")
        product.Name = Result("NAME")
        product.Price = Result("PRICE")
        product.Status = Result("IS_AVAILABLE")
        product.Image = Result("img")
        brandId = Result("brand")
        categoryId = Result("category")
        product_description = Result("DESCRIPTION")
        Result.MoveNext
    Loop
    Result.Close
    set Result = nothing
%>
<!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="../UIcomponents/notification.asp"-->

    <div class="container">
        <div class="product">
            <div class="swiper product__images">
                <div class="swiper-wrapper">
                    <%  for each image in product_Images
                            %><div class="swiper-slide"><img src="<%=image%>" alt=""></div><%
                        next
                    %>
                </div>
                <div class="swiper-pagination slide_btn"></div>
            </div>
            <div class="product__info">
                <h1 class='product__title'><%=product.Name%></h1>
                <div class="product__available-sizes">
                    <%
                        for each item in available_sizes
                            %> <div class="product__size product__size--bdr-black"><div class="value"><%=item%></div></div> <%
                        next
                    %>
                    <script>
    // Function to select only one size at a time
                        function selectSize(element) {
                            var selectedSize = element.textContent.trim();
                            var sizes = document.getElementsByClassName("product__size");
                            for (var i = 0; i < sizes.length; i++) {
                                sizes[i].classList.remove("selected");
                            }
                            element.classList.add("selected");
                        }
                        // Add event listeners to the size buttons
                        var sizes = document.getElementsByClassName("product__size");
                        for (var i = 0; i < sizes.length; i++) {
                            sizes[i].addEventListener("click", function() {
                                selectSize(this);
                            });
                        }
                    </script>
                </div>
                <div class='product__Status<%
                    If product.Status = True Then
                        %> product__Status--green'><span>&#x2022;</span> <h4>Còn hàng</h4><%
                    Else
                        %> product__Status--red'><span>&#x2022;</span> <h4>Hết Hàng</h4><%
                    End if
                %></div>
                <div class="product__purchase_options">
                    <a href=""  class="purchase__options purchase__options--red">Mua Ngay</a>
                    <button onclick="addCart()" class="purchase__options purchase__options--black"><p>Thêm vào Giỏ Hàng</p><span><i class='lni lni-cart'></i></span></button>
                </div>
                <div class="product__detail">
                    <h4>Nhãn hiệu: <%=findBrand(brandId)%></h4>
                    <h4>Danh mục: <%=findCategory(categoryId)%></h4>
                </div>
            </div>
        </div>
        <div class="description">
            <h2>Thông tin chi tiết sản phẩm</h2>
            <p><%=product_description%></p>
        </div>
        <h2 class='gallery-header'>Các hình ảnh của sản phẩm</h2>
        <div class="swiper gallery">
            <div class="swiper-wrapper">
                <%  
                    for each item in product_Images
                        %>
                            <div class="swiper-slide gallery__item">
                                <img src="<%=item%>" alt="">
                            </div>
                        <%
                    next
                %>
            </div>
            <div class="swiper-button-next nav_btn"></div>
            <div class="swiper-button-prev nav_btn"></div>
            <div class="swiper-pagination swiper-pagination2"></div>
        </div>

        <div class="shoe-size-chart">
            <h2>Bảng size giày</h2>
            <img src="/Resources/sizechart.jpg" alt="">
        </div>

    </div>
            
<!--#include file="../UIcomponents/footer.asp"-->
<script src='/Resources/swiper-9.2.4/package/swiper-bundle.min.js'></script>
<script>
    var swiper = new Swiper(".product__images", {
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    },
    pagination: {
        el: ".slide_btn",
        dynamicBullets: true,
    },
    });
    var gallery = new Swiper(".gallery", {
        slidesPerView: "auto",
        spaceBetween: 10,
        pagination: {
            el: ".swiper-pagination2",
            clickable: true,
            },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    var localhostAddress = window.location.origin
    function addCart() {
        var sizeSelected = $(".selected .value").html()
        sizeSelected = parseInt(sizeSelected)
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                notification(''+this.responseText,'var(--bs-orange)')
            }
        };
        xmlhttp.open("GET", localhostAddress + "/ShoppingFeature/addcart.asp?idproduct=" + <%=product.Id%> + "&size=" + sizeSelected + "&quantity=1", true);
        xmlhttp.send();    
    }
</script>
</body>
</html>