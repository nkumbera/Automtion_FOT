*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_alarm_dc_ui_controls.py

*** Variables ***
${value_to_set}


*** Keywords ***
Open Device Console Alarm Page
    [Documentation]
    Device console Login
    BuiltIn.Sleep  5s
    Login with Device ID  ${DEVICE_ALARM_MACID}
    BuiltIn.Sleep  5s
    set suite variable  ${DEVICE_ALARM_MACID}  ${DEVICE_ALARM_MACID}
    ${open_page}=  Format String   ${DEVICE_CONSOLE_ALARM_PAGE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_ALARM_MACID}
    Go To   ${open_page}
    BuiltIn.Sleep  10s

Open Device Console Alarm Page for Delete
    [Documentation]
    Device console Login
    BuiltIn.Sleep  5s
    Login with Device ID  ${DEVICE_ALARM_Delete_MACID}
    BuiltIn.Sleep  5s
    set suite variable  ${DEVICE_ALARM_Delete_MACID}  ${DEVICE_ALARM_Delete_MACID}
    ${open_page}=  Format String   ${DEVICE_CONSOLE_ALARM_PAGE_URL_Delete}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_ALARM_Delete_MACID}
    Go To   ${open_page}
    BuiltIn.Sleep  10s

Input Column Text_Proable_Cause
    [Documentation]  input proable cause
    Input Text    ${Device_Console_Alarm_Proable_Cause}  S1 connection
    BuiltIn.Sleep  5s

Input Column Text_Source1
    [Documentation]  input source1
    Input Text    ${Device_Console_Alarm_Source}  0005B9A503
    BuiltIn.Sleep  5s


Input Column Text_Source2
    [Documentation]  input source2
    Input Text    ${Device_Console_Alarm_Source}  0005B9A504
    BuiltIn.Sleep  5s


Apply Filter on Columns
    [Documentation]  click apply
    Click DMS Element  ${Apply_filter_alarm}
    BuiltIn.Sleep  5s


Header Checkbox Click
    [Documentation]  header checkbox
    Click DMS Element  ${Header_Checkbox}
    BuiltIn.Sleep  5s


Device Alarm Comment Button Click
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Comment}
    BuiltIn.Sleep  5s


Device Alarm Comment Content
    [Documentation]  comment content
    Input Text    ${Device_Console_Alarm_Comment_Content}  S1 Connection Alarm Noticed
    BuiltIn.Sleep  5s


Device Alarm Comment Confirm
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Comment_Confirm}
    BuiltIn.Sleep  5s

Device Alarm Acknowledgement Button Click
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Ackno}
    BuiltIn.Sleep  5s


Device Alarm Acknowledgement Content
    [Documentation]  comment content
    Input Text    ${Device_Console_Alarm_Ackno_Comment}  S1 Connection Alarm Noticed
    BuiltIn.Sleep  5s


Device Alarm Acknowledgement Confirm
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Ackno_Confirm}
    BuiltIn.Sleep  5s

Device Alarm UnAcknowledgement Button Click
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_UnAckno}
    BuiltIn.Sleep  5s


Device Alarm UnAcknowledgement Content
    [Documentation]  comment content
    Input Text    ${Device_Console_Alarm_UnAckno_Content}  S1 Connection Alarm Noticed
    BuiltIn.Sleep  5s


Device Alarm UnAcknowledgement Confirm
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_UnAckno_Confirm}
    BuiltIn.Sleep  5s


Device Alarm Clear Button Click
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Clear}
    BuiltIn.Sleep  5s


Device Alarm Clear Content
    [Documentation]  comment content
    Input Text    ${Device_Console_Alarm_Clear_Content}  S1 Connection Alarm Noticed
    BuiltIn.Sleep  5s


Device Alarm Clear Confirm
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Clear_Confirm}
    BuiltIn.Sleep  5s


Device Alarm Delete Button Click
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Delete}
    BuiltIn.Sleep  5s


Device Alarm Delete Confirm
    [Documentation]  comment button
    Click DMS Element  ${Device_Console_Alarm_Delete_Confirm}
    BuiltIn.Sleep  5s

#E2E Test Alarm

Open Device Console for Test Alarm
    [Documentation]
    Device console Login
    BuiltIn.Sleep  5s
    Login with Device ID  ${Test_Alarm_MACID}
    BuiltIn.Sleep  5s
    set suite variable  ${Test_Alarm_MACID}  ${Test_Alarm_MACID}
    ${open_page}=  Format String   ${DEVICE_CONSOLE_TEST_ALARM_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${Test_Alarm_MACID}
    Go To   ${open_page}
    BuiltIn.Sleep  10s
Test Alarm Button
    [Documentation]  Test Alarm Button
    Click DMS Element  ${Test_Alarm_Button}
    BuiltIn.Sleep  5s

Trigger Test Alarm Button
    [Documentation]  Test Alarm Button
    Click DMS Element  ${Trigger_Test_Alarm}
    BuiltIn.Sleep  30s

Clear Alarm Button
    [Documentation]
    Click DMS Element  ${Clear_Test_Alarm}
    BuiltIn.Sleep  5s



Dashborad element click
    Device console Login
    Login with Device ID  ${DEVICE13_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE13_MACID}
    Set Focus To Element    ${navigate_tab}
    Click DMS Element  ${XPATH_DASHBOARD_CONNECT_DEVICE}


Search BC Alarm in Alarm Page
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


Verify RPTxOff BC Alarm Param Details in Alarm page
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
    Should Be Equal  ${value2}    Radio Point: 0005B9519AA1 in BC: 0005B9423AB2_1 is DOWN
    BuiltIn.Sleep   2s

Verify RPTxOff BC Alarm Param Details in Network Device Alarm page
    BuiltIn.Sleep   2s
    Search RPTxOff Alarm in Network Device Alarm Page    Radio Point: 0005B9519AA1 in BC: 0005B9423AB2_1 is DOWN
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
    Should Be Equal  ${value2}    Radio Point: 0005B9519AA1 in BC: 0005B9423AB2_1 is DOWN
    BuiltIn.Sleep   2s

Open Device Console Alarm Pagec for RPTxOff
    [Documentation]
    [Arguments]    ${DEVICE_MACID}
    #Device console Login
    BuiltIn.Sleep  10s
    #Login with Device ID  ${DEVICE_MACID}
    #BuiltIn.Sleep  5s
    #set suite variable  ${DEVICE_ALARM_MACID}  ${DEVICE_ALARM_MACID}
    ${open_page}=  Format String   ${DEVICE_CONSOLE_ALARM_PAGE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    BuiltIn.Sleep  10s


Search BC Alarm in Network Device Alarm Page
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


Navigate to All Alarm
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

Verify RPTxOff Clear Alarm Param Details in Alarm page
    ${value}=     get text    ${XPATH_GET_ALARM_DETAILS}
    Log    ${value}
    #${value}=     get value    ${XPATH_GET_ALARM_DETAILS}
    Should Be Equal     ${value}    No alarms found
    BuiltIn.Sleep   2s

Search RPTxOff Alarm in Network Device Alarm Page
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

Verify BC Clear Alarm Param Details in Network Device Alarm page
    ${value}=     get text    ${XPATH_GET_ALARM_DETAILS}
    Log    ${value}
    Should Be Equal  ${value}    No alarms found