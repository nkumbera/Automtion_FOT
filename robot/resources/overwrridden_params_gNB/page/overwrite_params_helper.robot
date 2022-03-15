*** Settings ***
Resource            ../../common/ui_common.robot

Library             SeleniumLibrary
Library             Collections
Variables           overwrite_params_ui_controls.py
Resource           ../resources/device_history/device_history_page_keywords.robot

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${ENTITYMAPPING_FILE_LOCATION}
${last_est_time}

*** Keywords ***
Open gNB Provisioned Page
    [Documentation]  Open gNB Provisioned Data Page
    [Arguments]  ${PROVISION_PAGE_URL}
    ${open_page}=  Format String   ${DEVICE_PROVSIONED_DATA_CUCP}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_GNB_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_GNB_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s
    Log  Device History Page Opened


Open gNB Overridden Parameter Page
    [Documentation]  Open Overridden Paramas page
    Click DMS Element   ${XPATH_DMS_OVERRIDEN_MENU}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

Open gNB Overridden Page
    [Documentation]  Open gNB Overridden Page
    [Arguments]  ${OVERRIDDEN_PAGE_URL}
    ${open_page}=  Format String   ${OVERRIDDEN_PAGE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s


Search gNB Provision Parameter
    [Documentation]     Search DMS provisioned parameter
    [Arguments]     ${param}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    Maximize Browser Window
    BuiltIn.Sleep  7s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${param}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    #${collapse_expand_text}=  Get Text  ${XPATH_ORP_COLLAPSE_EXPAND_TEXT}
    #Run Keyword If  'Collapse All' in '''${collapse_expand_text}'''  Click DMS Element  ${ID_ORP_COLLAPSE_EXPAND_BUTTON}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_ExpandCollapse
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s

Save gNB Overriden Parameter
    [Documentation]  Save DMS overridden parameters
    #Click DMS Element  //html
    BuiltIn.Sleep   2s
    Set Focus To Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Press Keys  ${ID_ORP_PARAM_SAVE_BUTTON}  TAB
    #${Status}=     Run Keyword And Return Status    Element Should be Enabled    ${ID_ORP_PARAM_SAVE_BUTTON}
    #${class}=       Get Element Attribute  ${ID_ORP_PARAM_SAVE_BUTTON}  class
    #${bool}=  Run Keyword And Return Status  Should Contain  ${class}  disbaled
    #Run Keyword Unless  ${bool}  Click DMS Element  ${ID_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   5s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    #echo     ${condition}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    BuiltIn.Sleep   3s
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Wait Until Loading Icon Disappears


Click Notification Subscription
    Click DMS Element  ${ID_CUCP_Notification}
    BuiltIn.Sleep   3s
Verify CUCP Notification Subscription Value in PnP Status
    Scroll Element Into View  ${ID_CUCP_NOTIFICATION_PNP_STATUS}
    ${value}=     get text    ${ID_CUCP_NOTIFICATION_VALUE}
    Log    ${value}
    should contain      ${value}     x2c-state-info

Verify CUCP Notification Subscription Value in History
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RESULT_PANEL_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESULT_PANEL_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 10   set variable   100
    ...  ELSE  set variable  100
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Mandatory Notification Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_NOTIFICATION_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_COMP_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     x2c-state-info
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Verify CUUP Notification Subscription Value in PnP Status
    Scroll Element Into View  ${ID_CUCP_NOTIFICATION_PNP_STATUS}
    ${value}=     get text    ${ID_CUCP_NOTIFICATION_VALUE}
    Log    ${value}
    should contain      ${value}     e1-state-info

Verify CUUP Notification Subscription Value in History
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RESULT_PANEL_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESULT_PANEL_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 10   set variable   100
    ...  ELSE  set variable  100
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Mandatory Notification Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_NOTIFICATION_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_COMP_CUUP_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     e1-state-in
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Verify DU Notification Subscription Value in PnP Status
    Scroll Element Into View  ${ID_CUCP_NOTIFICATION_PNP_STATUS}
    ${value}=     get text    ${ID_CUCP_NOTIFICATION_VALUE}
    Log    ${value}
    should contain      ${value}     nrcell-state-info,nrcell-paraminuse-info,ru-notification-info,tx-array-carriers-state-change,ru-delete-notification,ru-sync-notify
Verify DU Notification Subscription Value in History
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RESULT_PANEL_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESULT_PANEL_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 10   set variable   100
    ...  ELSE  set variable  100
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Mandatory Notification Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_NOTIFICATION_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_COMP_DU_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     nrcell-state-info,nrcell-paraminuse-info,ru-notification-info,tx-array-carriers-state-change,ru-delete-notification,ru-sync-notify
    BuiltIn.Sleep  5s
    #Click DMS Element ${XPATH_HISTORY_DETAIL_CLOSE}
    #BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s
Verify MeNB X2C Value Change in History
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RESULT_PANEL_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESULT_PANEL_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 10   set variable   100
    ...  ELSE  set variable  100
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_X2C_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     X2C TIA Value Change
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_X2C_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_X2C_INTERFACE_VALUE}
    Log    ${Value}
    should contain  ${Value}     eth1

    #Scroll Element Into View  ${XPATH_X2C_IPADDRESS}
    #${Value1}=     get text    ${XPATH_X2C_IPADDRESS_VALUE}
    #Log    ${Value1}
    #should contain      ${Device_history_table}     Device Reachability
    #should contain  ${Value}     nrcell-state-info,nrcell-paraminuse-info,ru-notification-info,tx-array-carriers-state-change,ru-delete-notification,ru-sync-notify
Verify X2C Param in Provisioned Page

    BuiltIn.Sleep  2s
    ${value}=     get text    ${XPATH_PROVISIONING_X2CIP_VALUE}
    Log    ${value}
    #Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${ID_PROVISIONING_X2C_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    Entity Mapping
    BuiltIn.Sleep   2s

Verify X2C TIA PARAM in History
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RESULT_PANEL_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_RESULT_PANEL_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 10   set variable   100
    ...  ELSE  set variable  100
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_EPX2C_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Netconf EPX2_C Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_EPX2C_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_EPX2C_IP_VALUE}
    Log    ${Value}
    #should contain  ${Value}     eth1


Verify provisioned value for Heartbeat Period
    ${Table_value}    GET Text   ${XAPTH_VES_PROVISIONED_DATA_Heartbeat}
    Log     ${Table_value}
    should contain    ${Table_value}    ${Heartbeat_Interval}
    should contain    ${Table_value}    ${Heartbeat_Interval_Value}
    should contain    ${Table_value}    DMS GUI
    BuiltIn.Sleep   5s

Get Heartbeat Interval value from Provisioned data page
    BuiltIn.Sleep   2s
    ${Value_on_provisioned}    Get DMS Element Text   ${heartbeat_value_provisioned_data}
    Set Global Variable      ${Heartbeat_Interval_Value}
    Set Global Variable      ${Value_on_provisioned}



Get Heartbeat Interval value from dashboard
    [Documentation]  navigate to dashboard and get heartbeat interval value
    Click DMS Element  ${Xpath_gNB_Dashboard}
    BuiltIn.Sleep   10s
    ${Value_on_dashboard}    Get DMS Element Text   ${Heartbeat_Interval_Value_dashboard}
    Set Global Variable      ${Heartbeat_Interval_Value_dashboard}
    Set Global Variable      ${Value_on_dashboard}
    BuiltIn.Sleep   2s



Compare provisioned and dashboard values should be equal
    [Documentation]  compare provisioned and dashboard value for heartbeat interval
    Should Be Equal As Strings  ${Value_on_provisioned}  ${Value_on_dashboard}

Add gNB Overridden Parameter
    [Documentation]     Add Overriden Parameter
    #[Arguments]     ${section}  ${param_type}  Add gNB Overridden Parameter
    #[Arguments]    ${param_list}  ${value_to_set}  ${Text_Field_Path}
    [Arguments]    ${param_list}  ${Text_Field_Path}
    FOR    ${key}    IN    @{param_list}
        ${value_to_set}=    Get From Dictionary    ${param_list}    ${key}
        Log  ${value_to_set}
    END
    Search gNB DMS Overriden Parameter    ${key}
    #Click DMS Element  ${XPATH_OWP_FILTER_DROPDOWN_BUTTON}
    #BuiltIn.Sleep  5s
    #${true_false}=  Get Value  ${gName_value}
    #${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'Test-Replan'   set variable   Test-Replan-test
    #...  ELSE  set variable  Test-Replan
    #Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  10s
    #Wait Until Element Is Not Visible   ${Text_Field_Path}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #BuiltIn.Sleep  1s
    Input Text  ${Text_Field_Path}  ${value_to_set}
    BuiltIn.Sleep  5s
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    #Wait Until Element Is Enabled  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    #[Return]  ${value_to_set}


Delete gNB DMS Overriden Parameter
    [Arguments]     ${section}
    Search gNB DMS Overriden Parameter  ${section}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    #BuiltIn.Sleep  5s
    #Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}

Verify Param Value
    [Arguments]     ${local_Field_XPATH}    ${configured_DICT}
    FOR     ${key}    IN    ${configured_DICT}
        ${getvalue_from_DICT}=    Get From Dictionary    ${configured_DICT}    ${key}
    END
    ${value_from_XPATH}=     get value    ${local_Field_XPATH}
    Log    ${value}
    Should Be Equal  ${value_from_XPATH}    ${getvalue_from_DICT}
    BuiltIn.Sleep   2s

Load Provisioned Data
    [Documentation]     Load Provisioned Data
    [Arguments]    ${param_list}
    Search gNB DMS Overriden Parameter  ${param_list}
    BuiltIn.Sleep  10s
    Click DMS Element  ${ID_LOAD_PROVISIONED_DATA}
    BuiltIn.Sleep   2s

#Open gNB Overridden Parameter Page
#    [Documentation]  Open Overridden Paramas page
#    Click DMS Element   ${XPATH_DMS_OVERRIDEN_MENU}
#    BuiltIn.Sleep  2s
#    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    #Reload Page
#    BuiltIn.Sleep  10s

Open gNB Entity Mapping Overridden Parameter Page
    [Documentation]  Open Overridden Paramas page
    Click DMS Element   ${XPATH_DMS_OTHER_OVERRIDEN_MENU}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_DMS_Entity_Mapping_OVERRIDEN_MENU}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${ID_Entity_Mapping_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_Entity_Mapping_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

Open gNB DU CELL1 Overridden Parameter Page
    [Documentation]  Open Overridden Paramas page
    Open gNB Overridden Page    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    #Click DMS Element   ${XPATH_DMS_OVERRIDEN_MENU}
    #BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_DU_CELL4_TAB}
    #BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_DU_CELL1_TAB}
    #BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

Update WhiteList value
   [Arguments]      ${value}
   Input Text    ${Whitelist_cell1_text_area}    ${value}
   BuiltIn.Sleep  10s
   Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
   BuiltIn.Sleep  10s
   Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
   BuiltIn.Sleep  5s

Verify provisioned Whitelist value gNB
    [Arguments]     ${Whitelist_value_set}
    ${whitelist_value}    get Text    ${XPATH_Whitelist_provisioned_table}
    should contain     ${whitelist_value}     ${Whitelist_value_set}

Modify HB
    [Arguments]    ${XPATH_HBPeriod_Enter}
    Run Keyword And Ignore Error    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_HBPeriod_Enter}  ${New_HBPeriod}
    BuiltIn.Sleep  4s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  4s

Modify gNBName
    [Arguments]    ${XPATH_GNBName}
    BuiltIn.Sleep  4s
    Run Keyword And Ignore Error    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_GNBName}    ${New_gNBName}
    BuiltIn.Sleep  4s
    #Press Keys    ${XPATH_GNBName}  ENTER
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  4s

Delete HBPeriod
    [Arguments]    ${XPATH_HBPeriod_Enter}
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_HBPeriod_Enter}  ${EditBack_HBPeriod}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  2s

Delete gNBName
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  2s

HB gNBName PnP Status Verify
    Click DMS Element    ${XPATH_PNP_STATUS_BOX}
    BuiltIn.Sleep  4s
    ${value}        Get Text     ${XPATH_PNP_REPORT_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    ${value1}        Get Text    ${XPATH_FAILURE_REASON}
    Should Contain    ${value1}    NA
    ${value2}        Get Text    ${XPATH_HBPeriod_DETAILS}
    Should Contain    ${value2}    30
    ${value3}        Get Text    ${XPATH_GNBNAME_DETAILS}
    Should Contain    ${value3}    Automation-gNB
    BuiltIn.sleep    6s

Provisioned page verify gNBName
    go to   ${DEVICE_PROVSIONED_DATA_URL}
    ${value}        Get Text     ${XPATH_PROVISIONED_DATA}
    Should Contain    ${value}    Automation-gNB
    BuiltIn.Sleep  2s

Provisioned page verify HBPeriod
    ${value}        Get Text     ${XPATH_PROVISIONED_HBPeriod}
    Should Contain    ${value}    30
    BuiltIn.Sleep  2s

Device History CU gNBName Details
    [arguments]    ${XPATH_HISTORY_PROVISIONING}
    Click DMS Element    ${XPATH_HISTORY_PROVISIONING}
    BuiltIn.Sleep   5s
    ${value}        Get Text     ${XPATH_NEW_gNBNAME_VALUE}
    Log             ${value}
    Should Contain    ${value}    ${New_gNBName}
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Device History CU HB Details
    [arguments]    ${XPATH_HISTORY_PROVISIONING}
    Click DMS Element    ${XPATH_HISTORY_PROVISIONING}
    BuiltIn.Sleep   4s
    ${value}        Get Text     ${XPATH_NEW_HBP_VALUE}
    Log             ${value}
    Should Contain    ${value}    ${New_HBPeriod}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Device History DU HB Details
    [arguments]    ${XPATH_HISTORY_PROVISIONING}
    Click DMS Element    ${XPATH_HISTORY_PROVISIONING}
    BuiltIn.Sleep   4s
    ${value}        Get Text     ${XPATH_HISTORY_DU_HB_PROVISIONING}
    Log             ${value}
    Should Contain    ${value}    ${New_HBPeriod}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Device History DU gNBName Details
    [arguments]    ${XPATH_HISTORY_PROVISIONING}
    Click DMS Element    ${XPATH_HISTORY_PROVISIONING}
    BuiltIn.Sleep   5s
    ${value}        Get Text     ${XPATH_HISTORY_DU_gNBNAME}
    Log             ${value}
    Should Contain    ${value}    ${New_gNBName}
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

#Select and import Entity Mapping file
 #    BuiltIn.Sleep  3s
  #   Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
   # Click DMS Element  ${SELECT_ENTITYMAPPING_FILE}
    # BuiltIn.Sleep  7s
     #Click DMS Element  ${FOLDER_BUTTON}
     #BuiltIn.Sleep  7s
     #Click DMS Element  ${UPLOAD_OK_BUTTON}
     #BuiltIn.Sleep  7s
     #Click DMS Element  ${IMPORT_BUTTON}


#Verify Operation History values for Entity Mapping import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    #${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    #Log     ${Operation_name}
    #BuiltIn.Sleep  5s
    #${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    #Log     ${Operation_type}
    #BuiltIn.Sleep  5s
    #${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    #Log     ${Operation_status}

    #Should Contain    ${Operation_type}      	Entity Mapping
    #Should Contain    ${Operation_status}      Success
    #Should Contain    ${Operation_name}      	Marriott_Connecticut_Automation.zip

Click Delta Param icon from Dashboard
   Click DMS Element  ${XPATH_DELTA_PARAM_ICON_BUTTON}
   BuiltIn.Sleep   3s

Search gNB Delta Parameter in Provisioning Page
    [Documentation]     Search configured Delta Parameter in Provisioning Page
    [Arguments]     ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_DELTA_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_PROVISIONING_APPLY_BUTTON}
    BuiltIn.Sleep  5s
X2C Delta Provisioning Page
    #Click DMS Element  ${XPATH_DELTA_PARAM}
    ${value}=     get text    ${XPATH_PROVISIONING_X2C_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value}
    Should Be Equal  ${value}    IP Address
    BuiltIn.Sleep   2s
X2C Delete Delta Provisioning Page
    ${value}=     get text    ${XPATH_PROVISIONING_X2C_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value}
    Should Be Equal  ${value}    X2 C
    BuiltIn.Sleep   2s

Click CUUP device from Topology
    Click DMS Element  ${XPATH_CUUP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${cuup_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${cuup_summary_value}
    Should Be Equal  ${cuup_summary_value}    0005B9-CS_ONECELL_CU-UP-ipsec2-2051cuup1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s

Click DU device from Topology
    Click DMS Element  ${XPATH_DU_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${du_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${du_summary_value}
    Should Be Equal  ${du_summary_value}    0005B9-CS_ONECELL_DU-ipsec2-2051du1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s
Click CUCP device from Topology
    Click DMS Element  ${XPATH_CUCP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${cucp_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${cucp_summary_value}
    Should Be Equal  ${cucp_summary_value}    0005B9-CS_ONECELL_CU-CP-ipsec2-2051cucp1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s

Click RP device from Topology
    Click DMS Element  ${XPATH_RP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${rp_summary_value}=     get text    ${XPATH_RP_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${rp_summary_value}
    Should Be Equal  ${rp_summary_value}    - 0005B9-CS_ONECELL_DU-ipsec2-2051du1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s

X2C SGW and CA Param Delta Provisioning Page
    #Click DMS Element  ${XPATH_DELTA_PARAM}
    ${value}=     get text    ${XPATH_PROVISIONING_X2C_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value}
    Should Be Equal  ${value}    Ipsec  CA SecGw
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONING_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value1}
    Should Be Equal  ${value1}    ipv6-250-caserver.siqdomain.com
    BuiltIn.Sleep   2s

    #Click DMS Element  ${XPATH_DELTA_PARAM}
    ${value2}=     get text    ${XPATH_PROVISIONING_SGW_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value2}
    Should Be Equal  ${value2}    Secgw
    BuiltIn.Sleep   2s
    ${value4}=     get text    ${XPATH_PROVISIONING_SGW_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value4}
    Should Be Equal  ${value4}    svtsecgw5g-200.siqqa-ac.lab.india.wirelessworld.airvananet.com
    BuiltIn.Sleep   2s

Click Delta Param icon
    Click DMS Element  ${XPATH_DELTA_ICON}
    BuiltIn.Sleep   3s

Delete whitelist
    Click DMS Element  ${XPATH_DELETE_WHITELIST_BUTTON}
    BuiltIn.Sleep   3s


Verify Delete provisioned Whitelist value gNB
    [Arguments]     ${Whitelist_value_set}
    ${whitelist_value}    get Text    ${XPATH_Whitelist_provisioned_table}
    Should Not Contain     ${whitelist_value}     ${Whitelist_value_set}

CUCP Replay notification in Device History
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_CUREPLAY_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_CUREPLAY_NOTIFICATION_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     X2C State Notification
     BuiltIn.Sleep  5s
    #Log  ${event_type} event type is selected and respected result is shown
    #Click DMS Element    ${XPATH_NOTIFICATION_ROW}
    # BuiltIn.Sleep  10s
    #${Value}=     get text    ${XPATH_COMP_NEW_VALUE}
    #Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    #should contain  ${Value}     x2c-state-info
    #BuiltIn.Sleep  5s

CUUP Replay notification in Device History
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_UPREPLAY_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_UPREPLAY_NOTIFICATION_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     E1 State Notification
     BuiltIn.Sleep  5s

DU Replay notification in Device History
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_DUREPLAY_NOTIFICATION_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_DUREPLAY_NOTIFICATION_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     RP State Notification
     BuiltIn.Sleep  5s

Search gNB DMS Overriden Parameter CP
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    #${sector_tab}=  Format String   ${XPATH_ORP_SECTOR_TAB}   sector=${sector}
    #BuiltIn.Sleep  10s
    #Click DMS Element  ${sector_tab}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    #${collapse_expand_text}=  Get Text  ${XPATH_ORP_COLLAPSE_EXPAND_TEXT}
    #Run Keyword If  'Collapse All' in '''${collapse_expand_text}'''  Click DMS Element  ${ID_ORP_COLLAPSE_EXPAND_BUTTON}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_ExpandCollapse
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s
    #${collapse_expand_text}=  Get Text  ${XPATH_ORP_COLLAPSE_EXPAND_TEXT}
    #Run Keyword If  'Expand All' in '''${collapse_expand_text}'''  Click DMS Element  ${ID_ORP_COLLAPSE_EXPAND_BUTTON}


Delete gNB DMS VES Overriden Parameter
    [Arguments]     ${section}
    Search gNB DMS Overriden Parameter CP   ${section}
    BuiltIn.Sleep  2s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_1}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_2}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_3}
    BuiltIn.Sleep  5s

Save VNF Overriden Parameter
    [Documentation]  Save DMS overridden parameters
    BuiltIn.Sleep   2s
    Set Focus To Element  ${XPATH_ORP_PARAM_SAVE_BUTTON_gNB}
    BuiltIn.Sleep   5s
    #${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #BuiltIn.Sleep   5s
    Run Keyword And Ignore Error  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON_gNB}
    BuiltIn.Sleep   5s
    Run Keyword And Ignore Error  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON_gNB}
    BuiltIn.Sleep   5s
    Run Keyword And Ignore Error  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP_gNB}
    BuiltIn.Sleep   5s


update DMS ves values cucp
    [Arguments]    ${url}    ${username}    ${password}
    Click DMS Element   ${XPATH_VES_URL_DMS}
    BuiltIn.Sleep  5s
    Input Text    ${XPATH_VES_URL_DMS}    ${url}
    Click DMS Element   ${XPATH_VES_USERNAME_DMS}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VES_USERNAME_DMS}  ${username}
    Click DMS Element   ${XPATH_VES_PASSWORD_DMS}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VES_PASSWORD_DMS}  ${password}


Select and Verify DMS Activation Flag
    Click DMS Element   ${XPATH_DMS_FLAG_BOX_PNP}
    BuiltIn.Sleep  3s
    Scroll Element Into View    ${XPATH_FLAG_TEXT}
    BuiltIn.Sleep  3s
    ${flag_value}    get Text    ${XPATH_FLAG_TEXT}
    Log    ${flag_value}
    should contain     ${flag_value}       true

Dashboard page login
   [Arguments]  ${DASHBOARD_PAGE_URL}
   BuiltIn.Sleep  5s
    ${open_page}=  Format String   ${DASHBOARD_PAGE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    go to   ${open_page}
    BuiltIn.Sleep  20s
    ${last_est_time}    Get Text   ${XPATH_LAST_ESTABLISHED}
    BuiltIn.Sleep  5s
    Log    ${last_est_time}
    [Return]    ${last_est_time}

Verify ves provisioned value after reboot
    ${Table_value}    GET Text   ${XAPTH_VES_PROVISIONED_DATA_DMSGUI_table}
    Log     ${Table_value}
    should contain    ${Table_value}    ${url_ves_DMS_value1}
    should contain    ${Table_value}    ${Username_ves_DMS_value1}
    should contain    ${Table_value}    ${Password_ves_DMS_value1}
    should contain    ${Table_value}    DMS GUI

Get Device cnsole server time
   BuiltIn.Sleep  5s
   ${time_value}    get Text    ${XPATH_SERVER_TIME}
   Log    ${time_value}
   [Return]     ${time_value}

Replan required tag CP
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_gNBIDLength}    ${New_gNBIDLength}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_gNBIDLength}  ENTER
    BuiltIn.Sleep  4s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_SAVED}
    ${value}        Get Text     ${XPATH_SAVED}
    Log             ${value}
    Should Contain    ${value}     Saved successfully
    BuiltIn.Sleep  4s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  6s
    Click DMS Element  ${Xpath_gNB_Dashboard}
    BuiltIn.Sleep   10s
    Wait Until Element Is Visible  ${XPATH_PENDING_PROVISIONING}
    ${value}        Get Text     ${XPATH_PENDING_PROVISIONING}
    Log             ${value}
    Should Contain    ${value}     Replan Required
    BuiltIn.Sleep  2s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep   10s
    Search gNB DMS Overriden Parameter    gNB ID Length
    BuiltIn.Sleep  4s
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  2s


Replan required tag UP
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_gNBIDLength_UP}    ${New_gNBIDLength}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_gNBIDLength_UP}  ENTER
    BuiltIn.Sleep  4s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_SAVED}
    ${value}        Get Text     ${XPATH_SAVED}
    Log             ${value}
    Should Contain    ${value}     Saved successfully
    BuiltIn.Sleep  4s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  6s
    Click DMS Element  ${Xpath_gNB_Dashboard}
    BuiltIn.Sleep   10s
    Wait Until Element Is Visible  ${XPATH_PENDING_PROVISIONING}
    ${value}        Get Text     ${XPATH_PENDING_PROVISIONING}
    Log             ${value}
    Should Contain    ${value}     Replan Required
    BuiltIn.Sleep  2s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep   10s
    Search gNB DMS Overriden Parameter    gNB ID Length
    BuiltIn.Sleep  4s
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  2s

Replan required tag DU
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_gNBIDLength}    ${New_gNBIDLength}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_gNBIDLength}  ENTER
    BuiltIn.Sleep  4s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_SAVED}
    ${value}        Get Text     ${XPATH_SAVED}
    Log             ${value}
    Should Contain    ${value}     Saved successfully
    BuiltIn.Sleep  4s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  6s
    Click DMS Element  ${Xpath_gNB_Dashboard}
    BuiltIn.Sleep   10s
    Wait Until Element Is Visible  ${XPATH_PENDING_PROVISIONING}
    ${value}        Get Text     ${XPATH_PENDING_PROVISIONING}
    Log             ${value}
    Should Contain    ${value}     Replan Required
    BuiltIn.Sleep  2s
    Verify DMS Overriden Params page Navigation
    BuiltIn.Sleep   10s
    Search gNB DMS Overriden Parameter    gNB ID Length
    BuiltIn.Sleep  4s
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_OVEERIDE_SAVE_BUTTON}
    BuiltIn.Sleep  2s

Navigate to Device Other overridden params page
    [Documentation]  Open Other overridden params page
    [arguments]    ${VNF_OVERRIDDEN_PAGE}
    ${open_page}=   Format String   ${VNF_OVERRIDDEN_PAGE}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_ENTITY_MAPPING_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Add New Entity association from GUI
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_PLUS_ENTITY}
    BuiltIn.Sleep  2s
    Input Text   ${XPATH_ENTER_ENBID}    77
    BuiltIn.Sleep  4s
    Click DMS Element   ${XPATH_ENTER_IPADRESS}
    BuiltIn.Sleep  1s
    Input Text   ${XPATH_ENTER_IPADRESS}    10.212.2.11
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_SAVE_ENTITY}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_SAVE_ENTITY}
    #BuiltIn.Sleep  2s
    #Press Keys    ${XPATH_SAVE_ENTITY}  ENTER
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_SAVED}
    ${value}        Get Text     ${XPATH_SAVED}
    Log             ${value}
    Should Contain    ${value}     Saved successfully
    BuiltIn.Sleep  4s
    Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    BuiltIn.Sleep  6s

Entity association PnP verify
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_ENTITY_PNP_BOX}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_PROVISION_PNP_BOX_1}
    ${value}        Get Text     ${XPATH_PROVISION_PNP_BOX_1}
    Log             ${value}
    Should Contain   ${value}   StatusSuccess
    Should Contain   ${value}   Failure ReasonNA
    Should Contain   ${value}   EPX2C IP Address1 entries are present
    Should Contain   ${value}   X2 C2 entries are present
    BuiltIn.Sleep  2s

Delete Entity Association from GUI
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_DELETE_ENTITY}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_SAVE_ENTITY}
    BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_SAVE_ENTITY}
    #BuiltIn.Sleep  2s
    #Press Keys    ${XPATH_SAVE_ENTITY}  ENTER
    BuiltIn.Sleep  4s
