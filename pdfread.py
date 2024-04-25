import PyPDF2
import pdfplumber
from pytesseract import image_to_string



class Specs():

    
    # Function 1.1
    def SectionsPDFText(self):

        raw_text = []

        with open(self,"rb") as file:
            read = PyPDF2.PdfReader(file)

            pages = len(read.pages)
            print(f"{pages} pages")

            for page in range(pages):
                page_text = read.pages[page]
                raw_text.append(page_text.extract_text())


        cleanup = [dividors.split("\n") for dividors in raw_text]
        sections = []

        for x in cleanup:
            for y in x:
                if y[:1].isdigit() == True and len(y) > 2:
                    sections.append(y)

                else:
                    continue

        return sections

    # Function 1.2: The reason why this is different is because each pdf varies, therefore each cleanup varies 
    def CleaningExtraChar(self):
        crust = [spec.replace(".","")[:-6] for spec in self]
        mantle = [magma.replace(" ","") for magma in crust]
        asthenosphere = [lava.replace("-","") for lava in mantle]

        return asthenosphere

    
    def SectionsOCR(self):
        with pdfplumber.open(self) as pdf:
            for page in pdf.pages:
                page_image = page.to_image()
                text = image_to_string(page_image.original)
                print(text)



if __name__ == "__main__":
    # Insert Corresponding Specs PDF File
    specs_file = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/GoletaTraintDepot/GoletaSpecSections.pdf"
   
    # Function 1: Reads the specs and acquires a list of all spec sections if file is PDF Text-based.
    Specs.CleaningExtraChar(Specs.SectionsPDFText(specs_file))

    # Function 2: Reads the specs and acquires a list of all spec sections if file is Image-based.
    #Specs.SectionsOCR(specs_file)
    



