Sub AllocateHyperlinks()
    Dim ws As Worksheet
    Dim cell As Range
    Dim sheetIndex As Integer
    Dim linkCounter As Integer
    Dim oddSheetCount As Integer
    Dim targetRange As Range
    Dim userRange As String

    ' Ask for the range of cells where the hyperlinks will be placed
    userRange = InputBox("Enter the range of cells where the hyperlinks will be placed (e.g., A1:A45):", "Input Range")

    ' Check if the user input is valid
    On Error Resume Next
    Set targetRange = Range(userRange)
    On Error GoTo 0

    If targetRange Is Nothing Then
        MsgBox "Invalid range. Please try again.", vbExclamation
        Exit Sub
    End If

    ' Initialize link counter
    linkCounter = 0

    ' Loop through the range of cells
    For Each cell In targetRange
        ' Increment the counter for each cell
        linkCounter = linkCounter + 1

        ' Find the odd-numbered sheet starting from sheet 11
        oddSheetCount = 0
        For sheetIndex = 11 To ThisWorkbook.Sheets.Count Step 2
            oddSheetCount = oddSheetCount + 1
            ' If we have a valid cell, allocate the hyperlink
            If linkCounter = oddSheetCount Then
                Set ws = ThisWorkbook.Sheets(sheetIndex)
                cell.Hyperlinks.Add Anchor:=cell, Address:="", SubAddress:="'" & ws.Name & "'!A1", TextToDisplay:=ws.Name
                Exit For
            End If
        Next sheetIndex
    Next cell

    MsgBox "Hyperlinks have been allocated successfully!"
End Sub
