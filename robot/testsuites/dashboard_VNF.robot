*** Settings ***
Documentation       DMS Dashboard VNF Page
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off

Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/Import/Import_keywords.robot
Resource            ../resources/ServiceSetting/ServiceSetting_keywords.robot

Library             String
Library             SSHLibrary

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}

*** Test Cases ***

DashboardPage verificaion for CU CP components
    [Documentation]    DashboardPage verificaion for CU CP components T14612
    [Tags]    dashboardpage_cucp    dashboardpage    MJ_R60    regression    regression_6.0
    Log    Check DashboardPage for CU CP components
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage CUCP Components    0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    DMS UI Logout

DashboardPage verificaion for CU UP components
    [Documentation]    DashboardPage verificaion for CU UP components T14612
    [Tags]    dashboardpage_cuup    dashboardpage    MJ_R60    regression    regression_6.0
    Log    Check DashboardPage for CU UP components
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage CUUP Components    0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    DMS UI Logout

DashboardPage verificaion for DU components
    [Documentation]    DashboardPage verificaion for DU components T14612
    [Tags]    dashboardpage_du    dashboardpage    MJ_R60    regression    regression_6.0
    Log    Check DashboardPage for DU components
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID DU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage DU Components    0005B9-CS_ONECELL_DU    ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    DMS UI Logout


DashboardPage verificaion for CU CP Service State
    [Documentation]    DashboardPage verificaion for CU CP Service State TFTD_105
    [Tags]    TFTD_105  MJ_R60_DeviceState    regression    regression_6.0
    Log    Check DashboardPage for CU CP Service State
    Log    Import auto3 netconf file to check ready for commisionning state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto3_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto3_Automation.xml
    Log    Login to device and verify ready for commisionning state
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_auto3_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Ready for Commissioning
    BuiltIn.Sleep  5s
    DMS UI Logout
    Log    Import auto2 netconf file to check in service state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto2_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto2_Automation.xml


    Log    Login to device and verify ready for out of service
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_auto2_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Log    de-associate service area
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  20s
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Out of Service

    Log    associate service area
    Associate New Profile    ${EXECDIR}${CUCP_SSETTINGS_FILE_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    #BuiltIn.Sleep  1s

    #Log    verify ready for provisioning in progress
    #Open gNB Device Dashboard
    #Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Provisioning in Progress
    BuiltIn.Sleep  10s
    Log    verify ready for in service
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    In Service
    DMS UI Logout

DashboardPage verificaion for CU UP Service State
    [Documentation]    DashboardPage verificaion for CU UP Service State TFTD_106
    [Tags]    TFTD_106  MJ_R60_DeviceState    regression    regression_6.0
    Log    Check DashboardPage for CU UP Service State
    Log    Import auto3 netconf file to check ready for commisionning state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto3_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto3_Automation.xml
    Log    Login to device and verify ready for commisionning state
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_auto3_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Ready for Commissioning
    BuiltIn.Sleep  5s
    DMS UI Logout
    Log    Import auto2 netconf file to check in service state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto2_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto2_Automation.xml


    Log    Login to device and verify ready for out of service
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_auto2_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Log    de-associate service area
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  20s
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    Out of Service

    Log    associate service area
    Associate New Profile    ${EXECDIR}${CUUP_SSETTINGS_FILE_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    #BuiltIn.Sleep  2s

    #Log    verify ready for provisioning in progress
    #Open gNB Device Dashboard
    #Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    Provisioning in Progress
    BuiltIn.Sleep  10s
    Log    verify ready for in service
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    In Service
    DMS UI Logout

DashboardPage verificaion for DU Service State
    [Documentation]    DashboardPage verificaion for DU Service State TFTD_107
    [Tags]    TFTD_107  MJ_R60_DeviceState    regression    regression_6.0
    Log    Check DashboardPage for DU Service State
    Log    Import auto3 netconf file to check ready for commisionning state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto3_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto3_Automation.xml
    Log    Login to device and verify ready for commisionning state
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_auto3_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    Ready for Commissioning
    BuiltIn.Sleep  5s
    DMS UI Logout
    Log    Import auto2 netconf file to check in service state
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${EXECDIR}${NETCONFauto2_FILE_LOCATION}    ${NETCONF_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Netconf Mount file
    Verify Operation History for Netconf Mount file auto import  Netconf Mount  netconfmountauto2_Automation.xml

    Log    Login to device and verify ready for out of service
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_auto2_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Log    de-associate service area
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  20s
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    Out of Service

    Log    associate service area
    Associate New Profile    ${EXECDIR}${DU_SETTINGS_FILE_CELL1_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    #BuiltIn.Sleep  3s

    #Log    verify ready for provisioning in progress
    #Open gNB Device Dashboard
    #Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    Provisioning in Progress
    BuiltIn.Sleep  10s
    Log    verify ready for in service
    Open gNB Device Dashboard
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    In Service
    DMS UI Logout

Dashboard Service status for Not Applicable CUCP
    [Documentation]    DashboardPage verificaion for CP Not Appicable Service state
    [Tags]    cp_not_applicable     service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE24_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Not Applicable
    Get VNF Managed State   User Unmanaged


Dashboard Service status for Not Applicable CUUP
    [Documentation]    DashboardPage verificaion for UP Not Appicable Service state
    [Tags]    up_not_applicable     service_state   regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    BuiltIn.Sleep  4s
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE24_MACID}
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  4s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    Not Applicable
    Get VNF Managed State   User Unmanaged

Dashboard Service status for Not Applicable DU
    [Documentation]    DashboardPage verificaion for DU Not Appicable Service state
    [Tags]    du_not_applicable     service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE24_MACID}
    BuiltIn.Sleep  4s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  4s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    Not Applicable
    Get VNF Managed State   User Unmanaged

Dashboard Service status for unknown CP
    [Documentation]    DashboardPage verificaion for CP Unknown Service state
    [Tags]    cp_unknown    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${systemunmanaged_CP}
    BuiltIn.Sleep  4s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  4s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    Unknown
    BuiltIn.Sleep  2s
    Get VNF Managed State   System Unmanaged

Dashboard Service status for unknown UP
    [Documentation]    DashboardPage verificaion for UP Unknown Service state
    [Tags]    up_unknown    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${systemunmanaged_UP}
    BuiltIn.Sleep  4s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  4s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    Unknown
    BuiltIn.Sleep  4s
    Get VNF Managed State   System Unmanaged

Dashboard Service status for Unknown DU
    [Documentation]    DashboardPage verificaion for DU Unknown Service state
    [Tags]    du_unknown    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${systemunmanaged_DU}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    Unknown
    Get VNF Managed State   System Unmanaged

Dashboard Out of Service status for CP
    [Documentation]    DashboardPage verificaion for CP Out of Service Service state
    [Tags]    cp_OutofService   service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE23_MACID}
    BuiltIn.Sleep  4s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  4s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}      Out of Service
    BuiltIn.Sleep  4s
    Get VNF Managed State   Managed

Dashboard Out of Service status for UP
    [Documentation]    DashboardPage verificaion for UP Out of Service Service state
    [Tags]    up_OutofService   service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE23_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}  Out of Service
    Get VNF Managed State   Managed

Dashboard Out of Service status for DU
    [Documentation]    DashboardPage verificaion for DU Out of Service Service state
    [Tags]    du_OutofService   service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE23_MACID}
    BuiltIn.Sleep  2s
    Login with Device ID DU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}  Out of Service
    Get VNF Managed State   Managed

Verify Warning icon for CP
    [Documentation]    Verify Warning icon for CP
    [Tags]    cp_WarningIcon    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${rutest_CP}
    BuiltIn.Sleep  4s
    Login with Device ID CU  ${DEVICE_MACID}
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-CP    ${DEVICE_MACID}    In Service
    Verify Warning Sign in dashboard


Verify Warning icon for UP
    [Documentation]    Verify Warning icon for UP
    [Tags]    up_WarningIcon    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${rutest_UP}
    BuiltIn.Sleep  2s
    Login with Device ID CU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_CU-UP    ${DEVICE_MACID}    In Service
    BuiltIn.Sleep  2s
    Verify Warning Sign in dashboard

Verify Warning icon for DU
    [Documentation]    Verify Warning icon for DU
    [Tags]    du_WarningIcon    service_state    regression    regression_6.0
    #Device console Login
    #BuiltIn.Sleep  4s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${rutest_DU}
    BuiltIn.Sleep  2s
    Login with Device ID DU  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify DashboardPage Service State  0005B9-CS_ONECELL_DU    ${DEVICE_MACID}    In Service
    BuiltIn.Sleep  2s
    Verify Warning Sign in dashboard