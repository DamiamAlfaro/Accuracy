Attribute VB_Name = "Module1"
Sub InsertConstructionItems(startCell As Range)
    ' Insert items in column A
    startCell.Value = "Concrete"
    startCell.Offset(1, 0).Value = "Forming"
    startCell.Offset(2, 0).Value = "Pouring"
    startCell.Offset(3, 0).Value = "Lumber"
    startCell.Offset(4, 0).Value = "Compaction"
    startCell.Offset(5, 0).Value = "WakerCompacter"
    startCell.Offset(6, 0).Value = "Fuel"

    ' Insert units of measurement in column B
    startCell.Offset(0, 1).Value = "CY"
    startCell.Offset(1, 1).Value = "SF"
    startCell.Offset(2, 1).Value = "SF"
    startCell.Offset(3, 1).Value = "LS"
    startCell.Offset(4, 1).Value = "LS"
    startCell.Offset(5, 1).Value = "EA"
    startCell.Offset(6, 1).Value = "EA"
End Sub

