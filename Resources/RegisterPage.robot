*** Settings ***
Resource    ./PO/Register.robot
Resource    ./LoginPage.robot

*** Variables ***


*** Keywords ***
Open Register Page
    [Documentation]    This opens the the "register" page
    Register.Load Page

Verify Register Page
    [Documentation]    This tests if some of the elements are visibile or present
    Register.Verify Title
    Register.Verify Register Form

Fill Form
    [Arguments]    ${username}    ${email}    ${password}    ${confirm_password}
    [Documentation]    This fills the registration form

    Register.Fill Username    ${username}
    Register.Fill Email    ${email}
    Register.Fill Password    ${password}
    Register.Fill Confirm Password    ${confirm_password}

Register
    [Documentation]    User registration
    Register.Click Register Button

Verify Registeration Failure
    [Documentation]    This tests if the registration has failed and checks for error messages
    # If title is still same, it did not register and redirect
    Register.Verify Title
    Register.Verify Error Messages

Verify Registration Success
    [Documentation]    This tests if user has been redirected to login page and can login with the newly created username and password
    [Arguments]    ${username}    ${password}

    LoginPage.Verify Login Page
    LoginPage.Fill Form    ${username}    ${password}
    LoginPage.Login

    Sleep    3

    LoginPage.Verify Login Success