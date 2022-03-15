*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dc_operational_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open DC Operational History Page
    [Documentation]  click on operational history
    BuiltIn.Sleep  5s
    Click DMS Element  ${DC_Operational_History_Menu}
    BuiltIn.Sleep  5s