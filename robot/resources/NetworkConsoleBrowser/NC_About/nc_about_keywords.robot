*** Settings ***
Resource            page/nc_about_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Network Console About Page
    [Documentation]
    Click On Welcome dmsadmin for About
    Click on NC About
    Click on NC About Window Close

