*** Settings ***
#Suite Setup       DMS Network Console UI Login   # Login DMS UI with AdminUser
#Suite Teardown    DMS Network Console UI Logout    # Logging off
Suite Teardown      DMS UI Logout    # Logging off
Resource        ../resources/common/ui_common.robot
Resource        ../resources/dashboard/dashboard_keywords.robot
Resource        ../resources/System_Alarm_Opeartions/system_alarm_operations_keywords.robot
Resource        ../resources/Device_Alarm_Operations/device_alarm_operations_keywords.robot
Resource        ../resources/Device_Alarm_Operations/device_alarm_dc_operations_keywords.robot
Resource        ../resources/ddlg/ddlg_keywords.robot
Resource        ../resources/Alarm_gNB/alarm_page.robot
Resource        ../resources/device_history/device_history_page_keywords.robot
Resource        ../resources/dashboard_6.0/device_operation.robot


*** Variables ***


*** Test Cases ***
DU Raise and Clear Alarm Verification
    [Documentation]  Verify DU Raise and clear Alarm in DMS
    [Tags]  Alarm_gNB  du_alarm   regression    regression_6.0
    Start ves pool 	${DU_ALARM_RAISE_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify DU Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify DU Alarm in Network Console Device Alarm Page
    Stop ves pool 	${DU_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${DU_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify DU Clear Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify DU Clear Alarm in Network Console Device Alarm Page
    Stop ves pool 	${DU_ALARM_CLEAR_JOB}

CUCP Raise and Clear Alarm Verification
    [Documentation]  Verify CUCP Raise and clear Alarm in DMS
    [Tags]  Alarm_gNB  cucp_alarm   regression    regression_6.0
    Start ves pool 	${CUCP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${CUCP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUCP_VENUE_DEVICE1}
    Verify CUCP Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUCP Alarm in Network Console Device Alarm Page
    Stop ves pool 	${CUCP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${CUCP_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${CUCP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUCP_VENUE_DEVICE1}
    Verify CUCP Clear Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUCP Clear Alarm in Network Console Device Alarm Page
    Stop ves pool 	${CUCP_ALARM_CLEAR_JOB}

CUUP Raise and Clear Alarm Verification
    [Documentation]  Verify CUUP Raise and clear Alarm in DMS
    [Tags]  Alarm_gNB  cuup_alarm   regression    regression_6.0
    Start ves pool 	${CUUP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${CUUP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUUP_VENUE_DEVICE1}
    Verify CUUP Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUUP Alarm in Network Console Device Alarm Page
    Stop ves pool 	${CUUP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${CUUP_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${CUUP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUUP_VENUE_DEVICE1}
    Verify CUUP Clear Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUUP Clear Alarm in Network Console Device Alarm Page
    Stop ves pool 	${CUUP_ALARM_CLEAR_JOB}

RP Raise and Clear Alarm Verification
    [Documentation]  Verify RP Raise and clear Alarm in DMS
    [Tags]  Alarm_gNB  regression  du_rp_alarm    regression_6.0
    Start ves pool 	${RP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify RP Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RP Alarm in Network Console Device Alarm Page
    Stop ves pool 	${RP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${RP_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  20s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify RP Clear Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RP Clear Alarm in Network Console Device Alarm Page
    Stop ves pool 	${RP_ALARM_CLEAR_JOB}

CUCP Alarm details in additional info
    [arguments]    ${CUCP_gNBid}    ${CUCP_vnfid}    ${CUCP_gNBName}
    [Documentation]  Verify gNBid gNBName vnfid for CUCP Alarm in DMS
    [Tags]  Alarm_gNB  cucp_gNBid_gNBName_vnfid  vnf_gNBid_alarmVerify  regression    regression_6.0
    BuiltIn.Sleep  5s
    Start ves pool 	${CUCP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  10s
    Device console Login
    Login with gNB Device ID  ${CUCP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUCP_VENUE_DEVICE1}
    Verify CUCP Alarm details in Additional info    ${CUCP_gNBid}    ${CUCP_Alarm_vnfid}    ${CUCP_gNBName}
    BuiltIn.Sleep  8s
    Stop ves pool 	${CUCP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${CUCP_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  10s
    Stop ves pool 	${CUCP_ALARM_CLEAR_JOB}

CUUP Alarm details in additional info
    [arguments]    ${CUUP_gNBid}    ${CUUP_vnfid}    ${CUUP_gNBName}
    [Documentation]  Verify gNBid gNBName vnfid for CUUP Alarm in DMS
    [Tags]  Alarm_gNB  cuup_gNBid_gNBName_vnfid    vnf_gNBid_alarmVerify   regression    regression_6.0
    Start ves pool 	${CUUP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  10s
    Device console Login
    Login with gNB Device ID  ${CUUP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUUP_VENUE_DEVICE1}
    Verify CUUP Alarm details in Additional info    ${CUUP_gNBid}    ${CUUP_Alarm_vnfid}    ${CUUP_gNBName}
    BuiltIn.Sleep  8s
    Stop ves pool 	${CUUP_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${CUUP_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  10s
    Stop ves pool 	${CUUP_ALARM_CLEAR_JOB}


DU Alarm details in additional info
    [Documentation]  Verify gNBid gNBName vnfid for DU Alarm in DMS
    [Tags]  Alarm_gNB  du_gNBid_gNBName_vnfid    vnf_gNBid_alarmVerify    regression    regression_6.0
    Start ves pool 	${DU_ALARM_RAISE_JOB}
    BuiltIn.Sleep  10s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify DU Alarm details in Additional info    ${DU_gNBid}    ${DU_Alarm_vnfid}    ${DU_gNBName}
    Stop ves pool 	${DU_ALARM_RAISE_JOB}
    BuiltIn.Sleep  30s
    Start ves pool 	${DU_ALARM_CLEAR_JOB}
    BuiltIn.Sleep  10s
    Stop ves pool 	${DU_ALARM_CLEAR_JOB}

New CUUP Alarm after Sync Alarms operation
    [Documentation]  Verify CUUP new alarm after Sync alarm operation
    [Tags]  Alarm_gNB  regression  cuup_sync_alarm  sync_alarm    regression_6.0
    Stop and start ves pool    ${CU_UP_VENUE_DEVICE1}
    BuiltIn.Sleep  100s
    Device console Login
    Login with gNB Device ID  ${CUUP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUUP_VENUE_DEVICE1}
    Verify CUUP Alarm in Device Console Alarm Page after Sync Alarm operation
    Verify Sync Alarm in device History   Tabular  Last 1 hour  All  CRITICAL
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUUP Alarm in Network Console Alarm Page after Sync Alarm operation
Clear DU Alarm after Sync Alarms operation
    [Documentation]  Verify DU clear alarm after Sync alarm operation
    [Tags]  Alarm_gNB  regression  du_clear_sync_alarm  sync_alarm    regression_6.0
    Stop and start ves pool    ${DU_VENUE_DEVICE1}
    BuiltIn.Sleep  100s
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify DU Alarm in Device Console Alarm Page after Sync Alarm operation
    Verify DU Sync Alarm in device History   Tabular  Last 1 hour  All  CLEAR
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify DU Alarm in Network Console Alarm Page after Sync Alarm operation

Clear CUCP Alarm after Sync Alarms operation
    [Documentation]  Verify CUCP clear alarm after Sync alarm operation
    [Tags]  Alarm_gNB  regression  cucp_clear_sync_alarm  sync_alarm    regression_6.0
    Stop and start ves pool    ${CU_CP_VENUE_DEVICE1}
    BuiltIn.Sleep  100s
    Device console Login
    Login with gNB Device ID  ${CUCP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUCP_VENUE_DEVICE1}
    Verify CUCP Alarm in Device Console Alarm Page after Sync Alarm operation
    Verify Sync Alarm in device History   Tabular  Last 1 hour  All  CLEAR
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify CUCP Alarm in Network Console Alarm Page after Sync Alarm operation

Sync Alarm opearation during CUCP factory provision
    [Documentation]  Verify Sync Alarm opearation during CUCP factory provision
    [Tags]  Alarm_gNB  regression  cucp_sync_reset    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CUCP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUCP_VENUE_DEVICE1}
    Perform Sync Operation during CUCP Factoryreset
    Verify operation details in Notification  ipsec2-2051cucp1

Sync Alarm opearation during DU Reboot
    [Documentation]  Verify Sync Alarm opearation during DU Reboot
    [Tags]  Alarm_gNB  regression  du_sync_reboot    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Perform Sync Operation during DU Reboot
    Verify operation details in Notification  ipsec2-2051du1

Sync Alarm opearation during CUUP Replan
    [Documentation]  Verify Sync Alarm opearation during CUUP Replan
    [Tags]  Alarm_gNB  regression  cuup_sync_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CUUP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CUUP_VENUE_DEVICE1}
    Perform Sync Operation during CUUP Replan
    Verify operation details in Notification  ipsec2-2051cuup1

PnP mandatory computation failure Alarm CP
    [Documentation]  PnP mandatory computation failure Alarm CP
    [Tags]  Alarm_gNB  cp_pnp_computation_failure_alarm    pnp_computation_failure_alarm    regression    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE23_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE23_MACID}
    Reset gNB Device
    BuiltIn.Sleep  15s
    Verify PnP Status page Navigation
    BuiltIn.Sleep  8s
    Verify computation failure PnP status
    BuiltIn.Sleep  4s
    DMS Network Console UI Login
    BuiltIn.Sleep  6s
    Verify Computation failure alarm    ${cucp}


PnP mandatory computation failure Alarm UP
    [arguments]    ${cuup}
    [Documentation]  PnP mandatory computation failure Alarm UP
    [Tags]  Alarm_gNB  up_pnp_computation_failure_alarm    pnp_computation_failure_alarm    regression   regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE23_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE23_MACID}
    Reset gNB Device
    BuiltIn.Sleep  15s
    Verify PnP Status page Navigation
    BuiltIn.Sleep  8s
    Verify computation failure PnP status UP
    BuiltIn.Sleep  4s
    DMS Network Console UI Login
    BuiltIn.Sleep  6s
    Verify Computation failure alarm    ${cuup}


PnP mandatory computation failure Alarm DU
    [arguments]  ${du}
    [Documentation]  PnP mandatory computation failure Alarm DU
    [Tags]  Alarm_gNB  du_pnp_computation_failure_alarm    pnp_computation_failure_alarm    regression    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE23_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE23_MACID}
    Reset gNB Device
    BuiltIn.Sleep  15s
    Verify PnP Status page Navigation
    BuiltIn.Sleep  8s
    Verify computation failure PnP status DU
    BuiltIn.Sleep  5s
    DMS Network Console UI Login
    BuiltIn.Sleep  6s
    Verify Computation failure alarm    ${du}

RPTxOff Alarm Raise Verification for DU
    [Documentation]  Verify DMS Raises Alarm on RPTxOff notification from RP
    [Tags]  Alarm_gNB    du_alarm     rp_tx_alarm     regression      regression_6.0
    Create And Update Notification config file path ddlg    ${DU_DEVICE2_MACID}  conf/device/du/notification_RPTx_disabled.xml
    BuiltIn.Sleep   50s
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    BuiltIn.Sleep  59s
    Verify RPTxOff Raise Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RPTxOff Raise Alarm in Network Console Device Alarm Page

RPTxOff Alarm Clear Verification for DU
    [Documentation]  Verify DMS Clears Alarm on RPTxOff notification from RP
    [Tags]  Alarm_gNB    du_alarm     rp_tx_clear_alarm     regression     regression_6.0
    Create And Update Notification config file path ddlg    ${DU_DEVICE2_MACID}  conf/device/du/notification_RPTx_Ready.xml
    BuiltIn.Sleep   50s
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    BuiltIn.Sleep  59s
    Verify RPTxOff Clear Alarm in Device Console Alarm Page
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RPTxOff Clear Alarm in Network Console Device Alarm Page

