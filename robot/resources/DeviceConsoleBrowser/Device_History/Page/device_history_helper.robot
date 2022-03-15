*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_history_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device History Page
    [Documentation]  click on device history menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${History_Menu}
    BuiltIn.Sleep  5s
