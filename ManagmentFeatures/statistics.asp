<!--#include virtual="connect.asp"-->
<%  Dim limit, totalRowsProducts, pagesProducts, strSQL, page
    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function

    limit = 5

    strSQL = "select count(*) as count from monthlySales"
    Set CountResult = connDB.execute(strSQL)
    totalRowsProducts = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesProducts = totalRowsProducts/limit

    page = Request.QueryString("page")
    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if
    page = CInt(page)
    offset = (Clng(page) * Clng(limit)) - Clng(limit)

    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.commandText = "select * from monthlySales order by Year desc, Month desc offset "& CLng(offset) &" rows fetch next "& CLng(limit) &" row only"
    If Cint(pagesProducts)<1 Then
        cmdPrep.commandText = "select * from monthlySales order by Year desc, Month desc"
    End if
    set Result = cmdPrep.execute
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistics</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="/bootstrap-5.2.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/Resources/swiper-9.2.4/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/UIcomponents/header.css">
</head>
<body>
    <!--#include virtual="/UIcomponents/pageLoader.asp"-->
    <!--#include virtual="/UIcomponents/header.asp"-->
    <div class="container">
        <br>
        <h1>
            Monthly Sales (Ordered by Year and Month)
        </h1>
        <br>
        <table class="table table-responsive">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Year</th>
                    <th scope="col">Month</th>
                    <th scope="col">Total earning</th>
                </tr>
            </thead>
            <tbody>
                <%do while not Result.EOF%>
                <tr>
                    <td><%=Result("Year")%></td>
                    <td><%=Result("Month")%></td>
                    <td><%=Result("TotalEarnings")%></td>
                </tr>
                <%
                    Result.MoveNext
                    loop
                %>
            </tbody>
        </table>
         <nav aria-label="Page Navigation">
            <ul class="pagination ">
                <% if (pagesProducts>1) then 
                    for i= 1 to pagesProducts
                %>
                    <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>"><a class="page-link" href="/ManagmentFeatures/statistics.asp?page=<%=i%>"><%=i%></a></li>
                <%
                    next
                    end if
                %>
            </ul>
        </nav>
    </div>
</body>
</html>