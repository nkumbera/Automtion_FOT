*** Settings ***
#Suite Setup         Suite Setup Keyword    # Login DMS UI with AdminUser
Suite Teardown      DMS UI Logout    # Logging off
#Resource  ../resources/common/ui_common.robot
Resource  ../resources/operational_rp_params/rp_params_keywords.robot
Resource  ../resources/dashboard/device_operation.robot
Resource  ../resources/dashboard/dashboard_keywords.robot
Resource   ../resources/WebGUI/WebGUI_keywords.robot


*** Variables ***


*** Keywords ***
Suite Setup Keyword
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Reset Device
    DMS UI Logout
    BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    DMS WebGUI Login
    Update whitelist WEBGUI
    DMS WebGUI Logout
    BuiltIn.Sleep  180s



*** Test Cases ***


Verify RP Enclosure Type Indoor
    [Documentation]  Verify RP Enclosure Type Indoor
    [Tags]  RP_Param_Validation   Enclosure   Indoor   RP    regression
    Device console Login
    Login with Device ID  ${DEVICE10_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    Verify Enclosure Indoor

Modify RP Location
    [Documentation]  Modify RP Location
    [Tags]  RP_Param_Validation   Location   RP    regression
    Device console Login
    Login with Device ID  ${DEVICE10_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    #Reset Device
    #BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    Dashboard Device InService Status
    Delete WEBGUI Location Parameter
    Modify RP Location Information
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    BuiltIn.Sleep    150s
    Open RP Provisioned Data
    BuiltIn.Sleep    10s
    Verify Location Value

Modify RP Tx Power
    [Documentation]  Modify RP Tx Power
    [Tags]  RP_Param_Validation   Tx_Power   RP    regression
    Device console Login
    Login with Device ID  ${DEVICE10_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    #Reset Device
    #BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    Dashboard Device InService Status
    Delete WEBGUI Tx_Power Parameter
    Modify RP Tx Power Information
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open RP Provisioned Data
    Verify RP TX Power Value

Verify RP Auto Tx Power
    [Documentation]  Modify RP Auto Tx Power
    [Tags]  RP_Param_Validation   Auto_Tx_Power     RP    regression
    Device console Login
    Login with Device ID  ${DEVICE10_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    Modify RP Auto Tx Power Information
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Login with Device ID  ${DEVICE10_MACID}
    Verify PNP Status
    Open RP Provisioned Data
    Verify Auto Tx Power Provisioned

RP Nominal GPS configuration and provisioning
    [Documentation]  RP Nominal GPS configuration and provisioning
    [Tags]  RP_Nominal_GPS    Phase2      RP    regression
    Device console Login
    Login with Device ID  ${DEVICE10_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    #Reset Device
    #BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    Dashboard Device InService Status
    Delete WEBGUI RP Nominal GPS Parameter
    RP Nominal GPS Configuration Teardown
    BuiltIn.Sleep  10s
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Delete WEBGUI RP Nominal GPS Parameter
    RP Nominal GPS Configuration
    BuiltIn.Sleep  10s
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Open RP Provisioned Data
    Verify GPS configuration Parameter