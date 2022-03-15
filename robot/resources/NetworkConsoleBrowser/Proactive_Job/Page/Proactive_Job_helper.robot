*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Proactive_Job_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Proactive_Job Menu Item
    BuiltIn.Sleep  20s
    [Documentation]  click on report page
    Click DMS Element  ${Proactive_Menu}
    BuiltIn.Sleep  15s
