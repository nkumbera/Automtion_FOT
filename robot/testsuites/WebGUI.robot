*** Settings ***
#Suite Setup       DMS WebGUI Login   # Login DMS UI with AdminUser
Suite Teardown      DMS UI Logout
Resource            ../resources/common/ui_common.robot
Resource            ../resources/WebGUI/WebGUI_keywords.robot
Resource            ../resources/common/ui_common.robot
Resource            ../dashboard/device_operation.robot
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
Resource            ../resources/provisioning/provisioning_keywords.robot
Library             String
Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot


*** Variables ***
#Real_Device    0005B951FF70

*** Test Cases ***


WebGUI Overridden Params Delete
    [Documentation]  WebGUI Overridden Params Delete
    [Tags]  Webgui_delete      Webgui    regression
    DMS WebGUI Login
    Update whitelist WEBGUI
    DMS WebGUI Logout
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Validate whitelist WEBGUI Overridden Param
    Delete Webgui params
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep  80s
    Verify PNP Workflow Status
    Dashboard Device InService Status

WebGUI overridden White list
    [Documentation]  WebGUI overridden White list
    [Tags]  Webgui_whitelist         Webgui    regression
    DMS WebGUI Login
    Update whitelist WEBGUI
    DMS WebGUI Logout
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Validate whitelist WEBGUI Overridden Param
    Validate whitelist operationl Param
    Validate whitelist Provision Data
    Validate whitelist Device History

WebGUI overridden Nominal GPS
    [Documentation]  WebGUI overridden Nominal GPS
    [Tags]  Webgui_Nominal_gps        Webgui    regression
    DMS WebGUI Login
    Update Nominal GPS WEBGUI
    DMS WebGUI Logout
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    BuiltIn.Sleep  30s
    Validate WEBGUI Overridden Param
    Validate Provision Data
    Validate Device History
    dashboard device inservice status
    Resync All Device
    Validate Operationl Param

Open WebGUI access from BC dash board
    [Documentation]  The objective is to verify the BC WebGUI access from BC dash board
    [Tags]  Webgui      regression
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    Open WebGUI from DeviceConsole
    DMS WebGUI Login from Device Console