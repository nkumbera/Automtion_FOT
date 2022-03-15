*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           License_Features_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Welcome dmsadmin
    BuiltIn.Sleep  10s
    [Documentation]  click on welcome button
    Click DMS Element  ${Welcome_Button}
    BuiltIn.Sleep  10s

Click on Licensed Features
    BuiltIn.Sleep  10s
    [Documentation]  click on licensed features
    Click DMS Element  ${XPATH_License_Feature}
    BuiltIn.Sleep  10s
