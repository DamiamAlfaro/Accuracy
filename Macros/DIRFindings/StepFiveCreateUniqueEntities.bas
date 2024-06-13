Sub RemoveDuplicatesAndCopyToNewColumn()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim uniqueRow As Long
    Dim companyName As String
    Dim companyDict As Object
    Set companyDict = CreateObject("Scripting.Dictionary")
    
    ' Define the worksheet
    Set ws = ThisWorkbook.Sheets("Sheet1") ' Change "Sheet1" to your sheet name
    
    ' Find the last row with data in column M
    lastRow = ws.Cells(ws.Rows.Count, "M").End(xlUp).Row
    
    ' Initialize the row for unique entries in column V
    uniqueRow = 1
    
    ' Loop through each row in column M
    For i = 1 To lastRow
        companyName = ws.Cells(i, "M").Value
        
        ' Check if the company name is already in the dictionary
        If Not companyDict.exists(companyName) And companyName <> "" Then
            ' Add the company name and its attributes to the dictionary
            companyDict.Add companyName, i
            
            ' Copy the unique company and its attributes to the new column V
            ws.Cells(uniqueRow, "V").Value = ws.Cells(i, "M").Value ' Company Name
            ws.Cells(uniqueRow, "W").Value = ws.Cells(i, "N").Value ' Address
            ws.Cells(uniqueRow, "X").Value = ws.Cells(i, "O").Value ' Contact
            ws.Cells(uniqueRow, "Y").Value = ws.Cells(i, "P").Value ' Trait
            
            ' Increment the unique row counter
            uniqueRow = uniqueRow + 1
        End If
    Next i
    
    ' Delete the rows with duplicate company names
    For i = lastRow To 1 Step -1
        companyName = ws.Cells(i, "M").Value
        
        If companyDict.exists(companyName) Then
            If companyDict(companyName) <> i Then
                ws.Rows(i).Delete
            End If
        End If
    Next i
    
    MsgBox "Unique companies and their attributes have been copied to column V and duplicates removed."
End Sub
