*** Settings ***
#Resource            ../../common/ui_common.robot
#Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           backup_restore_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Click on Restore Operation Button
    [Documentation]  click on restore button
    BuiltIn.Sleep  5s
    Click DMS Element  ${Restore_Button}
    BuiltIn.Sleep  5s