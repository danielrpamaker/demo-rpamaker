*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}=  https://elpais.com/america/

*** Test Cases ***
Open El Pais
	${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
	${options.binary_location}=    Set Variable        /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
	Open Browser    url=${URL}    browser=chrome    executable_path=/usr/local/bin/chromedriver    options=${options}
	Sleep    15s
	Close Browser