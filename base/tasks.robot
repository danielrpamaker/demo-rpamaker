*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.brou.com.uy

*** Test Cases ***
Get Exchange Rates
    Open Browser  ${URL}  browser=chrome
    Wait Until Page Contains  Cotizaciones
    ${exchange_rates}=  Get Text  xpath=//div[@id='exchange-rates']
    Log  ${exchange_rates}
    Close Browser