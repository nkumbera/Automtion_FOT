*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           DMS_Health_ui_controls.py

*** Variables ***


*** Keywords ***
Click On DMS Health Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on dms health
    go to  ${DMS_NC_Health}
    #Scroll Element Into View  ${DMS_Health_Menu}
    #BuiltIn.Sleep  2s
    #Click DMS Element  ${DMS_Health_Menu}
    BuiltIn.Sleep  15s

