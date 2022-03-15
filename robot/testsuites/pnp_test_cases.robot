*** Settings ***
Suite Setup       DMS UI Login    # Login DMS UI with AdminUser
Suite Teardown    DMS UI Logout    # Logging off
Resource          ../resources/pnp/pnp_keywords.robot
Resource          ../resources/common/ui_common.robot
Resource          ../resources/slamd/slamd_keywords.robot

*** Variables ***

*** Test Cases ***
Initiate PNP
    [Documentation]    Initiate PNP
    [Tags]    init_pnp    pnp
    Log    Testing PNP
    Login with Device ID  ${DEVICE3_MACID}
    Start PNP Action
    BuiltIn.Sleep  10s
    Enable Pending SLAMD Job

Verify PNP
    [Documentation]    Verify PNP Status
    [Tags]    verify_pnp    regression    working
    Log    Testing PNP
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Verify PNP Status


Initiate PNP For Device
    [Documentation]    Initiate PNP for Device
    [Tags]    init_device_pnp
    [Arguments]   ${device} = ${DEVICE1}
    Log    Testing PNP
    Login with Device ID  ${device}
    Start PNP Action




Enable SLAMD Job
   [Tags]    select_slamd
   Enable Pending SLAMD Job