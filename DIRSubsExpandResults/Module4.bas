Attribute VB_Name = "Module4"
Sub FourthMacro()
    Dim ws As Worksheet
    Dim lastRow As Long, i As Long
    Dim compiledCars As String
    Dim currentID As String
    Dim outputRow As Long
    
    Set ws = ActiveSheet
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row ' Determine the last row with data in Column A
    outputRow = 1 ' Start pasting results in Column P from row 1
    
    ' Initialize the first ID and compiled cars string
    currentID = ws.Cells(1, "A").Value
    compiledCars = ws.Cells(1, "E").Value
    
    For i = 2 To lastRow
        If ws.Cells(i, "A").Value = "" Or ws.Cells(i, "A").Value = currentID Then
            ' Continue compiling cars if the same ID or empty ID cell
            If ws.Cells(i, "E").Value <> "" Then
                compiledCars = compiledCars & ", " & ws.Cells(i, "E").Value
            End If
        Else
            ' New ID encountered, paste the compiled cars and reset variables
            ws.Cells(outputRow, "P").Value = compiledCars
            outputRow = outputRow + 1 ' Move to the next row in column P for the next set of cars
            currentID = ws.Cells(i, "A").Value
            compiledCars = ws.Cells(i, "E").Value ' Start new compilation with the current car
        End If
    Next i
    
    ' Ensure the last compiled set of cars is also pasted
    If compiledCars <> "" Then
        ws.Cells(outputRow, "P").Value = compiledCars
    End If
End Sub

