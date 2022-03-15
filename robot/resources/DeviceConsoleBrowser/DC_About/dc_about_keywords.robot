*** Settings ***
Resource            page/dc_about_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console About Information
    [Documentation]    Device Console About
    Open Welcome DMSAdmin Page
    Click on About Button
    Close About Message
