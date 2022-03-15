*** Settings ***
#Library             String
#Variables           ServiceSetting_ui_controls.py
Variables           ../testdata/NetworkConsole_testdata.py
#Library             String
Variables           NetworkConsole_ui_controls.py
#Variables           ../testdata/Import_testdata.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${NETCONF_FILE_LOCATION}


*** Keywords ***
Login Service Package
    go to   ${NETWORK_CONSOLE_SERVICE_PACKAGE}
    Wait Until Page Contains Element  ${Service_Package_Label}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Edit CU Package
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${Service_Package_CU_Edit_Button}
    BuiltIn.Sleep  5s
    click dms element    ${Service_Package_CU_Edit_Button}
    BuiltIn.Sleep  5s


Edit DU Package
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${Service_Package_DU_Edit_Button}
    BuiltIn.Sleep  5s
    click dms element    ${Service_Package_DU_Edit_Button}
    BuiltIn.Sleep  5s


Search Service Package Parameter
    [Documentation]     Search DMS overridden parameter in respective sector
    #[Arguments]     ${sector}  ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ServicePackage_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ServicePackage_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ServicePackage_SEARCH_INPUT}   ${Heart_Beat}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ServicePackage_SEARCH_BUTTON}
    BuiltIn.Sleep  5s


Disable and Generate Alarm
    #[Arguments]     ${value}
    Scroll Element Into View    ${Raise_alarm_combo}
    BuiltIn.Sleep  5s
    #click dms element    ${Service_Package_Edit_Button}
    ${true_false}=  Get Value  ${XPATH_INPUT_COMBO}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'true'   set variable   false
    ...  ELSE  set variable  true
    Log  Setting Value to ${value_to_set}
    #${xpath_string} =  Format String   ${XPATH_INPUT_COMBO}  value=${value_to_set}
    #Log   Xpath ${xpath_string}
    Click DMS Element  ${COMBO_LIST}
    #Wait Until Element Is Not Visible   ${COMBO_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${COMBOX_VALUE_FALSE}
    #Wait Until Element Is Not Visible   ${COMBOX_VALUE_TRUE}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Enable and Clear Alarm
    Scroll Element Into View    ${Raise_alarm_combo}
    BuiltIn.Sleep  5s
    #click dms element    ${Service_Package_Edit_Button}
    ${true_false}=  Get Value  ${XPATH_INPUT_COMBO}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'true'   set variable   false
    ...  ELSE  set variable  true
    Log  Setting Value to ${value_to_set}
    #${xpath_string} =  Format String   ${XPATH_INPUT_COMBO}  value=${value_to_set}
    #Log   Xpath ${xpath_string}
    Click DMS Element  ${COMBO_LIST}
    #Wait Until Element Is Not Visible   ${COMBO_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${COMBOX_VALUE_TRUE}
    #Wait Until Element Is Not Visible   ${COMBOX_VALUE_TRUE}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Disable and Generate Alarm CU_UP
    #[Arguments]     ${value}
    Scroll Element Into View    ${Raise_alarm_combo}
    BuiltIn.Sleep  5s
    #click dms element    ${Service_Package_Edit_Button}
    ${true_false}=  Get Value  ${XPATH_INPUT_COMBO}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'true'   set variable   false
    ...  ELSE  set variable  true
    Log  Setting Value to ${value_to_set}
    #${xpath_string} =  Format String   ${XPATH_INPUT_COMBO}  value=${value_to_set}
    #Log   Xpath ${xpath_string}
    Click DMS Element  ${XPATH_CUUP_COMBO}
    #Wait Until Element Is Not Visible   ${COMBO_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${COMBOX_VALUE_FALSE}
    #Wait Until Element Is Not Visible   ${COMBOX_VALUE_TRUE}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Enable and Clear Alarm CU_UP
    Scroll Element Into View    ${Raise_alarm_combo}
    BuiltIn.Sleep  5s
    #click dms element    ${Service_Package_Edit_Button}
    ${true_false}=  Get Value  ${XPATH_INPUT_COMBO}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'true'   set variable   false
    ...  ELSE  set variable  true
    Log  Setting Value to ${value_to_set}
    #${xpath_string} =  Format String   ${XPATH_INPUT_COMBO}  value=${value_to_set}
    #Log   Xpath ${xpath_string}
    Click DMS Element  ${XPATH_CUUP_COMBO}
    #Wait Until Element Is Not Visible   ${COMBO_LIST}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${COMBOX_VALUE_TRUE}
    #Wait Until Element Is Not Visible   ${COMBOX_VALUE_TRUE}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Save Service Package Changes
    BuiltIn.Sleep  5s
    Click DMS Element    ${VIEW_PROFILE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element    ${SERVICE_PACKAGE_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Open System Alaram
    [Documentation]  Open Alarms Page
    go to   ${NETWORK_CONSOLE_SYSTEM_ALARM_PAGE}
    #Wait Until Page Contains Element  ${DEVICE_FILE_IMPORT}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Clear All Alarms Generated on Device
    [Arguments]    ${device_mac}
    BuiltIn.Sleep  10s
    Input Text    ${XPATH_SPECIFIC_PROBLEM}    ${device_mac}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_APPLY_FILTER}
    Click DMS Element    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_HEADER_CHECKBOX}
    Click DMS Element    ${XPATH_HEADER_CHECKBOX}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Scroll Element Into View    ${XPATH_DELETE_BUTTON}
    Run Keyword And Ignore Error     Click DMS Element    ${XPATH_DELETE_BUTTON}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element  ${XPATH_DELETE_CONFIRM}

Verify Alarm not to be present
    [Arguments]    ${device_mac}
    BuiltIn.Sleep  10s
    Input Text    ${XPATH_SPECIFIC_PROBLEM}    ${device_mac}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    ${value}    Get Text     ${XPATH_GET_DATA_ROW1}
    BuiltIn.Sleep  5s
    Should Contain     ${value}           No alarms found


Verify Alarm to be present
    [Arguments]    ${device_mac}
    BuiltIn.Sleep  10s
    Input Text    ${XPATH_SPECIFIC_PROBLEM}    ${device_mac}
    BuiltIn.Sleep  10s
    Scroll Element Into View    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    ${value}    Get Text     ${XPATH_GET_DATA_ROW1}
    BuiltIn.Sleep  10s
    Should Contain     ${value}           CRITICAL

VERIFY HEARTBEAT LABEL
    BuiltIn.Sleep  5s
    ${value}    Get Text     ${XPATH_HEART_BEAT_LABEL}
    BuiltIn.Sleep  5s
    Should Contain     ${value}           Critical


Click on License
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_CONGFIRM_BUTTON}
    BuiltIn.Sleep  5ss



Verify FAILURE Alarm to be present
    [Arguments]    ${device_mac}     ${EVENT_TYPE}
    BuiltIn.Sleep  10s
    Input Text    ${XPATH_SPECIFIC_PROBLEM}    ${device_mac}
    BuiltIn.Sleep  10s
    Scroll Element Into View    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    Input Text    ${XPATH_Event_Type}    ${EVENT_TYPE}
    BuiltIn.Sleep  10s
    Scroll Element Into View    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  10s
    ${value}    Get Text     ${XPATH_GET_DATA_ROW1}
    BuiltIn.Sleep  10s
    Should Contain     ${value}           MAJOR
     ${value}    Get Text     ${XPATH_TEXT}
    BuiltIn.Sleep  10s
    Should Contain     ${value}           ${EVENT_TYPE}

Verify Netconf Status
    [Arguments]    ${Netconf_status}
    ${Netconf_value}     Get Text     ${XPATH_NETCONF_TEXT}
    should match    ${Netconf_value}    ${Netconf_status}

