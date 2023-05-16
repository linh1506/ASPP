<!--#include file="aspuploader/include_aspuploader.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./uploader.css" />
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href='../UIcomponents/header.css'>

    <title>Upload Banner</title>
</head>
<body>
    <!--#include virtual="/UIcomponents/header.asp"-->
    <div class="container">
        <div class="demo">
                        
        <h2>Single File Upload</h2>
		<p> A basic sample demonstrating the use of the Upload control (Allowed file types: <span style="color:red">jpg, gif, png, zip</span>).</p>
		
		<%
		    Dim uploader
		    Set uploader=new AspUploader
		    uploader.Name="myuploader"
    		
		    uploader.MaxSizeKB=10240
		    uploader.InsertText="Upload File (Max 10M)"
            uploader.AllowedFileExtensions="*.jpg,*.png,*.gif,"
		    uploader.MultipleFilesUpload=false
    		
		    'Where'd the files go?
		    uploader.SaveDirectory="Banner"
    		
		    uploader.render()
		%>
		
		<br/><br/>
			
    <script type='text/javascript'>
	function CuteWebUI_AjaxUploader_OnTaskComplete(task)
	{
		alert(task.FileName + " is uploaded!");
	}
	window.addEventListener("load", (event) => {
		document.getElementById("myuploaderButton").className='btn uploader'
	});

	</script>
						
	</div>
    </div>
</body>
</html>