*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           License_Usages_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Welcome dmsadmin for License Usages
    BuiltIn.Sleep  10s
    [Documentation]  click on welcome button
    Click DMS Element  ${Welcome_Button}
    BuiltIn.Sleep  10s

Click on License Usages
    BuiltIn.Sleep  10s
    [Documentation]  click on license Usages
    Click DMS Element  ${XPATH_License_Usages}
    BuiltIn.Sleep  10s

