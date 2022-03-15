*** Settings ***
Documentation    HeartBeat regression
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/HeartBeat/heartbeat_keywords.robot
Library             String

*** Test Cases ***
HB Missing Count Verification
    [Tags]  heartbeat
    #Login with Device ID  ${CU_UP_DEVICE1_MACID}
    #set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    #Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify the missing heart beat count

	
Verify HB Monitoring on NETCONF session re-establishment Job for CUCP
    [Tags]    CUCP_HB_Monitor_Job     HB_Monitor    regression    regression_6.0
    Device console Login
    BuiltIn.Sleep  10s
    #Login with Device ID    ${CU_CP_DEVICE1_MACID}
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Open HB Monitor Job for CUCP
    BuiltIn.Sleep  5s
    DMS UI Logout

Verify HB Monitoring on NETCONF session re-establishment Job for CUUP
    [Tags]    CUUP_HB_Monitor_Job     HB_Monitor    regression    regression_6.0
    Device console Login
    BuiltIn.Sleep  10s
    #Login with Device ID    ${CU_UP_DEVICE1_MACID}
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Open HB Monitor Job for CUUP
    BuiltIn.Sleep  5s
    DMS UI Logout

Verify HB Monitoring on NETCONF session re-establishment Job for DU
    [Tags]    DU_HB_Monitor_Job     HB_Monitor    regression    regression_6.0
    Device console Login
    BuiltIn.Sleep  10s
    #Login with Device ID    ${DU_DEVICE1_MACID}
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Open HB Monitor Job for DU
    BuiltIn.Sleep  5s
    DMS UI Logout	