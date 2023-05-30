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
                        <h3>"+item.name+"</h3>\
                        <h5 class='cs'>"+item.price+"</h5>\
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
    });
</script>
</body>
</html>
