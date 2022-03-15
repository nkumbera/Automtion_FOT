*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dc_notification_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Notification Page
    [Documentation]  click on notification
    BuiltIn.Sleep  5s
    Click DMS Element  ${DC_Notification_Menu}
    BuiltIn.Sleep  5s

Click on All Notification Button
    [Documentation]  click on see all notification
    BuiltIn.Sleep  5s
    Click DMS Element  ${See_All_Notification}
    BuiltIn.Sleep  5s

Close Notification Window
    [Documentation]  click on close notification
    BuiltIn.Sleep  5s
    Click DMS Element  ${Close_Notification}
    BuiltIn.Sleep  5s

