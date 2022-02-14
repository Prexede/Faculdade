
#Projeto para baixar uma imagem do google imagens de acordo com um termo de pesquisa
#WebScrating
#Selenium

#Desenvolvido por: Carlos Eduardo 
#Musica do momento: Gelo -Djonga
#Data: 27/12/2021 

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import io

delay = 5
Page = input("Qual a imagem a ser pesquisada?")
Path = r"C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Python\WebScrapingTreino\chromedriver.exe"
url='https://www.google.com/search?q='+ Page +'&source=lnms&tbm=isch&sa=X&ved=2ahUKEwihicaog4X1AhX5rZUCHdOgCKUQ_AUoAXoECAIQAw&biw=479&bih=615&dpr=1'
s=Service(Path)
Nav = webdriver.Chrome(service=s)

def Get_Image(url,Nav):
    try:
        Nav.get(url)
        Image = Nav.find_elements(By.CLASS_NAME,"Q4LuWd")
        print(Image)
        Image.click()
        time.sleep(delay)  
        
    except:
        print("Erro")

Get_Image(url,Nav)
time.sleep(delay)
#Nav.close()    

