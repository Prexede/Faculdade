#
#WebScraping
#Selenium

#Desenvolvido por: Carlos Eduardo 

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

delay = 5
day = [0,0,0,0,0,0,0,0,0,0]
i = 1


Path = r"C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Python\BTCvalue\chromedriver.exe"
url='https://finance.yahoo.com/quote/BTC-EUR/history/'
s=Service(Path)
Nav = webdriver.Chrome(service=s)


Nav.get(url)
time.sleep(delay)
    
for i in range(1,10):
    
    day[i] = Nav.find_element(By.XPATH,"/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/section/div[2]/table/tbody/tr["+i+"]/td[1]",sep='').text
    #day= Nav.find_element(By.XPATH,"/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[2]/div/div/section/div[2]/table/tbody/tr[1]/td[1]").text
    #day column [1]/ close column [5]
    

print(day)
Nav.close()    
