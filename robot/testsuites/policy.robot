*** Settings ***
Suite Setup         Device console Login
Suite Teardown      DMS UI Logout    # Logging off
Resource    ../resources/common/ui_common.robot
Resource    ../resources/policy/policy_import_export.robot
Library     String
*** Variables ***
${UploadFiletest}           css=[type='file']

*** Test Cases ***
Policy Import Config File
    [Documentation]  Import config files for Pro
    [Tags]  import_policy_file    device_policy
    Login with Device ID  ${DEVICE21_MACID}
    Import Config Files

Device Policy-GPV-OnDemand
    [Documentation]   Device Policy GPV on Demand
    [Tags]   gpv_onDemand    device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    On Demand DevicePolicy Update

Device Policy-SPV-Scheduled
    [Documentation]   Device policy spv Scheduled
    [Tags]  spv_scheduled    device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Scheduled DevicePolicy Update

Event type Device Policy GPA-All
    [Documentation]   Device policy event type GPA-all
    [Tags]  event_type_all_gpa    device_policy    regression     working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    GPA all event type device policy update

Event type Device Policy SPA-Periodic
    [Documentation]   Device policy event type SPA-periodic
    [Tags]  event_type_periodic_spa    device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    SPA periodic event type device policy update

Event type Device Policy Add Object-Boot
    [Documentation]   Device policy event type Add Object-Boot
    [Tags]  event_type_boot_addObject    device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Add Object in Boot event type device policy update

Event type Device Policy Add Object-BootStrap
    [Documentation]   Device policy event type Add Object-BootStrap
    [Tags]  event_type_bootstrap_addObject    device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Add Object in BootStrap event type device policy update


Device Policy Import
    [Documentation]  Device Policy Import
    [Tags]  device_policy_import    policy_import_export  device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Open Devicy Policy Page
    Device Policy Import

Device Policy Clone
    [Documentation]  Device Policy Clone
    [Tags]  device_policy_clone   policy_import_export  device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Open Devicy Policy Page
    Device Policy Clone

Export device policy
    [Documentation]  Device Policy Export
    [Tags]  device_policy_export   policy_import_export   device_policy    regression    working
    Login with Device ID  ${DEVICE21_MACID}
    set global variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Open Devicy Policy Page
    Device Policy Export
