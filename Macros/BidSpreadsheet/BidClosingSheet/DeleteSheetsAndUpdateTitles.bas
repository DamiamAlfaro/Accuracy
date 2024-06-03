Sub DeleteSheetsAndUpdateTitles()
    Dim sheetName As String
    Dim ws As Worksheet
    Dim targetSheet As Worksheet
    Dim rightSheet As Worksheet
    Dim i As Integer
    Dim currentOddIndex As Integer
    Dim oddTitle As String
    Dim evenTitle As String

    ' Prompt user for the sheet name to delete
    sheetName = InputBox("Enter the name of the sheet to delete:")

    ' Check if the sheet exists
    On Error Resume Next
    Set targetSheet = ThisWorkbook.Sheets(sheetName)
    On Error GoTo 0

    If Not targetSheet Is Nothing Then
        ' Check if there is a sheet to the right
        If targetSheet.Index < ThisWorkbook.Sheets.Count Then
            Set rightSheet = ThisWorkbook.Sheets(targetSheet.Index + 1)

            ' Confirm deletion with the user
            If MsgBox("Are you sure you want to delete the sheets '" & targetSheet.Name & "' and '" & rightSheet.Name & "'?", vbYesNo) = vbYes Then
                Application.DisplayAlerts = False
                targetSheet.Delete
                rightSheet.Delete
                Application.DisplayAlerts = True
                MsgBox "Sheets deleted successfully."
            Else
                MsgBox "Operation cancelled."
            End If
        Else
            MsgBox "The specified sheet is the last one. No sheet to the right to delete."
        End If
    Else
        MsgBox "Sheet '" & sheetName & "' does not exist."
    End If

    ' Update sheet titles starting from sheet 9
    currentOddIndex = 1
    For i = 11 To ThisWorkbook.Sheets.Count Step 2
        If i <= ThisWorkbook.Sheets.Count Then
            ' Update odd-numbered sheet title
            oddTitle = currentOddIndex & Mid(ThisWorkbook.Sheets(i).Name, InStr(ThisWorkbook.Sheets(i).Name, "-"))
            ThisWorkbook.Sheets(i).Name = oddTitle

            ' Update even-numbered sheet title
            If i + 1 <= ThisWorkbook.Sheets.Count Then
                evenTitle = currentOddIndex & ".1" & Mid(ThisWorkbook.Sheets(i + 1).Name, InStr(ThisWorkbook.Sheets(i + 1).Name, "-"))
                ThisWorkbook.Sheets(i + 1).Name = evenTitle
            End If

            currentOddIndex = currentOddIndex + 1
        End If
    Next i
End Sub

