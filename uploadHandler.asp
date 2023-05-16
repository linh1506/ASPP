  <!-- #include file="aspuploader/include_aspuploader.asp" -->   
  <form id="form1" method="POST">    
    <%    
        Dim uploader    
        Set uploader=new AspUploader    
        uploader.Name="myuploader"
        uploader.InsertText="Select file (Max 10M)"
        uploader.AllowedFileExtensions="*.jpg,*.png"
      uploader.SaveDirectory="Images/Banner"
        uploader.MultipleFilesUpload=false
        uploader.Render()
    %>    
</form>    
<%  
    If Request.Form("myuploader")&""<>"" Then   
        Dim mvcfile    
        Set mvcfile=uploader.GetUploadedFile(Request.Form("myuploader"))    
        Response.Write("<div>")    
        Response.Write("Latest Upload")    
        Response.Write("<br/><br/>FileName: ")    
        Response.Write(mvcfile.FileName)    
        Response.Write("<br/>FileSize: ")    
        Response.Write(mvcfile.FileSize)
        Response.Write("<br/>FilePath: ")    
        Response.Write(mvcfile.FilePath) 
        Response.Write("</div>")
        FlushFolder(path)
    End If   
%>
<div class="mt-2">
    <iframe src="/Resources/aspuploader/misc-filemanager.asp" frameborder="0"></iframe>
</div>   
