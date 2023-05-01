<%  'viet ten case khong cach va lowcase
    Dim Parent, CurrentPage, filename,ParentUrl
        'Lay ten file
    filename = Lcase(Replace(Right(Mid(Request.ServerVariables("SCRIPT_NAME"),2),Len(Mid(Request.ServerVariables("SCRIPT_NAME"),2))-InStrRev(Mid(Request.ServerVariables("SCRIPT_NAME"),2),"/")),".asp",""))
    Select Case filename
        case "addproduct"
            Parent = "Management"
            ParentUrl = "../management.asp"
            CurrentPage = "Add product"
        case "editproduct"
            Parent = "Management"
            CurrentPage = "Edit product"
            ParentUrl = "../management.asp"
        case "addpromote"
            Parent = "Management"
            CurrentPage = "Add promotion pode"
            ParentUrl = "../management.asp"
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