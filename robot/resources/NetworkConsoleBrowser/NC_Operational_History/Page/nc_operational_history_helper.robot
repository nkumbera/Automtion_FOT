*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           nc_operational_history_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open NC Operational History Page
    [Documentation]  click on operational history
    BuiltIn.Sleep  5s
    Click DMS Element  ${NC_Operational_History_Menu}
    BuiltIn.Sleep  5s