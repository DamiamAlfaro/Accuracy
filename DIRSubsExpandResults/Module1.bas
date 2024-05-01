Attribute VB_Name = "Module1"
Sub FirstMacro()
    Dim ws As Worksheet
    Dim lastRow As Long, i As Long, outputRow As Long
    
    Set ws = ActiveSheet
    lastRow = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row ' Find the last row with data in Column B
    outputRow = 1 ' Start pasting results from row 1 in Column M
    
    ' Iterate through each cell in Column B
    For i = 1 To lastRow
        If ws.Cells(i, "B").Value <> "" Then ' Check if the cell is not empty
            ws.Cells(outputRow, "M").Value = ws.Cells(i, "B").Value ' Copy the value to Column M
            outputRow = outputRow + 1 ' Increment the destination row in Column M
        End If
    Next i
End Sub

