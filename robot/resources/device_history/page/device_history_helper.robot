*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../RadioPoint/page/radiopoint_helper.robot
Library             SeleniumLibrary
#Library             Selenium2Library
Library             Collections
Variables           device_history_ui_controls.py

*** Variables ***


*** Keywords ***
Open Device History Page
    [Documentation]  Open Device History Page
    ${device_history_url}=  Format String   ${DEVICE_HISTORY_PAGE}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${device_history_url}
    # ${js_output}=  Execute JavaScript  return document.readyState
    # Run Keyword Unless  '${js_output}'=='complete'  Go To  ${device_history_url}
    Wait Until Element Is Visible  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s
    Log  Device History Page Opened

Open gNB Device History Page
    [Documentation]  Open gNB Device History Page
    [Arguments]  ${HISTORY_PARAM}
    ${device_history_url}=  Format String   ${HISTORY_PARAM}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${device_history_url}
    # ${js_output}=  Execute JavaScript  return document.readyState
    # Run Keyword Unless  '${js_output}'=='complete'  Go To  ${device_history_url}
    Wait Until Element Is Visible  ${ID_GNB_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_GNB_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s
    Log  Device History Page Opened

Open Real Device History Page
    [Documentation]  Open Real Device History Page
    ${device_history_url}=  Format String   ${DEVICE_HISTORY_PAGE}   dms_device_console=${DMS_UI_URL_RealDevice}    device_macid=${DEVICE_MACID}
    Go To  ${device_history_url}
    # ${js_output}=  Execute JavaScript  return document.readyState
    # Run Keyword Unless  '${js_output}'=='complete'  Go To  ${device_history_url}
    Wait Until Element Is Visible  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s
    Log  Real Device History Page Opened
Select Tabular Tab
    [Documentation]  Select Tabular Tab in filter frame of Device History page
    [Arguments]  ${tab_type}
    ${tab_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TBAULAR_TAB}   tab_type=${tab_type}
    Click DMS Element  ${tab_type_output}
    Log  ${tab_type} Tab is selected

Select Time Option
    [Documentation]  Select time option from the given list in filter frame
    [Arguments]   ${time_option}
    Click DMS Element  ${XPATH_DEVICEHISTORY_TIMEOPTION_LIST_DISPLAYER}
    BuiltIn.Sleep  5s
#    Wait Until Page Contains Element  ${DEVICEHISTORY_TIMEOPTION_OPTION}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Mouse Over  ${DEVICEHISTORY_TIMEOPTION_OPTION}
#    Click Element  ${DEVICEHISTORY_TIMEOPTION_OPTION}
    # Press Keys  ${DEVICEHISTORY_TIMEOPTION_OPTION}  A+BACKSPACE
    # Clear Element Text  ${DEVICEHISTORY_TIMEOPTION_INPUT}
    # Input Text  ${DEVICEHISTORY_TIMEOPTION_INPUT}  ${timeoption}  clear=True
    # Press Keys  ${DEVICEHISTORY_TIMEOPTION_INPUT}  RETURN
    ${time_option_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_LISTITEM}   time_option=${time_option}
    Click DMS Element  ${time_option_output}
#    Wait Until Page Contains Element  ${time_option_output}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Mouse Over  ${time_option_output}
#    Click Element  ${time_option_output}
    Log  ${time_option} option is selected

Select Event Category and Click on Show Button
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
#    Wait Until Page Contains Element  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Mouse Over  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}
#    Click Element  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
#    Wait Until Page Contains Element  ${DEVICEHISTORY_SHOW_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Click Element  ${DEVICEHISTORY_SHOW_BUTTON}
    Log  ${event_type} event type is selected and respected result is shown

Click on Export Button
    [Documentation]  Click on Export button to extract device history of certain time period
    Wait Until Loading Icon Disappears
    #Browser Zoom Level  50%
    #Browser Zoom Level  75%
    BuiltIn.Sleep  5s
    #Maximize Browser Window
    #Scroll Page To Location    0    2000

    #Click DMS Element      ${BreadCrumb}
    #BuiltIn.Sleep  5s
    #Click DMS Element      ${BreadCrumb}
    #BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_EXPORT_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICE_HISTORY_PAGE_HEADER}
    BuiltIn.Sleep  5s
    # Wait Until Page Contains Element  ${DEVICEHISTORY_EXPORT_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    # Execute Javascript  document.evaluate('${DEVICEHISTORY_EXPORT_BUTTON}',document.body,null,9,null).singleNodeValue.click()
    # Execute Javascript  document.getElementById('DC_DeviceHistory_Export_Button').scrollTop = 0
    #Execute Javascript  window.scroll(500,500)
    #Execute Javascript  document.querySelector("button[id="DC_DeviceHistory_Export_Button"]").scrollTop=0
    Click DMS Element  ${ID_DEVICEHISTORY_EXPORT_BUTTON}
#    Wait Until Element is Enabled  ${DEVICEHISTORY_EXPORT_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
  #  Execute Javascript  document.evaluate('${ID_DEVICEHISTORY_EXPORT_BUTTON}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true)
#    Set Focus To Element  ${DEVICEHISTORY_EXPORT_BUTTON}
#    # Scroll Element Into View  ${DEVICEHISTORY_EXPORT_BUTTON}
#    Mouse Over  ${DEVICEHISTORY_EXPORT_BUTTON}
#    Click Element  ${DEVICEHISTORY_EXPORT_BUTTON}
    Log  Device history file is extracted

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Select Compute Event Category and Click on Show Button
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_TREE_NODE}
    #BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_TREE_NODE}
    #BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    #Input Text  ${XPATH_RESULT_PANEL_INPUT}  100
    #BuiltIn.Sleep  5s
    #Press Keys    ${XPATH_RESULT_PANEL_INPUT}    RETURN
    #BuiltIn.Sleep  5s
    #Press Keys    ${XPATH_RESULT_PANEL_INPUT}    ENTER
    #BuiltIn.Sleep  5s
    #Press Keys    ${XPATH_RESULT_PANEL_INPUT}    ENTER
    #BuiltIn.Sleep  5s
#    Wait Until Page Contains Element  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Mouse Over  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}
#    Click Element  ${DEVICEHISTORY_TIMEOPTION_CHECKBOX}

#    Wait Until Page Contains Element  ${DEVICEHISTORY_SHOW_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
#    Click Element  ${DEVICEHISTORY_SHOW_BUTTON}
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

    #Scroll Element Into View    ${XPATH_CONFIGURE_ACB_OK_BUTTON}
    #BuiltIn.Sleep  2s
    #click dms element    ${XPATH_CONFIGURE_ACB_OK_BUTTON}
    #BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_BLACKLIST_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Blacklist Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_BLACKLIST_ROW}
     BuiltIn.Sleep  10s
    ${NEW_VALUE}=     get text    ${XPATH_NEW_VALUE}
    Log    ${NEW_VALUE}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${NEW_VALUE}     ${Blacklist_RP}

Validate the response in event
    [Arguments]    ${Policy_Name}
    Click DMS Element     ${XPATH_POLICY_RESPONSE}
    BuiltIn.Sleep  10s
    ${success_msg} =    Format String   ${XPATH_RESPONSE_NAME}     ${Policy_Name}
    Wait Until Element Is Visible   ${success_msg}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element   ${XPATH_CLOSE_BUTTON}

Select Compute Event Category for SPID and Click on Show Button
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
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
    Scroll Element Into View     ${XPATH_SPID_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     SPID Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_SPID_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_COMP_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     true

Select Compute Event Category for MIMO and Click on Show Button
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
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
    Scroll Element Into View     ${XPATH_MIMO_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     MIMO Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_MIMO_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_COMP_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     true

Select Compute Event Category and Click on Show Button WEBGUI whitelist
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
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
    Scroll Element Into View     ${XPATH_whitelist_ROW_DH}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Whitelist Computation
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_whitelist_ROW_DH}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     ${WHITELIST_SECTOR1};${WHITELIST_SECTOR2}


Select Compute Event Category and Click on Show Button WEBGUI
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    BuiltIn.Sleep  5s
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
    Scroll Element Into View     ${XPATH_NGPS_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Nominal GPS Value Change
     BuiltIn.Sleep  5s
    Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_NGPS_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_NEW_VALUE}
    Log    ${Value}
    Log    ${Latitude_Sign_1}
    Log    ${Direction_Altitude_1}
    Log    ${Altitude_1}
    #should contain      ${Device_history_table}     Device Reachability
    #should contain  ${Value}     ${Latitude_Sign_1}
    #should contain  ${Value}     ${Direction_Altitude_1}
    should contain  ${Value}     ${Altitude_1}
    should contain  ${Value}     ${Uncertain_Semi_Major_1}
    should contain  ${Value}     ${Uncertain_Semi_Minor_1}
    should contain  ${Value}     ${Uncertain_Altitude_1}
    should contain  ${Value}     OrientationOfMajorAxis
    should contain  ${Value}     ${Orientation_of_Major_Axis_1}
    should contain  ${Value}     ${Confidence_1}

Validate the notification response
    Click DMS Element     ${XPATH_RP_NOTIFCATION}
    BuiltIn.Sleep  10s
    ${RP_VALUE}    get text     ${XPATH_NOTIFICATION_RP_DETAIL}
    Log    ${RP_VALUE}

Validate the RP Reboot notification response
    Click DMS Element     ${XPATH_RP_REBOOT_RESPONSE_NOTIFCATION}
    BuiltIn.Sleep  10s
    ${RP_VALUE}    get text     ${XPATH_NOTIFICATION_RP_REBOOT_DETAIL}
    Log    ${RP_VALUE}

validate the provisioning value for Certificate
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_GET_PARAMETER_VALUE}
    Click DMS Element     ${XPATH_GET_PARAMETER_VALUE}
    BuiltIn.Sleep  10s
    Scroll Element Into View    ${XPATH_MPLANE_VALUE}
    ${Certvalue_VALUE}    get text     ${XPATH_MPLANE_VALUE}
    Log    ${Certvalue_VALUE}
    should contain      ${Certvalue_VALUE}    KeyCertDownload_SUCCESS

validate History Resync All message
   BuiltIn.Sleep  5s
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
   BuiltIn.Sleep  5s
   Scroll Element Into View    ${XPATH_Resync_Resync_all_ROW}
   should contain      ${XPATH_Resync_Resync_all_ROW}    Resync or Resync All
   Scroll Element Into View    ${XPATH_Resync_get_response_ROW}
   should contain      ${XPATH_Resync_get_response_ROW}    Netconf Get Response
   Scroll Element Into View    ${XPATH_Resync_get_ROW}
   should contain      ${XPATH_Resync_get_ROW}    Netconf Get
  # Scroll Element Into View    ${XPATH_Resync_notification_ROW}
  # should contain      ${XPATH_Resync_notification_ROW}    RP Sync Notification
   #Scroll Element Into View    ${XPATH_Resync_add_notification_ROW}
   #should contain      ${XPATH_Resync_add_notification_ROW}    RP Add Notification
   Click DMS Element     ${XPATH_Resync_get_ROW}
    BuiltIn.Sleep  5s
    ${DEVICE_RRRESYNC_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RRRESYNC_VALUE}
    should contain any      ${DEVICE_RRRESYNC_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    RP Admin State    RP CellID    RP Connection Status    RP IP Address    RP Instance RF Module ID    RP OUI    RP PTP Lock State    RP Product Class    RP Serial Numbeer    RP Software Version    RP Sync State    RP Up Time
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_Resync_Resync_all_ROW}
    Click DMS Element     ${XPATH_Resync_Resync_all_ROW}
    BuiltIn.Sleep  5s
    ${DEVICE_RPRESYNC_ALL_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPRESYNC_ALL_VALUE}
    should contain any      ${DEVICE_RPRESYNC_ALL_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    User Id    dmsadmin
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_NETCONF_GET_RESPONSE}
   Click DMS Element     ${XPATH_DEVICE_NETCONF_GET_RESPONSE}
   BuiltIn.Sleep  2s
    ${DEVICE_NETCONF_GET_RESPONSE_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_NETCONF_GET_RESPONSE_VALUE}
    should contain any     ${DEVICE_NETCONF_GET_RESPONSE_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance    RP OUI    RP Sync State    RP Serial Numbeer    RP Product Class    RP Connection Status    RP Software Version    RP CellID    RP Instance RF Module ID    RP Up Time    205151201221    205151201222    CommScope_RP5200_0005B960AAA1    CommScope_RP5200_0005B960AAA2    CS_ONECELL_RU52    CONNECTED    Operation Id    Status    Success

validate delete whitelist
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_whitelist_ROW}
    Click DMS Element     ${XPATH_whitelist_ROW}
    BuiltIn.Sleep  10s
    Scroll Element Into View    ${XPATH_DELETE_VALUE_ROW}
    ${whitelist_delete_VALUE}    get text     ${XPATH_DELETE_VALUE_ROW}
    Log    ${whitelist_delete_VALUE}
    should contain      ${whitelist_delete_VALUE}    DELETE: 0005B9519BB3

Select Device History Items per Page
    [Documentation]  Select Device History items per page

    BuiltIn.Sleep  5s
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

validate History RP5200 RP Reboot
   BuiltIn.Sleep  5s
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
    BuiltIn.Sleep  10s
   Scroll Element Into View    ${XPATH_DEVICE_RPREBOOT}
   should contain      ${XPATH_DEVICE_RPREBOOT}    Device RP Reboot
   Scroll Element Into View    ${XPATH_DEVICE_RPREBOOT_RESPONSE}
   should contain      ${XPATH_DEVICE_RPREBOOT_RESPONSE}    Device RP Reboot Response
   Click DMS Element     ${XPATH_DEVICE_RPREBOOT}
    BuiltIn.Sleep  5s
    ${DEVICE_RPREBOOT_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPREBOOT_VALUE}
    should contain any      ${DEVICE_RPREBOOT_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    RP5000 Instance ID    205151201221,205151201222    User Id    dmsadmin
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RPREBOOT_RESPONSE}
    Click DMS Element    ${XPATH_DEVICE_RPREBOOT_RESPONSE}
    BuiltIn.Sleep  5s
    ${DEVICE_RPREBOOT_RESPONSE_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPREBOOT_RESPONSE_VALUE}
    should contain any      ${DEVICE_RPREBOOT_RESPONSE_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    Status    Success
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s


validate History RP5200 RP Reset
   BuiltIn.Sleep  5s
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
    BuiltIn.Sleep  10s
   Scroll Element Into View    ${XPATH_DEVICE_RPRESET}
   Log  XPATH_DEVICE_RPRESET ${XPATH_DEVICE_RPRESET}
   should contain      ${XPATH_DEVICE_RPRESET}    Device RP Reset
   Scroll Element Into View    ${XPATH_DEVICE_RPRESET_RESPONSE}
   should contain      ${XPATH_DEVICE_RPRESET_RESPONSE}    Device RP Reset Response
   Click DMS Element     ${XPATH_DEVICE_RPRESET}
    BuiltIn.Sleep  5s
    ${DEVICE_RPRESET_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPRESET_VALUE}
    should contain any      ${DEVICE_RPRESET_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    RP5000 Instance ID    205151201221,205151201222    User Id    dmsadmin
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RPRESET_RESPONSE}
    Click DMS Element     ${XPATH_DEVICE_RPRESET_RESPONSE}
    BuiltIn.Sleep  5s
    ${DEVICE_RPRESET_RESPONSE_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPRESET_RESPONSE_VALUE}
    should contain any      ${DEVICE_RPRESET_RESPONSE_VALUE}    Attribute    Cell    Key    New Value    Old Value    Operation Id    Status    Success
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s

validate History RP5200 Notifications
    BuiltIn.Sleep  5s
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
    BuiltIn.Sleep  10s
   Scroll Element Into View    ${XPATH_DEVICE_RPADD_NOTIFICATION1}
   Log  XPATH_DEVICE_RPADD_NOTIFICATION1 ${XPATH_DEVICE_RPADD_NOTIFICATION1}
   should contain      ${XPATH_DEVICE_RPADD_NOTIFICATION1}    RP Add Notification
   Scroll Element Into View    ${XPATH_DEVICE_RPADD_NOTIFICATION2}
   should contain      ${XPATH_DEVICE_RPADD_NOTIFICATION2}    RP Add Notification
   Scroll Element Into View    ${XPATH_DEVICE_RP52STATE_NOTIFICATION1}
    should contain      ${XPATH_DEVICE_RP52STATE_NOTIFICATION1}    RP State Notification
    Scroll Element Into View    ${XPATH_DEVICE_RP52STATE_NOTIFICATION2}
    should contain      ${XPATH_DEVICE_RP52STATE_NOTIFICATION2}    RP State Notification
    Scroll Element Into View    ${XPATH_DEVICE_RP52SYNC_NOTIFICATION1}
    should contain      ${XPATH_DEVICE_RP52SYNC_NOTIFICATION1}    RP Sync Notification
    Scroll Element Into View    ${XPATH_DEVICE_RP52SYNC_NOTIFICATION2}
    should contain      ${XPATH_DEVICE_RP52SYNC_NOTIFICATION2}    RP Sync Notification
   Click DMS Element     ${XPATH_DEVICE_RPADD_NOTIFICATION1}
    BuiltIn.Sleep  5s
    ${DEVICE_RPADD_NOTIFICATION1_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPADD_NOTIFICATION1_VALUE}
    should contain any      ${DEVICE_RPADD_NOTIFICATION1_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance RF Module ID    eventTime    RP Interface    RP Product Class    RP Connection Status    RP Instance    RP OUI    RP Software Version    RP Component Name    RP IP Address    RP CellID    RP Up Time    RP Serial Numbeer    CS_ONECELL_RU52    CONNECTED
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RPADD_NOTIFICATION2}
    Click DMS Element     ${XPATH_DEVICE_RPADD_NOTIFICATION2}
    BuiltIn.Sleep  5s
    ${DEVICE_RPADD_NOTIFICATION2_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RPADD_NOTIFICATION2_VALUE}
    should contain any      ${DEVICE_RPADD_NOTIFICATION2_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance RF Module ID    eventTime    RP Interface    RP Product Class    RP Connection Status    RP Instance    RP OUI    RP Software Version    RP Component Name    RP IP Address    RP CellID    RP Up Time    RP Serial Numbeer    CS_ONECELL_RU52    CONNECTED
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RP52STATE_NOTIFICATION1}
    Click DMS Element     ${XPATH_DEVICE_RP52STATE_NOTIFICATION1}
    BuiltIn.Sleep  5s
    ${DEVICE_RP52STATE_NOTIFICATION1_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RP52STATE_NOTIFICATION1_VALUE}
    should contain any      ${DEVICE_RP52STATE_NOTIFICATION1_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance    eventTime    DU Node    Tx Carrier name    Tx Carrier Status    CommScope_RP5200_0005B960AAA2    CommScope_RP5200_0005B960AAA1    Carrier0-DL    READY
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RP52STATE_NOTIFICATION2}
    Click DMS Element     ${XPATH_DEVICE_RP52STATE_NOTIFICATION2}
    BuiltIn.Sleep  5s
    ${DEVICE_RP52STATE_NOTIFICATION2_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RP52STATE_NOTIFICATION2_VALUE}
    should contain any      ${DEVICE_RP52STATE_NOTIFICATION2_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance    eventTime    DU Node    Tx Carrier name    Tx Carrier Status    CommScope_RP5200_0005B960AAA2    CommScope_RP5200_0005B960AAA1    Carrier0-DL    READY
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RP52SYNC_NOTIFICATION1}
    Click DMS Element     ${XPATH_DEVICE_RP52SYNC_NOTIFICATION1}
    BuiltIn.Sleep  5s
    ${DEVICE_RP52SYNC_NOTIFICATION_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RP52SYNC_NOTIFICATION_VALUE}
    should contain any      ${DEVICE_RP52SYNC_NOTIFICATION_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance    eventTime    PTP State Change    Sync State Change    LOCKED    CommScope_RP5200_0005B960AAA2    CommScope_RP5200_0005B960AAA1    DU Node
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Up Page
    Scroll Element Into View    ${XPATH_DEVICE_RP52SYNC_NOTIFICATION2}
    Click DMS Element     ${XPATH_DEVICE_RP52SYNC_NOTIFICATION2}
    BuiltIn.Sleep  5s
    ${DEVICE_RP52SYNC_NOTIFICATION2_VALUE}    get text     ${XPATH_DEVICE_EVENT_DETAILS}
    Log    ${DEVICE_RP52SYNC_NOTIFICATION2_VALUE}
    should contain any      ${DEVICE_RP52SYNC_NOTIFICATION2_VALUE}    Attribute    Cell    Key    New Value    Old Value    RP Instance    eventTime    PTP State Change    Sync State Change    LOCKED    CommScope_RP5200_0005B960AAA2    CommScope_RP5200_0005B960AAA1    DU Node

Validate Reboot Messages
    BuiltIn.Sleep  5s
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
    Click DMS Element    ${XPATH_Reboot_Provisioning_ROW}
    BuiltIn.Sleep  5s
    ${Reboot_Value}    get Text    ${XPATH_NEW_VALUE}
    Log   ${Reboot_Value}
    Should contain      ${Reboot_Value}    DMS_DeviceActivationStatus
    Should contain      ${Reboot_Value}    true
    Should contain      ${Reboot_Value}    User Defined State
    Should contain      ${Reboot_Value}    DMSACTIVATION
    Should contain      ${Reboot_Value}    Last Boot Time

Validate Delta Messages
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_Delta_Provisioning_ROW}
    BuiltIn.Sleep  5s
    ${Reboot_Value}    get Text    ${XPATH_NEW_VALUE}
    Log   ${Reboot_Value}
    Should contain      ${Reboot_Value}    DMS_DeviceActivationStatus
    Should contain      ${Reboot_Value}    true
    Should contain      ${Reboot_Value}    User Defined State
    Should contain      ${Reboot_Value}    DMSACTIVATION
    Should contain      ${Reboot_Value}    Last Boot Time

Validate Delta Messages nonexitence
    ${Reboot_Value}    get Text    ${XPATH_COMPLETE_HISTORY_TABLE}
    Log   ${Reboot_Value}
    Should not contain      ${Reboot_Value}    Delta Provision

Verify Software Upgarde Value Change
    BuiltIn.Sleep  5s
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
    Click DMS Element    ${XPATH_Software_Upgarde_Value_Change_Row}
    BuiltIn.Sleep  5s
    ${SoftwareUpgarde_Value_Change}    get Text    ${XPATH_NEW_VALUE}
    Log   ${SoftwareUpgarde_Value_Change}
    should Contain   ${SoftwareUpgarde_Value_Change}    RP Software Version
    should Contain   ${SoftwareUpgarde_Value_Change}    6.0.00.064
