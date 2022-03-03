*** Settings ***
Documentation    All tests related to the Landing page

Resource    ./PO/Landing.robot

*** Keywords ***
Open Landing Page
    [Documentation]    Opens the landing page
    Landing.Load Page

Verify Landing Page
    [Documentation]    Verifies if main elements are present and visibile
    Landing.Verify Title
    Landing.Verify Image