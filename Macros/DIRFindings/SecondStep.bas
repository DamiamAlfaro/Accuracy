Sub SecondMacro()
    Dim ws As Worksheet
    Dim lastRow As Long, i As Long, outputRow As Long
    Dim hairColor As String
    
    Set ws = ActiveSheet
    lastRow = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row ' Find the last row with data in Column B
    outputRow = 1 ' Start pasting results from row 1 in Columns M and N
    
    ' Iterate through each cell in Column B
    For i = 1 To lastRow
        If ws.Cells(i, "B").Value <> "" Then ' Check if the cell is not empty
            ws.Cells(outputRow, "M").Value = ws.Cells(i, "B").Value ' Copy the name to Column M

            ' Clean and copy the hair color to Column N
            hairColor = ws.Cells(i, "C").Value
            hairColor = Replace(hairColor, ".", "") ' Remove periods
            hairColor = Replace(hairColor, ",", "") ' Remove commas
            ws.Cells(outputRow, "N").Value = hairColor

            outputRow = outputRow + 1 ' Increment the destination row in Columns M and N
        End If
    Next i
End Sub
