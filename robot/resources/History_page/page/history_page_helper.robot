*** Settings ***
Library             String
Variables           robot\resources\dashboard\page\device_dashboard_ui_controls.py
Variables           history_ui_controls.py
*** Variables ***

*** Keywords ***
Dashboard Device History Status
    [Documentation]  Check the Device History
    Log  Check Dashboard Device History content
    Click DMS Element   ${XPATH_HISTORY_MENU}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HISTORY_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_HISTORY_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HISTORY_CHARTS}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HISTORY_CHARTS}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HISTORY_TABULAR}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HISTORY_TABULAR}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Select view of Maxmium Items Per Page
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

Check for Netconf Provisioning Item
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_Netconf_ROW}
    BuiltIn.Sleep  5s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Netconf Provisioning Response
     BuiltIn.Sleep  5s
    #Log  ${event_type} event type is selected and respected result is shown
    Click DMS Element    ${XPATH_Netconf_ROW}
     BuiltIn.Sleep  10s
    ${Value}=     get text    ${XPATH_NEW_VALUE}
    Log    ${Value}
    #should contain      ${Device_history_table}     Device Reachability
    should contain  ${Value}     Failed
    should contain   ${Value}     Provision failed due to AcsIfException while performing provision

	
	
