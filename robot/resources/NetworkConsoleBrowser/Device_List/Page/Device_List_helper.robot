*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Device_List_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Device List Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on device list
    Click DMS Element  ${Device_List_Menu}
    BuiltIn.Sleep  10s
