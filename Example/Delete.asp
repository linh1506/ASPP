<%
dim fs
Set fs=Server.CreateObject("Scripting.FileSystemObject")
if fs.FileExists("C:\inetpub\wwwroot\ODBG\Images\Gallery\Fp_vg_macAAaYGQ-2023515221132.jpg") then
  fs.DeleteFile("C:\inetpub\wwwroot\ODBG\Images\Gallery\Fp_vg_macAAaYGQ-2023515221132.jpg")
end if
set fs=nothing
%>