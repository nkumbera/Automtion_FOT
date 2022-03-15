*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Operator_Data_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Operator Data Menu Item
    BuiltIn.Sleep  20s
    [Documentation]  click on operator data page
    Click DMS Element  ${Operator_Data_Menu}
    BuiltIn.Sleep  15s

Click on OP_SS Menu Item
    [Documentation]  click on service setting page
    Click DMS Element  ${OP_Service_setting}
    BuiltIn.Sleep  10s

Click on OP_TAC Menu Item
    [Documentation]  click on tacpool page
    Click DMS Element  ${OP_TacPool}
    BuiltIn.Sleep  10s

Click on OP_ZIP Menu Item
    [Documentation]  click on zip page
    Click DMS Element  ${OP_Zip}
    BuiltIn.Sleep  10s

Click on OP_CDMA Menu Item
    [Documentation]  click on cdmalcib page
    Click DMS Element  ${OP_CdmsLcib}
    BuiltIn.Sleep  10s

Click on OP_LTE Menu Item
    [Documentation]  click on ltelcib page
    Scroll Element Into View  ${Service_package}
    Click DMS Element  ${OP_LteLcib}
    BuiltIn.Sleep  10s

Click on OP_PN Menu Item
    [Documentation]  click on pn page
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${Service_package}
    Click DMS Element  ${OP_PN}
    BuiltIn.Sleep  10s

Click on OP_MSCID Menu Item
    [Documentation]  click on mscid page
    Click DMS Element  ${OP_Mscid}
    BuiltIn.Sleep  10s



