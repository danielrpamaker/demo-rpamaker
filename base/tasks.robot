*** Settings ***
Library           String

*** Variables ***
${WEB_CONTENT}    ${EMPTY}

*** Keywords ***
Extract Stock Price
    [Arguments]    ${content}
    ${start} =    Get Substring Index    ${content}    $\n    ${end} =    Get Substring Index    ${content}    After Hours Volume:
    ${stock_price} =    Get Substring    ${content}    ${start + 1}    ${end}
    ${stock_price} =    Get Substring    ${stock_price}    0    ${stock_price.find(' ')}
    Log    Microsoft Stock Price: ${stock_price}

*** Test Cases ***
Copy Microsoft Stock Price
    Extract Stock Price    ${WEB_CONTENT}