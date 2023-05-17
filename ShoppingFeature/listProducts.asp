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
</head>
<body>
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <div class="container">
        <div id ="prd" class="row row-cols-1 row-cols-md-6 g-4">
            <div class="col">
                <div class="card">
                    <img src="https://mdbcdn.b-cdn.net/img/new/standard/city/044.webp" class="card-img-top" alt="Skyscrapers" />
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">
                            This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                        </p>
                    </div>
                </div>
            </div>
        </div>
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
                    htmlResult += "
                    <div class="'col'">\
                        <div class="'card'">\
                            <img src='"+item.img+"'/>\
                        <div class="'card-body'">\
                            <h5 class="'card-title'">"+item.name+"</h5>\
                        <p class="'card-text'">"+item.price+"</p>\
                        </div>\
                        </div>\
                    </div>\    
                    " ; 
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