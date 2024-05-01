Attribute VB_Name = "Module5"
Sub FifthMacro()
    Dim ws As Worksheet
    Dim lastRowM As Long, lastRowW As Long
    Dim i As Long, j As Long
    
    Set ws = ThisWorkbook.ActiveSheet
    lastRowM = ws.Cells(ws.Rows.Count, "M").End(xlUp).Row ' Find the last row with data in Column M
    lastRowW = ws.Cells(ws.Rows.Count, "W").End(xlUp).Row ' Find the last row with data in Column W
    
    ' Iterate through each name in Column M
    For i = 1 To lastRowM
        Dim mName As String
        mName = ws.Cells(i, "M").Value ' Name in Column M
        ' Remove periods and commas from mName
        mName = Replace(mName, ".", "")
        mName = Replace(mName, ",", "")

        ' Search for a match in Column W
        For j = 1 To lastRowW
            Dim wName As String
            wName = ws.Cells(j, "W").Value ' Name in Column W

            ' Check if the sanitized name matches
            If StrComp(mName, wName, vbTextCompare) = 0 Then ' Case-insensitive comparison
                ' If a match is found, copy the phone number from Column X to Column Q
                ws.Cells(i, "Q").Value = ws.Cells(j, "X").Value
                Exit For ' Exit the inner loop once a match is found
            End If
        Next j
    Next i
End Sub

