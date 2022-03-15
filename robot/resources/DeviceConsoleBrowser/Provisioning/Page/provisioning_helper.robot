*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           provisioning_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Provisioning Page
    [Documentation]  click on provisioning menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Provisioning_Menu}
    BuiltIn.Sleep  5s

Open Provisioned Data Page
    [Documentation]  click on provisioned data menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Provisioned_Menu}
    BuiltIn.Sleep  5s

Open Provisioning Status Page
    [Documentation]  click on provisioning status menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Provisioning_Status_Menu}
    BuiltIn.Sleep  5s