# Macro Usage

## Order (Preferable)

1. CreatingNewTraitSheet
  - This macro will create a new TraitSheet at the end of your workbook.
  - One has to know which number of trait it is before assigning the new title.
    
2. AddHyperlinkAndData
  - This macro is intended to run on teh BidClosing sheet.
  - It will link the necessary attributes of the newly created sheet from the first macro.

3. DeleteSheetsAndUpdateTitles
  - This can be done previously or after AddHyperlinkAndData.

4. CorrelateHyperlinks
  - Preferably used after (3) or/and (4).

5. SubAlteration
  - Alters the price of the inputted row (where a sub is currently located) and changes the price to one's percentage (second input) in order to meet criteria.

6. SubRestoration
  - If restoration from (5) is needed, this macro restores the value based on input (sheet name where sub numbers is located).
