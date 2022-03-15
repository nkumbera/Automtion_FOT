*** Settings ***
Documentation       DMS Timing Source Test Suite
Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/Timing_source/timing_source_keywords.robot
Resource            ../resources/common/ui_common.robot
Resource            ../dashboard/device_operation.robot
Resource            ../resources/WebGUI/WebGUI_keywords.robot


*** Variables ***


*** Test Cases ***
Nominal GPS Configuration
    [Documentation]  Nominal GPS Configuration
    [Tags]  Nominal_GPS    Phase2        Timing_Source    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Delete Nominal GPS Webgui params
    Dashboard Device InService Status
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Configure Nominal GPS
    BuiltIn.Sleep  10s
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify Timing Parameter configuration    eNodeB    Nominal GPS

NTP server configuration and provisioning
    [Documentation]  NTP server configuration and provisioning
    [Tags]   NTP_param       Phase2     Timing_Source    regression    working
    Login with Device ID  ${DEVICE12_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE12_MACID}
    Update NTP Params
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Dashboard Device InService Status
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify NTP Parameters    eNodeB    NTP
