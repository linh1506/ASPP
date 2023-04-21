<!--#include file="connect.asp"-->
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

    limit = 2

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

    strSQL = "SELECT COUNT(ID) AS count FROM USERS"
    Set CountResult = connDB.execute(strSQL)
    totalRowsUsers = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesUsers = Ceil(totalRowsUsers/limit)

    typeOfPage = Request.QueryString("type")
    if (trim(typeOfPage) = "") or (isnull(typeOfPage)) then
        ' type of page de trong thi set 1
        typeOfPage = 4
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

            if (CInt(pageProducts) > pagesProducts) then
                pageProducts = pagesProducts
            end if
        Case 2
            pageProducts = 1
            pageUsers = page
            pagePromotions = 1

            if (CInt(pageUsers) > pagesUsers) then
                pageUsers = pagesUsers
            end if

        Case 3
            pageProducts = 1
            pageUsers = 1
            pagePromotions = page

            if (CInt(pagePromotions) > pagesPromotions) then
                pagePromotions = pagesPromotions
            end if

        Case Else
            pageProducts = 1
            pageUsers = 1
            pagePromotions = 1
    End Select

    offsetProducts = (Clng(pageProducts) * Clng(limit)) - Clng(limit)
    offsetPromotions = (Clng(pagePromotions) * Clng(limit)) - Clng(limit)
    offsetUsers = (Clng(pageUsers) * Clng(limit)) - Clng(limit)
    
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./stylelogin.css" />
    <link rel="stylesheet" href="./Resources/web-font-files/lineicons.css">
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
  </head>
  <body>
  <!--#include file="header.asp"-->
    <div class="sidetab">
        <button class="tablinks" onclick="openCity(event, 'products')" id="OpenManageProduct">Manage Products</button>
        <button class="tablinks" onclick="openCity(event, 'customers')" id="OpenManageCustomer">Manage Customers</button>
        <button class="tablinks" onclick="openCity(event, 'promotions')" id="OpenManagePromotion">Manage Promotions</button>
    </div>
    <div class="container">
        <div id="products" class="tabcontent table-responsive">
            <h1>Manage Products</h1>
            <div class="Product-Feature-row">
                <a href="./ManagmentFeatures/addproduct.asp" class="btn btn-primary">ADD PRODUCT</a>
                <a href="../management.asp?sorttype=1" class="btn btn-warning <%if sorttype=1 then %>disabled<%end if%>" role="button" aria-disabled="true">Sort by ID</a>
                <a href="../management.asp?sorttype=2" class="btn btn-warning <%if sorttype=2 then %>disabled<%end if%>" role="button" aria-disabled="true"">Sort by Name (Ascending)</a>
                <a href="../management.asp?sorttype=3" class="btn btn-warning <%if sorttype=3 then %>disabled<%end if%>" role="button" aria-disabled="true"">Sort by Price (Asending)</a>
            </div>
            
            <table class="table table-dark table-hover table-responsive">
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
                        dim cmdPrep
                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType = 1
                        cmdPrep.Prepared = True
                        cmdPrep.commandText = "select * from PRODUCT order by "& sortProducts &" offset "& CLng(offsetProducts) &" rows fetch next "& CLng(limit) &" row only"
                        set Result = cmdPrep.execute
                        do while not Result.EOF
                    %>
                    <tr>
                            <td><%=Result("ID")%></td>
                            <td><%=Result("NAME")%></td>
                            <td><%=Result("PRICE")%></td>
                            <td>
                                <a href="./ManagmentFeatures/ToggleProductAvailabilty.asp?id=<%=Result("ID")%>&page=<%=Page%>&type=<%=typeOfPage%>&sorttype=<%=sorttype%>" class="btn 
                                <%if(Result("IS_AVAILABLE") = true) then%>
                                    btn-success">Open For Sale
                                    <%else%>
                                    btn-danger">Closed
                                <%end if%>
                                </a>
                            </td>
                            <td>
                                <a class="edit-product-button" href="./ManagmentFeatures/editProduct.asp?id=<%=Result("ID")%>&page=<%=page%>&sorttype=<%=sorttype%>">
                                    <i class = "lni lni-pencil-alt" style="margin:0;padding:0;color:#f3f3f3;font-size:1.5em"></i>
                                </a>
                            </td>
                            <td>
                                <a href="./Errors/404.asp" class="redirect-product-page">
                                    <i class = "lni lni-chevron-right-circle" style="margin:0;padding:0;color:#f3f3f3;font-size:1.5em"></i>
                                </a>
                            </td>
                    </tr>
                    <%
                        Result.MoveNext
                        loop
                        Result.Close
                        set Result = nothing
                    %>
                </tbody>
            </table>

            <nav aria-label="Page Navigation">
                <ul class="pagination pagination-sm">
                    <% if (pagesProducts > 1) then 
                        for i= 1 to pagesProducts
                    %>
                        <li class="page-item <%=checkPage(Clng(i)=Clng(pageProducts),"active")%>"><a class="page-link" href="management.asp?type=1&page=<%=i%><% if (CInt(sorttype) <> 1) then Response.Write "&sorttype=" & sorttype%>"><%=i%></a></li>
                    <%
                        next
                        end if
                    %>
                </ul>
            </nav>
        </div>
        <div id="customers" class="tabcontent">
            <h1>Manage Customers</h1>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">PASSWORD</th>
                        <th scope="col">ADDRESS</th>
                        <th scope="col">PHONE</th>
                        <th scope="col">ROLE</th>
                        <th scope="col">STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType = 1
                        cmdPrep.Prepared = True
                        cmdPrep.commandText = "select * from users order by id offset "& CLng(offsetUsers) &" rows fetch next "& CLng(limit) &" row only"
                        set Result = cmdPrep.execute
                        do while not Result.EOF
                    %>
                    <tr>
                        <td><%=Result("Id")%></td>
                        <td><%=Result("Name")%></td>
                        <td><%=Result("Email")%></td>
                        <td><%=Result("Password")%></td>
                        <td><%=Result("Address")%></td>
                        <td><%=Result("Phone")%></td>
                        <td><%=Result("Role")%></td>
                        <td>
                            <a href="./ManagmentFeatures/editstatususer.asp?id=<%=Result("Id")%>&page=<%=Page%>&type=<%=typeOfPage%>" class="btn 
                            <%if(Result("Status") = true) then%>
                                btn-success">active
                                <%else%>
                                btn-danger">block
                                <%end if%>
                            </a>
                        </td>
                    </tr>
                    <%
                        Result.MoveNext
                        loop
                    %>
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
        <div id="promotions" class="tabcontent">
            <h1>Manage Promotions</h1>
            <a href="./ManagmentFeatures/addpromote.asp" class="btn btn-outline-primary">Add Promotion</a>
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
                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType = 1
                        cmdPrep.Prepared = True
                        cmdPrep.commandText = "select * from PROMOTION order by id offset "& CLng(offsetPromotions) &" rows fetch next "& CLng(limit) &" row only"
                        set Result = cmdPrep.execute
                        do while not Result.EOF
                    %>
                    <tr>
                        <td><%=Result("ID")%></td>
                        <td><%=Result("NAME")%></td>
                        <td><%=Result("COUPON_CODE")%></td>
                        <td><%=Result("DISCOUNT_VALUE")%></td>
                        <td><%=Result("EXPIRED_AT")%></td>
                        <td>
                            <a href="./ManagmentFeatures/editstatuspromotion.asp?id=<%=Result("ID")%>&page=<%=page%>" class="btn 
                            <% if (Result("IS_ACTIVE") = True ) then %>
                                btn-success "> Enable
                            <% else %> 
                                btn-danger "> Disable
                            <% end if %>
                            </a>
                        </td>
                    </tr>
                    <%
                        Result.MoveNext
                        loop
                    %>
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
    </div>
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
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
            case else
            %>
            document.getElementById("OpenManageProduct").click();
            <%
        end select
        %>
    </script>
  </body>
</html>