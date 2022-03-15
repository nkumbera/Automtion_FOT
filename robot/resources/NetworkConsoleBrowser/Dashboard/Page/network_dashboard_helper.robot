*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           network_dashboard_ui_controls.py

*** Variables ***


*** Keywords ***
Network Console Dashboard Navigation
    [Documentation]  Open NC Dashboard Page
    go to  ${DMS_NETWORK_CONSOLE_URL}
    BuiltIn.Sleep  15s