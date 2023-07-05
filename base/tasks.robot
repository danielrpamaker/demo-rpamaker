*** Settings ***
Library  SeleniumLibrary
Library  Collections
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://www.cnbc.com/world/?region=world
${TABLE_XPATH}  //*[@id='HomePageInternational-MarketsModule-13']/section[2]/section[1]/div[1]/div/div/div[1]/div/table

*** Keywords ***
Open Website
    Open Browser  ${URL}  browser=chrome
    Maximize Browser Window

Get Table Info
    @{all_row_data}=    Create List
    FOR  ${i}  IN RANGE  0  4
        Wait Until Page Contains Element  ${TABLE_XPATH}  timeout=5
        ${rows}=  Get WebElements  ${TABLE_XPATH}/tbody/tr
        ${row_count}=  Get length  ${rows}
        Exit For Loop If  ${row_count} > 0
        Sleep  5s
    END
    FOR  ${index}  IN RANGE  0  ${row_count}
        ${row_data}=  Create Dictionary
        ${columns}=  Get WebElements  ${TABLE_XPATH}/tbody/tr[${index + 1}]/td
        ${column_count}=  Get length  ${columns}
        FOR  ${col_index}  IN RANGE  0  ${column_count}
            ${cell_data}=  Get Text  ${TABLE_XPATH}/tbody/tr[${index + 1}]/td[${col_index + 1}]
            Set To Dictionary  ${row_data}  Column_${col_index + 1}  ${cell_data}
        END
        Append To List  ${all_row_data}  ${row_data}
    END
    [Return]  ${all_row_data}

*** Test Cases ***
Test
    Open Website
    ${table_data}=  Get Table Info
    Log  ${table_data}
