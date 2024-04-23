import PyPDF2
import pdfplumber
from pytesseract import image_to_string



class Specs():

    
    # Function 1.1
    def SectionsPDFText(self):
        with open(self,"rb") as file:
            read = PyPDF2.PdfReader(file)

            pages = len(read.pages)
            print(f"{pages} pages")

            for page in range(pages):
                page_text = read.pages[page]
                print(page_text.extract_text())


    def SectionsOCR(self):
        with pdfplumber.open(self) as pdf:
            for page in pdf.pages:
                page_image = page.to_image()
                text = image_to_string(page_image.original)
                print(text)



if __name__ == "__main__":
    # Insert Corresponding Specs PDF File
    specs_file = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGrovePark-TechnicalSpecs.pdf"
   
    # Function 1: Reads the specs and acquires a list of all spec sections if file is PDF Text-based.
    #Specs.SectionsPDFText(specs_file)

    # Function 2: Reads the specs and acquires a list of all spec sections if file is Image-based.
    #Specs.SectionsOCR(specs_file)
    








