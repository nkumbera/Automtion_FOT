*** Settings ***
#Suite Setup         Device console Login
Suite Setup         Suite Setup Keyword
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../common/ui_common.robot
Resource            ../resources/RadioPoint/radiopoint_keywords.robot
Variables            ../properties/common.py
Resource            ../dashboard/device_operation.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/device_history/device_history_page_keywords.robot

*** Variables ***


*** Keywords ***
Suite Setup Keyword
    Stop and start ves pool    ${DU_DEVICE1_MACID}
    BuiltIn.Sleep  150s


*** Test Cases ***
RP Reboot mapped with DU Device
    [Tags]      rpreboot    regression    DU_Radio_point    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Open RP Params page and perform Reboot


RPKeyCertsStatus value during RP resync/resync all
    [Tags]      rpcertstatus    regression    ngrp_platform_console    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    Reset Device
    BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    Pre-requisite to Set the RP value for certificate download
    Replan Device
    BuiltIn.Sleep  60s
    Set the RP value for certificate download
    Replan Device
    BuiltIn.Sleep  60s
    Download RP certificate
    BuiltIn.Sleep  50s
    Verify certificate downloaded

Resync/Resyncall from NGRP Platform Console
    [Tags]      ngrp_platform_console    regression    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    Login to NGRP Platform Console Dashboard
    Validate Resync


Reboot/reset from NGRP Platform Console
    [Tags]      ngrp_platform_console    regression    regression_6.0
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    Login to NGRP Platform Console Dashboard
    Validate Reboot/Reset


Verify RP params in Operational RP params GUI after receiving RP VC
    [Tags]      RPNotification    regression    DU_Radio_point    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    RP Dashboard Verification
    Operational Param Verification
    Stop and start ves pool    ${VES_JOB_DU}
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    RU Add Notification Verification in device History


RP5200 Reboot mapped to DU
    [Tags]      rpreboot    regression  DU_Radio_point  rp5200    rp5200reboot  rp5200_actions    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VNF_ID}
    set global variable  ${DEVICE_MACID}  ${DU_VNF_ID}
    Open RP Params page and perform RP5200 Reboot
    BuiltIn.Sleep  20s
    Verify RP5200 Reboot Notification
    Verify RP5200 RP Reboot in History  Tabular  Last 1 hour  All


RP5200 Reset mapped to DU
    [Tags]      rpreset    regression  DU_Radio_point  rp5200    rp5200reset  rp5200_actions    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VNF_ID}
    set global variable  ${DEVICE_MACID}  ${DU_VNF_ID}
    Open RP Params page and perform Reset
    BuiltIn.Sleep  20s
    Verify RP5200 Reset Notification
    Verify RP5200 RP Reset in History  Tabular  Last 1 hour  All


ResyncAll on DU mapped to RP5200
    [Tags]      rpreset    regression  DU_Radio_point  rp5200    rp5200resyncall    rp5200_actions    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VNF_ID}
    set global variable  ${DEVICE_MACID}  ${DU_VNF_ID}
    Perform ResyncAll on DU connected with RP5200
    BuiltIn.Sleep  10s
    Verify Resync in History  Tabular  Last 1 hour  All


Verify RP params in Operational RP params GUI after receiving RP5200 RP VC
    [Tags]      RPNotification    regression    DU_Radio_point    rp5200    rp5200_rpmapping     regression_6.0
    Stop and start ves pool    ${DU_VNF_ID}
    BuiltIn.Sleep  180s
    Device console Login
    Login with gNB Device ID  ${DU_VNF_ID}
    set global variable  ${DEVICE_MACID}  ${DU_VNF_ID}
    RP5200 Dashboard Verification
    RP5200 Operational RP Params Verification
    RP5200 Notifications Verification in device History    Tabular  Last 1 hour  NOTIFICATION

RP5100 Reboot mapped to DU
    [Tags]      rpreboot    regression  DU_Radio_point  rp5100    rp5100reboot  rp5100_actions    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Open RP Params page and perform RP5200 Reboot
    BuiltIn.Sleep  20s
    Verify RP5100 Reboot Notification
    Verify RP5200 RP Reboot in History  Tabular  Last 1 hour  All


RP5100 Reset mapped to DU
    [Tags]      rpreset    regression  DU_Radio_point  rp5100    rp5100reset  rp5100_actions    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Open RP Params page and perform Reset
    BuiltIn.Sleep  20s
    Verify RP5100 Reset Notification
    Verify RP5200 RP Reset in History  Tabular  Last 1 hour  All

