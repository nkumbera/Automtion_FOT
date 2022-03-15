*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           other_overridden_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Other Overridden Parameters Page
    [Documentation]  click on other overridden params menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Other_Overridden_Menu}
    BuiltIn.Sleep  5s

Open NBI Overridden Parameters Page
    [Documentation]  click on nbi overridden params menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${NBI_Overridden_Menu}
    BuiltIn.Sleep  5s

Open WebGUI Overridden Parameters Page
    [Documentation]  click on webGUI overridden params menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${WebGUI_Overridden_Menu}
    BuiltIn.Sleep  5s