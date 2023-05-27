<!--#include file="./connect.asp"-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="./bootstrap-5.2.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/Resources/swiper-9.2.4/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="./UIcomponents/ShoppingHeader.css">
    <link rel="stylesheet" href="./home.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/UIcomponents/product_card.css">
    <link rel="stylesheet" href="/UIcomponents/category_card.css">
    <title>ODBG</title>
  </head>
  <body>
    <!--#include file="./UIcomponents/pageLoader.asp"-->
    <!--#include file="./UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="./UIcomponents/product_card.asp"-->
    <!--#include file="./UIcomponents/category_card.asp"-->
    <!--#include file="./models/gallery.asp"-->
      <div class="container-fluid-custom">
        <div class="shop-banner"><img src="<%=Banner%>" alt=""></div>
        <% if Gallery.Count >0 Then %>
        <div class="swiper slideshow">
            <div class="swiper-wrapper">
              <% for each item in Gallery %>
                <div class="swiper-slide"><img src="<%= Gallery(item) %>" alt=""></div>
              <% next %>
            </div>
            <div class="swiper-button-next slide_btn"></div>
            <div class="swiper-button-prev slide_btn"></div>
        </div>
        <%End if%>
      </div>
      <div class="container">
        <div class="category-display">
          <div class="category-display-header">Bạn Đang Mua Sắm Cho Ai?</div>
            <div class="category-display-list">
              <% for i = 1 to 3
                  %><a href="#" class='category-item'><%
                    displayCategory listCategory(i)
                  %></a><%
                  next
              %>  
            </div>
          <a class="category-display-footer">Xem tất cả các danh mục ></a>
        </div>
        <div class="new-product-display">
          <h2 class='category-display-header'>Các Sản Phẩm Mới</h3>
          <div class="new-product-list">
              <%
                Set featuredProduct = Server.CreateObject("Scripting.Dictionary")
                dim cmdPrep
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                'select 5 sản phẩm mới nhất theo ID và ảnh đầu tiên của nó
                cmdPrep.commandText = "select top 5 * from (SELECT ID, PRICE, NAME, IS_AVAILABLE,  JSON_VALUE(PRODUCT_IMAGE, '$.""0""') AS img FROM PRODUCT) subquery where IS_AVAILABLE = 1 order by ID desc"
                set Result = cmdPrep.execute
                seq = 0
                do while not Result.EOF
                    seq = seq + 1
                    set product = New Products
                    product.Id = Result("ID")
                    product.Name = Result("NAME")
                    product.Price = Result("PRICE")
                    product.Status = Result("IS_AVAILABLE")
                    product.Image = Result("img")
                    featuredProduct.add seq,product
                    Result.MoveNext
                Loop
                Result.Close
                set Result = nothing
                'IN ra danh sách product mới
                for each item in featuredProduct
                  %> 
                    <a class="new-product" href="/Security/productPageHandler.asp?id=<%=featuredProduct(item).Id%>">
                    <%displayProduct featuredProduct(item)%>
                    </a>
                  <%next%>
          </div>
        </div>
        <div class="see-more">
          <h3>vẫn còn nhiều thứ hay ho nữa</h3>
          <a href="">KHÁM PHÁ THÊM</a>
        </div>
      </div>
  <!-- Footer -->
    <!--#include file="./UIcomponents/footer.asp"-->
  <!-- Footer -->
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
    <script src='./bootstrap-5.2.0-dist/js/bootstrap.min.js'/></script>
    <script src='/Resources/swiper-9.2.4/package/swiper-bundle.min.js'></script>
    <script>
      var swiper = new Swiper(".slideshow", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
  </script>
  </body>
</html>