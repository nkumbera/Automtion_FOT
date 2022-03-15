*** Settings ***
Documentation       DMS Import
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
#Suite Setup         Device console Login
#Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/Search_Page/Search_Device.robot
Resource            ../resources/Import/Import_keywords.robot
Resource            ../resources/Import/Import_helper.robot
Resource            ../resources/Import/Import_ui_controls.py
Resource           ../resources/ServiceSetting/ServiceSetting_keywords.robot
Variables            ../properties/common.py
Resource            ../resources/ddlg/ddlg_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/device_list/page/device_list_helper.robot
Library             String
Library             SSHLibrary
Test Teardown       DMS Network Console UI Logout


*** Test Cases ***
Netconf Mount Import of Unmanaged CUCP CUUP DU
    #[Arguments]     ${managed_state}
    [Tags]    unmanaged_vnf_import    regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${MOUNT_UMANAGED_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Unmanaged Netconf Mount file import  Netconf Mount
    Device console Login
    search using cu_cp name    ${CU_CP_DEVICE22_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE22_MACID}
    Get VNF Managed State   User Unmanaged
    Verify gNB connect status      Disconnected
    Get First Session Establishment Time
    Get Last Session Establishment Time
    Get HeartBeat Status
    BuiltIn.Sleep   3s
    Verify unmanaged CU device history    Tabular  Last 1 hour  DEVICE
    DMS UI Logout
    Device console Login
    search using cu_up name    ${CU_UP_DEVICE22_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE22_MACID}
    Get VNF Managed State   User Unmanaged
    Verify gNB connect status      Disconnected
    Get First Session Establishment Time
    Get Last Session Establishment Time
    Get HeartBeat Status
    BuiltIn.Sleep   3s
    Verify unmanaged CU device history    Tabular  Last 1 hour  DEVICE
    DMS UI Logout
    Device console Login
    search using du name    ${DU_DEVICE22_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE22_MACID}
    Get VNF Managed State   User Unmanaged
    Verify gNB connect status      Disconnected
    Get First Session Establishment Time
    Get Last Session Establishment Time
    Get HeartBeat Status
    BuiltIn.Sleep   3s
    Verify unmanaged DU device history    Tabular  Last 1 hour  DEVICE
    DMS UI Logout



Factory File Schedule Import
    [Documentation]  Factory_File_Schedule_Import
    [Tags]   Factory_File_Schedule_Import     Factory_file    regression     TA_code
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${Schedule_Factory_File_Location}    ${Factory_Import_Path}
    DMS Network Console UI Login
    Open Schedule Import Page
    Schedule Factory Import
    BuiltIn.Sleep  200s
    Open Operation History
    Search Operation Type in History    FACTORY
    Verify Operation History Schedule factory import values

Gold Standard Value file manual import
    [Documentation]  GSV_File_Manual_Import
    [Tags]   GSV_File_Manual_Import    Gold_Standard_Value    regression    TA_code
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${GSV_File_Location}    ${GSV_Import_Path}
    DMS Network Console UI Login
    Open File Import Page
    Select and import Gold Standard Value file
    BuiltIn.Sleep  50s
    Open Operation History
    Search Operation Type in History    GOLD_STANDARD
    Verify Operation History GSV Import values

OmKPi file manual import
    [Documentation]  OmKPi_File_Manual_Import
    [Tags]   OmKPi_File_Manual_Import    OmKPi_File    regression     TA_code
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${OmKPi_File_Location}    ${OmKPi_Import_Path}
    DMS Network Console UI Login
    Open File Import Page
    Select and import OmKPi file
    BuiltIn.Sleep  50s
    Open Operation History
    Search Operation Type in History    OM_KPI
    Verify Operation History OmKPi File

Entity mapping Schedule Import
    [Documentation]  Entity_Mapping_Schedule_Import
    [Tags]   Entity_Mapping_Schedule_Import     regression
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${Schedule_EntityMapping_File_Location}    ${Entity_Auto_Import_Path}
    BuiltIn.Sleep  6s
    DMS Network Console UI Login
    BuiltIn.Sleep  4s
    Open Schedule Import Page
    BuiltIn.Sleep  4s
    Schedule Entity Mapping Import
    BuiltIn.Sleep  60s
    Open Operation History
    BuiltIn.Sleep  60s
    Verify Operation History Schedule Entity import values



Service Setting 6.0 Schedule Import
    [Documentation]  Service Setting 6.0 Schedule Import
    [Tags]   Service_Setting_6.0_Schedule_Import     regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${Schedule_6_0_ServiceSetting_File_Location}    ${SERVICE_SETTING_AUTO_IMPORT_PATH}
    BuiltIn.Sleep  6s
    DMS Network Console UI Login
    BuiltIn.Sleep  4s
    Open Schedule Import Page
    BuiltIn.Sleep  4s
    Schedule 6.0 ONECELL SS Import
    BuiltIn.Sleep  60s
    Open Operation History
    BuiltIn.Sleep  60s
    Verify Operation History Schedule 6.0 Service Setting values


Factory File Schedule Import with NW
    [Documentation]  Factory File Schedule Import with NW option
    [Tags]   Factory_File_Schedule_Import_NW     Factory_File_Import_NW    Factory_file    regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${BC_NW_Factory_File_Location}    ${Factory_Import_Path}
    DMS Network Console UI Login
    BuiltIn.Sleep  5s
    Delete Existing BC Device from DMS Device List Page
    Open Schedule Import Page
    Schedule Factory Import
    BuiltIn.Sleep  240s
    Open Operation History
    Verify Operation History for NW Factory File Import
    Device console Login
    Login with Device ID    ${BC_DELETE}
    set global variable  ${DEVICE_MACID}  ${BC_DELETE}
    Verify Device State in Device Dashboard


Factory File Manual Import with NW
    [Documentation]  Factory File Manual Import with NW option
    [Tags]   Factory_File_Manual_Import_NW     Factory_File_Import_NW    Factory_file    regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${BC_NW_Factory_File_Location}    ${FACTORY_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Delete Existing BC Device from DMS Device List Page
    Open File Import Page
    Select and import factory file
    BuiltIn.Sleep  60s
    Open Operation History
    Verify Operation History for NW Factory File Import
    Device console Login
    Login with Device ID    ${BC_DELETE}
    set global variable  ${DEVICE_MACID}  ${BC_DELETE}
    Verify Device State in Device Dashboard



Gold Standard Value file manual import for 5G
    [Documentation]  GSV File Manual Import for 5G devices
    [Tags]   GSV_File_Manual_Import_5G    GSV_File_Import_5G    Gold_Standard_Value    regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${GSV_File_Location_for_5G}    ${GSV_Import_Path}
    DMS Network Console UI Login
    Open File Import Page
    Select and import Gold Standard Value file
    BuiltIn.Sleep  30s
    Open Operation History
    Verify Operation History for 5G GSV File Import


Gold Standard Value file scheduled import for 5G
    [Documentation]  GSV File Scheduled Import for 5G devices
    [Tags]   GSV_File_Scheduled_Import_5G    GSV_File_Import_5G    Gold_Standard_Value    regression    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${GSV_File_Location_for_5G}    ${GSV_Schedule_Import_Path}
    DMS Network Console UI Login
    Open Schedule Import Page
    Schedule Gold Standard Value Import
    BuiltIn.Sleep  60s
    Open Operation History
    Verify Operation History for 5G GSV File Import