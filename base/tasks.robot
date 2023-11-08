*** Settings ***
Library  SeleniumLibrary
Library  libraries/ExampleHelper.py

*** Variables ***
${URL}  https://www.marketwatch.com/investing/stock/msft

*** Keywords ***
Open Website And Get Price
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Wait Until Page Contains Element  xpath=//bg-quote[@class='value']  10
    ${price}=  Get Text  xpath=//bg-quote[@class='value']
    [Return]  ${price}

*** Test Cases ***
Get Microsoft Stock Price
    Example Python Keyword
    ${price}=  Open Website And Get Price
    Log  Microsoft Stock Price: ${price}