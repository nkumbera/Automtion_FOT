*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           nc_about_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Welcome dmsadmin for About
    BuiltIn.Sleep  10s
    [Documentation]  click on welcome button
    Click DMS Element  ${About_Welcome_Button}
    BuiltIn.Sleep  10s

Click on NC About
    BuiltIn.Sleep  10s
    [Documentation]  click on NC About
    Click DMS Element  ${XPATH_About}
    BuiltIn.Sleep  10s


Click on NC About Window Close
    BuiltIn.Sleep  10s
    [Documentation]  click on NC About window close
    Click DMS Element  ${NC_About_Window_Close}
    BuiltIn.Sleep  10s
