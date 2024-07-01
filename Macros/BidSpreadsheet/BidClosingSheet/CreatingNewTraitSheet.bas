' ctrl+shift+n
Sub CreatingNewSheet()
    Dim ws1 As Worksheet
    Dim ws2 As Worksheet
    Dim newSheet1 As Worksheet
    Dim newSheet2 As Worksheet
    Dim newName1 As String
    Dim newName2 As String

    ' Reference to sheets 9 and 10
    Set ws1 = ThisWorkbook.Sheets(9)
    Set ws2 = ThisWorkbook.Sheets(10)

    ' Request new names for the copied sheets
    newName1 = InputBox("Enter the name for the copy of " & ws1.Name & ":")
    newName2 = InputBox("Enter the name for the copy of " & ws2.Name & ":")

    ' Check if names are valid
    If newName1 = "" Or newName2 = "" Then
        MsgBox "Sheet names cannot be empty."
        Exit Sub
    End If

    ' Copy sheets 9 and 10 to the end of the workbook
    ws1.Copy After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)
    Set newSheet1 = ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)

    ws2.Copy After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)
    Set newSheet2 = ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)

    ' Rename the new sheets
    On Error Resume Next
    newSheet1.Name = newName1
    newSheet2.Name = newName2
    If Err.Number <> 0 Then
        MsgBox "An error occurred while renaming sheets. Please check for duplicate names or invalid characters."
        On Error GoTo 0
        Exit Sub
    End If
    On Error GoTo 0

    ' Update formulas in the new sheets to refer to the new sheets instead of the old ones
    Call UpdateFormulas(newSheet1, ws1.Name, newName1, ws2.Name, newName2)
    Call UpdateFormulas(newSheet2, ws1.Name, newName1, ws2.Name, newName2)
End Sub

Sub UpdateFormulas(sheet As Worksheet, oldSheetName1 As String, newSheetName1 As String, oldSheetName2 As String, newSheetName2 As String)
    Dim cell As Range
    Dim formula As String

    For Each cell In sheet.UsedRange
        If cell.HasFormula Then
            formula = cell.formula
            formula = Replace(formula, "'" & oldSheetName1 & "'!", "'" & newSheetName1 & "'!")
            formula = Replace(formula, "'" & oldSheetName2 & "'!", "'" & newSheetName2 & "'!")
            cell.formula = formula
        End If
    Next cell
End Sub

