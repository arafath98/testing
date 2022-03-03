*** Settings ***
Resource    ./PO/Landing.robot
Resource    ./PO/Login.robot

*** Keywords ***
# Landing
Open Landing Page
    [Documentation]    Opens the landing page
    Landing.Load Page

Verify Landing Page
    [Documentation]    Verifies if main elements are present and visibile
    Landing.Verify Title
    Landing.Verify Image

# Login
Open Login Page
    [Documentation]    Opens the login page
    Login.Load Page

Verify Login Page
    [Documentation]    Verifies if main elements are present and visibile
    Login.Verify Title
    Login.Verify Login Form