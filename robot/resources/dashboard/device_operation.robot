*** Settings ***
Resource            ../common/ui_common.robot
Resource            page/dashboard_page_helper.robot

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile_restore_file}          ${EXECDIR}${BACKUP_RESTORE_FILE_LOCATION}

*** Keywords ***
Reboot Device
    [Documentation]  Reboot Device
    BuiltIn.Sleep  5s
    Set Focus To Element   ${XPATH_DASHBOARD_REBOOT_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DASHBOARD_REBOOT_DEVICE}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_ACTION_POPUP_OK}
    BuiltIn.Sleep  5s

Replan Device
    [Documentation]  Replan Device
    BuiltIn.Sleep  10s
    Set Window Size    1366    768
    BuiltIn.Sleep  5s
    Set Focus To Element  ${XPATH_DASHBOARD_REBOOT_DEVICE}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_DASHBOARD_REPLAN_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DASHBOARD_REPLAN_DEVICE}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_ACTION_POPUP_OK}
    BuiltIn.Sleep  5s

Reset Device
    [Documentation]     Reset Device
    Set Focus To Element  ${ID_DASHBOARD_RESET_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element   ${ID_DASHBOARD_RESET_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_DEVICE_ACTION_POPUP_OK}
    BuiltIn.Sleep  5s

Resync Device
    [Documentation]  Resync Device
    BuiltIn.Sleep  5s
    Set Focus To Element  ${ID_DASHBOARD_RESYNC_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DASHBOARD_RESYNC_DEVICE}
    BuiltIn.Sleep  5s

Resync All Device
    [Documentation]  Resync All Device
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_DASHBOARD_RESYNCALL_DEVICE}
    BuiltIn.Sleep  5s
    Set Focus To Element  ${ID_DASHBOARD_RESYNCALL_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DASHBOARD_RESYNCALL_DEVICE}
    BuiltIn.Sleep  5s

Firmware Upgrade
    [Documentation]  Firmware Upgrade
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DASHBOARD_FIRMWARE_UPGRADE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DASHBOARD_FIRMWARE_SELECT_UPGRADE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_ACTION_POPUP_OK}
    BuiltIn.Sleep  5s

Replan Device with Confirm
    [Documentation]  Replan Device
    BuiltIn.Sleep  10s
    Set Focus To Element  ${XPATH_DASHBOARD_REPLAN_DEVICE}
    BuiltIn.Sleep  15s
    Click DMS Element  ${XPATH_DASHBOARD_REPLAN_DEVICE}
    BuiltIn.Sleep  15s
    Click DMS Element  ${XPATH_CONFIRM_CHECKBOX}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_REPLAN_CONFIRM}
    BuiltIn.Sleep  10s
    #Click DMS Element  ${XPATH_DEVICE_ACTION_POPUP_OK}
    #BuiltIn.Sleep  5s

Trigger Restore
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${XPATH_RESTORE}
    Click DMS Element  ${XPATH_RESTORE}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${XPATH_LOCAL_RADIO_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LOCAL_RADIO_BUTTON}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element   ${UploadFiletest}   60s
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${UploadFiletest}
    BuiltIn.Sleep  5s
    Choose File     ${UploadFiletest}     ${AddFile_restore_file}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_APPLY_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_CONFIRM_BUTTON}

Backup Restore Teadown
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESTORE_DELETE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESTORE_OK_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SAVE_BUTTON}



Reset Confirm Device
    [Documentation]     Reset Device
    Set Focus To Element  ${ID_DASHBOARD_RESET_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element   ${ID_DASHBOARD_RESET_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_DEVICE_ACTION_POPUP_OK}
    BuiltIn.Sleep  5s
