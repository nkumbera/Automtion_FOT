*** Settings ***
Documentation       DMS Device Operation and Dashboard Test Suite
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/pnp/pnp_keywords.robot
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/device_history/device_history_page_keywords.robot
Resource            ../resources/WebGUI/WebGUI_keywords.robot
Library             String

*** Variables ***


*** Test Cases ***
Connect Device Test
    [Documentation]    Check Device Connect Status
    [Tags]    connect_device_check    regression    dashboard    sustenance6.0
    Log    Check Device Connect Statu Test
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Device Connect Status

Notification Test
    [Documentation]  Notificton test
    [Tags]  notification_test
    Login with Device ID  ${DEVICE4_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE4_MACID}
    Verify Notificaton Status   ${XPATH_NOTIFICATION_CONNECT_DEVICE}   ${XPATH_NOTIFICATION_STATUS_SUCCESS}

Reset Device Test
    [Documentation]  Change the parameter and do reset
    [Tags]  reset_device  regression    dashboard    sustenance6.0
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Device Reset Status

Reboot Device Test
    [Documentation]  Reboot the device and verify
    [tags]  reboot_device    dashboard    regression    sustenance6.0
    Login with Device ID  ${DEVICE5_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE5_MACID}
    Verify Device Reboot Status

Replan Device Test
    [Documentation]  Change the parameter and do replan
    [Tags]  replan_device     dashboard    regression    sustenance6.0
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Device Replan Status

Resync Device Test
    [Documentation]  Resync the device and verify
    [Tags]  resync_device  regression    dashboard    sustenance6.0
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Device Resync Status

Resync All Device Test
    [Documentation]  Resync All the device and verify
    [Tags]  resync_all_device  regression    dashboard    sustenance6.0
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Device Resync All Status

Firmware Upgrade Test
    [Documentation]  Upgrade firmware of device and verify
    [Tags]  firmware_upgrade  regression    dashboard    sustenance6.0
    Login with Device ID  ${DEVICE6_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE6_MACID}
    Verify Firmware Upgrade Status

Upgrade Software Versions
    [Documentation]  Verify all the software version by updating the simulator
    [Tags]   software_upgrade  regression    dashboard    sustenance6.0
    Login with Device ID  ${DEVICE3_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE3_MACID}
    Verify BOOTSTRAP All Software Version using ddlg
    Login with Device ID  ${DEVICE3_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE3_MACID}
    Verify Device History for Value Change     Tabular     Last 1 hour    INFORMS

Device History Export
    [Documentation]  Export device operation history
    [Tags]   device_history     dashboard    regression    sustenance6.0
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Export Device History  Tabular  Last 1 hour  All

Supported Radio Type
    [Documentation]  Verify Supported Radio Type
    [Tags]   supported_radio  regression    dashboard     working
    #set suite variable  ${DEVICE_MACID}  ${DEVICE3_MACID}
    Device console Login
    Login with Device ID  ${DEVICE15_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE15_MACID}
    Verify Supported Radio Type  RP2000

Periodic Device Test
    [Documentation]  Verify Periodic Device Test
    [Tags]   periodic_device   regression   dashboard     demo    working
    Device console Login
    Login with Device ID  ${DEVICE4_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE4_MACID}
    Verify Periodic Device Test with ddlg


Radio Point Addition
    [Documentation]  Radio Point Addition
    [Tags]   radio_point_add       dashboard     Demo    regression    working
    DMS WebGUI Login
    Update whitelist WEBGUI
    DMS WebGUI Logout
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    #Validate whitelist WEBGUI Overridden Param
    #Delete Webgui params
    Verify Radio Point Addition


Radio Point Deletioin
    [Documentation]  Radio Point Deletion
    [Tags]  radio_point_del      dashboard    regression    working
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify Radio Point Deletion
    #DMS WebGUI Login
    #Update whitelist WEBGUI
    #DMS WebGUI Logout


Simple Test
    [tags]    simple_test
    #[Argument]    ${device_macid}
    set suite variable  ${DEVICE_MACID}  ${DEVICE10_MACID}
    Test Dashboard Keywords


DashboardPage verificaion for BC components
    [Documentation]    DashboardPage verificaion for BC components T14612
    [Tags]    dashboardpage_BC    dashboardpage    regression
    Log    Check DashboardPage for BC components
    #Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    BuiltIn.Sleep  5s
    Verify DashboardPage BC components    0005B9-LTE_Enterprise_C-RANSC_Cntrl    ${DEVICE_MACID}
    BuiltIn.Sleep  5s
    DMS UI Logout

Downgrade Software Versions
    [Documentation]  Verify all the software version by updating the simulator
    [Tags]   software_downgrade  regression    dashboard    sustenance6.0
    Device console Login
    Login with Device ID  ${DEVICE3_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE3_MACID}
    Verify BOOTSTRAP Downgrade Software Version using ddlg

DMS Server time in both device console and network console
    [Tags]  Server_Time      regression
    Device console Login
    Login with Device ID  ${DEVICE4_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE4_MACID}
    Verify Server Time
