*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.elpais.com

*** Test Cases ***
Open Website
    Open Browser  ${URL}  browser=chrome
    Sleep  10s
    Close Browser