*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           opeartional_params_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Operational Parameters Page
    [Documentation]  click on operational params menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${Operational_Menu}
    BuiltIn.Sleep  5s