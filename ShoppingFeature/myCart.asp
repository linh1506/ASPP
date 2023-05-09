<!--#include file="../connect.asp"-->
<!--#include file="../models/product_cart.asp"-->
<!--#include file="../ShoppingFeature/filterAvailable.asp"-->
<%
Set listProductInCart = Server.CreateObject("Scripting.Dictionary")
dim view1,view2
if (not isempty(Session("Mycart"))) then 
    view1 = "d-none"
    view2 = "d-block"
    dim cart
    Session("Mycart") = filterAvailable(Session("Mycart"))
    cart = Session("Mycart")
    dim seq
    seq = 0
    For i = 0 to UBound(cart)-1
      'Get id of each item
      dim idProduct
      idProduct = cart(i)(0)

      dim cmdPrep, result
      set cmdPrep = Server.CreateObject("ADODB.Command")
      cmdPrep.ActiveConnection = connDB
      cmdPrep.CommandType = 1
        
      cmdPrep.commandText = "SELECT ID , NAME , IS_AVAILABLE, PRICE , JSON_VALUE(PRODUCT_IMAGE, '$.""0""') AS IMG FROM PRODUCT WHERE ID=" & idProduct
      set result = cmdPrep.execute
      set product = New product_cart
      product.Id = Result("ID")
      product.Name = Result("NAME")
      product.Status = Result("IS_AVAILABLE")
      product.Image = Result("IMG")
      product.Price = Result("PRICE")
      product.Size = cart(i)(1)
      cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE SIZE="&  cart(i)(1)  &" AND PRODUCT_ID=" & idProduct
      set result = cmdPrep.execute
      product.LimitQuantity = result("QUANTITY")
      product.Quantity = cart(i)(2)

      seq = seq + 1
      listProductInCart.add seq,product
    Next
    Else
      view1 = "d-block"
      view2 = "d-none"
end if
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link
      rel="stylesheet"
      href="../bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="myCart.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    </head>
  <body>
    <!--#include file="./notifyDeleteItemsNotAvailable.asp"-->
    
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="../UIcomponents/notification.asp"-->
    <nav style="z-index:1" class = 'navbar sticky-top navbar-light navbar-custom flex-row'>
    <div class="d-flex flex-row container-custom">
        <a class ="nav-link active" href="#"  onclick="history.go(-1); return false;"><i style="font-size:20px" class="lni lni-arrow-left"></i></a>
        <div class="page-address">
            <a href="#" class = "nav-link address">Quay lại</a>
        </div>
    </div>
    </nav>
    <div class="container">
      <div class="row">
      <div class="col-12">
        <h5 class="mt-3 text-center text-body-secondary <%= view1 %>">Bạn không có sản phẩm nào trong giỏ hàng.</h5> 
      </div>
      <!-- Cột danh sách sản phẩm trong giỏ hàng -->
      <div class="col-8">
      <% if (not IsEmpty(listProductInCart) or listProductInCart.Count = 0) then %>
        <% for each item in listProductInCart %>
          <div id="InCartItem<%=item%>" class="CartItem">
            <% if listProductInCart(item).Status = false then %><span style="color:Red">NOT Openning for sale</span><% end if %></h2>
            <div class="row mb-4 d-flex justify-content-between align-items-center">
            <!--<p>Name of Product: <%=listProductInCart(item).name%></p>-->
            <!-- Ảnh -->
            <div class="col-2">
                      <img
                        src="<%=listProductInCart(item).Image%>"
                        class="img-fluid rounded-3" alt="Fumo">
            </div>
            <!-- Tên và size -->
            <div class="col-2 ft">
              <h6 class="text-muted"><%=listProductInCart(item).name%></h6>
              <h6 class="text-black mb-0">Size: <%=listProductInCart(item).size%></h6>
            </div>
            <!-- Giá -->
            <!--<p>Size: <%=listProductInCart(item).size%></p>-->
            <div class="col-2">
                <p>Price: <span id="PriceItem<%=item%>"><%=listProductInCart(item).price%> VNĐ</span></p>
            </div>
            <!-- Số lượng -->
            <!--<p>Price: <span id="PriceItem<%=item%>"><%=listProductInCart(item).price%></span></p>-->
            <div class="col-2">
            <p>Quantity: 
              <input type="number" value="<%=listProductInCart(item).quantity%>" id="Quantity<%=item%>" onChange="AdjustQuantity(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)" min="1" max="<%=listProductInCart(item).LimitQuantity%>">
              <i>/<%=listProductInCart(item).LimitQuantity%> product<% if (listProductInCart(item).LimitQuantity > 1) then Response.Write("s") %> left</i>
            </p>
            </div>
            <!-- Xoá sản phẩm khỏi giỏ hàng -->
            <div class="col-2">
            <button class="btn btn-danger btn-delete" onClick="DeleteProductInCart(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)">Delete</button>
            </div>
            </div>
          </div>
          <hr class="my-4">
        <% next %>
      <%
        else %>
          <h4>Bạn chưa thêm sản phẩm nào vào giỏ hàng, vui lòng quay trở về trang chủ</h4>
        <% end if
      %>
      </div>
      <!-- Cột đặt mua-->
      <div class="col-4 <%=view2%>">
                 <div class="mb-5">
                    <div class="form-outline">
                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea2">Enter your code</label>
                    </div>
                  </div>
                  <hr class="my-4">
                  
                  <!-- Tính giá tiền của tất cả sản phẩm trong giỏ hàng -->
                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Total price:</h5>
                    <div id="SubTotalElement " style="justify-content:center">
                      <p id="SubTotal"></p>
                    </div>
                  </div>
                  <div class="row">
                    <button type="button" class="btn btn-purchase btn-lg"
                      data-mdb-ripple-color="dark">Purchase</button>
                  </div>
        </div>
      </div>
    </div>
    
    <script>
      var localhostAddress = window.location.origin
      $("#NothingInCart").hide();
      function checkNullInCart() {
        if ($(".CartItem").length === 0) {
          $("#SubTotalElement").hide();
          $("#NothingInCart").show();
        }
      }
      function DeleteProductInCart(ItemId,ProductId,Size) {
        console.log("Deleted")
        var element = document.getElementById("InCartItem"+ItemId);
        element.remove();
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              notification(''+this.responseText,"var(--bs-orange)")
            }
        };
        xmlhttp.open("GET", localhostAddress + "/ShoppingFeature/deleteItemInCart.asp?idProduct="+ProductId+"&size="+Size, true);
        xmlhttp.send();
        GetSubTotal()
        checkNullInCart()
      }

      function AdjustQuantity(ItemId,ProductId,Size) {
        var element = document.getElementById("Quantity"+ItemId);
        var Quantity = element.value
        var xmlhttp = new XMLHttpRequest();
        // console.log(localhostAddress + "/ShoppingFeature/adjustQuantity.asp?idProduct="+ProductId+"&size="+Size+"&quantity="+Quantity)
        xmlhttp.open("GET", localhostAddress + "/ShoppingFeature/adjustQuantity.asp?idProduct="+ProductId+"&size="+Size+"&quantity="+Quantity, true);
        xmlhttp.send();
        GetSubTotal()
        checkNullInCart()
      }
      function GetSubTotal() {
        var count = <%=listProductInCart.Count%>
        var subTotal = 0
        for (var item = 1; item <= count; item++) {
          if (document.getElementById("InCartItem"+item) === null){
            continue
          } else {
            subTotal += (parseInt(document.getElementById("PriceItem"+item).innerHTML) * parseInt(document.getElementById("Quantity"+item).value))
          }
        }
        document.getElementById("SubTotal").innerHTML = subTotal + "đ"
      }
      
      GetSubTotal()
      checkNullInCart()
    </script>
    <!--#include file="../UIcomponents/footer.asp"-->
  </body>
</html>