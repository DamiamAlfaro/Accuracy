from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()

driver.get('https://example.com')
driver.implicitly_wait(100)
element = driver.find_element(By.TAG_NAME, 'h1')

print(element.text)
