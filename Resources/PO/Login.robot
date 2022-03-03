*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Locators
${LOGIN_HEADER} =    xpath://*[@id="root"]/div/div/h1
${LOGIN_BUTTON} =    xpath://*[@id="root"]/div/div/form/div[3]/div/button

${USERNAME_FIELD} =    xpath://*[@id="root"]/div/div/form/div[1]/div/input
${PASSWORD_FIELD} =    xpath://*[@id="root"]/div/div/form/div[2]/div/input

${LOGIN_TITLE} =    Login
${ERROR_MESSAGE} =    Invalid username or password


*** Keywords ***
Load Page
    Go To    ${URL}/login

Verify Title
    Title Should Be    ${LOGIN_TITLE}

Verify Login Form
    Element Should Be Visible    ${LOGIN_HEADER}
    Element Should Be Visible    ${LOGIN_BUTTON}

Fill Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Error Message
    Page Should Contain    ${ERROR_MESSAGE}

Verify Auth Token
    ${token} =    Execute Javascript    return window.localStorage.getItem("token");
    Should Not Be Equal As Strings    ${token}    None

Verify Not In Login Page Anymore
    ${title} =    Get Title
    Should Not Be Equal As Strings    ${title}    ${LOGIN_TITLE}