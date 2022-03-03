*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Locators
${LANDING_IMAGE} =    xpath://*[@id="root"]/div/div/div[3]/div/img

${LANDING_TITLE} =    Frydge

*** Keywords ***
Load Page
    Go To    ${URL}

Verify Image
    Page Should Contain Image    ${LANDING_IMAGE}
    Element Should Be Visible    ${LANDING_IMAGE}

Verify Title
    Title Should Be    ${LANDING_TITLE}