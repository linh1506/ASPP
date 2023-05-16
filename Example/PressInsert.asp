<!--#include file="../connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="Press()">Vailon</button>
    <%
    Function GetFirstFilePath(folderPath)
        Dim relativePath
        relativePath = ""
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        Set folder = fso.GetFolder(folderPath)
        Set files = folder.Files
        for each f1 in files
            relativePath = Replace(f1.Path, Server.MapPath("/"), "/")
            relativePath = Mid(relativePath, 2)
            exit for
        next
        Set files = Nothing
        Set folder = Nothing
        Set fso = Nothing

        GetFirstFilePath = relativePath
    End Function
    
    dim path,firstFilePath
    path = "C:\inetpub\wwwroot\ODBG\Resources\aspuploader\filemanagerfolder\guest"

    firstFilePath = GetFirstFilePath(path)

    Response.Write "First File Path: " & firstFilePath
    %>
    <img src="\Resources\aspuploader\filemanagerfolder\guest\2023-05-15 17-56-53.3ae5ba9d-4b48-32dc-5f36-8bcc0317859e.Screenshot 2023-03-25 223541.png " alt="" srcset="">

</body>
</html>