*** Settings ***
Library             String
Variables           robot\resources\dashboard\page\device_dashboard_ui_controls.py
Variables           alarm_ui_controls.py
Variables           ../testdata/alarm_testdata.py

*** Variables ***

*** Keywords ***
Open Device Console gNB Alarm Page
    [Documentation]  Open gNB Device Alarm Page
    [Arguments]  ${DEVICE_ALARM_URL}
    ${alarm_param_url}=  Format String   ${ALARM_PARAMETER_CU}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${alarm_param_url}
    # ${js_output}=  Execute JavaScript  return document.readyState
    # Run Keyword Unless  '${js_output}'=='complete'  Go To  ${device_history_url}
    Wait Until Element Is Visible  ${ID_GNB_ALARM_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_GNB_ALARM_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Log  Device Alarm Page Opened

Search Alarm in Alarm Page
    [Documentation]  Verify Search Alarm param details in Device Alarm Page
    [Arguments]     ${section}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_EVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_EVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_EVENTTYPE_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ALARM_APPLY_BUTTON}
    BuiltIn.Sleep  5s

Verify DU Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CRITICAL
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    F1Connectionisdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_ALARM_SPECIFIC_PROBLEM}
    Log    ${value2}
    Should Be Equal  ${value2}    F1 Connection is down to CU-CP
    BuiltIn.Sleep   2s

Verify RPTxOff Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    Radio Point Tx is OFF
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_ALARM_SPECIFIC_PROBLEM}
    Log    ${value2}
    Should Be Equal  ${value2}    Radio Point:0005B9514245 in DU:drop2-3031du1_cellindex_1 is DOWN
    BuiltIn.Sleep   2s

Verify RPTxOff Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_NW_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    Radio Point Tx is OFF
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_NW_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    Radio Point:0005B9514245 in DU:drop2-3031du1_cellindex_1 is DOWN
    BuiltIn.Sleep   2s

Navigate to gNB All Alarm
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ALL_ALARM}
    BuiltIn.Sleep  7s

Search RPTxOff Alarm in All Alarm Page
    [Documentation]  Verify DU Alarm param details in Device Alarm Page
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ALL_SPECIFIC_PROBLEM_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_ALL_SPECIFIC_PROBLEM_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_ALL_SPECIFIC_PROBLEM_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ALARM_APPLY_BUTTON}
    BuiltIn.Sleep  5s

Search Alarm in All Alarm Page
    [Documentation]  Verify DU Alarm param details in Device Alarm Page
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ALL_EVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_ALL_EVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_ALL_EVENTTYPE_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ALARM_APPLY_BUTTON}
    BuiltIn.Sleep  5s
Verify DU Clear Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s
Verify RPTxOff Clear DU Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_GET_ALARM_DETAILS}
    Log    ${value}
    #${value}=     get value    ${XPATH_GET_ALARM_DETAILS}
    Should Be Equal     ${value}    No alarms found
    BuiltIn.Sleep   2s

Search RPTxOff Alarm in Network gNB Device Alarm Page
    [Documentation]  Verify Alarm param details in Network Device Alarm Page
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_NW_SPECIFIC_PROBLEM_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_NW_SPECIFIC_PROBLEM_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_NW_SPECIFIC_PROBLEM_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_NWALARM_APPLY_BUTTON}
    BuiltIn.Sleep  5s


Search Alarm in Network Device Alarm Page
    [Documentation]  Verify Alarm param details in Network Device Alarm Page
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_NWEVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_NWEVENTTYPE_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_NWEVENTTYPE_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_NWALARM_APPLY_BUTTON}
    BuiltIn.Sleep  5s
Verify DU Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CRITICAL
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_NW_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    F1Connectionisdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_NW_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    F1 Connection is down to CU-CP
    BuiltIn.Sleep   2s

Verify RPTxOff Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_GET_ALARM_DETAILS}
    Log    ${value}
    Should Be Equal  ${value}    No alarms found
Verify DU Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s
Verify CUCP Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    X2CCommunication
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    X2C Communication is down to CU-CP
    BuiltIn.Sleep   2s
Verify CUCP Clear Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify CUCP Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_NW_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    X2CCommunication
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_NW_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    X2C Communication is down to CU-CP
    BuiltIn.Sleep   2s

Verify CUCP Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify CUUP Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    X2connectionisdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    X2 connection is down to MeNB :2005:1:0:200::7c
    BuiltIn.Sleep   2s
Verify CUUP Clear Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify CUUP Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_NW_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    X2connectionisdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_NW_ALARM_SPECIFIC_PROBLEM}
    Log    ${value1}
    Should Be Equal  ${value2}    X2 connection is down to MeNB :2005:1:0:200::7c
    BuiltIn.Sleep   2s

Verify CUUP Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify RP Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    NetworkissueorDUdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_ALARM_SPECIFIC_PROBLEM}
    Log    ${value2}
    Should Be Equal  ${value2}    Network issue or DU down
    BuiltIn.Sleep   2s
Verify RP Clear Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify RP Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    MAJOR
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_NW_ALARM_PROBABLE_CAUSE}
    Log    ${value1}
    Should Be Equal  ${value1}    NetworkissueorDUdown
    BuiltIn.Sleep   2s
    ${value2}=     get text    ${XPATH_NW_ALARM_SPECIFIC_PROBLEM}
    Log    ${value2}
    Should Be Equal  ${value2}    Network issue or DU down
    BuiltIn.Sleep   2s

Verify RP Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    CLEAR
    BuiltIn.Sleep   2s

Verify CUCP gNBid gNBName vnfid in Alarm details
    #[arguments]    ${gNBid}    ${vnfid}    ${gNBName}
    Click DMS Element  ${XPATH_ALARM_SETTINGS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_ADDITIONAL_INFO}
    BuiltIn.Sleep  4s
    ${value}        Get Text     ${XPATH_ALARM_TABLE}
    Log             ${value}
    Should Contain    ${value}    ${CUCP_gNBid}
    Should Contain    ${value}    ${CUCP_Alarm_vnfid}
    Should Contain    ${value}    ${CUCP_gNBName}
    BuiltIn.sleep    4s


Verify CUUP gNBid gNBName vnfid in Alarm details
    #[arguments]    ${gNBid}    ${vnfid}    ${gNBName}
    Click DMS Element  ${XPATH_ALARM_SETTINGS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_ADDITIONAL_INFO}
    BuiltIn.Sleep  4s
    ${value}        Get Text     ${XPATH_ALARM_TABLE}
    Log             ${value}
    Should Contain    ${value}    ${CUUP_gNBid}
    Should Contain    ${value}    ${CUUP_Alarm_VNFID}
    Should Contain    ${value}    ${CUUP_gNBName}
    BuiltIn.sleep    4s


Verify DU gNBid gNBName vnfid in Alarm details
    #[arguments]    ${DU_gNBid}    ${DU_vnfid}    ${DU_gNBName}
    Click DMS Element  ${XPATH_ALARM_SETTINGS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_ADDITIONAL_INFO}
    BuiltIn.Sleep  4s
    ${value}        Get Text     ${XPATH_ALARM_TABLE}
    Log             ${value}
    Should Contain    ${value}    ${DU_gNBid}
    Should Contain    ${value}    ${DU_Alarm_VNFID}
    Should Contain    ${value}    ${DU_gNBName}
    BuiltIn.sleep    4s


Perform Sync Alarm Operation
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_SYNC_ALARM}
    BuiltIn.Sleep  30s
Verify New Sync Alarm in Alarm page
    [Arguments]     ${section}
    ${value}=     get text    ${XPATH_SYNC_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${section}
    BuiltIn.Sleep   2s

Verify Clear Sync Alarm in Alarm page
    [Arguments]     ${section}
    ${value}=     get text    ${XPATH_SYNC_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${section}
    BuiltIn.Sleep   2s

Verify New Sync Alarm in Network Alarm page
    [Arguments]     ${section}
    ${value}=     get text    ${XPATH_NW_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${section}
    BuiltIn.Sleep   2s

Verify Clear Sync Alarm in Network Alarm page
    [Arguments]     ${section}
    ${value}=     get text    ${XPATH_CLEAR_ALARM_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${section}
    BuiltIn.Sleep   2s

Verify Sync Alarm details in history
    [Arguments]     ${response_severity}
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_SYNC_ALARM_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_SYNC_ALARM_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     Sync Alarms Response
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SYNC_ALARM_ROW}
    BuiltIn.Sleep  10s
    ${value}=     get text    ${XPATH_RESPONSE_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${response_severity}
    BuiltIn.Sleep  5s
        #Click DMS Element ${XPATH_HISTORY_DETAIL_CLOSE}
        #BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Verify DU Sync Alarm details in history
    [Arguments]     ${response_severity}
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_SYNC_ALARM_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_SYNC_ALARM_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     Sync Alarms Response
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SYNC_ALARM_ROW}
    BuiltIn.Sleep  10s
    ${value}=     get text    ${XPATH_DU_RESPONSE_SEVERITY}
    Log    ${value}
    Should Be Equal  ${value}    ${response_severity}
    BuiltIn.Sleep  5s
        #Click DMS Element ${XPATH_HISTORY_DETAIL_CLOSE}
        #BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s



Verify operation details in Notification
    [Arguments]     ${notification_search}
    BuiltIn.Sleep  2s
    Click DMS Element    ${ID_NOTIFICATION_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${ID_ALL_NOTIFICATION_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${ID_NOTIFICATION_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_NOTIFICATION_SEARCH}   ${notification_search}
    BuiltIn.Sleep  2s
    Click DMS Element    ${ID_NOTIFICATION_SEARCH_BUTTON}
    BuiltIn.Sleep  2s
    ${value}=     get text    ${XPATH_SYNC_NOTIFICATION}
    Log    ${value}
    #should contain  ${Value}     ${Sync_Status}
    BuiltIn.Sleep  2s
    ${value1}=     get text    ${XPATH_ACTION_NOTIFICATION}
    Log    ${value1}
    should contain  ${Value1}     ${action_Status}
    BuiltIn.Sleep  2s




computation failure PnP status

    Click DMS Element  ${XPATH_ENABLE_PAGE}
    BuiltIn.Sleep   8s
    Click DMS Element  ${XPATH_PNP_MINMANDATORY}
    BuiltIn.Sleep   4s
    ${value}=     get text    ${XPATH_FAILURE}
    Log    ${value}
    Should Be Equal  ${value}    ${Failure_Reason}
    BuiltIn.Sleep   4s

computation failure PnP status UP
    Click DMS Element  ${XPATH_ENABLE_PAGE}
    BuiltIn.Sleep   8s
    Click DMS Element  ${XPATH_PNP_MINMANDATORY}
    BuiltIn.Sleep   3s
    ${value}=     get text    ${XPATH_FAILURE}
    Log    ${value}
    Should Be Equal  ${value}    ${Failure_Reason_UP}
    BuiltIn.Sleep   4s

computation failure PnP status DU

    Click DMS Element  ${XPATH_ENABLE_PAGE}
    BuiltIn.Sleep   8s
    Click DMS Element  ${XPATH_PNP_MINMANDATORY}
    BuiltIn.Sleep   3s
    ${value}=     get text    ${XPATH_FAILURE}
    Log    ${value}
    Should Be Equal  ${value}    ${Failure_Reason_DU}
    BuiltIn.Sleep   4s

computation failure alarm verification
    [arguments]    ${vnf}
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_INPUT_PROBABLE}  ${Probable_cause}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_SPECIFIC_PROBLEM}  ${vnf}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_GEAR_ICON}
    #BuiltIn.Sleep  4s
    #Click DMS Element  ${XPATH_ADDITIONAL_TEXT}
    Scroll Element Into View  ${XPATH_DETAILS}
    BuiltIn.Sleep  3s
    Press Keys    ${XPATH_DETAILS}  ENTER
    #Click DMS Element  ${XPATH_DETAILS}
    BuiltIn.Sleep  4s
    ${value}        Get Text     ${XPATH_EVENT_TYPE}
    Log             ${value}
    Should Contain    ${value}    ${Event_Type}
    #${value1}        Get Text     ${XPATH_SOURCE}
    #Log             ${value1}
    #Should Contain    ${value1}    ${Source}
    ${value2}        Get Text     ${XPATH_PROBABLE_CAUSE}
    Log             ${value2}
    Should Contain    ${value2}    ${Probable_cause}
    BuiltIn.Sleep  4s
    ${value3}       Get Text    ${XPATH_OCCURENCE}
    Log             ${value3}
    Should Contain Any    ${value3}    ${OCCURENCE}     ${OCCURENCE_REASON}
    #BuiltIn.sleep    4s