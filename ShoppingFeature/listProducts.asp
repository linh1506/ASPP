<!--#include file="../connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="listProducts.css">
</head>
<body>
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <br>
    <div class="container">
        <h3>Tất cả sản phẩm</h3>
    </div>
    <br>
    <div>
        Which brand is your choice ?
        <br>
        <select name="filterBrand" id="filterBrand">
            <option value="0">All</option>
            <%
                dim cmdPrep
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "SELECT * FROM BRAND"
                Set Result = cmdPrep.execute 
                do while not Result.EOF
            %>
                    <option value="<%=Result("ID")%>"><%=Result("NAME")%></option>
            <%
                    Result.MoveNext
                loop
                Result.Close
                set Result = nothing
            %>
        </select>
    </div>
    <div>
        Which category is your choice ?
        <br>
        <select name="filterCategory" id="filterCategory">
            <option value="0">All</option>
            <%
                cmdPrep.CommandText = "SELECT * FROM CATEGORY"
                Set Result = cmdPrep.execute 
                do while not Result.EOF
            %>
                    <option value="<%=Result("ID")%>"><%=Result("NAME")%></option>
            <%
                    Result.MoveNext
                loop
                Result.Close
                set Result = nothing
            %>
        </select>
    </div>
    <div id="prd" class="container container-list">
    </div>


    <div class="container">
        <br>
        <h3>Tất cả sản phẩm</h3>
        <br>
    </div>
    <div>
        <div class="row">
            <div class="col-3 text-center">
                <div>
                    Which brand is your choice ?
                    <br>
                    <select name="filterBrand" id="filterBrand">
                        <option value="0">All</option>
                        <%
                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                            cmdPrep.ActiveConnection = connDB
                            cmdPrep.CommandType = 1
                            cmdPrep.Prepared = True
                            cmdPrep.CommandText = "SELECT * FROM BRAND"
                            Set Result = cmdPrep.execute 
                            do while not Result.EOF
                        %>
                                <option value="<%=Result("ID")%>"><%=Result("NAME")%></option>
                        <%
                                Result.MoveNext
                            loop
                            Result.Close
                            set Result = nothing
                        %>
                    </select>
                </div>
            </div>
            <div class="col-9">
                <div class="product-container">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="http://"><img src="https://m.media-amazon.com/images/I/513MIC5OULL.jpg" alt=""></a>
                        </div>
                        <br>
                        <div>
                            <div class='product-name'>sdsdasdasdsajkdhasjkdjkashdjkas</div>
                            <div class='product-price'>hehe</div>
                        </div>
                    </div>
                    <div class="product-card">
                        <div class="product-img">
                            <a href="#"><img src="https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgkv8DGuQh6hOppT4GYHy85I3m4tI96HdyDZR5KCq99Wakw7-cEp8PdaeDJ7CgWU8U2olr-DBnR9w3-c9sw_XxXSCRgdcyN9JUvW5FVPrqofkV_lhPD85khg&usqp=CAE" alt=""></a>
                        </div>
                        <div class='product-name'>Hehe</div>
                        <div class='product-price'>hehe</div>
                    </div>
                    <div class="product-card">
                        <div class="product-img">
                            <a href="#"><img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0030f99e-f45d-4042-b3e1-669952e3c24e/air-force-1-07-flyease-shoes-LKXPhZ.png" alt=""></a>
                        </div>
                        <div class='product-name'>Hehe</div>
                        <div class='product-price'>hehe</div>
                    </div>
                    <div class="product-card">
                        <div class="product-img">
                            <a href="#"><img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0030f99e-f45d-4042-b3e1-669952e3c24e/air-force-1-07-flyease-shoes-LKXPhZ.png" alt=""></a>
                        </div>
                        <div class='product-name'>Hehe</div>
                        <div class='product-price'>hehe</div>
                    </div>
                    <div class="product-card">
                        hihi
                    </div>
                </div>
            </div>
        </div>
    </div>





<script>
    var localhostAddress = window.location.origin;

    function render(object) {
        let htmlResult = "";
            object.list.forEach(item => {
                htmlResult += "\
                <div class=\"itemProduct\">\
                    <div class=\"ic\">\
                        <a href=\"productDetail.asp?id="+item.id+"\">\
                            <img class=\"img-card\" src="+item.img+">\
                        </a>\
                    </div>\
                    <div class=\"cd\">\
                        <h3 class=\"text-name\">"+item.name+"</h3>\
                        <p class=\"cs\">"+item.price+"</p>\
                    </div>\
                </div>";
            });
        $('#prd').append(htmlResult);
    }

    function getList() {
        $.ajax({
            url: localhostAddress + "/ShoppingFeature/showAllProducts.asp",
            method: "GET",
            success: function (result) {
                var obj = result
                console.log(obj);
                render(obj);
            }
        })
    }
    function filter(brandId, categoryId) {
        $.ajax({
            url: localhostAddress + "/ShoppingFeature/showAllProducts.asp?brandid=" + brandId + "&categoryid=" + categoryId,
            method: "GET",
            success: function (result) {
                var obj = result
                console.log(obj);
                $(".itemProduct").remove();
                render(obj);
            }
        })
    }
    $(function () {
        getList();
    });
    $(document).ready(function() {
        $("#filterBrand").change(function() {
            var brandSelected = $(this).children("option:selected").val();
            console.log("Brand " + brandSelected);
            var categorySelected = $("#filterCategory").children("option:selected").val();
            console.log("Category " + categorySelected);

            filter(brandSelected, categorySelected);
        });
        $("#filterCategory").change(function() {
            var categorySelected = $(this).children("option:selected").val();
            console.log("Category " + categorySelected);
            var brandSelected = $("#filterBrand").children("option:selected").val();
            console.log("Brand " + brandSelected);

            filter(brandSelected, categorySelected);
        });
        $(".cs").each(function() {
            var text = $(this).text();
            var formattedText = formatCurrencyVND(text);
            $(this).text(formattedText);
        });
        function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(amount)
        }
    });
</script>
</body>
</html>
