*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Bulk_Page_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Bulk Configuration Menu Item
    BuiltIn.Sleep  20s
    [Documentation]  click on bulk configuration page
    Click DMS Element  ${Bulk_Menu}
    BuiltIn.Sleep  15s

Click on Bulk Device Configuration Menu Item
    [Documentation]  click on bulk device configuration page
    Click DMS Element  ${Device_Configuration}
    BuiltIn.Sleep  10s

Click on Bulk Network Policy Menu Item
    [Documentation]  click on bulk network policy page
    Click DMS Element  ${Network_Policy}
    BuiltIn.Sleep  10s