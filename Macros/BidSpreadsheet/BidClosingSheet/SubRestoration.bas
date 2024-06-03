Sub RestorePriorValuesBasedOnSheet()
    Dim ws As Worksheet
    Dim rowNum As Long
    Dim inputRow As String
    Dim sheetName As String

    Set ws = ThisWorkbook.Sheets("Bid Closing")

    ' Prompt user for the row number
    inputRow = InputBox("Enter the row number:", "Row Input")
    If IsNumeric(inputRow) Then
        rowNum = CLng(inputRow)
    Else
        MsgBox "Invalid row number. Please enter a numeric value.", vbExclamation
        Exit Sub
    End If

    ' Prompt user for the sheet name
    sheetName = InputBox("Enter the sheet name:", "Sheet Name Input")
    If sheetName = "" Then
        MsgBox "Invalid sheet name. Please enter a valid sheet name.", vbExclamation
        Exit Sub
    End If

    ' Check if the sheet exists
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets(sheetName)
    On Error GoTo 0

    If ws Is Nothing Then
        MsgBox "Sheet '" & sheetName & "' not found. Please enter a valid sheet name.", vbExclamation
        Exit Sub
    End If

    Set ws = ThisWorkbook.Sheets("Bid Closing") ' Reset to original sheet after validation

    ' Column C: Set value to "S"
    ws.Cells(rowNum, 3).Value = "S"

    ' Column D: Reference the F67 value from the specified sheet
    ws.Cells(rowNum, 4).Formula = "='" & sheetName & "'!F67"

    ' Column E: Reference the E67 value from the specified sheet
    ws.Cells(rowNum, 5).Formula = "='" & sheetName & "'!E67"

    ' Column F: Reference the B7 value from the specified sheet
    ws.Cells(rowNum, 6).Formula = "='" & sheetName & "'!B7"
End Sub

