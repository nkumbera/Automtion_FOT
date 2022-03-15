*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           DMS_Device_License_ui_controls.py

*** Variables ***


*** Keywords ***
Click On DMS Device License Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on Device License page
    go to  ${DMS_NC_Network_License}
    #Scroll Element Into View  ${DMS_Device_License}
    #BuiltIn.Sleep  2s
    #Click DMS Element  ${DMS_Device_License}
    BuiltIn.Sleep  15s
