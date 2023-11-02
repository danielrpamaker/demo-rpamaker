*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://www.marketwatch.com/investing/stock/msft

*** Keywords ***
Open Browser And Get Stock Price
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Wait Until Page Contains Element  xpath://*[@class='intraday__price']  timeout=10
    ${stock_price}=  Get Text  xpath://*[@class='intraday__price']
    Log  Microsoft Stock Price: ${stock_price}

*** Test Cases ***
Get Microsoft Stock Price
    Open Browser And Get Stock Price
