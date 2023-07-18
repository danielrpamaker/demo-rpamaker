*** Settings ***
Library           RPA.Browser.Selenium
Library           RPA.Excel.Files
Library           RPA.HTTP

*** Variables ***
${URL}            http://rpachallenge.com
${DOWNLOAD_URL}   http://rpachallenge.com/assets/downloadFiles/challenge.xlsx
${FILE_PATH}      ${CURDIR}${/}challenge.xlsx

*** Tasks ***
Download and Fill Form
    Open Browser    ${URL}    browser=chrome
    Download File   ${DOWNLOAD_URL}   ${FILE_PATH}
    ${sheet}=   Read Worksheet As Table   ${FILE_PATH}
    FOR   ${row}   IN   @{sheet}
        Input Text   id:firstName   ${row}[First Name]
        Input Text   id:lastName    ${row}[Last Name]
        Input Text   id:companyName ${row}[Company Name]
        Input Text   id:role        ${row}[Role in Company]
        Input Text   id:address     ${row}[Address]
        Input Text   id:email       ${row}[Email]
        Input Text   id:phone       ${row}[Phone Number]
        Click Button   xpath://*[@id="saveBtn"]
    END
    Close Browser