Sub AddHyperlinkAndData()
    Dim ws As Worksheet
    Dim targetSheet As Worksheet
    Dim sheetPrefix As String
    Dim sheetName As String
    Dim startCell As String
    Dim cell As Range
    Dim rowNum As Long
    Dim found As Boolean

    ' Prompt the user to enter the sheet prefix
    sheetPrefix = InputBox("Enter the first one or two digits of the sheet title:")

    ' Find the sheet name based on the prefix
    found = False
    For Each ws In ThisWorkbook.Sheets
        If Left(ws.Name, Len(sheetPrefix)) = sheetPrefix And Mid(ws.Name, Len(sheetPrefix) + 1, 1) = "-" Then
            sheetName = ws.Name
            found = True
            Exit For
        End If
    Next ws
    
    If Not found Then
        MsgBox "Sheet with prefix " & sheetPrefix & " not found!"
        Exit Sub
    End If

    ' Prompt the user to enter the starting cell in Column A
    startCell = InputBox("Enter the starting cell in Column A (e.g., A1):")
    
    ' Check if the input cell is valid
    On Error Resume Next
    Set cell = Range(startCell)
    On Error GoTo 0
    If cell Is Nothing Or cell.Column <> 1 Then
        MsgBox "Invalid cell address!"
        Exit Sub
    End If

    ' Set the active worksheet
    Set ws = cell.Worksheet
    rowNum = cell.Row

    ' Add the hyperlink to the inputted sheet
    ws.Hyperlinks.Add Anchor:=ws.Cells(rowNum, 1), Address:="", SubAddress:= _
        "'" & sheetName & "'!A1", TextToDisplay:=sheetPrefix
    
    ' Center the hyperlink in the cell
    ws.Cells(rowNum, 1).HorizontalAlignment = xlCenter

    ' Populate the cells in columns B to G with references
    ws.Cells(rowNum, 2).Formula = "='" & sheetName & "'!B5" ' Reference to B5 of the target sheet
    ws.Cells(rowNum, 3).Value = "P" ' Letter "P"
    ws.Cells(rowNum, 4).Formula = "='" & sheetName & "'!F67" ' Reference to F67 of the target sheet
    ws.Cells(rowNum, 5).Formula = "='" & sheetName & "'!E67" ' Reference to E67 of the target sheet
    ws.Cells(rowNum, 6).Formula = "='" & sheetName & "'!B7" ' Reference to B7 of the target sheet
    ws.Cells(rowNum, 7).Formula = "='" & sheetName & "'!B11" ' Reference to B11 of the target sheet
End Sub
