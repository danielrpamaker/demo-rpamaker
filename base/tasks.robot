*** Settings ***
Library  SeleniumLibrary
Library  Collections
Suite Teardown  Close All Browsers

*** Keywords ***
Get Table Info
    Open Browser  https://www.cnbc.com/world/?region=world  chrome
    Wait Until Page Contains Element  //*[@id='HomePageInternational-MarketsModule-13']/section[2]/section[1]/div[1]/div/div/div[1]/div/table  timeout=30
    ${table_info}=  Get Element Attribute  //*[@id='HomePageInternational-MarketsModule-13']/section[2]/section[1]/div[1]/div/div/div[1]/div/table  outerHTML
    Log  ${table_info}
    Close Browser

*** Test Cases ***
Test
    Get Table Info