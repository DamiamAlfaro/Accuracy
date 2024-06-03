Attribute VB_Name = "Module2"
Sub CallInsertItems()
    Dim startCell As Range
    ' Prompt the user to select a starting cell
    On Error Resume Next
    Set startCell = Application.InputBox("Select the starting cell:", Type:=8)
    On Error GoTo 0
    
    If Not startCell Is Nothing Then
        InsertConstructionItems startCell
    Else
        MsgBox "No cell selected. Operation cancelled."
    End If
End Sub

