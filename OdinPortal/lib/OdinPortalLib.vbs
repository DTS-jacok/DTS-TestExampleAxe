' (c)2005-2006 Odin Technology Ltd. All rights reserved.
'
' OdinPortalLib
' Sample custom function library of Axe OdinPortal demo application for QuickTest Professional




' Documentation Samples

Function my_edit_set(objectname, value) 
    objectname.Set("")
    objectname.Click()
    my_edit_set = objectname.Set(value)
End Function


Function my_obj_exists(objectname) 
    If objectname.Exist = "True" Then
        my_obj_exists = "True"
    Else
        my_obj_exists = "False"
    End If   
End Function


RegisterUserFunc "WebEdit", "MySet", "my_edit_set"
RegisterUserFunc "WebEdit", "MyExists", "my_obj_exists"


Function MyValidateLength(expected, actual)
    Dim res
    Dim actual_length
    
    actual_length = Len(actual)  
    If CStr(actual_length) = expected Then
        res = 0
    Else
        res = 1
    End If
 
    MyValidateLength = AxeMainAPI.StepValidate(expected, actual_length, res)
End Function
