*** Settings ***
Suite Setup       DMS Network Console UI Login   # Login DMS UI with AdminUser
Suite Teardown    DMS Network Console UI Logout    # Logging off
Resource        ../resources/common/ui_common.robot
Resource        ../resources/dashboard/dashboard_keywords.robot
Resource        ../resources/System_Alarm_Opeartions/system_alarm_operations_keywords.robot
Resource        ../resources/Device_Alarm_Operations/device_alarm_operations_keywords.robot
Resource        ../resources/Device_Alarm_Operations/device_alarm_dc_operations_keywords.robot



*** Variables ***


*** Test Cases ***
Verify System Alarm Comment Opeartion
    [Documentation]  Comment Alarm
    [Tags]  Alarms    Comment   System_Alarm    regression    working
    Alarm Comment


Verify System Alarm Acknowledgment
    [Documentation]  Comment Alarm
    [Tags]  Alarms   ACK    System_Alarm    regression    working
    Alarm Acknoledgment


Verify System Alarm UnAcknowledgment
    [Documentation]  Comment Alarm
    [Tags]  Alarms   UnACK    System_Alarm    regression    working
    Alarm UnAcknoledgment


Verify system Alarm Clear
    [Documentation]  Comment Alarm
    [Tags]  Alarms   Clear_Alarm    System_Alarm    regression    working
    Alarm Clear_operation

Verify system Alarm Delete
    [Documentation]  Comment Alarm
    [Tags]  Alarms   Delete_Alarm    System_Alarm    regression    working
    Alarm Delete_operation


Verify NC Device Alarm Comment Opeartion
    [Documentation]  Comment NC DeviceAlarm
    [Tags]  Alarms   Comment_NC_Device    Device_Alarm_NC    regression    working
    Device Alarm Comment

Verify NC Device Alarm Ack Opeartion
    [Documentation]  ACK NC DeviceAlarm
    [Tags]  Alarms   ACK_NC_Device    Device_Alarm_NC    regression    working
    Device Alarm Acknoledgment


Verify NC Device Alarm UnAck Opeartion
    [Documentation]  UnACK NC DeviceAlarm
    [Tags]  Alarms   UnACK_NC_Device    Device_Alarm_NC    regression    working
    Device Alarm UnAcknoledgment


Verify NC Device Alarm Clear Opeartion
    [Documentation]  Clear NC DeviceAlarm
    [Tags]  Alarms   Clear_NC_Device   Device_Alarm_NC    regression    working
    Device Alarm Clear_operation



Verify NC Device Alarm Delete Opeartion
    [Documentation]  Delete NC DeviceAlarm
    [Tags]  Alarms   Delete_NC_Device    Device_Alarm_NC   regression    working
    Device Alarm Delete_operation

Verify Device Console Alarm Comment Operation
    [Documentation]  Comment Device Console Alarm
    [Tags]  Alarms   DC_Alarm   Comment_DC_Alarm    regression    working
    Device Console Alarm Comment
    DMS UI Logout

Verify Device Console Alarm Acknowledgement Operation
    [Documentation]  Ackno Device Console Alarm
    [Tags]  Alarms   DC_Alarm   Ackno_DC_Alarm    regression    working
    Device Console Alarm Acknowledgement
    DMS UI Logout

Verify Device Console Alarm UnAcknowledgement Operation
    [Documentation]  UnAckno Device Console Alarm
    [Tags]  Alarms   DC_Alarm   UnAckno_DC_Alarm    regression    working
    Device Console Alarm UnAcknowledgement
    DMS UI Logout

Verify Device Console Alarm Clear Operation
    [Documentation]  Clear Device Console Alarm
    [Tags]  Alarms   DC_Alarm   Clear_DC_Alarm    regression    working
    Device Console Alarm Clear
    DMS UI Logout

Verify Device Console Alarm Delete Operation
    [Documentation]  Delete Device Console Alarm
    [Tags]  Alarms   DC_Alarm   Delete_DC_Alarm    regression    working
    Device Console Alarm Delete
    DMS UI Logout

Verify E2E S1 Connection Failure Test Alarm
    [Documentation]  S1 Connection Failure
    [Tags]  Alarms   Test_Alarm   S1_Test_Alarm    regression    working
    S1 Connection Test Alarm Generation
    DMS UI Logout

Click on overlaping element
    [Documentation]  S1 Connection Failure
    [Tags]  click_test
    click element on dashboard overlap tab


RPTxOff Alarm Raise Verification for BC
    [Documentation]  Verify DMS Raises Alarm on RPTxOff notification from RP
    [Tags]  Alarm_BC    dms_alarm     rp_alarm     regression     regression_6.0     RPt9
    Create And Update Params for NGRP VC file path ddlg    ${BC_VENUE_DEVICE1}  conf/device/SIQ/params/ngrp-params_automation_RPTxOff.properties
    BuiltIn.Sleep   50s
    Device console Login
    Login with Device ID  ${BC_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${BC_VENUE_DEVICE1}
    BuiltIn.Sleep  59s
    Verify RPTxOff Raise Alarm in BC Device Console Alarm Page    ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RPTxOff Raise BC Alarm in Network Console Device Alarm Page


RPTxOff Alarm Clear Verification for BC
    [Documentation]  Verify DMS Clears Alarm on RPTxOff notification from RP
    [Tags]  Alarm_BC    dms_alarm     rp_alarm     regression     regression_6.0    azzu1
    Create And Update Params for NGRP VC file path ddlg    ${BC_VENUE_DEVICE1}  conf/device/SIQ/params/ngrp-params_automation_RPTxON.properties
    BuiltIn.Sleep   50s
    Device console Login
    Login with Device ID  ${BC_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${BC_VENUE_DEVICE1}
    BuiltIn.Sleep  59s
    Verify RPTxOff Clear Alarm in BC Device Console Alarm Page    ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    DMS Network Console UI Login
    Verify RPTxOff Clear BC Alarm in Network Console Device Alarm Page

