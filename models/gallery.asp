<%  
    Sub DeleteFile(filePath)
        Dim fso, file
        Set fso = CreateObject("Scripting.FileSystemObject")
        Set file = fso.GetFile(filePath)
        If file.Attributes And 1 Then
            file.Attributes = file.Attributes - 1
        End If
        
        file.Delete
    End Sub 

    Function GetFirstFilePath(folderPath)
        Dim relativePath, newestDate
        relativePath = ""
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        Set folder = fso.GetFolder(folderPath)
        Set files = folder.Files
        newestDate = DateSerial(1900, 1, 1)
        For Each file In files
            If file.DateLastModified > newestDate Then
                newestDate = file.DateLastModified
                Set newestFile = file
            End If
        Next
            ' relativePath = Replace(f1.Path, Server.MapPath("/"), "/")
        relativePath = Mid(Replace(newestFile.Path, Server.MapPath("/"), "/"), 2)
        Set files = Nothing
        Set folder = Nothing
        Set fso = Nothing

        GetFirstFilePath = relativePath
    End Function
    
    Function NewestBanner
        Dim folderPath
        ' folderPath = "E:\ASP\ASPP\Images\Banner"
        folderPath = Server.MapPath("Images\Banner")

        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        Set folder = fso.GetFolder(folderPath)
        Set files = folder.Files
        newestDate = DateSerial(1900, 1, 1)
        For Each file In files
            If file.DateLastModified > newestDate Then
                newestDate = file.DateLastModified
                Set newestFile = file
            End If
        Next
        NewestBanner = newestFile.Path
    End Function

    Sub FlushFolder(filePath)
        Dim fso, folder, files, file
        Dim deleteFlag
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        Set folder = fso.GetFolder(filePath)
        Set files = folder.Files
        newestDate = DateSerial(1900, 1, 1)
        For Each file In files
            If file.Path <> NewestBanner Then
                fso.DeleteFile(file.Path)
            End If
        Next
    End Sub

    dim path,Banner
    path = Server.MapPath("Images\Banner")
    FlushFolder path
    Banner = GetFirstFilePath(path)

    Set SlideImages = Server.CreateObject("Scripting.Dictionary")
        seq = 0
        Dim folderDirectory
        folderDirectory = Server.MapPath("Images\Gallery")
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        ' set folder = fso.GetFolder(folderDirectory)
        set files = fso.GetFolder(folderDirectory).Files
        for each item in files
            seq = seq + 1
            SlideImages.add seq,item.Name
        next

    Set Gallery = Server.CreateObject("Scripting.Dictionary")
        seq = 0
        folderDirectory = Server.MapPath("Images\Gallery")
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        ' set folder = fso.GetFolder(folderDirectory)
        set files = fso.GetFolder(folderDirectory).Files
        for each item in files
            seq = seq + 1
            Gallery.add seq,Mid(Replace(item.Path, Server.MapPath("/"), "/"), 2)
        next

%>