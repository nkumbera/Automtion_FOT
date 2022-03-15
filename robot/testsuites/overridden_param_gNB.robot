*** Settings ***
Documentation       DMS Override Parameter Test Suite
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
#Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
Resource            ../resources/overwrridden_params_gNB/overwrridden_params.robot
Resource            ../resources/provisioning/provisioning_keywords.robot
Library             String
Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/Search_Page/Search_Device.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/HeartBeat/heartbeat_keywords.robot
Resource            ../resources/ServiceSetting/ServiceSetting_keywords.robot
Resource            ../resources/RadioPoint/radiopoint_keywords.robot

*** Variables ***
${AddFile_CUCP}          ${EXECDIR}${CU_CP_SETTINGS_FILE_LOCATION}
${AddFile_CUUP}          ${EXECDIR}${CU_UP_SETTINGS_FILE_LOCATION}
${AddFile_DU}            ${EXECDIR}${DU_SETTINGS_FILE_LOCATION}

*** Test Cases ***

Mandatory Subscription on CUCP reset
    [Documentation]  Verify Mandatory subscription on CUCP reset
    [Tags]   cucp_subscription  overridden_param_gnb  regression   cu-cp    regression_6.0
    Device console Login
    search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Verify gNB Device Reset Status
    Verify CUCP Subscription in PnP Status
    CUCP Subscription on Device History   Tabular  Last 1 hour  COMPUTATION

Mandatory Subscription on CUUP reset
    [Documentation]  Verify Mandatory subscription on CUUP reset
    [Tags]   cuup_subscription  overridden_param_gnb  regression     cu-up    regression_6.0
    Device console Login
    search using cu_up name    ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Verify gNB Device Reset Status
    Verify CUUP Subscription in PnP Status
    CUUP Subscription on Device History   Tabular  Last 1 hour  COMPUTATION

Mandatory Subscription on DU reset
    [Documentation]  Verify Mandatory subscription on DU reset
    [Tags]   du_subscription  overridden_param_gnb  regression     du    regression_6.0
    Device console Login
    search using du name    ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify gNB Device Reset Status
    Verify DU Subscription in PnP Status
    DU Subscription on Device History   Tabular  Last 1 hour  COMPUTATION

EntityMapping file import along MeNB Device
    [Documentation]  Verify Entity file import is successful along MeNB device
    [Tags]   entity_mapping_import    import    regression    entitymapping    working    regression_6.0
    Stop and start ves pool    ${DU_VENUE_DEVICE1}
    BuiltIn.Sleep  150s
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${ENTITYMAPPING_FILE_LOCATION}    ${ENTITYMAPPING_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Entity Mapping file
    Verify Operation History for Entity Mapping file import    Entity Mapping       Automation-device-entity.xml
    Device console Login
    Search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    Verify Topology Navigation from dashboard
    #Verify X2C Param Delta in Provisioning Page



Auto Update of MeNB S1 TIA IP for CU-CP during MeNB PnP
    [Documentation]  Auto Update of MeNB S1 TIA IP for CU-CP during MeNB PnP
    [Tags]   s1_tia_ip  gnb_overridden_param_gnb     cu-cp    regression    entitymapping    regression_6.0
    Stop and start ves pool    ${BC_VENUE_DEVICE1}
    BuiltIn.Sleep  150s
    Device console Login
    Login with Device ID  ${BC_VENUE_DEVICE1}
    set suite variable  ${DEVICE_MACID}  ${BC_VENUE_DEVICE1}
    #Reset Device
    BuiltIn.Sleep  30s
    #Dashboard Device InService Status
    Verify PNP Workflow Status
    MeNB X2C Value Change in Device History   Tabular  Last 1 hour  INFORMS
    DMS UI Logout
    Device console Login
    search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Verify X2C TIA PARAM in CUCP Provisioned Page
    X2C TIA PARAM on Device History   Tabular  Last 1 hour  COMPUTATION

Remove EntityMapping association for MeNB Device
    [Documentation]  Verify that removal of Entity file association is successful for MeNB device
    [Tags]   remove_entitymapping_import    import    regression    entitymapping    working    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${ENTITYMAPPING_DEL_FILE_LOCATION}    ${ENTITYMAPPING_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Entity Mapping file
    Verify Operation History for Entity Mapping file import  Entity Mapping    Automation-device-entity.xml
    Device console Login
    search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    Verify X2C Delete Param Delta in Provisioning Page

Heartbeat Delta Provisioning on Replan CUCP
    [Documentation]    Heartbeat Delta Provisioning on Replan
    [Tags]    delta_provisioning_CUCP_Hearhbeat    Regression    Provision    Heartbeat_Interval_Provisioning    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    #set global variable  ${DEVICE_MACID}  ${CU_CP_MinMan_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden}
    replan gnb device
    BuiltIn.Sleep  30s
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden1}
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    #Change the device to unmaged and back to Managed
    BuiltIn.Sleep  60s
    #Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_CP}
    Verify value provisioned for Heartbeat Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}



Heartbeat Delta Provisioning on Replan CUUP
    [Documentation]    Heartbeat Delta Provisioning on Replan
    [Tags]    delta_provisioning_CUUP_Hearhbeat    Regression    Provision    Heartbeat_Interval_Provisioning    regression_6.0
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    search using cu_up name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden}
    replan gnb device
    BuiltIn.Sleep  30s
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden1}
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    #Change the device to unmaged and back to Managed
    BuiltIn.Sleep  60s
    #Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_CP}
    Verify value provisioned for Heartbeat Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}


Heartbeat Delta Provisioning on Replan DU
    [Documentation]    Heartbeat Delta Provisioning on Replan
    [Tags]    delta_provisioning_DU_Hearhbeat    Regression    Provision    Heartbeat_Interval_Provisioning    regression_6.0
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    search using du name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden}
    replan gnb device
    BuiltIn.Sleep  30s
    configure Heartbeat Params CU    ${VES_DICT_Heartbeat_DMS_Overridden1}
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    #Change the device to unmaged and back to Managed
    BuiltIn.Sleep  60s
    #Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_CP}
    Verify value provisioned for Heartbeat Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}

CUCP PnP with UI Overridden
    [Tags]    UI_Override_CUCP  UI_Override  regression    regression_6.0
    Log    Check CU-CP_Device UI Override Test
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    #Verify Dashboard gNB Device InService Status
    Add DMS Overriden Parameter CUCP gNBID Keywords
    Add DMS Overriden Parameter CUCP PLMN Keywords
    Add DMS Overriden Parameter CUCP Cell Local ID Keywords
    Add DMS Overriden Parameter CUCP PLMNInfoList Keywords
    Add DMS Overriden Parameter CUCP X2 C Keywords
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  10s

    #Verify gNBID Param Value in Overridden Page
    #Verify gNBName Param Value in Overridden Page

    Verify gNB Device Reset Status
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_CUCP}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  10s
    Delete DMS Overriden Parameter CUCP gNBID Keywords
    Delete DMS Overriden Parameter CUCP PLMN Keywords
    Delete DMS Overriden Parameter CUCP Cell Local ID Keywords
    Delete DMS Overriden Parameter CUCP PLMNInfoList Keywords
    Delete DMS Overriden Parameter CUCP X2 C Keywords
    BuiltIn.Sleep  5s
    DMS UI Logout


CUUP PnP with UI Overridden
    [Tags]    UI_Override_CUUP  UI_Override  regression    regression_6.0
    Log    Check CU-UP_Device UI Override Test
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    #Verify Dashboard gNB Device InService Status
    Add DMS Overriden Parameter CUUP gNBID Keywords
    Add DMS Overriden Parameter CUUP E1 Keywords
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  10s
    #Verify gNBID Param Value in Overridden Page
    #Verify gNBName Param Value in Overridden Page
    Verify gNB Device Reset Status
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_CUUP}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  10s
    Delete DMS Overriden Parameter CUUP gNBID Keywords
    Delete DMS Overriden Parameter CUUP E1 Keywords
    BuiltIn.Sleep  5s
    DMS UI Logout

DU PnP with UI Overridden
    [Tags]    UI_Override_DU  UI_Override  regression    regression_6.0
    Log    Check DU_Device UI Override Test
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    #Verify Dashboard gNB Device InService Status
    Add DMS Overriden Parameter DU gNBID Keywords
    Add DMS Overriden Parameter DU F1 C Keywords
    Add DMS Overriden Parameter DU PLMN Keywords
    Add DMS Overriden Parameter DU Cell Local ID Keywords
    Add DMS Overriden Parameter DU NR PCI Keywords
    Add DMS Overriden Parameter DU ARFCN DL Keywords
    Add DMS Overriden Parameter DU ARFCN UL Keywords
    Add DMS Overriden Parameter DU DL BS Channel BW Keywords
    Add DMS Overriden Parameter DU UL BS Channel BW Keywords
    Add DMS Overriden Parameter DU NR Frequency Band DL Keywords
    Add DMS Overriden Parameter DU Root Sequence Index Keywords

    #Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    #BuiltIn.Sleep  10s
    #Verify gNBID Param Value in Overridden Page
    #Verify gNBName Param Value in Overridden Page
    #Verify gNB Device Reset Status
    #BuiltIn.Sleep  60s
    #Associate New Profile    ${AddFile_DU}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    #BuiltIn.Sleep  10s
    Delete DMS Overriden Parameter DU gNBID Keywords
    Delete DMS Overriden Parameter DU F1 C Keywords
    Delete DMS Overriden Parameter DU PLMN Keywords
    Delete DMS Overriden Parameter DU Cell Local ID Keywords
    Delete DMS Overriden Parameter DU NR PCI Keywords
    Delete DMS Overriden Parameter DU ARFCN DL Keywords
    Delete DMS Overriden Parameter DU ARFCN UL Keywords
    Delete DMS Overriden Parameter DU DL BS Channel BW Keywords
    Delete DMS Overriden Parameter DU UL BS Channel BW Keywords
    Delete DMS Overriden Parameter DU NR Frequency Band DL Keywords
    Delete DMS Overriden Parameter DU Root Sequence Index Keywords

    BuiltIn.Sleep  5s
    DMS UI Logout


Replace RP whitelist and replan DU
    [Documentation]    Replace RP whitelist and replan DU
    [Tags]    Regression    RP_Whitelist_gNB    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    search using du name    ${DEVICE_MACID}
    configure whitelst Params DU    ${Whitelist_DMS_Overridden_value1}
    #Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  90s
    Verify value provisioned for Whitelist Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}    ${Whitelist_DMS_Overridden_value1}
    configure whitelst Params DU    ${Whitelist_DMS_Overridden_value}
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    BuiltIn.Sleep  60s
    Verify value provisioned for Whitelist Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}    ${Whitelist_DMS_Overridden_value}
    RU Add Notification Verification in device History


Override HBPeriod gNBName on CUCP
    [Documentation]   Override CP HBPeriod gNBName and provision on Replan
    [Tags]    override_CUCP_HB_gNBName  override_HB_gNBName    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    search using cu_cp name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    Override CP HBPeriod and gNBName
    BuiltIn.Sleep  8s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  5s
    replan gnb device
    Verify HB Provisioning details
    BuiltIn.Sleep  5s
    #Verify HB gNBName in device history CU    Tabular  Last 1 hour   PROVISIONING
    #BuiltIn.Sleep  8s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep  3s
    Deleting CP HB Period and gNBName
    BuiltIn.Sleep  3s
    replan gnb device
    BuiltIn.Sleep  3s


Override HBPeriod gNBName on CUUP
    [Documentation]    Override UP HBPeriod gNBName and provision on Replan
    [Tags]    override_CUUP_HB_gNBName  override_HB_gNBName    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    search using cu_up name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    Override UP HBPeriod and gNBName
    BuiltIn.Sleep  6s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  3s
    Verify HB Provisioning details
    BuiltIn.Sleep  3s
    Verify HB gNBName in device history UP    Tabular  Last 1 hour   PROVISIONING
    BuiltIn.Sleep  8s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep  3s
    Deleting UP HB Period and gNBName
    BuiltIn.Sleep  3s
    replan gnb device
    BuiltIn.Sleep  3s


Override HBPeriod gNBName on DU
    [Documentation]    Override DU HBPeriod gNBName and provision on Replan
    [Tags]    override_DU_HB_gNBName    override_HB_gNBName    Regression    regression_6.0
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    search using du name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep  3s
    Override DU HBPeriod and gNBName
    BuiltIn.Sleep  6s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  3s
    replan gnb device
    BuiltIn.Sleep  3s
    Verify HB Provisioning details
    BuiltIn.Sleep  4s
    Verify HB gNBName in device history DU    Tabular  Last 1 hour   PROVISIONING
    BuiltIn.Sleep  8s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep  5s
    Deleting DU HB Period and gNBName
    BuiltIn.Sleep  3s
    replan gnb device
    BuiltIn.Sleep  3s

X2C and CA Secgw modification for CUCP device
    [Documentation]    X2C and CA Secgw modification for CUCP device
    [Tags]    delta_provisioning_CUCP_X2C    regression    Provision    x2c_ca_param    regression_6.0
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    search using cu_cp name    ${DEVICE_MACID}
    Verify DMS Overriden Params page Navigation
    configure X2C and CA Params CU-CP    ${X2C_DMS_Overridden}    ${CA_DMS_Overridden}
    #Verify X2C SGW and CA Delta in CU-CP Provisioning Page
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    Verify DMS Overriden Params page Navigation
    Delete X2C and CA Params CU-CP
    replan gnb device
    BuiltIn.Sleep  30s

Delete RU5200 whitelist in DMS
    [Documentation]    Delete RU5200 whitelist in DMS
    [Tags]    regression    RP_Whitelist_Delete    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    configure whitelst Params DU    ${Whitelist_Delete_value}
    replan gnb device
    BuiltIn.Sleep  90s
    Verify value provisioned for Whitelist Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}    ${Whitelist_Delete_value}
    Delete whitelst Params DU
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    replan gnb device
    BuiltIn.Sleep  30s
    BuiltIn.Sleep  60s
    Verify Delete Whitelist Configuration    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}    ${Whitelist_Delete_value}
    Verify whitelist Delete    Tabular  Last 1 hour     PROVISIONING

Mandatory Notification subscription and replay notifications for CUCP
    [Documentation]    Verify Mandatory Notification subscription and replay notifications for CUCP device
    [Tags]    subscription_replay_CUCP    regression    Provision    regression_6.0
    Stop and start ves pool    ${CU_CP_VENUE_DEVICE1}
    BuiltIn.Sleep  60s
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    search using cu_cp name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  30s
    CUCP Subscription on Device History   Tabular  Last 1 hour  All
    CUCP Replay notification in Device History

Mandatory Notification subscription and replay notifications for CUUP
    [Documentation]    Verify Mandatory Notification subscription and replay notifications for CUUP device
    [Tags]    subscription_replay_CUUP    regression    Provision    regression_6.0
    Stop and start ves pool    ${CU_UP_VENUE_DEVICE1}
    BuiltIn.Sleep  60s
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    search using cu_up name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  30s
    CUUP Subscription on Device History   Tabular  Last 1 hour  All
    CUUP Replay notification in Device History


Mandatory Notification subscription and replay notifications for DU
    [Documentation]    Verify Mandatory Notification subscription and replay notifications for DU device
    [Tags]    subscription_replay_DU    regression    Provision    regression_6.0
    Stop and start ves pool    ${DU_VENUE_DEVICE1}
    BuiltIn.Sleep  150s
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    search using du name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  30s
    DU Subscription on Device History   Tabular  Last 1 hour  All
    DU Replay notification value in Device History   Tabular  Last 1 hour  All

DMS displays warning message for unknown RPs addition
    [Documentation]  DMS displays warning message for RPs which are not available in DMS DB
    [Tags]   dashboard      regression    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set suite variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Verify gNB Radio Point Addition

Reboot Provisioning when Device and/or DMS flags are true and change in lastReboottime
    [Documentation]    Reboot Provisioning when Device and/or DMS flags are true and change in lastReboottime
    [Tags]    regression    Reboot_vnf    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Reboot Status
    Verify UserDefinedFlag
    Verify Last Established time
    Verify Device History for Reboot    Tabular  Last 1 hour   DEVICE    ${DEVICE_HISTORY_PARAMETER_CU}

Reboot Provisioning when Device and/or DMS flags are true and change in lastReboottime + delta
    [Documentation]    Reboot Provisioning when Device and/or DMS flags are true and change in lastReboottime + delta
    [Tags]    regression    Reboot_provisioning    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Configure ves value in Device console and reboot
    Verify gNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU}
    Reboot gNB Device
    BuiltIn.Sleep  60s
    Verify gNB provisioned value for ves after reboot    ${DEVICE_PROVSIONED_DATA_CUCP}
    Verify UserDefinedFlag
    Verify Last Established time
    Verify Device History for Reboot    Tabular  Last 1 hour   DEVICE    ${DEVICE_HISTORY_PARAMETER_CU}

Delta Provisioning when Device, DMS flag are true and no change in lastReboottime and delta exists for CUCP
    [Documentation]    Delta Provisioning when Device, DMS flag are true and no change in lastReboottime and delta exists for CUCP
    [Tags]    regression    delta_provisioning_with_workflow    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Configure ves value in Device console and reboot
    Verify gNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  120s
    Verify gNB provisioned value for ves after reboot    ${DEVICE_PROVSIONED_DATA_CUCP}
    Verify UserDefinedFlag
    Verify Last Established time
    Verify Device History for Delta    Tabular  Last 1 hour   DEVICE    ${DEVICE_HISTORY_PARAMETER_CU}

No provisioning when Device, DMS flag are true and no change in lastReboottime and no delta exists for CUCP
    [Documentation]    No provisioning when Device, DMS flag are true and no change in lastReboottime and no delta exists for CUCP
    [Tags]    Regression    no_delta_provisioning_no_workflow    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    ${Device_console_Server_Time}=    Verify Device Console Server Time
    ${last_est_time1}=    Verify Last Established time
    Verify gNB no Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  120s
    Verify UserDefinedFlag
    BuiltIn.Sleep  10s
    ${last_est_time2}=     Verify Last Established time
    should not match     ${last_est_time1}     ${last_est_time2}
    should not match     ${Device_console_Server_Time}     ${last_est_time2}
    Verify Device History for nonexist of Delta entry    Tabular  Last 1 hour   DEVICE    ${DEVICE_HISTORY_PARAMETER_CU}


Replan required tag for CP
    [Documentation]   Replan required tag for CP
    [Tags]    replan_required_cp  replan_required_tag    Regression    regression_6.0
    Device console Login
    search using cu_cp name    ${rutest_CP}
    set global variable  ${DEVICE_MACID}  ${rutest_CP}
    Verify DMS Overriden Params page Navigation
    Verify Replan required tag

Replan required tag for UP
    [Documentation]   Replan required tag for UP
    [Tags]    replan_required_up  replan_required_tag    Regression    regression_6.0
    Device console Login
    search using cu_up name    ${rutest_UP}
    set global variable  ${DEVICE_MACID}  ${rutest_UP}
    Verify DMS Overriden Params page Navigation
    Verify Replan required tag UP


Replan required tag for DU
    [Documentation]   Replan required tag for DU
    [Tags]    replan_required_du  replan_required_tag    Regression    regression_6.0
    Device console Login
    search using du name    ${rutest_DU}
    set global variable  ${DEVICE_MACID}  ${rutest_DU}
    Verify DMS Overriden Params page Navigation
    Verify Replan required tag


Add Entity Mapping association from GUI
    [Documentation]   Add Entity Mapping association from GUI
    [Tags]    entity_mapping_association_gui    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${rutest_CP}
    search using cu_cp name    ${DEVICE_MACID}
    BuiltIn.Sleep  3s
    Navigate to Device Other overridden params page     ${DEVICE_ENTITY_MAPPING_URL_CU}
    Add New Entity association from GUI
    BuiltIn.Sleep  6s
    Navigate to Device Other overridden params page     ${DEVICE_ENTITY_MAPPING_URL_CU}
    replan gnb device
    BuiltIn.Sleep  3s
    Open gNB Device PNP Page
    Entity association PnP verify
    Navigate to Device Other overridden params page     ${DEVICE_ENTITY_MAPPING_URL_CU}
    BuiltIn.Sleep  3s
    Delete Entity Association from GUI
    BuiltIn.Sleep  2s
