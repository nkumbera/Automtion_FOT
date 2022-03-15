*** Settings ***
Library             DateTime
Resource            page/dashboard_page_helper.robot
Resource            device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
Resource            ../pnp/pnp_keywords.robot
Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            ../ddlg/ddlg_keywords.robot


*** Variables ***


*** Keywords ***
Verify Device Connect Status
    [Documentation]  Verify Connect Device
    Dashboard Device InService Status
    ${last_data_time_staring}=   Get DMS Element Text  ${ID_DASHBOARD_LAST_CONTACT_TIME}
    ${last_date_time}=  Convert Date  ${last_data_time_staring}
    Log   ${last_date_time}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DASHBOARD_CONNECT_DEVICE}
    BuiltIn.Sleep  10s
    Open Device Dashboard
    BuiltIn.Sleep  5s
    Verify Notificaton Status  Connect on Device  success
    BuiltIn.Sleep  5s
    ${latest_data_time_staring} =  Get DMS Element Text  ${ID_DASHBOARD_LAST_CONTACT_TIME}
    BuiltIn.Sleep  5s
    ${latest_date_time}=  Convert Date  ${latest_data_time_staring}
    BuiltIn.Sleep  5s
    ${diff_time}=   Subtract Date From Date  ${latest_date_time}  ${last_date_time}
    BuiltIn.Sleep  5s
    Log  Time Taken to Connect in Sec-MiliSec ${diff_time}
    BuiltIn.Sleep  5s
    Should Not Be Equal  ${latest_date_time}   ${last_date_time}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Device Reboot Status
    [Documentation]  Verify Reboot Device
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Dashboard Device InService Status
    Reboot Device
    BuiltIn.Sleep  ${REAl_DEVICE_REBOOT_TIMEOUT}
    Verify Notificaton Status  Reboot on Device   success
    BuiltIn.Sleep  15s
    Verify PNP Workflow Status
    BuiltIn.Sleep  15s
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Boot
    BuiltIn.Sleep  15s
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    BuiltIn.Sleep  15s
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Device Reset Status
    [Documentation]  Verify Reset Device
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Dashboard Device InService Status
    Reset Device
    BuiltIn.Sleep  10s
    Verify Notificaton Status  Reset on Device   success
    BuiltIn.Sleep  ${REAl_DEVICE_RESET_TIMEOUT}
    Verify PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Bootstrap
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Device Replan Status
    [Documentation]  Verify Device Replan
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Dashboard Device InService Status
    Open Device Dashboard
    Open Overridden Params Page
    Update Carrier Aggregation Downlink
    Replan Device
    BuiltIn.Sleep  15s
    Verify Notificaton Status   Replan on Device   success
    BuiltIn.Sleep    ${REAL_DEVICE_REPLAN_TIMEOUT}
    Verify PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify BOOTSTRAP All Software Version using ddlg
    [Documentation]  Verify Software Upgrade

    FOR  ${sw_version}  IN   @{SOFTWARE_VERSIONS}
         Log  Software version ${sw_version}
         ${old_data_time} =   Get PNP Workflow Finished Data And Time For
         Close Browser
         Create And Update Software Version ddlg  ${DEVICE_MACID}  ${sw_version}
         Device console Login
         Verify PNP Workflow Status
         ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Bootstrap
         Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
         ${device_software_version} =   Get Device Software Version
         Should Be True   '${device_software_version}' == '${sw_version}'
    END

Verify Device Resync Status
    [Documentation]  Verify Device Resync
    Dashboard Device InService Status
    Resync Device
    BuiltIn.Sleep  10s
    Open Device Dashboard
    Verify Notificaton Status   Resync on Device   success
    Verify PNP Workflow Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Device Resync All Status
    [Documentation]  Verify Device Resync All
    Dashboard Device InService Status
    Resync All Device
    BuiltIn.Sleep  10s
    Open Device Dashboard
    Verify Notificaton Status   Resync All on Device   success
    Verify PNP Workflow Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Firmware Upgrade Status
    [Documentation]  Verify Firmware Upgrade Operation
    Dashboard Device InService Status
    Firmware Upgrade
    BuiltIn.Sleep  10s
    Verify Notificaton Status   Firmware Upgrade on Device   initiated
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Supported Radio Type
    [Documentation]  Verify Supported Radio Type
    [Arguments]  ${pr_type}
    Dashboard Device InService Status
    #Set Slamd RU VC   ${pr_type}
    Verify Supported Radio Type In Dashboard   ${pr_type}
    Verify Operational RP Params  ${pr_type}

Verify Periodic Device Test with ddlg
    [Documentation]  Enable Periodic
    Dashboard Device InService Status
    Create delta to check periodic flow
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Close All Browsers
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    #${old_inform_type}=  Update Slamd Job Status  PERIODIC
    ${old_inform_type}=  Update ddlg Job Status  PERIODIC
    Device console Login
    Verify PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Periodic
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Close All Browsers
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    #Update Slamd Job Status  ${old_inform_type}
    Update ddlg Job Status    ${old_inform_type}

Verify Radio Point Addition
    [Documentation]  Verify Radio Point Addition
    Dashboard Device InService Status
    ${sector_params}=   Get SLAMD Sector WhiteList
    Update WhiteList RPs  ${sector_params}
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Open Device Dashboard
    Replan Device
    BuiltIn.Sleep  10s
    Verify Notificaton Status   Replan on Device   success
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Verify PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Dashboard Device InService Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Radio Point Deletion
    [Documentation]  Verify Radio Point Deletion
    Dashboard Device InService Status
    Delete WhiteList RPs
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Dashboard Device InService Status
    Create delta to check periodic flow
    Open Device Dashboard
    Replan Device
    BuiltIn.Sleep  15s
    Verify Notificaton Status   Replan on Device   success
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Verify PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Dashboard Device InService Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}


Test Dashboard Keywords
    [Documentation]  Test Dash
    #[Arguments]  ${device_macid}
    ${sector_params}=   Get SLAMD Sector WhiteList
    Update WhiteList RPs  ${sector_params}
    #Delete WhiteList RPs

Verify DashboardPage BC components
    [Documentation]  Verify DashboardPage BC components
    Log    Check DashboardPage BC components
    [Arguments]  ${device_productclass}    ${device_serialno}
    BC DashboardPage component Header
    BC DashboardPage component Summary    ${device_productclass}    ${device_serialno}
    BC DashboardPage component Summary Details
    BC DashboardPage component Device Details    ${device_serialno}
    BC DashboardPage component Timing Source In Use
    BC DashboardPage component RP Status Count
    BC DashboardPage component Provisioning Details
    BC DashboardPage component Sector Details and In Use Parameters
    BC DashboardPage component Device History
    BC DashboardPage component Device PnP Status
    BC DashboardPage component Map


Verify BOOTSTRAP Downgrade Software Version using ddlg
    [Documentation]  Verify Software Upgrade

    FOR  ${sw_version}  IN   @{SOFTWARE_VERSIONS_DOWNGRADE}
         Log  Software version ${sw_version}
         ${old_data_time} =   Get PNP Workflow Finished Data And Time For
         Close Browser
         Create And Update Software Version ddlg  ${DEVICE_MACID}  ${sw_version}
         Device console Login
         Verify PNP Workflow Status
         ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Bootstrap
         Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
         ${device_software_version} =   Get Device Software Version
         Should Be True   '${device_software_version}' == '${sw_version}'
    END


Verify Server Time
    ${DeviceConsole_server_time}=    get server time
    Log   ${DeviceConsole_server_time}
    DMS Network Console UI Login
    ${NetworkConsole_server_time}=    get server time
    Log    ${NetworkConsole_server_time}
    should match     ${DeviceConsole_server_time}    ${NetworkConsole_server_time}
