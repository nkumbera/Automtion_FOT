*** Settings ***
Library            SSHLibrary
Resource           ../resources/common/ui_common.robot
Resource           ../resources/ServiceSetting/ServiceSetting_keywords.robot
Suite Teardown     DMS UI Logout
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
Resource            ../resources/provisioning/provisioning_keywords.robot
Library             String
#Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot



*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}


*** Test Cases ***
Service setting GUI_Override_Profile-show advance option
    [Documentation]  Service setting GUI_Override_Profile-show advance option
    [Tags]   Service_setting_advance_option     Service_setting    regression
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${SETTINGS_FILE_LOCATION_profile}    ${SERVER_IMPORT_PATH}
    ${output}           Execute Command     cp ${SERVER_FILE_COPY_FROM_PATH} ${SERVER_COPY_TO_PATH}
    Log    ${output}
    DMS Network Console UI Login
    Import Service Setting file
    Verify Operation History for import
    Device console Login
    Login with Device ID  ${DEVICE20_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Profile Association Teardown
    Select show advance option
    Verify Delta Provisioning Status
    Reset Device
    BuiltIn.Sleep  300s
    verify pnp workflow status
    Dashboard Device InService Status
    Profile Association Teardown

Service setting GUI_Override_Profile-associate new one
    [Documentation]  Service setting GUI_Override_Profile-associate new one
    [Tags]   Service_setting_profile_association    Service_setting    regression
    Device console Login
    Login with Device ID  ${DEVICE20_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Select Profile Association
    Verify Delta Provisioning Status
    Reset Device
    BuiltIn.Sleep  200s
    verify pnp workflow status
    Dashboard Device InService Status
    Profile Association Teardown

Restore Device
    [Documentation]  Restore Device
    [Tags]  restore    Service_setting   regression    dashboard
    Device console Login
    Login with Device ID  ${DEVICE20_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Profile Association Teardown
    Trigger Restore
    BuiltIn.Sleep  250s
    verify pnp workflow status
    Dashboard Device InService Status
    Open Overridden Params Page
    Search Provision Parameter    eNodeB    Restore Profile Name
    Backup Restore Teadown
    Verify Delta Provisioning Status
    #Replan Device with Confirm
    Replan Device
    BuiltIn.Sleep  100s
    Select show advance option
    Reset Device
    BuiltIn.Sleep  350s
    verify pnp workflow status
    Dashboard Device InService Status

ENDC configuration from SS file
    [Documentation]  ENDC configuration from SS file
    [Tags]  ENDC_SS    MJ_R60    regression    regression_6.0
    Log  verify ENDC configuration from SS file
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Login with Device ID  ${DEVICE20_MACID}
    BuiltIn.Sleep  2s
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    Associate New Profile    ${EXECDIR}${SETTINGS_FILE_LOCATION_ENDC}    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    Verify Delta Provisioning Status
    BuiltIn.Sleep  2s
    Replan Device
    BuiltIn.Sleep  100s
    verify pnp workflow status
    BuiltIn.Sleep  2s
    Dashboard Device InService Status
    BuiltIn.Sleep  2s
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    Associate New Profile    ${EXECDIR}${SETTINGS_FILE_LOCATION_profile}    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    DMS UI Logout


Min Mandatory configuration changes using service settings manual import
     [Documentation]  Service setting Min_Mandatory_Configuration_changes Manual_import
    [Tags]   Service_setting_Config_change     Service_setting    regression        TA_code    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${SETTINGS_FILE_LOCATION_Config_Change}    ${SERVER_IMPORT_PATH}
    DMS Network Console UI Login
    Import Service Setting file
    BuiltIn.Sleep  30s
    Verify Operation History for ConfigChange import
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${SETTINGS_FILE_LOCATION_profile}    ${SERVER_IMPORT_PATH}
    Import Service Setting file
    BuiltIn.Sleep  30s
    Verify Operation History for import
    Device console Login
    Login with Device ID  ${DEVICE20_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    #Profile Association Teardown2
    #Select show advance option
    Verify Delta Provisioning Status
    BuiltIn.Sleep  30s
    Replan Device
    BuiltIn.Sleep  30s
    verify pnp workflow status


Min Mandatory configuration changes using service settings auto import
    [Documentation]  Service setting Min_Mandatory_Configuration_changes Auto_import
    [Tags]   Service_setting_Config_change_auto     Service_setting    regression       TA_code    regression_6.0
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${SETTINGS_FILE_LOCATION_Config_Change}    ${SERVER_IMPORT_PATH1}
    DMS Network Console UI Login
    Schedule Import Service Setting file
    BuiltIn.Sleep  120s
    Verify Operation History for ConfigChange import
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file            ${EXECDIR}${SETTINGS_FILE_LOCATION_profile}    ${SERVER_IMPORT_PATH1}
    Schedule Import Service Setting file
    BuiltIn.Sleep  180s
    Verify Operation History for import
    Device console Login
    Login with Device ID  ${DEVICE20_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE20_MACID}
    Verify Delta Provisioning Status
    BuiltIn.Sleep  30s
    Replan Device
    BuiltIn.Sleep  30s
    verify pnp workflow status

R6.0 Onecell and n-1 n-2 Device PnP with Minimum Mandatory parameter
    [Documentation]     R6.0 R5.5 R4.5 Device PnP with Minimum Mandatory parameter
    [Tags]      R6.0_R5.5_R4.5_PnP_with_Minimum_Mandatory_parameter    PnP     Regression  TA_PNP
    Device console Login
    Login with Device ID  ${DEVICE19_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE19_MACID}
    Profile Association Teardown2
    Associate 4.5 SS File
    Login with Device ID  ${DEVICE19_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE19_MACID}
    Verify BOOTSTRAP Downgrade Software Version using ddlg