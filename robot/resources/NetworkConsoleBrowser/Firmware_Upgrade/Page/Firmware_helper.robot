*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Firmware_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Firmware Upgrade Menu Item
    BuiltIn.Sleep  20s
    [Documentation]  click on firmware upgradwe page
    Click DMS Element  ${Firmware_Menu }
    BuiltIn.Sleep  15s

Click on Manage Upgrade Menu Item
    [Documentation]  click on manage upgrade page
    Click DMS Element  ${Manage_Upgrade}
    BuiltIn.Sleep  10s

Click on Firmware Image Menu Item
    [Documentation]  click on bulk firmware image page
    Click DMS Element  ${Firmware_Image}
    BuiltIn.Sleep  10s
