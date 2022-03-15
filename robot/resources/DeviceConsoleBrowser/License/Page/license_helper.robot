*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           license_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device License Page
    [Documentation]  click on device license menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_License_Menu}
    BuiltIn.Sleep  5s
