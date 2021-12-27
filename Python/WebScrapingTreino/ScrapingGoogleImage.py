from selenium import webdriver
from selenium.webdriver.chrome.service import Service


def Paths(Nav):
    url='https://www.google.com'
    Nav.get(url)

Path = r"C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Python\WebScrapingTreino\chromedriver.exe"
s=Service(Path)
Nav = webdriver.Chrome(service=s)
## Utilizando Selenium para pegar uma imagem do google imagens

    

