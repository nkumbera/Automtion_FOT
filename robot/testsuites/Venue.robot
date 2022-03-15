*** Settings ***
Library            SSHLibrary
#Suite Setup         Suite Setup Keyword
Suite Teardown     DMS UI Logout
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Library             String
#Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/Import/Import_keywords.robot
Resource           ../resources/Venue/Venue_keywords.robot
Resource           ../resources/Search_Page/Search_Device.robot
Test Teardown       DMS Network Console UI Logout
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot


*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}



*** Test Cases ***
Venue file import with multiple device types
    [Documentation]  Verify Venue file import is successful with CUCP,CUUP,DU,DURP,BC,RP device types
    [Tags]   venue_import_alldevice    import_venue    venue    regression    venue_import    regression_6.0
    Stop and start ves pool    ${DU_VENUE_DEVICE1}
    BuiltIn.Sleep  150s
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${VENUE_FILE_LOCATION}    ${VENUE_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Venue file
    Verify Operation History for venue import  VENUE     VENUE
    Verify Venue in Enterprise View page

Venue file import with updated service area
    [Documentation]  Verify Venue file import with updated service area
    [Tags]   venue_servicearea    import_venue    venue    regression    venue_import    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${VENUE_UPDATED_FILE_LOCATION}    ${VENUE_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Venue file
    Verify Operation History for venue import  VENUE     VENUE
    Verify updated service area and replan status in venue

Override Leaf/list parameters from topology DU
    [Documentation]  Override Leaf/list parameters from topology
    [Tags]   venue_leaf_list_param    regression    venue_leaf_list_param_DU    venue    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Delete DMS GUI Parameter    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}

    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    Confiure Leaf and List parameters Topology View DU    ${VES_DICT1}
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Replan Device
    BuiltIn.Sleep  60s
    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    Confiure Leaf and List parameters Topology View DU    ${VES_DICT}
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Verify gNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    Replan Device
    BuiltIn.Sleep  60s
    Verify the gNB provisioned value    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}


Override Leaf/list parameters from topology CUCP
    [Documentation]  Override Leaf/list parameters from topology
    [Tags]   venue_leaf_list_param    regression    venue_leaf_list_param_CUCP     venue    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Delete DMS GUI Parameter    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}

    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    #Confiure Leaf and List parameters Topology View CUCP    ${VES_DICT1}
    configure ves param in Topology    ${VES_URL1}    ${VES_Username1}    ${VES_Password1}
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Replan Device
    BuiltIn.Sleep  60s
    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    #Confiure Leaf and List parameters Topology View CUCP     ${VES_DICT}
    configure ves param in Topology    ${VES_URL_venue}    ${VES_Username_venue}    ${VES_Password_venue}
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Verify gNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU}
    Replan Device
    BuiltIn.Sleep  60s
    Verify CP gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}


Override Leaf/list parameters from topology CUUP
    [Documentation]  Override Leaf/list parameters from topology
    [Tags]   venue_leaf_list_param    regression    venue_leaf_list_param_CUUP    venue    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Delete DMS GUI Parameter    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}

    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    #Confiure Leaf and List parameters Topology View CUUP    ${VES_DICT1}
    configure ves param in Topology cuup     ${VES_URL1}    ${VES_Username1}    ${VES_Password1}
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Replan Device
    BuiltIn.Sleep  60s
    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    #Confiure Leaf and List parameters Topology View CUUP     ${VES_DICT}
    configure ves param in Topology cuup   ${VES_URL_venue}    ${VES_Username_venue}    ${VES_Password_venue}
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Verify gNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU}
    Replan Device
    BuiltIn.Sleep  60s
    Verify CP gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Venue file import provided by so-tool
    [Documentation]  Verify Venue file import is successful with CUCP,CUUP,DU,RP device types
    [Tags]   venue_import    import    venue    regression    so-tool     regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFMOUNT_FILE_LOCATION_SO_TOOL}    ${NETCONFMOUNT_FILE_IMPORT_PATH}
    put file        ${EXECDIR}${ENTITYMAPPING_FILE_LOCATION_SO_TOOL}    ${ENTITYMAPPING_FILE_IMPORT_PATH}
    put file        ${EXECDIR}${CUCP_SS_FILE_LOCATION_SO_TOOL}    ${SOTOOL_FILE_IMPORT_PATH}
    put file        ${EXECDIR}${CUUP_SS_FILE_LOCATION_SO_TOOL}    ${SOTOOL_FILE_IMPORT_PATH}
    put file        ${EXECDIR}${DU_SS_FILE_LOCATION_SO_TOOL}    ${SOTOOL_FILE_IMPORT_PATH}
    put file        ${EXECDIR}${VENUE_FILE_LOCATION_SO_TOOL}    ${VENUE_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file import  Netconf Mount       netconfmount_Automation.xml
    Import Entity Mapping file
    Verify Operation History for Entity Mapping file import  Entity Mapping      ATT-drop2-device-entity.xml
    Import Service Setting file
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    serviceSetting_ONECELL5GCU_cucp-base-drop2.xml
    Import Service Setting file
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    serviceSetting_ONECELL5GCU_cuup-base-drop2.xml
    Import Service Setting file
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    serviceSetting_ONECELL5GDU_base-drop2.xml
    Import Venue file
    Verify Operation History for venue import  VENUE     VENUE
    Verify SO-Tool Venue in Enterprise View page   drop2

Validate simulator stop start for CU-DU devices
    [Documentation]  Verify sim stop start after Venue file import is successful with CUCP,CUUP,DU device types
    [Tags]   venue_import    import    venue    regression    so-tool       regression_6.0
    Stop ves pool    ${CU_CP_DEVICE2_MACID}
    BuiltIn.Sleep  15s
    Start ves pool    ${CU_CP_DEVICE2_MACID}
    BuiltIn.Sleep  15s
    Stop ves pool    ${CU_UP_DEVICE2_MACID}
    BuiltIn.Sleep  15s
    Start ves pool    ${CU_UP_DEVICE2_MACID}
    BuiltIn.Sleep  15s
    Stop ves pool    ${DU_DEVICE2_MACID}
    BuiltIn.Sleep  15s
    Start ves pool    ${DU_DEVICE2_MACID}
    BuiltIn.Sleep  15s

Verify last session disconnect time of CU-CP
    [Tags]    regression    so-tool        regression_6.0
    Log    Check CU-CP_Device LastDissconnectTime Status Test
    Device console Login
    BuiltIn.Sleep  5s
    Login with gNB Device ID  ${CU_CP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE2_MACID}
    Verify gNB connect status      Connected
    Verify gNB LastDisconnectTime   NA
  	Stop ves pool    ${CU_CP_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
	BuiltIn.Sleep  5s
    Login with gNB Device ID  ${CU_CP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE2_MACID}
	Verify gNB connect status      Disconnect
	Verify gNB LastDisconnectTime   UTC
	DMS UI Logout
	Start ves pool    ${CU_CP_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
	BuiltIn.Sleep  5s
    Login with gNB Device ID  ${CU_CP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE2_MACID}
    BuiltIn.Sleep  5s
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout

Verify last session disconnect time of CU-UP
    [Tags]    regression    so-tool    regression_6.0
    Log    Check CU-UP_Device LastDissconnectTime Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE2_MACID}
    Verify gNB connect status      Connected
    Verify gNB LastDisconnectTime   NA
  	Stop ves pool    ${CU_UP_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE2_MACID}
	Verify gNB connect status      Disconnect
	Verify gNB LastDisconnectTime   UTC
	DMS UI Logout
	Start ves pool    ${CU_UP_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE2_MACID}
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout

Verify last session disconnect time of DU
    [Tags]    regression    so-tool    regression_6.0
    Log    Check DU_Device LastDissconnectTime Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Verify gNB connect status      Connected
    Verify gNB LastDisconnectTime   NA
  	Stop ves pool    ${DU_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
	Verify gNB connect status      Disconnect
	Verify gNB LastDisconnectTime   UTC
	DMS UI Logout
	Start ves pool    ${DU_DEVICE2_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${DU_DEVICE2_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout

Export Venue from Enterprise GUI
    [Documentation]  Verify Venue export is successful from Enterprise GUI
    [Tags]   venue_export    export    venue    regression    regression_6.0
    DMS Network Console UI Login
    Export Venue from Enterprise View page

Add CP device from floor page
    #[Arguments]  ${Venue_Name}
    [Documentation]  Add CP device from floor page
    [Tags]   Add_cp_floor   Add_from_floor  regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  2s
    Enterprise view Venue Selection     Automation_Museum
    BuiltIn.Sleep  2s
    Verify Add CP from floor

Add UP device from floor page
    #[Arguments]  ${Venue_Name}
    [Documentation]  Add UP device from floor page
    [Tags]   Add_up_floor   Add_from_floor  regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  2s
    Enterprise view Venue Selection     Automation_Museum
    BuiltIn.Sleep  2s
    Verify Add UP from floor


Add DU device from floor page
    #[Arguments]  ${Venue_Name}
    [Documentation]  Add DU device from floor page
    [Tags]   Add_du_floor   Add_from_floor  regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  2s
    Enterprise view Venue Selection     Automation_Museum
    BuiltIn.Sleep  2s
    Verify Add DU from floor

Venue configuration of PnP Mandatory tabular parameters
    [Documentation]  Verify venue configuration of PnP Mandatory tabular parameters
    [Tags]   venue_tabular_param_BC    regression    venue_configuration_BC    venue
    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    Configure tabular param for BC device    ${PLMN_PARAM_DICT1}
    Device console Login
    Login with gNB Device ID  ${BC_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${BC_VENUE_DEVICE1}
    Replan Device
    BuiltIn.Sleep  60s
    DMS Network Console UI Login
    Enterprise view Venue Selection    Automation_Venue
    Configure tabular param for BC device    ${PLMN_PARAM_DICT}
    Device console Login
    Login with gNB Device ID  ${BC_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${BC_VENUE_DEVICE1}
    BuiltIn.Sleep  60s
    Verify Delta Provisioning Status
    Verify Device Reboot Status



Enable/Disable RPTx Off alarm flag from Enterprise Venue page
    [Documentation]  Enable/Disable RPTx Off alarm flag from Enterprise Venue page
    [Tags]   venue_flag     venue    regression      regression_6.0     so-tool
    DMS Network Console UI Login
    BuiltIn.Sleep  5s
    Verify Enable and Disable of RPTx Off alarm flag from Enterprise GUI     drop2
    DMS UI Logout


Export GSC Report from Enterprise GUI
    [Documentation]  Verify GSC Report export is successful from Enterprise GUI
    [Tags]   venue_gsc_report_generation    export    venue    regression    regression_6.0
    DMS Network Console UI Login
    Export GSC Report for all gNB in Venue
    Verify Operation History for GSC Report  ONECELL5G GoldStandard Compliance Report
    Export GSC Report for a gNB in Venue
    Verify Operation History for GSC Report  ONECELL5G GoldStandard Compliance Report

Topology Details from CUCP device
    [Documentation]  Verify CUCP,CUUP and DU device topology details
    [Tags]   gNB_topology_CP   topology  regression    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID CU  ${CU_CP_REAL_DEVICE_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_REAL_DEVICE_MACID}
    Verify Topology Details from CUCP

Topology Details from CUUP device
    [Documentation]  Verify CUUP device topology details
    [Tags]   gNB_topology_UP   topology  regression    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID CU  ${CU_UP_REAL_DEVICE_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_REAL_DEVICE_MACID}
    Verify Topology Details from CUUP

Topology Details from DU device
    [Documentation]  Verify CUUP device topology details
    [Tags]   gNB_topology_DU   topology  regression    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID CU  ${DU_REAL_DEVICE_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_REAL_DEVICE_MACID}
    Verify Topology Details from DU