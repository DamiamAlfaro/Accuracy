Sub ModifyRowBasedOnInput()
    Dim ws As Worksheet
    Dim rowNum As Long
    Dim perc As Double
    Dim inputRow As String
    Dim inputPerc As String

    Set ws = ThisWorkbook.Sheets("Bid Closing") ' Change "Sheet1" to your sheet name

    ' Prompt user for the row number
    inputRow = InputBox("Enter the row number:", "Row Input")
    If IsNumeric(inputRow) Then
        rowNum = CLng(inputRow)
    Else
        MsgBox "Invalid row number. Please enter a numeric value.", vbExclamation
        Exit Sub
    End If

    ' Prompt user for the percentage
    inputPerc = InputBox("Enter the percentage:", "Percentage Input")
    If IsNumeric(inputPerc) Then
        perc = CDbl(inputPerc)
    Else
        MsgBox "Invalid percentage. Please enter a numeric value.", vbExclamation
        Exit Sub
    End If

    ' Column C: Set value to "Q"
    ws.Cells(rowNum, 3).Value = "Q"

    ' Column D: Multiply current value by percentage and set as new value with Accounting Formatting
    With ws.Cells(rowNum, 4)
        .Value = .Value * (perc / 100)
        .NumberFormat = "_($* #,##0.00_);_($* (#,##0.00);_($* -??_);_(@_)"
    End With

    ' Column E: Set value to "Marcon"
    ws.Cells(rowNum, 5).Value = "Marcon"

    ' Column F: Delete current value (leave cell blank)
    ws.Cells(rowNum, 6).ClearContents
End Sub
