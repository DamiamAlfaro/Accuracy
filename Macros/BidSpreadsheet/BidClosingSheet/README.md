## Macro Usage

# Order (Preferable)

1. CreatingNewTraitSheet
  - This macro will create a new TraitSheet at the end of your workbook.
  - One has to know which number of trait it is before assigning the new title.
    
2.1 AddHyperlinkAndData
  - This macro is intended to run on teh BidClosing sheet.
  - It will link the necessary attributes of the newly created sheet from the first macro.

2.2 DeleteSheetsAndUpdateTitles
  - This can be done previously or after AddHyperlinkAndData

3. CorrelateHyperlinks
  - Preferably used after 2.1 or/and 2.2
