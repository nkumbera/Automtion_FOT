*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Service_Package_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Service Package Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on service package page
    Scroll Element Into View  ${Service_Package_Menu}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Service_Package_Menu}
    BuiltIn.Sleep  15s
