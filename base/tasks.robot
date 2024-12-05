*** Settings ***
Documentation   Template robot main suite.
Library         OperatingSystem
Library         SeleniumLibrary
Library         Collections
Library         libraries/ExampleHelper.py
Library         libraries/ed.py
Resource        keywords/keywords.robot


*** Variables ***
${my_event_id}
${my_oauth_token}


*** Keywords ***
Example Keyword
    Open Browser     http://rpachallenge.com/    Chrome 
    Log    HOLAMUNDO    level=WARN


*** Tasks ***
Example Task
    Log    ${my_event_id}
    # DANIEL DEV EXAMPLE:
    Copy Event    1105989306789    3GRRIJFTF2PRUJJ4OXBH
    # CLIENT PROD EXAMPLE:
    # Copy Event    970195800757    2N27QAXBW43T66A6ZFXW    
