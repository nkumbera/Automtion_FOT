*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           map_usages_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Welcome dmsadmin for Map
    BuiltIn.Sleep  10s
    [Documentation]  click on welcome button
    Click DMS Element  ${Map_Welcome_Button}
    BuiltIn.Sleep  10s

Click on NC Map Count
    BuiltIn.Sleep  10s
    [Documentation]  click on NC Map Count
    Click DMS Element  ${XPATH_Map_Count}
    BuiltIn.Sleep  10s


Click on NC Map Count Window Close
    BuiltIn.Sleep  10s
    [Documentation]  click on NC Map Count window close
    Click DMS Element  ${Map_Window_Close}
    BuiltIn.Sleep  10s
