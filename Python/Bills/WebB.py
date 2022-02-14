
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time


delay = 5
url = "https://agenciavirtual.sabesp.com.br/minhas-faturas"
Path = r"C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Python\Bills\chromedriver.exe"
s=Service(Path)
Nav = webdriver.Chrome(service=s)

Nav.get(url)
Image = Nav.find_elements(By.CLASS_NAME,"btn")
Image.click()
time.sleep(delay)  