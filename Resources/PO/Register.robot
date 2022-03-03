*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Locators
${FORM_TITLE_ELEMENT} =    xpath://*[@id="root"]/div/div/h1

${REGISTER_ERROR_ELEMENT} =    xpath://*[@id="root"]/div/div/h3[1]

${REGISTER_USERNAME_FIELD} =    xpath://*[@id="root"]/div/div/form/div[1]/div/input
${REGISTER_EMAIL_FIELD} =    xpath://*[@id="root"]/div/div/form/div[2]/div/input
${REGISTER_PASSWORD_FIELD} =    xpath://*[@id="root"]/div/div/form/div[3]/div/input
${REGISTER_CONFIRM_PASSWORD_FIELD} =    xpath://*[@id="root"]/div/div/form/div[4]/div/input

${REGISTER_BUTTON} =    xpath://*[@id="root"]/div/div/form/div[5]/div/button

${REGISTER_TITLE} =    Register

@{REGISTER_ERROR_MESSAGES} =    Username too short    Email not valid    Password too short    Password does not match

*** Keywords ***
Load Page
    Go To    ${URL}/register

Verify Title
    Title Should Be    ${REGISTER_TITLE}

Verify Register Form
    [Documentation]    This checks if all the form fields are visible
    Element Should Be Visible    ${REGISTER_USERNAME_FIELD}
    Element Should Be Visible    ${REGISTER_EMAIL_FIELD}
    Element Should Be Visible    ${REGISTER_PASSWORD_FIELD}
    Element Should Be Visible    ${REGISTER_CONFIRM_PASSWORD_FIELD}

    Element Should Be Visible    ${REGISTER_BUTTON}

    Element Text Should Be    ${FORM_TITLE_ELEMENT}    ${REGISTER_TITLE}
    
Fill Username
    [Arguments]    ${username}
    Input Text    ${REGISTER_USERNAME_FIELD}    ${username}

Fill Email
    [Arguments]    ${email}
    Input Text    ${REGISTER_EMAIL_FIELD}    ${email}

Fill Password
    [Arguments]    ${password}
    Input Password    ${REGISTER_PASSWORD_FIELD}    ${password}

Fill Confirm Password
    [Arguments]    ${confirm_password}
    Input Password    ${REGISTER_CONFIRM_PASSWORD_FIELD}    ${confirm_password}

Click Register Button
    [Documentation]    Clicks the registration button to submit the form
    Click Button    ${REGISTER_BUTTON}

Verify Error Messages
    # FOR    ${err}    IN    @{REGISTER_ERROR_MESSAGES}
    # END

    # ${error_found} =    Set Variable    False

    # Erros are in h3 tags
    # @{elements} =    Get WebElements    tag:h3

    # FOR    ${el}    IN    @{elements}
    #     ${value} =    Get Element Attribute    ${el}    data
    #     Log    ${el}
    # END

    # If the first error message is visible there are feedbacks
    Element Should Be Visible    ${REGISTER_ERROR_ELEMENT}