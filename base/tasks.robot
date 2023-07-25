*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  =  https://elpais.com

*** Test Cases ***
Open El Pais
	${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
	Set Variable    ${options.binary_location}    /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
	Open Browser    ${URL}    browser=chrome    executable_path=/usr/local/bin/chromedriver    options=${options}
	Sleep    15s
	Close Browser