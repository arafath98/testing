*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Fill Password
    Open Browser    https://frydge.netlify.app/register    chrome
    Maximize Browser Window

    Input Text    xpath://*[@id="root"]/div/div/form/div[3]/div/input    HELLO

    Sleep    4

    [Teardown]    Close Browser