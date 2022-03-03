*** Settings ***
Documentation    All tests related to the Login page

Resource    ./PO/Login.robot

*** Variables ***


*** Keywords ***
Open Login Page
    [Documentation]    Opens the login page
    Login.Load Page

Verify Login Page
    [Documentation]    Verifies if main elements are present and visibile
    Login.Verify Title
    Login.Verify Login Form

Fill Form
    [Arguments]    ${username}    ${password}
    Login.Fill Username    ${username}
    Login.Fill Password    ${password}

Login
    Login.Click Login Button

Verify Login Failure
    Login.Verify Title
    Login.Verify Error Message

Verify Login Success
    Login.Verify Auth Token
    Login.Verify Not In Login Page Anymore