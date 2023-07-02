<!--#include file="../connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="listProducts.css">
    <title>Product list</title>
</head>
<body>
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <br>
    <div class="container">
        <h2>All product</h2>
    </div>
    <div class="main">
        <div class="left text-center">
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
                                <option value="<%=Result("ID")%>" <%if(trim(Result("NAME")) = Request.querystring("sendBrand")) then %> selected <%end if%>><%=Result("NAME")%></option>
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
                                <option value="<%=Result("ID")%>" <%if(trim(Result("NAME")) = Request.querystring("sendCategory")) then %> selected <%end if%>><%=Result("NAME")%></option>
                        <%
                                Result.MoveNext
                            loop
                            Result.Close
                            set Result = nothing
                        %>
                </select>
            </div>
        </div>
        <div class="right">
            <div id="prd" class="div-table">
            </div>
        </div>
    </div>
        <div id="pagination-container"></div>
<script>
    var currentPage = 1
    var totalPage = 0
    var brandId = 0 
    var categoryId = 0
    function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(amount)
    }
    var localhostAddress = window.location.origin;
    function render(object) {
        let htmlResult = "";
            object.list.forEach(item => {
                let price = formatCurrencyVND(item.price)
                htmlResult += "\
                <div class=\"itemProduct\">\
                    <div class=\"card-image\">\
                        <a href=\"productDetail.asp?id="+item.id+"\">\
                            <img class=\"img-card\" src="+item.img+">\
                        </a>\
                    </div>\
                    <div class=\"card-name\">\
                        <h3 class=\"product-name\">"+item.name+"</h3>\
                        <p class=\"product-price current_format\">"+price+"</p>\
                    </div>\
                </div>";
            });
        $('#prd').html("");
        $('#prd').append(htmlResult);
    }

    function getList() {
        brandId = $('#filterBrand').val()
        categoryId = $('#filterCategory').val()
        $.ajax({
            url: localhostAddress + "/ShoppingFeature/showAllProducts.asp",
            data:{currentPage,brandId,categoryId},
            method: "GET",
            success: function (result) {
                var obj = result
                totalPage = result.totalPage
                render(obj)
                createPagination(totalPage)
                setActivePage()
            }
        })
    }
    function filter(brandId, categoryId) {
        brandId = $('#filterBrand').val()
        categoryId = $('#filterCategory').val()
        currentPage = 1
        getList();
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
        function createPagination(totalPage) {
        var previousPage = currentPage - 1;
        var nextPage = currentPage + 1;
        var paginationHTML = `<nav aria-label="Page navigation example" class="mt-5">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                                      <a class="page-link" href="#" ${currentPage !== 1 ? `onclick="setPage(${previousPage})"` : ''}>Previous</a>
                                    </li>`;
        for (var i = 1; i <= totalPage; i++) {
            if (i === currentPage) {
                paginationHTML += `<li class="page-item active">
                                    <a class="page-link" href="#" onclick="setPage(${i})">${i}</a>
                                   </li>`;
            } else {
                paginationHTML += `<li class="page-item">
                                    <a class="page-link" href="#" onclick="setPage(${i})">${i}</a>
                                   </li>`;
            }
        }
        paginationHTML += `<li class="page-item ${currentPage === totalPage ? 'disabled' : ''}">
                              <a class="page-link" href="#" ${currentPage !== totalPage ? `onclick="setPage(${nextPage})"` : ''}>Next</a>
                           </li>
                         </ul>
                        </nav>`;
        $("#pagination-container").html(paginationHTML)
    }

    function setActivePage() {
        let paginationItems = $('.page-item');
        $('.page-item').each(function (item) {
            item.removeClass('active');
        });
        var currentPageItem = $(`.page-item:nth-child(${currentPage + 1})`);
        currentPageItem.allClass('active');
    }

    function setPage(page) {
        if (page < 1) {
            currentPage = 1;
        } else if (page > totalPage) {
            currentPage = totalPage;
        } else {
            currentPage = page;
        }
        getList();
    }
</script>
</body>
</html>
