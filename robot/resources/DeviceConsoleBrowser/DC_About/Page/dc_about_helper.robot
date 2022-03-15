*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dc_about_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Welcome DMSAdmin Page
    [Documentation]  click on welcome menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Welcome_Menu}
    BuiltIn.Sleep  5s

Click on About Button
    [Documentation]  click on about menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${About_button}
    BuiltIn.Sleep  5s

Close About Message
    [Documentation]  click on about menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${About_Window_Close}
    BuiltIn.Sleep  5s

