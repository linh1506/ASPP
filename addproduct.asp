<!--#include file="connect.asp"-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./stylelogin.css" />
    <script src="./jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <div class="container">
        <form method="post">
            <div>
                <!-- Name Product -->
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div>
                <!-- Brand Product -->
                <label for="brand" class="form-label">Brand</label>
                <select name="brand" id="brand">
                <%
                    connDB.open
                    Dim cmdPrep
                    Set cmdPrep = Server.CreateObject("ADODB.Command")
                    cmdPrep.ActiveConnection = connDB
                    cmdPrep.CommandType = 1
                    cmdPrep.Prepared = True
                    cmdPrep.CommandText = "SELECT * FROM BRAND"
                    Dim Result
                    set Result = cmdPrep.execute
                    do while not Result.EOF
                %>
                    <option value="<%=Result("ID")%>"><%=Result("NAME")%></option>
                <%
                    Result.MoveNext
                    loop

                %>
                </select>
            </div>
            <div>
                <!-- Category Product -->
                <label for="category" class="form-label">Category</label>
                <select name="category" id="category">
                <%
                    cmdPrep.CommandText = "SELECT * FROM CATEGORY"
                    set Result = cmdPrep.execute
                    do while not Result.EOF
                %>
                    <option value="<%=Result("ID")%>"><%=Result("NAME")%></option>
                <%
                    Result.MoveNext
                    loop

                %>
                </select>
            </div>
            <div>
                <label for="description" class="form-label">Description</label>
                <input type="text" name="description" id="description" class="form-control">
            </div>
        </form>
    </div>
  </body>
</html>