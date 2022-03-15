*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dc_help_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open DC Online Help Page
    [Documentation]  click on Online help menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Online_Help_Menu}
    BuiltIn.Sleep  5s

Close Online Help Window
    [Documentation]  close online help
    BuiltIn.Sleep  5s
    Click DMS Element  ${Help_Window_Close}
    BuiltIn.Sleep  5s