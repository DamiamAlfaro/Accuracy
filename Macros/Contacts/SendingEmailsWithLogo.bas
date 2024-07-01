Sub SendEmails()
    Dim OutlookApp As Object
    Dim OutlookMail As Object
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim cell As Range
    Dim TemplatePath As String

    ' Path to your Outlook template file (.oft)
    TemplatePath = Environ("USERPROFILE") & "\Desktop\file.oft"
    
    ' Set the worksheet
    Set ws = ThisWorkbook.Sheets("Sheet1") ' Change "Sheet1" to your sheet name
    
    ' Find the last row with data in column A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Create a new instance of Outlook
    On Error Resume Next
    Set OutlookApp = GetObject(class:="Outlook.Application")
    If OutlookApp Is Nothing Then
        Set OutlookApp = CreateObject(class:="Outlook.Application")
    End If
    On Error GoTo 0

    ' Loop through each email address in column A
    For Each cell In ws.Range("A1:A" & lastRow)
        If cell.Value <> "" Then
            ' Create a new mail item from the template
            Set OutlookMail = OutlookApp.CreateItemFromTemplate(TemplatePath)
            
            ' Set the recipient
            OutlookMail.To = cell.Value
            
            ' Display or send the email
            OutlookMail.Display ' Use .Send to send automatically
            
            ' Clean up
            Set OutlookMail = Nothing
        End If
    Next cell
    
    ' Clean up
    Set OutlookApp = Nothing
End Sub
