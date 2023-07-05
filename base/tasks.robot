*** Settings ***
Library  SeleniumLibrary
Library  Collections
Suite Teardown  Close All Browsers

*** Variables ***
${URL}=  https://www.cnbc.com/world/?region=world
${TABLE_XPATH}=  //*[@id="HomePageInternational-MarketsModule-13"]/section[2]/section[1]/div[1]/div/div/div[1]/div/table
${MAX_ATTEMPTS}=  4

*** Test Cases ***
Open Website and Get Table Data
    Open Browser  ${URL}  browser=chrome
    ${attempts}=  Set Variable  0
    FOR  ${attempts}  IN RANGE  ${MAX_ATTEMPTS}
        ${table_data}=  Run Keyword And Return Status  Get Table Data
        Exit For Loop If  ${table_data}
        Sleep  5s
    END
    Log  ${table_data}

*** Keywords ***
Get Table Data
    Wait Until Page Contains Element  ${TABLE_XPATH}  timeout=5
    ${rows}=  Get WebElements  ${TABLE_XPATH}/tbody/tr
    ${row_count}=  Get Length  ${rows}
    Return From Keyword If  ${row_count} > 0  ${TRUE}
    Return  ${FALSE}