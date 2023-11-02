*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://www.marketwatch.com/investing/stock/msft

*** Keywords ***
Open Browser And Get Price
    Open Browser  ${URL}  Chrome
    Wait Until Page Contains Element  xpath://*[@class='value']
    ${price}=  Get Text  xpath://*[@class='value']
    [Return]  ${price}

*** Test Cases ***
Get Microsoft Stock Price
    ${price}=  Open Browser And Get Price
    Log  Microsoft Stock Price: ${price}