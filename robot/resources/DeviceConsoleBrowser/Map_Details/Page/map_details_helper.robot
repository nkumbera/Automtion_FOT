*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           map_details_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device Map Details Page
    [Documentation]  click on map details menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Map_Details_Menu}
    BuiltIn.Sleep  5s
