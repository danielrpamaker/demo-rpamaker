*** Settings ***
Library  SeleniumLibrary
Library  Collections
Suite Teardown  Close All Browsers

*** Variables ***
${URL}=  https://www.cnbc.com/world/?region=world
${TABLE_XPATH}=  //*[@id='HomePageInternational-MarketsModule-13']/section[2]/section[1]/div[1]/div/div/div[1]/div/table
${MAX_ATTEMPTS}=  4

*** Keywords ***
Open Website And Log Table
    Open Browser  ${URL}  browser=chrome
    Wait Until Page Contains Element  ${TABLE_XPATH}  timeout=5
    ${attempts}=  Set Variable  0
    FOR  ${attempts}  IN RANGE  ${MAX_ATTEMPTS}
        ${rows}=  Get WebElements  ${TABLE_XPATH}/tbody/tr
        ${row_count}=  Get Length  ${rows}
        Exit For Loop If  ${row_count} > 0
        Sleep  5
    END
    Log Table Information

Log Table Information
    @{all_row_data}=  Create List
    ${rows}=  Get WebElements  ${TABLE_XPATH}/tbody/tr
    ${row_count}=  Get Length  ${rows}
    FOR  ${index}  IN RANGE  0  ${row_count}
        ${row_data}=  Create Dictionary
        ${columns}=  Get WebElements  ${TABLE_XPATH}/tbody/tr[${index + 1}]/td
        ${column_count}=  Get Length  ${columns}
        FOR  ${column_index}  IN RANGE  1  ${column_count + 1}
            ${cell_data}=  Get Text  ${TABLE_XPATH}/tbody/tr[${index + 1}]/td[${column_index}]
            Set To Dictionary  ${row_data}  Column_${column_index}  ${cell_data}
        END
        Append To List  ${all_row_data}  ${row_data}
    END
    Log  ${all_row_data}

*** Test Cases ***
Test
    Open Website And Log Table