*** Settings ***
Documentation       DMS Sanity Test Scripts
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
#Suite Setup         Device console Login
#Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/Search_Page/Search_Device.robot
Resource            ../resources/HeartBeat/heartbeat_keywords.robot
Resource            ../resources/Provisioning/provision_page_keywords.robot
Resource            ../resources/pnp/pnp_keywords.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
Resource            ../resources/History_page/history_page_keywords.robot
Resource            ../resources/CommunicationLogs/CommunicationLog_keyword.robot
Resource            ../resources/Alarm/alarm_page.robot
Resource            ../resources/Import/Import_keywords.robot
Resource            ../resources/ServiceSetting/ServiceSetting_keywords.robot
Variables            ../properties/common.py
Resource            ../resources/ddlg/ddlg_keywords.robot
Resource            ../resources/device_history/device_history_page_keywords.robot
Library             String
Library             SSHLibrary
Test Teardown       DMS Network Console UI Logout

*** Variables ***
#SERVER_IP='10.212.2.11'
#SERVER_USERNAME='dmsadmin'
#SERVER_PASSWORD='airvana123'
#${SERVER_IP}           10.212.2.11
#${SERVER_USERNAME}     dmsadmin
#${SERVER_PASSWORD}     airvana123
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}
${UploadFiletest}       css=[type='file']
${AddFile_CUCP}          ${EXECDIR}${CU_CP_SETTINGS_FILE_LOCATION}
${AddFile_CUUP}          ${EXECDIR}${CU_UP_SETTINGS_FILE_LOCATION}
${AddFile_DU}            ${EXECDIR}${DU_SETTINGS_FILE_LOCATION}

*** Test Cases ***
Perform Connect operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Connect Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB connect status      Connected
    #Verify gNB Device Connect Status
	Stop ves pool    ${CU_UP_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
	Verify gNB connect status      Disconnect
	DMS UI Logout
	Start ves pool    ${CU_UP_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout

Perform Connect operation CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Connect Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB connect status      Connected
    #Verify gNB Device Connect Status
	Stop ves pool    ${CU_CP_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
	Verify gNB connect status      Disconnect
	DMS UI Logout
	Start ves pool    ${CU_CP_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout


Perform Connect operation DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Connect Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB connect status      Connected
    #Verify gNB Device Connect Status
	Stop ves pool    ${DU_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
	Verify gNB connect status      Disconnect
	DMS UI Logout
	Start ves pool    ${DU_DEVICE1_MACID}
	BuiltIn.Sleep  15s
	Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Connect Status
	Verify gNB connect status      Connected
    #Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    DMS UI Logout

	
Perform Reset operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Reset Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Reset Status
    DMS UI Logout

Perform Reset operation CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Reset Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Reset Status
    DMS UI Logout

Perform Reset operation DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Reset Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Reset Status
    DMS UI Logout

Search Device using CU-UP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    search using cu_up name    ${CU_UP_DEVICE1_MACID}
    DMS UI Logout

Search Device using CU-CP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    search using cu_cp name    ${CU_CP_DEVICE1_MACID}
    DMS UI Logout

Search Device using DU
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    search using du name    ${DU_DEVICE1_MACID}
    DMS UI Logout

NetworkConsoleLoginLogout
    [Tags]      sanity    regression    regression_6.0    sustenance6.0
    DMS Network Console UI Login
    Check the About Link in homepage
    Search for device in NC     ${CU_CP_DEVICE1_MACID}
    DMS UI Logout

Verify DU HeartBeat
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    BuiltIn.Sleep  10s
    search using du name    ${DU_DEVICE1_MACID}
    Device HeartBeat Status CU_CP and DU
    DMS UI Logout

Perform Dashboard Navigation operation for CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Summary Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Dashboard Navigation
    DMS UI Logout

Perform Alarm Navigation operation for CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device alarm page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify Alarm page Navigation
    DMS UI Logout

Verify Communication logs page Navigation for CU-CP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Communication logs page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify Communication logs page Navigation
    DMS UI Logout

Verify DMS Overriden params page Navigation for CU-CP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP Device DMS overriden params page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify DMS Overriden Params page Navigation
    DMS UI Logout

Perform History Navigation operation for CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP History page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify History page Navigation
    DMS UI Logout

Perform PnP Status page Navigation operation for CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_PnP_Status page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify PnP Status page Navigation
    DMS UI Logout

Perform Provisioning page Navigation for CU-CP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Provisioning page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify Provisioning page Navigation
    DMS UI Logout

Perform Dashboard Navigation operation for CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Summary Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Dashboard Navigation
    DMS UI Logout

Perform Alarm Navigation operation for CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device alarm page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify Alarm page Navigation
    DMS UI Logout

Verify Communication logs page Navigation for CU-UP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Communication logs page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify Communication logs page Navigation
    DMS UI Logout

Verify DMS Overriden params page Navigation for CU-UP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP Device DMS overriden params page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify DMS Overriden Params page Navigation
    DMS UI Logout

Perform History Navigation operation for CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP History page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify History page Navigation
    DMS UI Logout

Perform PnP Status page Navigation operation for CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_PnP_Status page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify PnP Status page Navigation
    DMS UI Logout

Verify Provisioning page Navigation for CU-UP
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Provisioning page Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify Provisioning page Navigation
    DMS UI Logout

Perform Dashboard Navigation operation for DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Summary Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Dashboard Navigation
    DMS UI Logout

Perform Alarm Navigation operation for DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device alarm page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify Alarm page Navigation
    DMS UI Logout

Verify Communication logs page Navigation for DU
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Communication logs page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify Communication logs page Navigation
    DMS UI Logout

Verify DMS Overriden params page Navigation for DU
    [Tags]    sanity    regression     regression_6.0    sustenance6.0
    Log    Check DU Device DMS overriden params page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify DMS Overriden Params page Navigation
    DMS UI Logout

Perform History Navigation operation for DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU History page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify History page Navigation
    DMS UI Logout

Perform PnP Status page Navigation operation for DU Device
    [Tags]   sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_PnP_Status page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify PnP Status page Navigation
    DMS UI Logout

Verify Provisioning page Navigation for DU
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Provisioning page Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify Provisioning page Navigation
    DMS UI Logout

Netconf Mount Import of CUCP CUUP DU
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONF_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    #${output}           Execute Command     cp ${NETCONF_FILE_COPY_FROM_PATH} ${NETCONF_FILE_COPY_TO_PATH}
    #Log    ${output}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file import  Netconf Mount      netconfmount_Automation.xml
    Device console Login
    search using cu_cp name    ${CU_CP_DEVICE1_MACID}
    DMS UI Logout
    Device console Login
    search using cu_up name    ${CU_UP_DEVICE1_MACID}
    DMS UI Logout
    Device console Login
    search using du name    ${DU_DEVICE1_MACID}
    DMS UI Logout

Service Setting File import of CUCP
    [Documentation]  Service setting GUI_Override_Profile-associate new one
    [Tags]   sanity    regression    regression_6.0    sustenance6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${CUCP_SS_FILE_LOCATION}    ${SS_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Service Setting file
    Verify Operation History for CUCP Service Setting import  SERVICE_SETTINGS

Service Setting File import of CUUP
    [Documentation]  Service setting GUI_Override_Profile-associate new one
    [Tags]   sanity    regression    regression_6.0    sustenance6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${CUUP_SS_FILE_LOCATION}    ${SS_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Service Setting file
    Verify Operation History for CUUP Service Setting import  SERVICE_SETTINGS

Service Setting File import of DU
    [Documentation]  Service setting GUI_Override_Profile-associate new one
    [Tags]   sanity    regression    regression_6.0    sustenance6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${DU_SS_FILE_LOCATION}    ${SS_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Service Setting file
    Verify Operation History for DU Service Setting import  SERVICE_SETTINGS

Factory Import
    [DOCUMENTATION]  Factory file import for  5g devices (GNB)
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${FACTORY_FILE_LOCATION}    ${FACTORY_FILE_IMPORT_PATH}
    #${output}           Execute Command     cp ${NETCONF_FILE_COPY_FROM_PATH} ${NETCONF_FILE_COPY_TO_PATH}
    #Log    ${output}
    DMS Network Console UI Login
    Import Factory file
    Verify Operation History for factory import    FACTORY

Service Setting import for (CUCP)
    [DOCUMENTATION]  Service Setting import for  5g devices (GNB)
    [Tags]  sanity    regression     regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan gNB Device
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_CUCP}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan Device
    BuiltIn.Sleep  60s
    Check for the Row Present    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
	
Service Setting import for (CUUP)
    [DOCUMENTATION]  Service Setting import for  5g devices (GNB)
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    #Dashboard gNB Device InService Status
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan gNB Device
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_CUUP}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    #Dashboard gNB Device InService Status
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan Device
    BuiltIn.Sleep  60s
    Check for the Row Present    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}

Service Setting import for (DU)
    [DOCUMENTATION]  Service Setting import for  5g devices (GNB)
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan Device
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_DU}    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan gNB Device
    BuiltIn.Sleep  60s
    Check for the Row Present    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}

Move device to unmanaged/Managed from Device console for DU
    [DOCUMENTATION]  Move device to unmanaged/Managed from Device console
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
	Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  120s
    Verify gNB Device Connect Status
    BuiltIn.Sleep  5s
    Verify gNB connect status      Connected

Move device to unmanaged/Managed from Device console for CUCP
    [DOCUMENTATION]  Move device to unmanaged/Managed from Device console
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  120s
    Verify gNB Device Connect Status
    BuiltIn.Sleep  5s
    Verify gNB connect status      Connected
	
Move device to unmanaged/Managed from Device console for CUUP
    [DOCUMENTATION]  Move device to unmanaged/Managed from Device console
    [Tags]  sanity    regression    regression_6.0    sustenance6.0
	Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Change the device to unmaged and back to Managed
    BuiltIn.Sleep  120s
    Verify gNB Device Connect Status
    BuiltIn.Sleep  5s
    Verify gNB connect status      Connected

Perform Reboot operation DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Reboot Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Reboot Status
    DMS UI Logout

Perform Reboot operation CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Reboot Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Reboot Status
    DMS UI Logout

Perform Reboot operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Reboot Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Reboot Status
    DMS UI Logout

Perform Replan operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Replan Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Replan Status    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    DMS UI Logout

Perform Replan operation CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Replan Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Replan Status    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    DMS UI Logout

Perform Replan operation DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Replan Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Replan Status    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    DMS UI Logout

Perform Resync operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Resync Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Resync Status
    DMS UI Logout

Perform Resync operation CU-CP Device
    [Tags]    sanity    regression     regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Resync Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Resync Status
    DMS UI Logout

Perform Resync operation DU Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Resync Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Resync Status
    DMS UI Logout
	
Perform Resync All operation CU-UP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-UP_Device Resync All Status Test
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify gNB Device Resync All Status
    DMS UI Logout

Perform Resync All operation CU-CP Device
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check CU-CP_Device Resync All Status Test
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify gNB Device Resync All Status
    DMS UI Logout

Perform Resync All operation DU Device   
    [Tags]    sanity    regression    regression_6.0    sustenance6.0
    Log    Check DU_Device Resync All Status Test
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify gNB Device Resync All Status
    Verify Resync in History    Tabular  Last 1 hour     All
    DMS UI Logout	