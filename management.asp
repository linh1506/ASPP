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

    limit = 1

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
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
  </head>
  <body>
  <!--#include file="header.asp"-->
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'products')" id="OpenManageProduct">Manage Products</button>
        <button class="tablinks" onclick="openCity(event, 'customers')" id="OpenManageCustomer">Manage Customers</button>
        <button class="tablinks" onclick="openCity(event, 'promotions')" id="OpenManagePromotion">Manage Promotions</button>
    </div>
    <div class="container">
        <div id="products" class="tabcontent">
            <h1>Manage Products</h1>
            <a href="./ManagmentFeatures/addproduct.asp" class="btn btn-primary">ADD PRODUCT</a>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">PRICE</th>
                        <th scope="col">STATUS</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                
                </tbody>
            </table>
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
                        dim cmdPrep
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
                            <a href="./ManagmentFeatures/editstatususer.asp?id=<%=Result("Id")%>" class="btn 
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
                            <a href="./ManagmentFeatures/editstatuspromotion.asp?id=<%=Result("ID")%>" class="btn 
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