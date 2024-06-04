Sub AllocateAndSumValuesWithSplit()

    Dim wsBidClosing As Worksheet
    Dim wsOtherCostsSpread As Worksheet
    Dim cell As Range
    Dim lookupValues As Variant
    Dim lookupValue As Variant
    Dim foundCell As Range
    Dim dict As Object
    Dim valueSplit As Double
    Dim i As Integer

    ' Set references to the sheets
    Set wsBidClosing = ThisWorkbook.Sheets("Bid Closing")
    Set wsOtherCostsSpread = ThisWorkbook.Sheets("OtherCostsSpread")
    
    ' Create a dictionary to store sums
    Set dict = CreateObject("Scripting.Dictionary")
    
    ' Loop through J36:J72 in the "Bid Closing" sheet
    For Each cell In wsBidClosing.Range("J36:J72")
        If IsNumeric(cell.Value) Or InStr(cell.Value, ";") > 0 Then
            lookupValues = Split(cell.Value, ";")
            valueSplit = wsBidClosing.Cells(cell.Row, "D").Value / (UBound(lookupValues) + 1)
            For i = LBound(lookupValues) To UBound(lookupValues)
                lookupValue = Trim(lookupValues(i))
                If Not dict.exists(lookupValue) Then
                    dict(lookupValue) = valueSplit
                Else
                    dict(lookupValue) = dict(lookupValue) + valueSplit
                End If
            Next i
        End If
    Next cell
    
    ' Allocate the summed values to the "OtherCostsSpread" sheet in the J column
    For Each lookupValue In dict.keys
        Set foundCell = wsOtherCostsSpread.Range("A2:A31").Find(lookupValue, LookIn:=xlValues, LookAt:=xlWhole)
        
        If Not foundCell Is Nothing Then
            wsOtherCostsSpread.Cells(foundCell.Row, "J").Value = dict(lookupValue)
        End If
    Next lookupValue

    MsgBox "Values summed and allocated to column J successfully."

End Sub

