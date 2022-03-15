*** Settings ***
Test Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource    ../resources/common/ui_common.robot
Resource    ../resources/policy_gNB/policy_keywords.robot
Library     String
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddPolicy_CUCP}          ${EXECDIR}${CU_CP_POLICY_LOCATION}
${AddPolicy_CUUP}          ${EXECDIR}${CU_UP_POLICY_LOCATION}
${AddPolicy_DU}            ${EXECDIR}${DU_POLICY_LOCATION}

*** Test Cases ***
CP Device Policy Import
    [Documentation]  CP Device Policy Import
    [Tags]  cp_device_policy_import    policy_import_export    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Import CP Device Policy


UP Device Policy Import
    [Documentation]  UP Device Policy Import
    [Tags]  up_device_policy_import    policy_import_export    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Import UP Device Policy

DU Device Policy Import
    [Documentation]  DU Device Policy Import
    [Tags]  du_device_policy_import    policy_import_export    regression    Policy_gNB     regression_6.0
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    Import DU Device Policy


Configuration of EnableAutomaticRPKeyCertsDown through device onDemand Policy
    [Documentation]  EnableAutomaticRPKeyCertsDown through device onDemand Policy
    [Tags]     EnableAutomaticRPKeyCertsDown_policy    regression    Policy_gNB    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    Delete EnableAutomaticRPKeyCertsDown created policy    EnableAutomaticRPKeyCertsDownload_SPV
    Create SPV On Demand DevicePolicy for policy EnableAutomaticRPKeyCertsDown
    Delete EnableAutomaticRPKeyCertsDown created policy    EnableAutomaticRPKeyCertsDownload_GPV
    Create GPV On Demand DevicePolicy for policy EnableAutomaticRPKeyCertsDown

Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for CP
    [Documentation]  Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for CP
    [Tags]  cucp_ondemand_getconfigure_getoperational    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Create On Demand Get Configured Data    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GCD}    ${DEVICE_HISTORY_PARAMETER_CU}
    Create On Demand Get Operational Data    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GOD}    ${DEVICE_HISTORY_PARAMETER_CU}

Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for UP
    [Documentation]  Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for UP
    [Tags]  cuup_ondemand_getconfigure_getoperational    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Create On Demand Get Configured Data    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GCD}    ${DEVICE_HISTORY_PARAMETER_CU}
    Create On Demand Get Operational Data    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GOD}    ${DEVICE_HISTORY_PARAMETER_CU}


Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for DU
    [Documentation]  Verify Creation and execution of On-demand Get Configured data/Get Operational Policy for DU
    [Tags]  du_ondemand_getconfigure_getoperational    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    Create On Demand Get Configured Data    ${VNF_DU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GCD}    ${DEVICE_HISTORY_PARAMETER_DU}
    Create On Demand Get Operational Data    ${VNF_DU_POLICY_PAGE}
    Verify device history for Policy Results    ${OnDemand_policy_name_GOD}    ${DEVICE_HISTORY_PARAMETER_DU}

Creation and execution of Scheduled Edit Confguration Policy for CP
    [Documentation]    Creation and execution of Scheduled Edit Confguration Policy for CP
    [Tags]  edit_configuration    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Edit configuration Scheduled policy    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${Schedule_policy_name}    ${DEVICE_HISTORY_PARAMETER_CU}

Creation and execution of Scheduled Edit Confguration Policy for UP
    [Documentation]    Creation and execution of Scheduled Edit Confguration Policy for UP
    [Tags]  edit_configuration    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Edit configuration Scheduled policy    ${VNF_CU_POLICY_PAGE}
    Verify device history for Policy Results    ${Schedule_policy_name}    ${DEVICE_HISTORY_PARAMETER_CU}

Creation and execution of Scheduled Edit Confguration Policy for DU
    [Documentation]    Creation and execution of Scheduled Edit Confguration Policy for DU
    [Tags]  edit_configuration    regression    Policy_gNB    regression_6.0
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    Edit configuration Scheduled policy    ${VNF_DU_POLICY_PAGE}
    Verify device history for Policy Results    ${Schedule_policy_name}    ${DEVICE_HISTORY_PARAMETER_DU}

Creation and execution of Event Type Policy for CP
    [Documentation]    Creation and execution of Event Type Policy for CP
    [Tags]  Create_execute_EventType    regression    regression_6.0
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Create and execute Event type policy    ${VNF_CU_POLICY_PAGE}
    Verify gNB Device Reboot Status
    Verify VNF Success msg    ${VNF_CU_POLICY_PAGE}    ${EventType_policy_name_GOD}
    Verify gNB Device Reset Status
    Verify VNF Success msg    ${VNF_CU_POLICY_PAGE}    ${EventType_policy_name_GOD}

Creation and execution of Event Type Policy for UP
    [Documentation]    Creation and execution of Event Type Policy for UP
    [Tags]  Create_execute_EventType    regression    regression_6.0
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_CU_POLICY_PAGE}
    Create and execute Event type policy    ${VNF_CU_POLICY_PAGE}
    Verify gNB Device Reboot Status
    Verify VNF Success msg    ${VNF_CU_POLICY_PAGE}    ${EventType_policy_name_GOD}
    Verify gNB Device Reset Status
    Verify VNF Success msg    ${VNF_CU_POLICY_PAGE}    ${EventType_policy_name_GOD}

Creation and execution of Event Type Policy for DU
    [Documentation]    Creation and execution of Event Type Policy for UP
    [Tags]  Create_execute_EventType_DU    regression    regression_6.0
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    Create and execute Event type policy    ${VNF_DU_POLICY_PAGE}
    Verify gNB Device Reboot Status
    Verify VNF Success msg    ${VNF_DU_POLICY_PAGE}    ${EventType_policy_name_GOD}
    Verify gNB Device Reset Status
    Verify VNF Success msg    ${VNF_DU_POLICY_PAGE}    ${EventType_policy_name_GOD}

Configuration of EnableBanner GPV Device Policy
    [Documentation]  Verify Configuration of EnableBanner GPV Device Policy
    [Tags]     EnableBanner_GPV_policy    regression    device_policy    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    Open Realdevice Devicy Policy Page
    Delete the Realdevice Policy    EnableBanner_GPV
    Create GPV On Demand DevicePolicy for policy EnableBanner
    Verify EnableBanner GPV in device history   Tabular  Last 1 hour  PROVISIONING
    #Delete the Realdevice PolicyDelete EnableBanner created policy    EnableBanner_GPV


Create RU STATE device policy in DU
    [Documentation]    Create RU STATE device policy in DU
    [Tags]  Create_execute_RU_STATE    regression    regression_6.0
    Login with gNB Device ID  ${rutest_DU}
    set global variable  ${DEVICE_MACID}  ${rutest_DU}
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    Add On demand RU State policy for DU    RU_StateTest_Policy    ${XPATH_DP_DEVICEOPERATION_Editconfig}