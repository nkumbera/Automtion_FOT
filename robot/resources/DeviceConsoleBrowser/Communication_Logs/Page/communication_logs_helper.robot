*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           communication_logs_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device Communication Logs Page
    [Documentation]  click on device communication logs menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Comm_Logs_Menu}
    BuiltIn.Sleep  5s
