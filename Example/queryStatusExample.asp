<%
    ' Import necessary ADODB components
    Set conn = Server.CreateObject("ADODB.Connection")
    Set rs = Server.CreateObject("ADODB.Recordset")

    ' Connect to the SQL Server database
    conn.Open "Provider=SQLOLEDB;Data Source=your_server;Initial Catalog=your_database;User ID=your_username;Password=your_password"

    ' Function to insert relative paths into the database
    Sub InsertRelativePaths(folderPath)
        ' Get all files in the specified folder
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        Set folder = fso.GetFolder(folderPath)
        Set files = folder.Files
        
        ' Loop through each file and insert its relative path into the database
        For Each file In files
            relativePath = Replace(file.Path, Server.MapPath("/"), "/")
            sql = "INSERT INTO YourTableName (FilePath) VALUES ('" & Replace(relativePath, "'", "''") & "')"
            conn.Execute(sql)
        Next
        
        ' Clean up objects
        Set files = Nothing
        Set folder = Nothing
        Set fso = Nothing
    End Sub

    ' Call the function with the folder path
    InsertRelativePaths "your_folder_path"

    ' Clean up objects
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
%>
