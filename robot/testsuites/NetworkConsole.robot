*** Settings ***

#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
Test Setup          DMS Network Console UI Login
Suite Teardown      DMS UI Logout    # Logging off
Library            SSHLibrary

Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/NetworkConsole/NetworkConsole_keywords.robot
Resource            ../resources/Search_Page/Search_Device.robot
Resource            ../resources/Import/Import_keywords.robot
Resource            ../resources/pnp/pnp_keywords.robot
Resource            ../resources/ddlg/ddlg_keywords.robot

Library             String
Test Teardown       DMS Network Console UI Logout

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}

*** Test Cases ***
Raise Alarms On VES HB Events Missing for DU Device Type
    [Documentation]    Raise Alarms On VES HB Events Missing for DU Device Type
    [Tags]    Raise_VES_Alarm_DU    regression    ves    regression_6.0
    BuiltIn.Sleep  10s
    Open System Alarm Page
    BuiltIn.Sleep  10s
	Clear All Alarms    ${DU_DEVICE1_MACID}
	BuiltIn.Sleep  10s
    Open Service Package Page
    BuiltIn.Sleep  5s
    Open Service Package Page
    BuiltIn.Sleep  10s
	Edit Service Package for DU
	Search Parameter
	Change Flag To False
	Save Changes
	#Stop and start ves pool
	Stop ves pool    ${VES_JOB_DU}
	DMS UI Logout
	BuiltIn.Sleep  420s
    DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for non-Existence of Alarm    ${DU_DEVICE1_MACID}
	Start ves pool    ${VES_JOB_DU}
	DMS Network Console UI Login
	Open Service Package Page
    BuiltIn.Sleep  5s
	Open Service Package Page
	BuiltIn.Sleep  10s
	Edit Service Package for DU
	Search Parameter
	Change Flag To True
	Save Changes
	Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    DMS UI Logout
    # Start the VES Pool Manually
    Stop ves pool    ${VES_JOB_DU}
	BuiltIn.Sleep  1000s
	DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Alarm    ${DU_DEVICE1_MACID}
	Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    Check Heatbeat value
    Start ves pool    ${VES_JOB_DU}


Raise Alarms On VES HB Events Missing for CP Device Type
    [Documentation]    Raise Alarms On VES HB Events Missing for CP Device Type
    [Tags]    Raise_VES_Alarm_CP    regression    ves    regression_6.0
    BuiltIn.Sleep  10s
    Open System Alarm Page
    BuiltIn.Sleep  10s
	Clear All Alarms    ${CU_CP_DEVICE1_MACID}
	BuiltIn.Sleep  10s
	Open Service Package Page
    BuiltIn.Sleep  5s
    Open Service Package Page
    BuiltIn.Sleep  10s
	Edit Service Package for CU
	Search Parameter
	Change Flag To False
	Save Changes
	# Start the VES Pool Manually
	Stop ves pool     ${VES_JOB_CUCP}
	BuiltIn.Sleep  420s
	DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for non-Existence of Alarm    ${CU_CP_DEVICE1_MACID}
	Start ves pool     ${VES_JOB_CUCP}
	DMS Network Console UI Login
	Open Service Package Page
    BuiltIn.Sleep  5s
	Open Service Package Page
	BuiltIn.Sleep  10s
	Edit Service Package for CU
	Search Parameter
	Change Flag To True
	Save Changes
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    DMS UI Logout
    # Start the VES Pool Manually
    Stop ves pool     ${VES_JOB_CUCP}
	BuiltIn.Sleep  1000s
	DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Alarm    ${CU_CP_DEVICE1_MACID}
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    Check Heatbeat value
    Start ves pool     ${VES_JOB_CUCP}

Raise Alarms On VES HB Events Missing for CU Device Type
    [Documentation]    Raise Alarms On VES HB Events Missing for CU Device Type
    [Tags]    Raise_VES_Alarm_CU    regression    ves    regression_6.0
    BuiltIn.Sleep  10s
    Open System Alarm Page
    BuiltIn.Sleep  10s
	Clear All Alarms    ${CU_UP_DEVICE1_MACID}
	BuiltIn.Sleep  10s
	Open Service Package Page
    BuiltIn.Sleep  5s
    Open Service Package Page
    BuiltIn.Sleep  10s
	Edit Service Package for CU
	Search Parameter
	Change Flag To False CU_UP
	Save Changes
	# Start the VES Pool Manually
	Stop ves pool     ${VES_JOB_CUUP}
	BuiltIn.Sleep  420s
	DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for non-Existence of Alarm    ${CU_UP_DEVICE1_MACID}
	Start ves pool     ${VES_JOB_CUUP}
	DMS Network Console UI Login
	Open Service Package Page
    BuiltIn.Sleep  5s
	Open Service Package Page
	BuiltIn.Sleep  10s
	Edit Service Package for CU
	Search Parameter
	Change Flag To True CU_UP
	Save Changes
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    DMS UI Logout
    #DMS Network Console UI Login
    # Start the VES Pool Manually
    Stop ves pool     ${VES_JOB_CUUP}
	BuiltIn.Sleep  1000s
	DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Alarm    ${CU_UP_DEVICE1_MACID}
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Check Heatbeat value
	Start ves pool     ${VES_JOB_CUUP}
	
Netconf session lost alarm
    [Documentation]    Netconf session lost alarm CUUP
    [Tags]    Netconf_Alarm_cuup_cp_du    regression    working    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    # Stop Pool Manually
    Stop ves pool    ${CU_UP_DEVICE1_MACID}
    BuiltIn.Sleep  300s
	DMS UI Logout
    DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Failure Alarm    ${CU_UP_DEVICE1_MACID}    VNF Connection
	# Start Pool Manually
	Start ves pool    ${CU_UP_DEVICE1_MACID}
	BuiltIn.Sleep  120s

    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    # Stop Pool Manually
    Stop ves pool    ${CU_CP_DEVICE1_MACID}
    BuiltIn.Sleep  300s
    DMS UI Logout
    DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Failure Alarm    ${CU_CP_DEVICE1_MACID}    VNF Connection
	# Start Pool Manually
	Start ves pool    ${CU_CP_DEVICE1_MACID}
	BuiltIn.Sleep  120s

    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    #Change the device to unmaged and back to Managed
    # Stop Pool Manually
    DMS UI Logout
    Stop ves pool    ${DU_DEVICE1_MACID}
    BuiltIn.Sleep  300s
    DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	Check for Existence of Failure Alarm    ${DU_DEVICE1_MACID}    VNF Connection
	# Start Pool Manually
	Start ves pool    ${DU_DEVICE1_MACID}
	BuiltIn.Sleep  120s

Netconf Mount Import of CUUP with Key Change
    [Documentation]    Netconf Mount Import of CUUP with Key Change
    [Tags]  netconf_mount_import_key_change  import
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONF_FILE_IMPORT_INVALID_KEY_PATH}    ${NETCONF_FILE_IMPORT_PATH}
    Import Netconf Mount file
    Verify Operation History for Netconf key Mount file import  Netconf Mount
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_REAL_DEVICE_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Netconf connection Status    Disconnected
    DMS UI Logout
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONF_FILE_IMPORT_VALID_KEY_PATH}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf key Mount file import  Netconf Mount
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_REAL_DEVICE_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Netconf connection Status    Connected
    Verify PNP Workflow Status