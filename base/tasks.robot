*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary

*** Variables ***
${URL}  http://rpachallenge.com
${DOWNLOAD_PATH}  /path/to/download/directory
${EXCEL_FILE}  ${DOWNLOAD_PATH}/RPA_Challenge.xlsx

*** Test Cases ***
Download and Fill Form
    Open Browser  ${URL}  browser=chrome
    Click Element  css:.downloadButton
    Wait Until Keyword Succeeds  10x  3s  File Should Exist  ${EXCEL_FILE}
    @{data}=  Read Excel  ${EXCEL_FILE}
    FOR  ${row}  IN  @{data}
        Fill Form  @{row}
    END
    Close Browser

*** Keywords ***
Read Excel
    [Arguments]  ${file}
    Open Excel  ${file}
    @{data}=  Read Worksheet As Table
    Close Excel
    [Return]  ${data}

Fill Form
    [Arguments]  @{data}
    Input Text  id:firstName  ${data}[0]
    Input Text  id:lastName  ${data}[1]
    Input Text  id:companyName  ${data}[2]
    Input Text  id:role  ${data}[3]
    Input Text  id:address  ${data}[4]
    Input Text  id:email  ${data}[5]
    Input Text  id:phone  ${data}[6]
    Click Button  id:submit