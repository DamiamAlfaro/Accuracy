' ctrl+shift+F
Sub FixingDetailDistribution()
'
' FixingDetailDistribution Macro
'

'
    Range("L4").Select
    ActiveCell.Formula2R1C1 = "=UNIQUE(R[-1]C[-11]:R[196]C[-11])"
    Range("M4").Select
    ActiveCell.Formula2R1C1 = "=UNIQUE(R[-1]C[-11]:R[196]C[-11])"
    Range("M5").Select
End Sub
