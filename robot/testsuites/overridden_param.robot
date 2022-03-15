*** Settings ***
Documentation       DMS Override Parameter Test Suite
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
#Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
Resource            ../resources/provisioning/provisioning_keywords.robot
Library             String
Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot

*** Test Cases ***
Modify Sector 2 Mandatory Param on Replan
    [Documentation]  Replan device after updating mandatory overridden parameters
    [Tags]   mandatory_overridden_param  overridden_param    mandatory_overridden_param_sector2    regression    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Mandatory Params  Sector 2
    Verify Delta Provisioning Status
    Verify Device Replan Status
    DMS UI Logout

Modify Sector 2 Optional Param on Reboot
    [Documentation]  Reboot device after updating optional overridden parameters
    [Tags]   optional_overridden_param  overridden_param  regression   optional_overridden_param_sector2    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update Optional Params  Sector 2
    Verify Delta Provisioning Status
    Verify Device Reboot Status
    DMS UI Logout

Modify Sector 2 Scalar Param on Periodic
    [Documentation]  Periodic operation device after updating scalar overridden parameters
    [Tags]   scalar_overridden_param_periodic  overridden_param  regression    working    periodic_device
    Device console Login
    #DMS UI Login
    Login with Device ID  ${DEVICE16_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE16_MACID}
    Update Scalar Params  Sector 2
    Verify Delta Provisioning Status
    #Verify Periodic Device Test
    Verify Periodic Device Test with ddlg

Modify Sector 2 Tabular Param on Reboot
    [Documentation]  Reboot device after updating tabular overridden parameters
    [Tags]   tabular_overridden_param  overridden_param  regression     sector2_reboot    sector1_test    working
    Device console Login
    #DMS UI Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update Tabular Params  Sector 2
    Verify Delta Provisioning Status
    Verify Device Reboot Status

Modify Sector 1 Mandatory Param on Replan
    [Documentation]  Replan device after updating mandatory overridden parameters
    [Tags]   mandatory_overridden_param  overridden_param  regression    sector1_test    working
    Device console Login
    #DMS UI Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Mandatory Params  Sector 1
    Verify Delta Provisioning Status
    Verify Device Replan Status

Modify Sector 1 Optional Param on Periodic
    [Documentation]  Periodic operation device after updating optional overridden parameters
    [Tags]   optional_overridden_param  overridden_param  regression    sector1_test    optional_periodic    working    periodic_device
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE17_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE17_MACID}
    Update Optional Params  Sector 1
    Verify Delta Provisioning Status
    #Verify Periodic Device Test
    Verify Periodic Device Test with ddlg

Modify Sector 1 Scalar Param on Replan
    [Documentation]  Replan device after updating scalar overridden parameters
    [Tags]   scalar_overridden_param  overridden_param  regression     sector1_replan_param    sector1_test    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Scalar Params  Sector 1
    Verify Delta Provisioning Status
    Verify Device Replan Status

Modify Sector 1 Tabular Param on Reboot
    [Documentation]  Reboot device after updating tabular overridden parameters
    [Tags]   tabular_overridden_param  overridden_param  regression    sector1_test    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update Tabular Params  Sector 1
    Verify Delta Provisioning Status
    Verify Device Reboot Status

Modify eNodeB Mandatory Param on Replan
    [Documentation]  Replan device after updating mandatory overridden parameters
    [Tags]   mandatory_overridden_param  overridden_param  regression   eNodeB_Mandatory    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update eNodeB Mandatory Params
    Verify Delta Provisioning Status
    Verify Device Replan Status

Modify eNodeB Optional Param on Reboot
    [Documentation]  Reboot device after updating optional overridden parameters
    [Tags]   optional_overridden_param  overridden_param  regression    eNodeB_optional    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update eNodeB Optional Params
    Verify Delta Provisioning Status
    Verify Device Reboot Status



Provisioning of Delta DAS Driver param on Replan
    [Documentation]  Provisioning of delta DAS Driver value during ondemand replan
    [Tags]   das_provisioning  delta_provisiioning  regression  overridden_param    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Delta DAS Driver Params  eNodeB
    Verify Delta Provisioning Status
    Verify Device Replan Status

Provisioning of Delta QAM param on Replan
    [Documentation]  Provisioning of delta DL256QAM and UL64QAM params on ondemand replan
    [Tags]   qam_provisioning  delta_provisiioning    overridden_param    regression    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Delta QAM Params  Sector 1
    BuiltIn.Sleep  5s
    Update Delta QAM Params  Sector 2
    Verify Delta Provisioning Status
    Verify Device Replan Status

Provisioning of NGRP param on Replan
    [Documentation]  Provisioning of NGRP parameters on ondemand replan from GUI
    [Tags]   ngrp_provisioning  delta_provisiioning  regression     overridden_param     working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Delta NGRP Params  eNodeB
    Verify Delta Provisioning Status
    Verify Device Replan Status

Provisioning of Band Reservation param on Replan
    [Documentation]  Provisioning of Band reservation parameters on ondemand replan from GUI
    [Tags]   band_reservation_provisioning  delta_provisiioning  regression     overridden_param    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Delta RP5000 Params  eNodeB
    Verify Delta Provisioning Status
    Verify Device Replan Status

Deletion of Sector1 parameters
    [Documentation]     Deletion of parameters from sector1
    [Tags]   delete_sector1    delete      overridden_param    regression    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Delete parameters in sector1
    BuiltIn.Sleep  5s
    Verify Delta Provisioning Status
    #Open Overridden Params Page
    #Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT}
    #Save DMS Overriden Parameter
    BuiltIn.Sleep  5s
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

Deletion of Sector2 parameters
    [Documentation]     Deletion of parameters from sector2
    [Tags]   delete_sector2          delete      overridden_param    regression    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Delete param in sector_2
    Verify Delta Provisioning Status
    BuiltIn.Sleep  5s
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

Modify eNodeB Scalar Param on Periodic
    [Documentation]  Periodic operation device after updating scalar overridden parameters
    [Tags]   scalar_overridden_param  overridden_param   scalar_enodeb   scalar_periodic      working  regression    periodic_device
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE18_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE18_MACID}
    Update eNodeB Scalar Params
    Verify Delta Provisioning Status
    #Verify Periodic Device Test
    Verify Periodic Device Test with ddlg

Deletion of EnodeB parameters
    [Documentation]     Deletion of parameters from enodeB
    [Tags]   delete_enodeB    MJ_R60    delete      overridden_param    regression    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Delete parameters in enodeB
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

#Prov GUI overridden admin state "TRUE" to 1B1C BC on BS
Provision Admin State Sector1
    [Documentation]     provisioning of admin status
    [Tags]   admin_provision_sector1     overridden_param    Phase2    admin    regression    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Decrease eNodeB NoOfSector Parameter
    Update Carrier Aggregation
    Update Sector Admin Status    Sector 1    TRUE
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    verify pnp workflow status
    Increase eNodeB NoOfSector Parameter
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Dashboard Device InService Status

Provision noOfSector CA and Admin State
    [Documentation]     provisioning of Sector CA and Admin State
    [Tags]   admin_ca_noofsecor_provision_sector1     overridden_param    Phase2    admin    regression    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update eNodeB sector Params
    Dashboard Device InService Status
    Update Carrier Aggregation
    Dashboard Device InService Status
    Update Sector Admin Status    Sector 1    FALSE
    Update Sector Admin Status    Sector 2    FALSE
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    verify pnp workflow status
    Dashboard Device OutOfService Status
    Update Sector Admin Status    Sector 2    TRUE
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    verify pnp workflow status
    #Increase eNodeB NoOfSector Parameter
    Dashboard Device InService Status

CellIdentity Computataion
    [Documentation]     computation of Sector cell Identity
    [Tags]   cell_identity_compute     overridden_param    Phase2    admin    regression    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update eNodeB sector Params
    BuiltIn.Sleep  80s
    Dashboard Device InService Status
    Update Carrier Aggregation
    Update Sector Cell Parameter
    Open Provisioned Data
    Verify Cell Identity Provisioned    Sector 1    Cell Identity
    Verify Cell Identity Provisioned    Sector 2    Cell Identity

Configuring PLMN ACB parameters
    [Documentation]     configure ACB parameters
    [Tags]    ACB_param    overridden_param    Phase2    regression    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update Tabular ACB Params     Sector 1
    Verify PNP Workflow Status
    Open Provisioning Status
    Update Tabular ACB Params     Sector 2
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify ACB Provisioned    Sector 1   Public Land Mobile Network
    Verify ACB Provisioned    Sector 2   Public Land Mobile Network

configure MultiBandInfoList and FreqBandIndicatorPriority
    [Documentation]  Reboot MultiBandInfoList & FreqBandIndicatorPriority from GUI during replan
    [Tags]   MultiBandInfoList_FreqBandIndicator  overridden_param  regression    Phase2    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update Tabular Params MultiBand and FreqBand  Sector 1
    Verify Delta Provisioning Status
    Verify Device Reboot Status

Prov of SPS configuration from GUI during ondemand replan
    [Documentation]  Prov of SPS configuration from GUI during ondemand replan
    [Tags]   sps_param  overridden_param  regression    Phase2    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update SPS Params  Sector 1
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    BuiltIn.Sleep    120s
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify SPS Parameters    Sector 1    SPS Parameters

Configuration Page Param Name and Value Search
    [Documentation]  Configuration Page Param Name and Value Search
    [Tags]   search_param_name_value  overridden_param  regression    Phase2    working
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Configure and Verify enodeb sector1 sector2 Param

Provision of blacklist on-demand replan
    [Documentation]  Provision of blacklist to CU during on-demand replan
    [Tags]  Blacklist_provision      Phase2    overridden_param    regression    working
    DMS Network Console UI Login
    Remove Blacklisting
    Radio Point Blacklist
    Verify Blacklisted Radio Point
    Device console Login
    Login with Device ID  ${DEVICE4_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE4_MACID}
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Verify PNP Workflow Status
    Verify Blacklist Configured in PnP
    Blacklist Verification on Device History   Tabular  Last 1 hour  COMPUTATION
    DMS Network Console UI Login
    Remove Blacklisted Radio Point

Configuring Cat-M1 parameters
    [Documentation]     configure Cat-M1 parameters
    [Tags]    Cat_M1_param    overridden_param   regression     working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update scalar Cat-M1 Params     Sector 1
    Verify PNP Workflow Status
    Open Provisioning Status
    Update scalar Cat-M1 Params     Sector 2
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify Cat-M1 Provisioned    Sector 1   CatM1
    Verify Cat-M1 Provisioned    Sector 2   CatM1

Provision SPID Parameter during Replan
    [Documentation]  Provision SPID Parameter during Replan
    [Tags]   spid_param  overridden_param  regression    enodeB_param    Phase2    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Update SPID Param  eNodeB
    Verify SPID Param Value in Overridden Page
    Verify SPID Param Delta in Provisioning Page
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Verify SPID Configured in PnP Status
    Verify SPID Param in Provisioned Page
    SPID Verification on Device History   Tabular  Last 1 hour  COMPUTATION
    Export Device History   Tabular  Last 1 hour  All

Provision Sector 1 MIMO Parameter during Reboot
    [Documentation]  Provision Sector 1 MIMO Parameter during Reboot
    [Tags]   mimo_param  overridden_param  regression    enodeB_param    Phase2    working
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update MIMO Param    Sector 1
    Verify MIMO Param Value in Overridden Page
    Verify MIMO Param Delta in Provisioning Page
    #Verify Device Reboot Status
    Reboot Device
    BuiltIn.Sleep  ${REAl_DEVICE_REBOOT_TIMEOUT}
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Verify MIMO Configured in PnP Status
    Verify MIMO Param in Provisioned Page
    MIMO Verification on Device History   Tabular  Last 1 hour  COMPUTATION
    Export Device History   Tabular  Last 1 hour  All

Provision ENDC Parameter
    [Documentation]  Provision ENDC Parameter
    [Tags]  ENDC_GUI    regression
    Device console Login
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Login with Device ID  ${DEVICE_MACID}
    #Update ENDC Param  eNodeB
    Add DMS Overriden Parameter ENDCEnable Keywords
    Add DMS Overriden Parameter ENDCX2 Keywords
    #Verify ENDCEnable Param Value in Overridden Page
    #Verify ENDCEnable Param Delta in Provisioning Page
    #Replan Device
    #BuiltIn.Sleep  100
    #Dashboard Device InService Status
    #Verify PNP Workflow Status
    #Verify ENDCEnable Configured in PnP Status
    #Verify ENDCEnable Param in Provisioned Page
    #ENDCEnable Verification on Device History   Tabular  Last 1 hour  COMPUTATION
    #Export Device History   Tabular  Last 1 hour  All
    Delete DMS Overriden Parameter ENDCEnable Keywords
    Delete DMS Overriden Parameter ENDCX2 Keywords
    BuiltIn.Sleep  2s
    DMS UI Logout


Modify Sector 1 Physical Cell ID
    [Documentation]  Replan device after updating 1 Physical Cell ID
    [Tags]    Physical_Cell_ID_Update   overridden_param    mandatory_overridden_param_sector2    regression    TA_code
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE13_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE13_MACID}
    Update Physical Cell ID  Sector 1
    BuiltIn.Sleep  20s
    verify pnp workflow status
    DMS UI Logout

Modify eNode S1 Signal Link Server List
    [Documentation]  Replan device after updating eNode S1 Signal Link Server List
    [Tags]   S1SignalLink_Update  overridden_param    mandatory_overridden_param_sector2    regression    TA_code
    #DMS UI Login
    Device console Login
    Login with Device ID  ${DEVICE13_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE13_MACID}
    Update S1 Signal Link Server List
    BuiltIn.Sleep  20s
    verify pnp workflow status
    DMS UI Logout

To Verify Device uploads logs to Device File Server
    [Documentation]    To Verify Device uploads logs to Device File Server
    [Tags]    Regression    File_Server    regression_6.0     Transfer_Logs
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update File Server Details
    Replan Device
    BuiltIn.Sleep  120s
    Verify Provisioning File Type value

TransferLogsToController - Activity - GUI Profile
    [Documentation]    TransferLogsToController - Activity - GUI Profile
    [Tags]    Regression    Transfer_Logs    regression_6.0
    Device console Login
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Update File Logs
    Verify Provisioning log value
