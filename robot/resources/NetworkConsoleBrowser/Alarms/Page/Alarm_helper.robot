*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Alarm_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Alarm Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on import page
    Click DMS Element  ${Alarm_Menu}
    BuiltIn.Sleep  15s

Click on System Alarm Menu Item
    [Documentation]  click on schedule import page
    Click DMS Element  ${System_Alarm}
    BuiltIn.Sleep  10s

Click on Device Alarm Menu Item
    [Documentation]  click on file import page
    Click DMS Element  ${Device_Alarm}
    BuiltIn.Sleep  10s

Click on Alarm Correlation Menu Item
    [Documentation]  click on file import page
    Click DMS Element  ${Alarm_Correlation}
    BuiltIn.Sleep  10s

Click on Alarm Logging Rule Menu Item
    [Documentation]  click on file import page
    Click DMS Element  ${Alarm_Logging_Rule}
    BuiltIn.Sleep  10s



