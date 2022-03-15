*** Settings ***
Library             String
Library             DateTime
Variables           heartbeat_ui_controls.py
Resource            robot/resources/notification/notification_helper.robot
Resource            robot/resources/common/ui_common.robot
Resource            robot/resources/pnp/pnp_keywords.robot
Resource            robot/resources/dashboard/page/dashboard_page_helper.robot
Resource            robot/resources/dashboard/device_operation.robot
Resource            robot/resources/pnp/page/pnp_page_helper.robot


*** Variables ***

*** Keywords ***
Dashboard HeartBeat Trigger CU_CP and DU
    [Documentation]  Trigger HeartBeat from Device Dashboard
    BuiltIn.Sleep  20s
    ${last_data_time_staring}=   Get DMS Element Text  ${ID_DASHBOARD_LAST_RECEVIED_TIME}
    ${last_date_time}=  Convert Date  ${last_data_time_staring}
    Log   ${last_date_time}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DASHBOARD_TRIGGER_HEARTBEAT}
    BuiltIn.Sleep  15s
    #Verify Notificaton Status  Heartbeat on Device   success
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_AUTO_REFRESH_DASHBOARD}
    BuiltIn.Sleep  20s
    Click DMS Element  ${XPATH_AUTO_REFRESH_DASHBOARD}
    BuiltIn.Sleep  10s
    ${latest_data_time_staring} =  Get DMS Element Text  ${ID_DASHBOARD_LAST_RECEVIED_TIME}
    BuiltIn.Sleep  5s
    ${latest_date_time}=  Convert Date  ${latest_data_time_staring}
    BuiltIn.Sleep  5s
    ${diff_time}=   Subtract Date From Date  ${latest_date_time}  ${last_date_time}
    BuiltIn.Sleep  5s
    Log  Time Taken to Connect in Sec-MiliSec ${diff_time}
    BuiltIn.Sleep  5s
    Should Not Be Equal  ${latest_date_time}   ${last_date_time}
    BuiltIn.Sleep  5s

Dashboard HeartBeat Trigger CU_UP
    [Documentation]  Trigger HeartBeat from Device Dashboard CU_UP
    BuiltIn.Sleep  20s
    ${last_data_time_staring}=   Get DMS Element Text  ${ID_DASHBOARD_LAST_RECEVIED_TIME}
    ${last_date_time}=  Convert Date  ${last_data_time_staring}
    Log   ${last_date_time}
    BuiltIn.Sleep  10s
    Click DMS Element  ${ID_DASHBOARD_TRIGGER_HEARTBEAT_CU_UP}
    #Click DMS Element  ${ID_DASHBOARD_TRIGGER_HEARTBEAT}
    BuiltIn.Sleep  15s
    #Verify Notificaton Status  Heartbeat on Device   success
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_AUTO_REFRESH_DASHBOARD}
    BuiltIn.Sleep  20s
    Click DMS Element  ${XPATH_AUTO_REFRESH_DASHBOARD}
    BuiltIn.Sleep  10s
    ${latest_data_time_staring} =  Get DMS Element Text  ${ID_DASHBOARD_LAST_RECEVIED_TIME}
    BuiltIn.Sleep  5s
    ${latest_date_time}=  Convert Date  ${latest_data_time_staring}
    BuiltIn.Sleep  5s
    ${diff_time}=   Subtract Date From Date  ${latest_data_time_staring}  ${last_date_time}
    BuiltIn.Sleep  5s
    Log  Time Taken to Connect in Sec-MiliSec ${diff_time}
    BuiltIn.Sleep  5s
    Should Not Be Equal  ${latest_date_time}   ${last_date_time}
    BuiltIn.Sleep  5s





Verifying HB details
    [Documentation]  Verifying HB details for VNF
    BuiltIn.Sleep  5s
    ${verification_Last_HB_ReceivedTime} =  Get DMS Element Text  ${XPATH_Last_HB_ReceivedTime}
    Set Global Variable      ${verification_Last_HB_ReceivedTime}
    ${verification_HB_Interval_Minutes} =  Get DMS Element Text  ${XPATH_HB_Interval_Minutes}
    Set Global Variable      ${verification_HB_Interval_Minutes}
    ${verification_HB_Missing_Count} =  Get DMS Element Text  ${XPATH_HB_Missing_Count}
    Set Global Variable      ${verification_HB_Missing_Count}
    #Stop DDLG VES HB job here
    #BuiltIn.Sleep  10s
    #Start DDLG VES HB job here
    #BuiltIn.Sleep  ${verification_HB_Interval_Minutes}m
    BuiltIn.Sleep  52s

Get current HB details
    [Documentation]  Verifying current HB details for VNF
    Reload Page
    BuiltIn.Sleep  5s
    ${verification_New_Last_HB_ReceivedTime} =  Get DMS Element Text  ${XPATH_Last_HB_ReceivedTime}
    Set Global Variable      ${verification_New_Last_HB_ReceivedTime}
    ${verification_New_HB_Interval_Minutes} =  Get DMS Element Text  ${XPATH_HB_Interval_Minutes}
    Set Global Variable      ${verification_New_HB_Interval_Minutes}
    ${verification_New_HB_Missing_Count} =  Get DMS Element Text  ${XPATH_HB_Missing_Count}
    Set Global Variable      ${verification_New_HB_Missing_Count}

Compare current HB details with earlier HB details
    [Documentation]  Comparing current HB details with earlier HB details for VNF
    Get Diff Time Stamp    ${verification_Last_HB_ReceivedTime}    ${verification_New_Last_HB_ReceivedTime}
    ${verification_Last_HB_ReceivedTime} =    set variable    ${verification_Last_HB_ReceivedTime}
    ${verification_HB_Interval_Minutes} =    set variable    ${verification_HB_Interval_Minutes}
    ${reference_Last_HB_ReceivedTime} =    set variable    ${verification_Last_HB_ReceivedTime}
    ${verification_Last_HB_ReceivedTime} =    Convert Date    ${verification_Last_HB_ReceivedTime}  date_format=%Y-%m-%d %H:%M:%S.%f UTC  result_format=%Y-%m-%d %H:%M exclude_millis=False
    #${reference_Last_HB_ReceivedTime} =    Evaluate    ${verification_Last_HB_ReceivedTime}+${verification_HB_Interval_Minutes}
    #${reference_Last_HB_ReceivedTime} =  Evaluate int(${verification_Last_HB_ReceivedTime}) +  int(${verification_HB_Interval_Minutes})
    ${reference_Last_HB_ReceivedTime} =    Convert Date    ${reference_Last_HB_ReceivedTime}  date_format=%Y-%m-%d %H:%M:%S.%f UTC  result_format=%Y-%m-%d %H:%M exclude_millis=False
    #${reference_Last_HB_ReceivedTime} =  Add Time To Date    ${verification_Last_HB_ReceivedTime}    ${verification_HB_Interval_Minutes} minutes  date_format=%Y-%m-%d %H:%M  result_format=%Y-%m-%d %H:%M
    ${reference_Last_HB_ReceivedTime} =  Add Time To Date    ${verification_Last_HB_ReceivedTime}    ${verification_HB_Interval_Minutes} minutes
    ${reference_Last_HB_ReceivedTime} =    Convert Date    ${reference_Last_HB_ReceivedTime}  date_format=%Y-%m-%d %H:%M:%S.%f  result_format=%Y-%m-%d %H:%M exclude_millis=False
    ${verification_New_Last_HB_ReceivedTime} =    Convert Date    ${verification_New_Last_HB_ReceivedTime}  date_format=%Y-%m-%d %H:%M:%S.%f UTC  result_format=%Y-%m-%d %H:%M exclude_millis=False
    #${verification_New_Last_HB_ReceivedTime} =    Convert Date    ${verification_New_Last_HB_ReceivedTime}  date_format=%Y-%m-%d %H:%M:%S.%f UTC  result_format=%Y-%m-%d %H:%M exclude_millis=False
    Should Be Equal As Strings  ${reference_Last_HB_ReceivedTime}  ${verification_New_Last_HB_ReceivedTime}
    Should Be Equal As Strings  ${verification_HB_Missing_Count}  ${verification_New_HB_Missing_Count}