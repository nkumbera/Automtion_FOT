*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Configuration_Page_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Configuration Menu Item
    BuiltIn.Sleep  20s
    [Documentation]  click on configuration page
    Click DMS Element  ${Configuration_Menu}
    BuiltIn.Sleep  15s

Click on Product SKU Menu Item
    [Documentation]  click on product sku page
    Click DMS Element  ${Product_SKU}
    BuiltIn.Sleep  10s

Click on SNMP Menu Item
    [Documentation]  click on snmp page
    Click DMS Element  ${SNMP}
    BuiltIn.Sleep  10s

Click on SMTP Menu Item
    [Documentation]  click on smtp page
    Click DMS Element  ${SMTP}
    BuiltIn.Sleep  10s

Click on EMAIL Menu Item
    [Documentation]  click on email page
    Click DMS Element  ${EMAIL}
    BuiltIn.Sleep  10s

Click on SMS Menu Item
    [Documentation]  click on sms page
    Click DMS Element  ${SMS}
    BuiltIn.Sleep  10s



