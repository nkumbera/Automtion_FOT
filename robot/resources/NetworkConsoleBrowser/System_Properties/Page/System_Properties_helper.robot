*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           System_Properties_ui_controls.py

*** Variables ***


*** Keywords ***
Click On System Properties Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on service package page
    go to  ${DMS_NC_Network_SystemProperty}
    #Scroll Element Into View  ${System_Properties_Menu}
    #Scroll Element Into View  ${enterpriseview}
    #BuiltIn.Sleep  2s
    #Click DMS Element  ${System_Properties_Menu}
    BuiltIn.Sleep  15s

