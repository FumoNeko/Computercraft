# from selenium import webdriver
# from selenium.webdriver.common.keys import Keys

# driver = webdriver.Firefox()
# driver.get("http://www.python.org")
# assert "Python" in driver.title
# elem = driver.find_element_by_name("q")
# elem.clear()
# elem.send_keys("pycon")
# elem.send_keys(Keys.RETURN)
# assert "No results found." not in driver.page_source
# driver.close()

# Import Selenium and Time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

# Declaration of Variables and Input
URL = input("Enter the MLB marketplace URL of the card you are buying: ")
stringRepeat = input("Enter a number for the amount of times you want to repeat this: ")
stringBuyprice = input("Enter the price you want to buy at: ")
numberRepeat = int(stringRepeat)
stringEmail = input("Enter your Playstation Email: ")
stringPassword = input("Enter your Playstation Password: ")
driver = webdriver.Chrome()
driver.implicitly_wait(10)
driver.maximize_window()

# Processing Phase
driver.get(URL)
elemAccount = driver.find_element_by_xpath("/html/body/div[3]/div/div[2]/span/a[1]")
elemAccount.click()
elemEmail = driver.find_element_by_xpath("//*[@id='ember20']")
elemEmail.send_keys(stringEmail)
elemPsnButton = driver.find_element_by_xpath("//*[@id='ember21']/button")
elemPsnButton.click()
elemPassword = driver.find_element_by_xpath("//*[@id='ember37']")
elemPassword.send_keys(stringPassword)
elemSignin = driver.find_element_by_xpath("//*[@id='ember39']/button")
elemSignin.click()

# Conditional loop to allow the user to solve a CAPTCHA before continuing the script
currentURL = driver.current_url
while currentURL != URL:
    currentURL = driver.current_url
    time.sleep(10)

# Loop to send X amount of buy orders with price of Y
for i in range(numberRepeat):
    elemAccount.send_keys(Keys.PAGE_DOWN)
    elemPrice = driver.find_element_by_xpath("//*[@id='price']")
    elemPrice.send_keys(stringBuyprice)
    elemButton = driver.find_element_by_xpath("//*[@id='create-buy-order-form']/div/div[2]/button")
    elemButton.click()
    time.sleep(5)

# Gracefully exit
driver.close()
quit()
