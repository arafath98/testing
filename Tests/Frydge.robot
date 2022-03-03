*** Settings ***
Resource    ../Resources/Common.robot

Resource    ../Resources/LandingPage.robot
Resource    ../Resources/LoginPage.robot

Test Setup    Start Test
Test Teardown    End Test

*** Variables ***
${URL} =    https://frydge.netlify.app
${BROWSER} =    chrome

# Login details
${VALID_USERNAME} =    admin
${VALID_PASSWORD} =    admin

*** Test Cases ***
# Landing
Should be able to load the landing page
    [Documentation]    This tests if the landing page loads correctly
    [Tags]    Landing

    LandingPage.Open Landing Page
    LandingPage.Verify Landing Page


# Login
Should be able to load "login" page
    [Documentation]    This tests if the "Login" page loads correctly
    [Tags]    Login

    LoginPage.Open Login Page
    LoginPage.Verify Login Page

Should not be able to login with invalid credentials
    [Documentation]    This tests if invalid credentials gives feedback while not allowing login
    [Tags]    Login

    LoginPage.Open Login Page
    # Concatenating some random text on the credentials makes them invalid
    LoginPage.Fill Form    ${VALID_USERNAME}ABC    ${VALID_PASSWORD}45
    LoginPage.Login

    # Give some time for the request to be completed
    Sleep    3

    LoginPage.Verify Login Failure

Should not be able to login with empty credentials
    [Documentation]    This tests if empty credentials gives feedback while not allowing login
    [Tags]    Login

    LoginPage.Open Login Page
    LoginPage.Fill Form    ${EMPTY}    ${EMPTY}
    LoginPage.Login

    Sleep    3

    LoginPage.Verify Login Failure

Should be able to login with valid credentials
    [Documentation]    This tests if valid credentials gives access to the Home page
    [Tags]    Login    Current

    LoginPage.Open Login Page
    LoginPage.Fill Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    LoginPage.Login

    Sleep    3

    LoginPage.Verify Login Success


# Registration
Should be able to load "register" page
    [Documentation]    This tests if the "register" page load correctly
    [Tags]    Register    Current

    RegisterPage.Open Register Page