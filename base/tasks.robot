*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.brou.com.uy

*** Test Cases ***
Get Exchange Rates
    Open Browser  ${URL}  browser=chrome
    Wait Until Page Contains  Cotizaciones
    ${exchange_rates}=  Get Text  xpath=//*[@id="p_p_id_cotizacion_WAR_broutmfportlet_INSTANCE_df0HsIO8xsuv_"]/div/div/table
    Log  ${exchange_rates}
    Close Browser