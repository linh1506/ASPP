<% 
    Class categories
        Private p_Id
        Private p_Name 
        Private p_img
        Public Property Get Id()
            Id = p_Id
        End Property
        Public Property Let Id(Value)
            p_Id = Value
        End Property

        Public Property Get Name()
            Name = p_Name
        End Property
        Public Property Let Name(Value)
            p_Name = Value
        End Property
        ' Private Sub Class_Initialize()
        ' End Sub
        ' Private Sub Class_Terminate()
        ' End Sub
        Public Property Get Image()
            Image = p_img
        End Property
        Public Property Let Image(Value)
            p_img = Value
        End Property
    End Class
    Set listCategory = Server.CreateObject("Scripting.Dictionary")
    Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText = "select * from CATEGORY"
        set Result = cmdPrep.execute
        seq = 0
        do while not Result.EOF
            seq = seq + 1
            set category = new categories
            category.Id = Result("ID")
            category.Name = Result("NAME")
            category.Image = Result("img")
            listCategory.add seq,category
            Result.MoveNext
        loop
        Result.Close
        set Result = nothing

    Public Function findCategory(search_id)
        ' Do Something...
        for each item in listCategory
            If listCategory(item).Id = search_id Then
                findCategory = listCategory(item).Name
                exit Function
            End if
        next
        findCategory = "N/A"
    End Function
%>