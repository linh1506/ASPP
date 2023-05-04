<!--#include file="./connect.asp"-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link
      rel="stylesheet"
      href="./bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="/Resources/swiper-9.2.4/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="./UIcomponents/ShoppingHeader.css">
    <link rel="stylesheet" href="./home.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/UIcomponents/product_card.css">
    <link rel="stylesheet" href="/UIcomponents/category_card.css">
  </head>
  <body>
    <!--#include file="./models/category.asp"-->
    <!--#include file="./models/brands.asp"-->
    <!--#include file="./models/products.asp"-->
    <!--#include file="./UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="./UIcomponents/product_card.asp"-->
    <!--#include file="./UIcomponents/category_card.asp"-->
      <div class="container-fluid-custom">
        <div class="shop-banner"><img src="/Resources/banner3.png" alt=""></div>
        <div class="swiper slideshow">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/92a774157325607.63768ffc717ea.jpg" alt=""></div>
                <div class="swiper-slide"><img src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/c5f87e147486429.62c39ec35694d.jpg" alt=""></div>
                <div class="swiper-slide"><img src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/22e2a1111795411.601da00d3bd52.png" alt=""></div>
                <div class="swiper-slide"><img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/b7f369150879029.630261a7c5e2f.jpg" alt=""></div>
            </div>

            <div class="swiper-button-next slide_btn"></div>
            <div class="swiper-button-prev slide_btn"></div>
        </div>
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
                    %> <a class="new-product"><%
                          displayProduct featuredProduct(item)
                    %></a>
                <%next
              %>
          </div>
        </div>
        <div class="see-more">
          <h3>vẫn còn nhiều thứ hay ho nữa cơ</h3>
          <a href="">KHÁM PHÁ THÊM</a>
        </div>
      </div>
  <!-- Footer -->
      <footer class="text-center text-white footer" style="background-color: var(--secondary)">
        <!-- Grid container -->
        <div class="container">
          <!-- Section: Links -->
          <section class="mt-5">
            <!-- Grid row-->
            <div class="row text-center d-flex justify-content-center pt-5">
              <!-- Grid column -->
              <div class="col-md-2">
                <h6 class="text-uppercase font-weight-bold">
                  <a href="#!" class="text-white">About us</a>
                </h6>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-2">
                <h6 class="text-uppercase font-weight-bold">
                  <a href="#!" class="text-white">Products</a>
                </h6>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-2">
                <h6 class="text-uppercase font-weight-bold">
                  <a href="#!" class="text-white">Awards</a>
                </h6>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-2">
                <h6 class="text-uppercase font-weight-bold">
                  <a href="#!" class="text-white">Help</a>
                </h6>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-2">
                <h6 class="text-uppercase font-weight-bold">
                  <a href="#!" class="text-white">Contact</a>
                </h6>
              </div>
              <!-- Grid column -->
            </div>
            <!-- Grid row-->
          </section>
          <!-- Section: Links -->

          <hr class="my-5" />

          <!-- Section: Text -->
          <section class="mb-5">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-8">
                <p class="text-white">
                  Đúng vậy, chúng tôi bán giầy
                </p>
              </div>
            </div>
          </section>
          <!-- Section: Text -->

          <!-- Section: Social -->
          <section class="text-center mb-5">
            <a href="https://www.facebook.com/profile.php?id=100008553451184" class="text-white me-4">
              <i class="lni lni-facebook"></i>
            </a>
            <a href="google.com" class="text-white me-4">
              <i class="lni lni-google"></i>
            </a>
            <a href="https://steamcommunity.com/id/d1agn0ze/" class="text-white me-4">
              <i class="lni lni-steam"></i>
            </a>
            <a href="https://github.com/linh1506/ASPP" class="text-white me-4">
              <i class="lni lni-github"></i>
            </a>
          </section>
          <!-- Section: Social -->
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
        >
          © 2023 Copyright:
          <a class="text-white" href="/"
            >odbg.com</a
            >
        </div>
        <!-- Copyright -->
      </footer>
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