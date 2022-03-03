*** Settings ***
Library    String

Resource    ../Resources/Common.robot

Resource    ../Resources/LandingPage.robot
Resource    ../Resources/LoginPage.robot
Resource    ../Resources/RegisterPage.robot

Test Setup    Start Test
Test Teardown    End Test

*** Variables ***
${URL} =    https://frydge.netlify.app
${BROWSER} =    chrome

# Login details
${LOGIN_VALID_USERNAME} =    admin
${LOGIN_VALID_PASSWORD} =    admin

# Register details
${REGISTER_VALID_USERNAME} =    arafath666
${REGISTER_VALID_EMAIL} =    arafath856@gmail.com
${REGISTER_VALID_PASSWORD} =    Test12365
${REGISTER_VALID_CONFIRM_PASSWORD} =    Test12365


*** Test Cases ***
Set Speed
    [Setup]
    Common.Set Speed    1
    [Teardown]

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
    LoginPage.Fill Form    ${LOGIN_VALID_USERNAME}ABC    ${LOGIN_VALID_PASSWORD}45
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
    [Tags]    Login

    LoginPage.Open Login Page
    LoginPage.Fill Form    ${LOGIN_VALID_USERNAME}    ${LOGIN_VALID_PASSWORD}
    LoginPage.Login

    Sleep    3

    LoginPage.Verify Login Success


# Registration
Should be able to load "register" page
    [Documentation]    This tests if the "register" page load correctly
    [Tags]    Register

    RegisterPage.Open Register Page
    RegisterPage.Verify Register Page

Should not be able to register with invalid details
    [Documentation]    This tests if the user is prevented in registering with invalid details (not matching pass, invalid email, etcc..)
    [Tags]    Register

    RegisterPage.Open Register Page
    
    ${random_username} =    Generate Random String    3    [LETTERS][NUMBERS]
    ${random_email} =    Generate Random String    5    [LETTERS][NUMBERS]
    ${random_password} =    Generate Random String    6    [LETTERS][NUMBERS]
    ${random_confirm_password} =    Generate Random String    7    [LETTERS][NUMBERS]

    RegisterPage.Fill Form    ${random_username}    ${random_email}    ${random_password}    ${random_confirm_password}
    RegisterPage.Register

    RegisterPage.Verify Registeration Failure

Should be able to register with valid details
    [Documentation]    This tests if the user can register using valid details
    [Tags]    Register    Current
    
    RegisterPage.Open Register Page
    RegisterPage.Fill Form    ${REGISTER_VALID_USERNAME}    ${REGISTER_VALID_EMAIL}    ${REGISTER_VALID_PASSWORD}    ${REGISTER_VALID_CONFIRM_PASSWORD}
    RegisterPage.Register

    Sleep    3

    RegisterPage.Verify Registration Success    ${REGISTER_VALID_USERNAME}    ${REGISTER_VALID_PASSWORD}