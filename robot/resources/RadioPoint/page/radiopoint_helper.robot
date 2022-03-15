*** Settings ***
Library             String
Library             DateTime
Variables           radiopoint_ui_controls.py
Resource            robot/resources/common/ui_common.robot
Resource            ../../notification/notification_helper.robot
Resource            ../../ProactiveJob/Page/proactivejob_helper.robot



*** Variables ***

*** Keywords ***
Open RP Params Page
    [Documentation]  Open the RP Parameters page
    ${rp_params_url}=  Format String   ${DEVICE_CONSOLE_RPPAGE_URL}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${rp_params_url}
    BuiltIn.Sleep  5s

Perform reboot operation
    [Documentation]     open RP dashboard page
    Click DMS Element   ${ID_RP_DU_DEVICE}
    Click DMS Element   ${ID_RP_REBOOT_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_CELL1_CHECKBOX}
    Click DMS Element   ${ID_RP_REBOOT_OK_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_RP_CONFIRM_OK_BUTTON}


open DMS RP Overridden Param
    BuiltIn.Sleep  5s
    Go to   ${DMS_CERTIFICATE_DOWNLOAD}
    BuiltIn.Sleep  5s

Select RP from BC
    Click DMS Element   ${RP_FILTER_INPUT_TEXT}
    BuiltIn.Sleep  5s
    input dms text  ${RP_FILTER_INPUT_TEXT}    ${CERT_MAC_ADDRESS}
    BuiltIn.Sleep  5s
    Click DMS Element   ${APPLY_RP_FILTER}
    BuiltIn.Sleep  5s

Change M-plane value
    [Arguments]    ${CERTIFICATE_OPTION}
    Click DMS Element    ${XPATH_M_PLANE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${CERTIFICATE_OPTION}

save changes
    BuiltIn.Sleep  5s
    Click DMS Element    ${SAVE_BUTTON}

Open RP Params Page for Real device
    BuiltIn.Sleep  5s
    Go to   ${RP_PARM_PAGE}
    BuiltIn.Sleep  5s

Resync RP Page
    BuiltIn.Sleep  5s
    Click DMS Element    ${RP_RESYNC_ALL_RP}

Select Show More Columns
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Select_Mplane_option}
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN_OK_BUTTON}

Verify certificate downloaded success message
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${M_PLANE_MESSAGE}
    ${MESSAGE}    GET TEXT     ${M_PLANE_MESSAGE}
    Log    ${MESSAGE}
    should contain    ${MESSAGE}     KeyCertDownload_SUCCESS

Enter RP Dashboard
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_MAC}

Select RP Resync
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_RESYNC}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_DASHBOARD_OPRATION_CONFIRM_BUTTON}
    BuiltIn.Sleep  5s


Select RP Resync All
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_RESYNC_ALL}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_DASHBOARD_OPRATION_CONFIRM_BUTTON}
    BuiltIn.Sleep  5s


Select RP Reboot
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_REBOOT}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_DASHBOARD_OPRATION_CONFIRM_BUTTON}
    BuiltIn.Sleep  5s


Select RP Reset
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_RESET}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_RP_DASHBOARD_OPRATION_CONFIRM_BUTTON}
    BuiltIn.Sleep  5s

Get Table Content
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_SELECET_ALL}
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN_OK_BUTTON}
    BuiltIn.Sleep  5s
    ${table_content}     get Text     ${XPATH_RP_FULL_TABLE}
    Log    ${table_content}
    should contain     ${table_content}    CS_ONECELL_RU51
    should contain     ${table_content}    READY
    should contain     ${table_content}    CONNECTED
    should contain     ${table_content}    LOCKED
    should contain     ${table_content}    0005B9
    should contain     ${table_content}    6.0.00.055
    should contain     ${table_content}    10.11.11.11
    #should contain     ${table_content}    205151201221
    #should contain     ${table_content}    87263899289374


open RP Dashboard Page
    BuiltIn.Sleep  5s
    ${rp_params_url}=  Format String   ${RP_Mapping_Dashboard_URL_DU}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go to   ${rp_params_url}
    BuiltIn.Sleep  5s

Verify RP Dashboard Table Content
    Scroll Element Into View       ${XPATH_RP_DASHBOARD_FULL_TABLE}
    ${RP_table_content}     get Text     ${XPATH_RP_DASHBOARD_FULL_TABLE}
    Log    ${RP_table_content}
    should contain     ${RP_table_content}    CS_ONECELL_RU51
    should contain     ${RP_table_content}    Connected
    should contain     ${RP_table_content}    mjsimuauto-1101du1_0005B9519AA1_1
    should contain     ${RP_table_content}    20515120122
    #should Match       ${RP_table_content}    1
    should contain     ${RP_table_content}    InService

Perform reset operation
    [Documentation]     open RP dashboard page
    Click DMS Element   ${ID_RP_DU_DEVICE}
    Click DMS Element   ${ID_RP_RESET_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_CELL1_CHECKBOX}
    Click DMS Element   ${ID_RP_RESET_OK_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_RP_CONFIRM_OK_BUTTON}
    BuiltIn.Sleep  10s

Perform resyncall operation
    [Documentation]     Perform Resync Operation
    Click DMS Element   ${ID_RESYNCALL_BUTTON}
    BuiltIn.Sleep  10s

Verify RP5200 Dashboard Table Content
    Scroll Element Into View       ${XPATH_RP_DASHBOARD_TABLE_WITH_HEADER}
    ${RP_table_content}     get Text     ${XPATH_RP_DASHBOARD_TABLE_WITH_HEADER}
    Log    ${RP_table_content}
    should contain     ${RP_table_content}    CS_ONECELL_RU52
    should contain     ${RP_table_content}    Connected
    should contain     ${RP_table_content}    sszblndrblr-7777du1_0005B960AAA1_1
    should contain     ${RP_table_content}    sszblndrblr-7777du1_0005B960AAA2_1
    should contain     ${RP_table_content}    205151201221
    should contain     ${RP_table_content}    205151201222
    should contain     ${RP_table_content}    InService
    should contain     ${RP_table_content}    RP Identifier
    should contain     ${RP_table_content}    RF Module ID
    should contain     ${RP_table_content}    Product Class
    should contain     ${RP_table_content}    Cell
    should contain     ${RP_table_content}    Service Status
    should contain     ${RP_table_content}    Admin Status
    should contain     ${RP_table_content}    Connection Status

Get RP5200 Operational RP Params Table Content
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_SELECET_ALL}
    BuiltIn.Sleep  5s
    Click DMS Element    ${SHOW_MORE_COLUMN_OK_BUTTON}
    BuiltIn.Sleep  5s
    ${table_content}     get Text     ${XPATH_RP_OP_PARAMS_TABLE_WITH_HEADER}
    Log    ${table_content}
    should contain     ${table_content}    RP Identifier
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_HWREVISION}
    BuiltIn.Sleep  5s
    ${table_content}     get Text     ${XPATH_RP_OP_PARAMS_TABLE_WITH_HEADER}
    Log    ${table_content}
    should contain     ${table_content}    CS_ONECELL_RU52
    should contain     ${table_content}    READY
    should contain     ${table_content}    CONNECTED
    should contain     ${table_content}    LOCKED
    should contain     ${table_content}    0005B9
    should contain     ${table_content}    6.0.00.055
    should contain     ${table_content}    10.11.11.11
    should contain     ${table_content}    205151201221
    should contain     ${table_content}    205151201222
    should contain     ${table_content}    87263899289374
    should contain     ${table_content}    sszblndrblr-7777du1_0005B960AAA1_1
    should contain     ${table_content}    sszblndrblr-7777du1_0005B960AAA2_1
    should contain     ${table_content}    Cell
    should contain     ${table_content}    Admin Status
    should contain     ${table_content}    RfTx State
    should contain     ${table_content}    Connection Status
    should contain     ${table_content}    Sync State
    should contain     ${table_content}    PTP State
    should contain     ${table_content}    Software Version
    should contain     ${table_content}    Up Time (seconds)
    should contain     ${table_content}    RP IP Address
    should contain     ${table_content}    First Use Date
    should contain     ${table_content}    Firmware Revision
    should contain     ${table_content}    Product Class
    should contain     ${table_content}    Hardware Revision
    should contain     ${table_content}    Manufacturer OUI

Scroll Up Page
	[Documentation]  Scroll up to page
    Scroll Element Into View    ${XPATH_TOP_OF_PAGE}
    press keys  ${XPATH_TOP_OF_PAGE}  ARROW_UP
    press keys  ${XPATH_TOP_OF_PAGE}  END
    press keys  ${XPATH_TOP_OF_PAGE}  END
    BuiltIn.Sleep  5s

Verify RP Reboot_Reset Notification
    [Documentation]  Verification of RP Reboot Notification
    #Check Notification For Success Message
    [Arguments]   ${type_operation}  ${status}
    Click DMS Element  ${ID_NOTIFICATION_HEADER}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${type_operation}
    ${count}=  Get Element Count   ${type_to_verify}
    Should Be True  ${count} > 0
    Log  Number of element ${count}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${status}
    ${count}=  Get Element Count  ${type_to_verify}
    Log  Number of element ${count}
    Should Be True  ${count} > 0
    Wait Until Element Is Visible  ${XPATH_NOTIFICATION_DETAILS_VIEW}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_NOTIFICATION_DETAILS_VIEW}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element  ${XPATH_NOTIFICATION_DETAILS_VIEW}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${XPATH_LAST_UPDATE_TIME}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_LAST_UPDATE_TIME}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_PARAMETER_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_PARAMETER_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${Notification_Details_content}    get Text    ${XPATH_RFMODULEID_TABLE}
    Log    ${Notification_Details_content}
    should contain     ${Notification_Details_content}    RF Module ID
    should contain     ${Notification_Details_content}    205151201221
    should contain     ${Notification_Details_content}    205151201222
    BuiltIn.Sleep  2s

Verify RP 5100 Reboot_Reset Notification
    [Documentation]  Verification of RP Reboot Notification
    #Check Notification For Success Message
    [Arguments]   ${type_operation}  ${status}
    Click DMS Element  ${ID_NOTIFICATION_HEADER}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${type_operation}
    ${count}=  Get Element Count   ${type_to_verify}
    Should Be True  ${count} > 0
    Log  Number of element ${count}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${status}
    ${count}=  Get Element Count  ${type_to_verify}
    Log  Number of element ${count}
    Should Be True  ${count} > 0
    Wait Until Element Is Visible  ${XPATH_NOTIFICATION_DETAILS_VIEW}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_NOTIFICATION_DETAILS_VIEW}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_LATEST_NOTIFICATION_DETAILS_VIEW}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${XPATH_LAST_UPDATE_TIME}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_LAST_UPDATE_TIME}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_PARAMETER_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_PARAMETER_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${Notification_Details_content}    get Text    ${XPATH_RFMODULEID_TABLE}
    Log    ${Notification_Details_content}
    should contain     ${Notification_Details_content}    RF Module ID
    should contain any      ${Notification_Details_content}    205151201221    20515120122
    #should contain     ${Notification_Details_content}    205151201222
    BuiltIn.Sleep  2s