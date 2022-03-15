*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Provisioning_Status_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Provisioning Status Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on service package page
    Scroll Element Into View  ${Provisioning_Status_Menu}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Provisioning_Status_Menu}
    BuiltIn.Sleep  15s
