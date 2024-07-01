' ctrl+shift+T
Sub FixingTabName()
'
' FixingTabName Macro
'

'
    Range("E67").Select
    ActiveCell.Formula2R1C1 = _
        "=IF(MIN(IF((R[-2]C[2]:R[-2]C[8]>0)*(R[-2]C[2]:R[-2]C[8]<>""""), R[-2]C[2]:R[-2]C[8], R[-2]C[1]))=R[-2]C[1], R[-53]C[-2], INDEX(R[-64]C[2]:R[-64]C[8], MATCH(MIN(IF(R[-2]C[2]:R[-2]C[8]>0, R[-2]C[2]:R[-2]C[8])), R[-2]C[2]:R[-2]C[8], 0)))"
End Sub
