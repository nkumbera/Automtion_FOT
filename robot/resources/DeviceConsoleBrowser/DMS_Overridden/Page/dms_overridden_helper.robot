*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dms_overridden_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open DMS Overridden Parameters Page
    [Documentation]  click on dms overridden params menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${DMS_Overridden_Menu}
    BuiltIn.Sleep  5s