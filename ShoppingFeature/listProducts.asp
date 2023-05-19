<!--#include file="../connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Document</title>
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
    <div id="prd" class="container container-list">
    </div>
    
<script>
    var localhostAddress = window.location.origin;
    function getList() {
        $.ajax({
            url: localhostAddress + "/ShoppingFeature/showAllProducts.asp",
            method: "GET",
            success: function (result) {
                var obj = result
                console.log(obj);
                let htmlResult = "";
                obj.list.forEach(item => {
                    htmlResult += "\
                    <div>\
                        <div class=\"ic\">\
                            <a href=\"productDetail.asp?id="+item.id+"\">\
                                <img class=\"img-card\" src="+item.img+">\
                            </a>\
                        </div>\
                        <div class=\"cd\">\
                            <h3>"+item.name+"</h3>\
                            <h5>"+item.price+" đ</h5>\
                        </div>\
                    </div>";
                });
                $('#prd').append(htmlResult);
            }
        })
    }
    $(function () {
        getList();
    });
</script>
</body>
</html>
