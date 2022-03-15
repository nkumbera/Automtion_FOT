*** Settings ***
Library             DateTime
Resource            page/dashboard_page_helper.robot
Resource            device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
Resource            ../pnp/pnp_keywords.robot
Resource            ../operational_rp_params/rp_params_keywords.robot


*** Variables ***


*** Keywords ***
Verify gNB Dashboard Navigation
    [Documentation]  Verify Dashboard Navigation
    Dashboard gNB Device Summary Status

Verify gNB Device Connect Status
    [Documentation]  Verify Connect Device
    #Dashboard Device InService Status
    #${last_data_time_staring}=   Get DMS Element Text  ${ID_DASHBOARD_LAST_CONTACT_TIME}
    #${last_date_time}=  Convert Date  ${last_data_time_staring}
    #Log   ${last_date_time}
    #BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_GNB_DASHBOARD_CONNECT_DEVICE}
    BuiltIn.Sleep  10s
    Open gNB Device Dashboard
    BuiltIn.Sleep  5s
	
    #Verify Notificaton Status  Connect on Device  success
    #BuiltIn.Sleep  5s
    #${latest_data_time_staring} =  Get DMS Element Text  ${ID_DASHBOARD_LAST_CONTACT_TIME}
    #BuiltIn.Sleep  5s
    #${latest_date_time}=  Convert Date  ${latest_data_time_staring}
    #BuiltIn.Sleep  5s
    #${diff_time}=   Subtract Date From Date  ${latest_date_time}  ${last_date_time}
    #BuiltIn.Sleep  5s
    #Log  Time Taken to Connect in Sec-MiliSec ${diff_time}
    #BuiltIn.Sleep  5s
    #Should Not Be Equal  ${latest_date_time}   ${last_date_time}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify gNB Device Reboot Status
    [Documentation]  Verify Reboot Device
    ${old_data_time} =   Get gNB PNP Workflow Finished Data And Time For
    #Dashboard Device InService Status
    Reboot gNB Device
    BuiltIn.Sleep  100s
    Verify Notificaton Status  Reboot on Device   success
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get gNB PNP Workflow Finished Data And Time For  Reboot
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify gNB Device Reset Status
    [Documentation]  Verify Reset Device
    ${old_data_time} =   Get gNB PNP Workflow Finished Data And Time For
    #Dashboard Device InService Status
    Reset gNB Device
    BuiltIn.Sleep  20s
    Verify Notificaton Status  Reset on Device   success
    BuiltIn.Sleep  40s
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get gNB PNP Workflow Finished Data And Time For    Factory
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify gNB Device Replan Status
    [Documentation]  Verify Device Replan
    [Arguments]    ${DMS_URL}
    ${old_data_time} =   Get gNB PNP Workflow Finished Data And Time For
    #Dashboard Device InService Status
    Open gNB Overridden Params Page    ${DMS_URL}
    #Search gNB DMS Overriden Parameter   Profile
    Set gNB Name Value
    Replan gNB Device
    BuiltIn.Sleep  10s
    Verify Notificaton Status   Replan on Device   success
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get gNB PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify BOOTSTRAP All Software Version
    [Documentation]  Verify Software Upgrade

    FOR  ${sw_version}  IN   @{SOFTWARE_VERSIONS}
         Log  Software version ${sw_version}
         ${old_data_time} =   Get PNP Workflow Finished Data And Time For
         Close Browser
         Create And Update Software Version  ${DEVICE_MACID}  ${sw_version}
         Device console Login
         Verify gNB PNP Workflow Status
         ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Bootstrap
         Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
         ${device_software_version} =   Get Device Software Version
         Should Be True   '${device_software_version}' == '${sw_version}'
    END

Verify gNB Device Resync Status
    [Documentation]  Verify Device Resync
    #Dashboard Device InService Status
    Resync gNB Device
    BuiltIn.Sleep  10s
    Open gNB Device Dashboard
    Verify Notificaton Status   Resync on Device   success
    Verify gNB PNP Workflow Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify gNB Device Resync All Status
    [Documentation]  Verify Device Resync All
    #Dashboard Device InService Status
    Resync gNB All Device
    BuiltIn.Sleep  10s
    Open gNB Device Dashboard
    Verify Notificaton Status   Resync All on Device   success
    Verify gNB PNP Workflow Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Firmware Upgrade Status
    [Documentation]  Verify Firmware Upgrade Operation
    Dashboard gNB Device InService Status
    Firmware Upgrade
    BuiltIn.Sleep  10s
    Verify Notificaton Status   Firmware Upgrade on Device   initiated
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify Supported Radio Type
    [Documentation]  Verify Supported Radio Type
    [Arguments]  ${pr_type}
    Dashboard gNB Device InService Status
    #Set Slamd RU VC   ${pr_type}
    Verify Supported Radio Type In Dashboard   ${pr_type}
    Verify Operational RP Params  ${pr_type}

Verify Periodic Device Test
    [Documentation]  Enable Periodic
    #Dashboard Device InService Status
    Create delta to check periodic flow
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Close All Browsers
    Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Maximize Browser Window
    ${old_inform_type}=  Update Slamd Job Status  PERIODIC
    Device console Login
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Periodic
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Close All Browsers
    Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Maximize Browser Window
    Update Slamd Job Status  ${old_inform_type}

Verify Radio Point Addition
    [Documentation]  Verify Radio Point Addition
    Dashboard gNB Device InService Status
    ${sector_params}=   Get SLAMD Sector WhiteList
    Update WhiteList RPs  ${sector_params}
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Open gNB Device Dashboard
    Replan gNB Device
    BuiltIn.Sleep  2s
    Verify Notificaton Status   Replan on Device   success
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Dashboard Device InService Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}

Verify gNB Radio Point Addition
    [Documentation]  Verify gNB Radio Point Addition
    BuiltIn.Sleep  5s
    Update gNB WhiteList RPs  0005B9234534

Verify Radio Point Deletion
    [Documentation]  Verify Radio Point Deletion
    Dashboard Device InService Status
    Delete WhiteList RPs
    ${old_data_time} =   Get PNP Workflow Finished Data And Time For
    Dashboard gNB Device InService Status
    Create delta to check periodic flow
    Open gNB Device Dashboard
    Replan gNB Device
    BuiltIn.Sleep  2s
    Verify Notificaton Status   Replan on Device   success
    Verify gNB PNP Workflow Status
    ${new_data_time} =   Get PNP Workflow Finished Data And Time For  Replan
    Run Keyword If  '${old_data_time}' != 'None'   Get Diff Time Stamp  ${old_data_time}  ${new_data_time}
    Dashboard gNB Device InService Status
    Click DMS Element  ${XPATH_DASHBOARD_DASHBOARD}


Test Dashboard Keywords
    [Documentation]  Test Dash
    #[Arguments]  ${device_macid}
    ${sector_params}=   Get SLAMD Sector WhiteList
    Update WhiteList RPs  ${sector_params}
    #Delete WhiteList RPs
	
Verify gNB connect status
	[Documentation]  Verify the connect status on dashboard
	[Arguments]  ${Status}
	Verify the status of netconf connection    ${Status}   

Verify gNB LastDisconnectTime
    [Documentation]  Verify the last disconnect status on dashboard
    [Arguments]  ${Lasttime}
   ${disconnecttime}   get text    ${ID_DASHBOARD_LAST_SES_DISCONNECT_TIME}
    should contain  ${disconnecttime}   ${Lasttime}


Verify DashboardPage CUCP components
    [Documentation]  Verify DashboardPage CUCP components
    Log    Check DashboardPage CUCP components
    [Arguments]  ${device_productclass}    ${device_serialno}
    DashboardPage component Header
    DashboardPage component Summary    ${device_productclass}    ${device_serialno}
    #DashboardPage component Summary Details    ${XPATH_DC_gNBIdCA_Title_Label}    ${XPATH_DC_gNBId_Value_Label}
    DashboardPage component Summary Details
    DashboardPage component gNB Details CUCP
    DashboardPage component netconf session
    DashboardPage component ves heartbeat
    DashboardPage component toplogy    Central Unit User Plane    Distributed Unit
    DashboardPage component details
    DashboardPage component x2 connection
    DashboardPage component history
    DashboardPage component pnp status

Verify DashboardPage CUUP components
    [Documentation]  Verify DashboardPage CUUP components
    Log    Check DashboardPage CUUP components
    [Arguments]  ${device_productclass}    ${device_serialno}
    DashboardPage component Header
    DashboardPage component Summary    ${device_productclass}    ${device_serialno}
    #DashboardPage component Summary Details    ${XPATH_DC_CUUP_gNBIdCA_Title_Label}    ${XPATH_DC_CUUP_gNBId_Value_Label}
    DashboardPage component Summary Details
    DashboardPage component gNB Details CUUP
    DashboardPage component netconf session
    DashboardPage component ves heartbeat
    DashboardPage component toplogy    Central Unit Control Plane    Distributed Unit
    DashboardPage component details
    DashboardPage component e1 connection
    DashboardPage component history
    DashboardPage component pnp status

Verify DashboardPage DU components
    [Documentation]  Verify DashboardPage DU components
    Log    Check DashboardPage DU components
    [Arguments]  ${device_productclass}    ${device_serialno}
    DashboardPage component Header
    DashboardPage component Summary    ${device_productclass}    ${device_serialno}
    #DashboardPage component Summary Details    ${XPATH_DC_gNBIdCA_Title_Label}    ${XPATH_DC_gNBId_Value_Label}
    DashboardPage component Summary Details
    DashboardPage component gNB Details DU
    DashboardPage component netconf session
    DashboardPage component ves heartbeat
    DashboardPage component toplogy DU    Central Unit Control Plane    Central Unit User Plane
    DashboardPage component details
    DashboardPage component cell details and inuse parameters
    DashboardPage component du configuration
    DashboardPage component provisioned cell configuration
    DashboardPage component history
    DashboardPage component pnp status

Verify Dashboard gNB Device InService Status
    [Documentation]  Verify the Dashboard gNB Device InService Status
    Dashboard gNB Device InService Status

Verify Dashboard DU gNB Device InService Status
    [Documentation]  Verify the Dashboard gNB Device InService Status
    Dashboard DU gNB Device InService Status

Verify DashboardPage Service State
    [Documentation]  Verify DashboardPage CUCP Service State
    Log    Check DashboardPage CUCP Service State
    [Arguments]  ${device_productclass}    ${device_serialno}  ${device_servicestate}
    DashboardPage component Service State  ${device_productclass}  ${device_serialno}  ${device_servicestate}

