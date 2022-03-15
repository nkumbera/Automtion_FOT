*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           nc_online_help_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open NC Online Help Page
    [Documentation]  click on Online help menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${NC_Online_Help}
    BuiltIn.Sleep  5s

Close NC Online Help Window
    [Documentation]  close online help
    BuiltIn.Sleep  5s
    Click DMS Element  ${NC_Help_Window_Close}
    BuiltIn.Sleep  5s