import requests
from bs4 import BeautifulSoup
import pandas as pd
import re
import openpyxl

url = "https://www.cslb.ca.gov/about_us/library/licensing_classifications/"
response = requests.get(url)

soup = BeautifulSoup(response.content, 'html.parser')

links = soup.find_all('a', href=lambda href: href and "Licensing_Classifications_Detail.aspx?Class=" in href)

hrefs = [link['href'] for link in links]

licenseTexts = []

for license in hrefs[4:]:
  licensePage = url + license
  linkResponse = requests.get(licensePage)
  souping = BeautifulSoup(linkResponse.content, 'html.parser')
  section = souping.find("div", class_="main-primary")
  paragraphs = section.find_all("p")
  text = [paragraph.get_text() for paragraph in paragraphs]
  licenseTexts.append(text)

cleanedLicenseTexts = []

for licenseText in licenseTexts:
  cleansing = []
  for paragraph in licenseText:
    cleanedString = paragraph.replace("\n", "").replace("\t", "").replace("\r", "").replace("            "," ")
    cleansing.append(cleanedString)
  cleanedLicenseTexts.append(cleansing)

excelFile = ""
excel = openpyxl.load_workbook(excelFile)
worksheet = excel.active
startRow = 1
startColumn = 3

for row_index, row_data in enumerate(cleanedLicenseTexts, start=startRow):
    for col_index, value in enumerate(row_data, start=startColumn):
        worksheet.cell(row=row_index, column=col_index, value=value)

excel.save(excelFile)
