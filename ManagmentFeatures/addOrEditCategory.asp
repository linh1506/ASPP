<!--#include file="../connect.asp"-->

<%
On Error Resume Next
' handle Error
Sub handleError(message)
    Session("Error") = message
    'send an email to the admin
    'Write the error message in an application error log file
End Sub
    if(isempty(Session("Email"))) then
        response.redirect("/login.asp")
    end if

'go to page addoredit
    If (Request.ServerVariables("REQUEST_METHOD") = "GET") THEN
        id = Request.QueryString("id")
        If (isnull(id) OR trim(id) = "") then 
            id=0
        End if
        If (cint(id)<>0) Then
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            connDB.Open()
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT * FROM category WHERE id="&id
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                'gan gia tri cac bien
                name = Result("Name")
                url = Result("img")
            End If

            Result.Close()
        End If
    Else
        id = Request.QueryString("id")
        name = trim(Request.form("name"))
        url = trim(request.form("url"))

        if (isnull (id) OR trim(id) = "") then id=0 end if

        if (cint(id)=0) then
            if not isempty(name) then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "INSERT INTO category(name,img) VALUES('"&name&"','"&url&"')"
                cmdPrep.execute               
                
                If Err.Number = 0 Then 
                    Session("Success") = "Add Category Successfully!"  
                    Response.redirect("/management.asp?type=8")
                Else  
                    handleError(Err.Description)
                End If
                On Error GoTo 0
            else
                Session("Error") = "You have to input Name"                
            end if
        else
            'update
            if name<>"" and not isnull(name)  then
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "UPDATE category SET name='"&name&"',img='"&url&"' where id="&id
                cmdPrep.execute
                If Err.Number=0 Then
                    Session("Success") = "Update Category Successfully!"
                    Response.redirect("/management.asp?type=8")
                Else
                    handleError(Err.Description)
                End If
                On Error Goto 0
            else
                Session("Error") = "You have to input Name"
            end if
        end if
    End If    
%>
<html lang="en">
    <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/Resources/AdminLTE/plugins/toastr/toastr.min.css">
    <link rel="stylesheet" href="../UIcomponents/header.css">
    <title>Giỏ hàng</title>
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    </head>
    <body>
        <!--#include file="../UIcomponents/header.asp"-->

        <div class="container mt-4">
            <form method="post">
                <div class="mb-3">
                       <label for="name" class="form-label">Name:</label>
                       <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
                </div>
                <div class="mb-3">
                       <label for="url" class="form-label">Url:</label>
                       <input type="text" class="form-control" id="url" name="url" value="<%=url%>">
                </div>
                <button type="button" class="btn btn-success" onClick="checkUrl()">Check</button>
                <button type="submit" class="btn btn-primary">
                <%
                    if (id=0) then
                        Response.write("Add")
                    else
                        Response.write("Edit")
                    end if
                %>
                </button>
                <a href="/management.asp?type=8" class="btn btn-info">Cancel</a>    
            </form>
            <img src="" hidden id="hienanh" alt="anh loi" width="50%" />
        </div>
        <script>
            function checkUrl() {
                // Lấy giá trị của input url
                let url = document.getElementById("url").value.trim();
                let checkimg = document.getElementById("hienanh");
                if(url != null && url != ""){
                    checkimg.removeAttribute("hidden");
                    checkimg.src = url;
                    checkimg.onerror = function() {
                        toastr.error("URL is error, please try input a new URL")
                        checkimg.src = "https://zhost.vn/wp-content/uploads/2020/08/failed-to-load-resource-the-server-responded-with-a-status-of-404-not-found-la-gi-1-1.jpg";
                        checkimg.alt = "Anh loi";
                        return;
                    }
                }else{
                    toastr.warning("Please input your url")
                }
            }
        </script>
    <script src="/Resources/AdminLTE/plugins/toastr/toastr.min.js"></script>
    <script>
        <%
            if  not isempty(Session("Success")) then
            %>
                toastr.success("<%=Session("Success")%>")
            <%
                Session.Contents.remove("Success")
            else
                if not isempty(Session("Error")) then
                %>
                    toastr.error("<%=Session("Error")%>")
                <%
                    Session.Contents.remove("Error")
                end if
            end if
        %>
    </script>
  </body>
  </html>