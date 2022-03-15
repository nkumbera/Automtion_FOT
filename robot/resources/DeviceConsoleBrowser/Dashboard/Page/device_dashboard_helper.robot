*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_dashboard_ui_control.py

*** Variables ***
${value_to_set}


*** Keywords ***
Open Device Console Dashboard Page
    [Documentation]
    Device console Login
    BuiltIn.Sleep  5s
    Login with Device ID  ${DEVICE_ALARM_MACID}
    BuiltIn.Sleep  5s

