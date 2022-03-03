*** Settings ***
Documentation    This file contains Common keywords used by multiple files (Setup, Teardown, etcc..).

Library    SeleniumLibrary

*** Variables ***
# Default broser in case not given
${BROWSER} =    chrome

*** Keywords ***
Start Test
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

End Test
    Close Browser