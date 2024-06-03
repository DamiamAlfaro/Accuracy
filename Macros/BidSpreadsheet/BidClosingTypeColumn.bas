Sub ApplyFunctionToOddSheets()
    Dim ws As Worksheet
    Dim i As Integer
    Dim lastSheetIndex As Integer
    
    ' Get the index of the last sheet
    lastSheetIndex = ThisWorkbook.Sheets.Count
    
    ' Loop through each sheet starting from sheet 9
    For i = 9 To lastSheetIndex
        ' Check if the sheet index is odd
        If i Mod 2 <> 0 Then
            Set ws = ThisWorkbook.Sheets(i)
            ' Apply the formula to cell B7
            ws.Range("B7").Formula = "=IF(E67<>""Marcon"", ""SUBCONTRACTOR"", """")"
        End If
    Next i
End Sub

