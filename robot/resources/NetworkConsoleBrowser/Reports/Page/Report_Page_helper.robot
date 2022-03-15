*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Report_Page_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Reports Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on report page
    Click DMS Element  ${Report_Menu}
    BuiltIn.Sleep  15s




