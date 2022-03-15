*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           timingsource_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Timing Source Page
    [Documentation]  click on timing source menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Timing_Source_Menu}
    BuiltIn.Sleep  5s