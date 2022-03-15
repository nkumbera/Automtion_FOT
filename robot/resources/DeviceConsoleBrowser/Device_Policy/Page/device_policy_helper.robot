*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_policy_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device Policy Page
    [Documentation]  click on device policy menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Policy_Menu}
    BuiltIn.Sleep  5s
