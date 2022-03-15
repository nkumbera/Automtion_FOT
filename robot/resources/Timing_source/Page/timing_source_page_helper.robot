*** Settings ***
#Library             String
Variables           timing_source_ui_controls.py


*** Variables ***

*** Keywords ***
Open Timing Source Page
    ${open_page}=  Format String   ${DEVICE_TIMING_SOURCE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To  ${open_page}
    Wait Until Element Is Visible  ${XPATH_TIMING_SOURCE_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_TIMING_SOURCE_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Search Timing Parameter
    [Documentation]     Search Timing Source parameter
    [Arguments]      ${Param}
    BuiltIn.Sleep  7s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}    ${Param}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s


Select Timing Dropdown Option
    [Documentation]  Select time option from the given list in filter frame
    [Arguments]   ${dropdown_xpath}  ${option}
    ${list_button}=  Catenate  ${dropdown_xpath}  /following::div
    BuiltIn.Sleep  3s
    Click DMS Element  ${list_button}
    BuiltIn.Sleep  3s
    ${option_output}=  Format String   ${XPATH_DMS_DROPDOWN_OPTION_LISTITEM}   option=${option}
    BuiltIn.Sleep  5s
    ${item_present}=  Run Keyword And Return Status  Element Should Be Visible  ${option_output}
    BuiltIn.Sleep  5s
    ${next_page_present}=  Run Keyword And Return Status  Element Should Be Visible  ${XPATH_Timing_DROPDOWN_LIST_NEXT_BUTTON}
    BuiltIn.Sleep  5s
    Run Keyword If  ${item_present}  Run Keywords     BuiltIn.Sleep  5s  AND    Click DMS Element  ${option_output}
    ...  ELSE  Run Keywords  Mouse Over  ${XPATH_Timing_DROPDOWN_LIST_NEXT_BUTTON}  AND  Click DMS Element  ${XPATH_Timing_DROPDOWN_LIST_NEXT_BUTTON}  AND  Click DMS Element  ${option_output}
    BuiltIn.Sleep  5s
    Log  ${option} option is selected


Update Timing Parameter
    [Documentation]     Timing Overriden Parameter
    [Arguments]    ${section}    ${param_type}   ${param_list}
    #Search Timing Parameter  ${Param}
    BuiltIn.Sleep   2s
    ${param_type}=  Convert To Upper Case  ${param_type}
    BuiltIn.Sleep   2s
    ${param_xpath}=  Run Keyword If  '${param_type}' == 'SCALAR'  Set Variable  ${XPATH_ORP_SCALAR_PARAM_INPUT}
    ...     ELSE IF  '${param_type}' == 'TABULAR'  Set Variable  ${XPATH_ORP_TABULAR_PARAM_INPUT}
    Run Keyword If  '${param_type}' == 'TABULAR'  Add New Tabular Param List Row  ${section}
    BuiltIn.Sleep   2s
    FOR    ${key}    IN    @{param_list}
        ${value}=    Get From Dictionary    ${param_list}    ${key}
        BuiltIn.Sleep   2s
        #${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        ${overridden_param_xpath}=  Format String   ${param_xpath}  section=${section}    overridden_param=${key}
        BuiltIn.Sleep   2s
        #Set Focus To Element  ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${attr_value}=  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${list_button}=  Catenate  ${overridden_param_xpath}  /following::div
        BuiltIn.Sleep   2s
        Set Focus To Element  ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   2s
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select Timing Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   5s
        Press Keys  ${overridden_param_xpath}  TAB
        #Clear Element Text  ${overridden_param_xpath}
        #Set Focus To Element  ${overridden_param_xpat
        #Input Text  ${overridden_param_xpath}  ${value}
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   1s
    END


Save DMS Timing Parameter
    [Documentation]  Save DMS overridden parameters
    BuiltIn.Sleep   2s
    Set Focus To Element  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    BuiltIn.Sleep   3s


Verify Timing Parameter configuration
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    #Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    #BuiltIn.Sleep  5s
    #Input Text  ${RP_PROV_PAGE_SEARCH_TEXTFIELD}  PLMN
    #Click DMS Element    ${RP_PROV_PAGE_SEARCH_BUTTON}
    ${value}          GET TEXT         ${GPS_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    #Get From List    ${value}    16
    #Get Line Count    ${value}
    #${Line_value_5}=    Get Line   ${value}    5
    #Log     ${Line_value_5}
    #${Line_value_8}=    Get Line   ${value}    8
    #Log     ${Line_value_8}
    #${Line_value_11}=    Get Line   ${value}    11
    #Log     ${Line_value_11}
    #${Line_value_14}=    Get Line   ${value}    14
    #Log     ${Line_value_14}
    #${Line_value_17}=    Get Line   ${value}    17
    #Log     ${Line_value_17}
    #${Line_value_20}=    Get Line   ${value}    20
    #Log     ${Line_value_20}
    #${Line_value_23}=    Get Line   ${value}    23
    #Log     ${Line_value_23}
    #${Line_value_26}=    Get Line   ${value}    26
    #Log     ${Line_value_26}
    #${Line_value_29}=    Get Line   ${value}    29
    #Log     ${Line_value_29}
    #${Line_value_32}=    Get Line   ${value}    32
    #Log     ${Line_value_32}
    #${type string}=    Evaluate     type($value)
    #Log To Console     ${type string}
    #Should Be Equal   ${Line_value_5}      ${Latitude_Sign_TS}
    #Should Be Equal   ${Line_value_8}      ${Latitude_Degree}
    #Should Be Equal   ${Line_value_11}     ${Longitude_Degree}
    #Should Be Equal   ${Line_value_14}     ${Direction_Altitude_TS}
    #Should Be Equal   ${Line_value_17}     NA
    #Should Be Equal   ${Line_value_20}     ${Uncertain_Semi_Major_TS}
    #Should Be Equal   ${Line_value_23}     ${Uncertain_Semi_Minor_TS}
    #Should Be Equal   ${Line_value_26}     ${Uncertain_Altitude_TS}
    #Should Be Equal   ${Line_value_29}     ${Orientation_of_Major_Axis_TS}
    #Should Be Equal   ${Line_value_32}     ${Confidence_TS}
    Should Contain     ${value}     ${Latitude_Sign_TS}
    Should Contain     ${value}     ${Direction_Altitude_TS}
    Should Contain     ${value}     ${Uncertain_Semi_Major_TS}
    Should Contain     ${value}     ${Uncertain_Semi_Minor_TS}
    Should Contain     ${value}     ${Uncertain_Altitude_TS}
    Should Contain     ${value}     ${Orientation_of_Major_Axis_TS}
    Should Contain     ${value}     ${Confidence_TS}


Search NTP Parameter
    [Documentation]     Search Timing Source parameter
    [Arguments]      ${Param}
    Search Timing Parameter    ${Param}
    BuiltIn.Sleep  5s
    Click DMS Element  ${NTP_SERVER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${NTP_SERVER_COMBO}
    BuiltIn.Sleep  5s
    ${Select_value}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${Select_value}' == 'GPS'   set variable   NTP
    ...  ELSE  set variable  NTP
    Log  Setting Value to ${Select_value}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${NTP_SERVER_BOX}
    BuiltIn.Sleep  5s
    Click DMS Element  ${NTP_SERVER_BOX}
    BuiltIn.Sleep  5s

Verify NTP Parameters
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${NTP_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    Should Contain     ${value}     ${NTP_Server_1}
    Should Contain     ${value}     ${NTP_Server_2}
    Should Contain     ${value}     ${NTP_Server_3}
    Should Contain     ${value}     ${NTP_Server_4}
    Should Contain     ${value}     ${NTP_Server_5}


Save Timing Parameter
    [Documentation]  Save DMS overridden parameters
    BuiltIn.Sleep   2s
    Set Focus To Element  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   3s
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_TIMING_PARAM_SAVE_BUTTON}
    #wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    #Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    #BuiltIn.Sleep   3s

#Validate WebGUI Overridden Params Nominal GPS
#    ${Value}       GET TEXT       ${XPATH_WEBGUI_OVERRIDDEN_TABLE}
#    Log      ${Value}
#    should contain  ${Value}     Device.FAP.X_0005B9_RUWhiteList