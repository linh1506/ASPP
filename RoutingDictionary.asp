<%  'viet ten case khong cach va lowcase
    Dim Parent, CurrentPage, filename,ParentUrl
        'Lay ten file
    filename = Lcase(Replace(Right(Mid(Request.ServerVariables("SCRIPT_NAME"),2),Len(Mid(Request.ServerVariables("SCRIPT_NAME"),2))-InStrRev(Mid(Request.ServerVariables("SCRIPT_NAME"),2),"/")),".asp",""))
    Select Case filename
        case "addproduct"
            Parent = "Products"
            ParentUrl = "../management.asp?type=1"
            CurrentPage = "Add product"
        case "editproduct"
            Parent = "Products"
            CurrentPage = "Edit product"
            ParentUrl = "../management.asp?type=1"
        case "addpromote"
            Parent = "Management"
            CurrentPage = "Add promotion code"
            ParentUrl = "../management.asp?type=3"
        case "bannerupload"
            Parent = "Gallery"
            CurrentPage = "Upload Store's Banner"
            ParentUrl = "/management.asp?type=5"
        case "galleryupload"
            Parent = "Gallery"
            CurrentPage = "Upload Store's Gallery"
            ParentUrl = "/management.asp?type=5"
        case "statistics"
            Parent = "Management"
            CurrentPage = "Statistics"
            ParentUrl = "/management.asp?type=7"
        case "productstatistics"
            Parent = "Management"
            CurrentPage = "Product Sales"
            ParentUrl = "/management.asp?type=7"
        case "addoreditbrand"
            Parent = "Management"
            CurrentPage = "Action to Brand"
            ParentUrl = "/management.asp?type=4"
        case "addoreditcategory"
            Parent = "Management"
            CurrentPage = "Action to Category"
            ParentUrl = "/management.asp?type=8"
    end select

        'Readable version
            ' Dim url,slashPosition
            ' url = Request.ServerVariables("SCRIPT_NAME")
            ' url = Mid(url,2)
            ' slashPosition = InStrRev(url,"/")
            ' newurl = Right(url,Len(url)-slashPosition)
            ' newurl = Replace(newurl,".asp","")
            ' Response.Write newurl&"<br>"
    'Same code but callback hell
%>