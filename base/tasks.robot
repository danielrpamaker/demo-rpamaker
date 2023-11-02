*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://www.marketwatch.com/investing/stock/msft

*** Keywords ***
Open Browser And Get Price
    Open Browser  ${URL}  Chrome
    Wait Until Page Contains Element  xpath://*[@class='intraday__price']  timeout=10
    ${price}=  Get Text  xpath://*[@class='intraday__price']
    Log  Microsoft Stock Price: ${price}

*** Test Cases ***
Get Microsoft Stock Price
    Open Browser And Get Price
