*** Settings ***
Suite Setup       DMS Network Console UI Login   # Login DMS UI with AdminUser
Suite Teardown    DMS Network Console UI Logout    # Logging off

Resource        ../resources/common/ui_common.robot
Resource        ../resources/dashboard/dashboard_keywords.robot
Resource        ../resources/FirmwareUpgrade/firmwareupgrade_keywords.robot
Resource         ../resources/Import/Import_keywords.robot
Resource         ../resources/device_history/device_history_page_keywords.robot
Resource         ../resources/CommunicationLogs/CommunicationLog_keyword.robot
Resource         ../resources/ServiceSetting/ServiceSetting_keywords.robot
Library             String




*** Variables ***


*** Test Cases ***
Verify URL based non-Split RP only firmware Image creation
    [Documentation]  Verify URL based non-Split RP only firmware Image creation from Firmware Upgrade page
    [Tags]   rp_url_image    NC_firmware_upgrade    regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Image creation Page
    Create URL based non-split RP only Image
    #Delete URL based non-split RP only Image
    DMS Network Console UI Logout
Verify RP5100 device based firmware upgrade
    [Documentation]  Verify device based firmware upgrade for RP5100 device
    [Tags]   rp5100_url_upgrade    NC_firmware_upgrade    regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Manage Page
    Create RP5100 Firmware Upgrade Job
    Device console Login
    Login with gNB Device ID  ${RP_UPGRADE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${RP_UPGRADE_DEVICE1}
    Verify FIrmware Upgrade in device History   Tabular  Last 1 hour  All
    DMS Network Console UI Logout

Verify Delete Firmware JOB and Firmware Image
    [Documentation]  Verify delete Firmware Job and firmware image
    [Tags]   delete_firmwarejob_image    NC_firmware_upgrade    regression    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Manage Page
    Delete Firmware Upgrade Job
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Image creation Page
    Delete URL based non-split RP only Image
    DMS Network Console UI Logout

Verify schedule split upgrade with RDC ServiceSetting file
    [Documentation]  Verify schedule split upgrade using url of RDC ServiceSetting file
    [Tags]   regression    regression_6.0
    Device console Login
    Login with gNB Device ID  ${FIRMWARE_SPLIT_MAC_ID}
    Select Profile Association for RDC  ${FIRMWARE_SPLIT_MAC_ID}
    Navigate to Communication logs
    Enable Communication logs
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Manage Page
    ${JOB_NAME}=    Schedule split firmware upgrade job for OneCell devices     ${FIRMWARE_UPGRADE_JOB_NAME1}
    Verify Firmware Job Status  Ready   ${JOB_NAME}
    BuiltIn.Sleep  300s
    Verify Firmware Job Status  Running   ${JOB_NAME}
    DMS Network Console UI Logout
    Device console Login
    Login with gNB Device ID  ${FIRMWARE_SPLIT_MAC_ID}
    Verify Communication logs page Navigation
    Verify download url from Communication logs    ${RCA_IMAGE_LOCATION}



Verify schedule split upgrade without RDC ServiceSetting file
    [Documentation]  Verify schedule split upgrade download url is taken Job settings
    [Tags]   regression    regression_6.0
    Device console Login
    Login with gNB Device ID  ${FIRMWARE_SPLIT_MAC_ID}
    Select Profile Association for RDC  ${FIRMWARE_SPLIT_MAC_ID}
    Navigate to Communication logs
    Enable Communication logs
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Manage Page
    ${JOB_NAME1}=    Schedule split firmware upgrade job for OneCell devices    ${FIRMWARE_UPGRADE_JOB_NAME}
    Verify Firmware Job Status  Ready   ${JOB_NAME1}
    Device console Login
    Login with gNB Device ID  ${FIRMWARE_SPLIT_MAC_ID}
    Open Overridden Params Page1    ${FIRMWARE_SPLIT_MAC_ID}
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile RDC
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Firmware Upgrade Manage Page
    BuiltIn.Sleep  200s
    Verify Firmware Job Status  Running   ${JOB_NAME1}
    DMS Network Console UI Logout
    Device console Login
    Login with gNB Device ID  ${FIRMWARE_SPLIT_MAC_ID}
    Verify Communication logs page Navigation
    Verify download url from Communication logs    ${SPLIT_IMAGE_LOCATION}