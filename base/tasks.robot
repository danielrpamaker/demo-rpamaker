*** Settings ***
Documentation   Template robot main suite.
Library         OperatingSystem
Library         SeleniumLibrary
Library         Collections
Library         libraries/ExampleHelper.py
Library         libraries/ed.py
Resource        keywords/keywords.robot


*** Keywords ***
Example Keyword
    Open Browser     http://rpachallenge.com/    Chrome 
    Log    HOLAMUNDO    level=WARN


*** Tasks ***
Example Task
    Copy Event    1105989306789    3GRRIJFTF2PRUJJ4OXBH
