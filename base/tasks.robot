*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://elpais.com

*** Test Cases ***
Open Website and Wait
	${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
	${options.binary_location} =    Set Variable    /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
	Open Browser    ${URL}    browser=chrome    executable_path=/usr/local/bin/chromedriver    options=${options}
	Sleep    15