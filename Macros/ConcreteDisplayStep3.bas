Attribute VB_Name = "Module3"
Sub ConcreteDisplayStep3()
    Dim startCell As Range
    Dim sqFeet As Double
    Dim multiplier As Double
    Dim result As Double
    Dim roundedResult As Double
    
    ' Prompt the user to select the starting cell
    On Error Resume Next
    Set startCell = Application.InputBox("Select the starting cell with the SF:", Type:=8)
    On Error GoTo 0
    
    If startCell Is Nothing Then
        MsgBox "No cell selected. Operation cancelled."
        Exit Sub
    End If
    
    ' Ask for the square feet value
    sqFeet = Application.InputBox("Enter/Select total SF: ", Type:=1)
    startCell.Value = sqFeet
    
    ' Ask for the multiplier
    multiplier = Application.InputBox("Enter the tickness", Type:=1)
    
    ' Calculate the result
    result = sqFeet * multiplier
    roundedResult = Application.WorksheetFunction.Ceiling(result / 27, 1)
    
    ' Populate the cells with the calculated values
    startCell.Offset(1, 0).Value = roundedResult
    startCell.Offset(2, 0).Value = sqFeet
    startCell.Offset(3, 0).Value = sqFeet
    startCell.Offset(4, 0).Value = 1
    startCell.Offset(5, 0).Value = sqFeet
End Sub

