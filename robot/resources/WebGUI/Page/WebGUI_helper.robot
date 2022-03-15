*** Settings ***
Library             String
Variables           WebGUI_ui_controls.py
Resource           ../resources/device_history/device_history_page_keywords.robot


*** Variables ***

*** Keywords ***
Open Timing Source Page1
    ${open_page}=  Format String   ${DEVICE_TIMING_SOURCE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To  ${open_page}
    Wait Until Element Is Visible  ${XPATH_TIMING_SOURCE_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_TIMING_SOURCE_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Search Timing Parameter1
    [Documentation]     Search Timing Source parameter
    [Arguments]      ${Param}
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}    ${Param}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s


Select Timing Dropdown Option1
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


Update Timing Parameter1
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


Save DMS Timing Parameter1
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


Verify Timing Parameter configuration1
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
    Get Line Count    ${value}
    ${Line_value_5}=    Get Line   ${value}    5
    Log     ${Line_value_5}
    ${Line_value_8}=    Get Line   ${value}    8
    Log     ${Line_value_8}
    ${Line_value_11}=    Get Line   ${value}    11
    Log     ${Line_value_11}
    ${Line_value_14}=    Get Line   ${value}    14
    Log     ${Line_value_14}
    ${Line_value_17}=    Get Line   ${value}    17
    Log     ${Line_value_17}
    ${Line_value_20}=    Get Line   ${value}    20
    Log     ${Line_value_20}
    ${Line_value_23}=    Get Line   ${value}    23
    Log     ${Line_value_23}
    ${Line_value_26}=    Get Line   ${value}    26
    Log     ${Line_value_26}
    ${Line_value_29}=    Get Line   ${value}    29
    Log     ${Line_value_29}
    ${type string}=    Evaluate     type($value)
    Log To Console     ${type string}
    Should Be Equal   ${Line_value_5}      ${Latitude_Sign_TS}
    #Should Be Equal   ${Line_value_8}      ${Latitude_Degree}
    #Should Be Equal   ${Line_value_11}     ${Longitude_Degree}
    Should Be Equal   ${Line_value_14}     ${Direction_Altitude_TS}
    Should Be Equal   ${Line_value_17}     NA
    Should Be Equal   ${Line_value_20}     ${Uncertain_Semi_Major_TS}
    Should Be Equal   ${Line_value_23}     ${Uncertain_Semi_Minor_TS}
    Should Be Equal   ${Line_value_26}     ${Uncertain_Altitude_TS}
    Should Be Equal   ${Line_value_29}     ${Confidence_TS}

Search NTP Parameter1
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

Verify NTP Parameters1
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


Update GPS Teardown
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_NGPS_WEBGUI}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_WEGUI}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_LATITUDE_DROPDOWN}
    #BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_LATITUDE_WEGUI}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'north'   set variable   South
    ...  ELSE  set variable  North
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_LATITUDE_WEGUI}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  3s
    Clear Element Text     ${XPATH_DEGREE_OF_LATITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LATITUDE_WEBGUI}    ${Latitude_Degree_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_DEGREE_OF_LONGITUTE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LONGITUTE_WEBGUI}    ${Longitude_Degree_TS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_DROPDOWN}
    #BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'height'   set variable   Depth
    ...  ELSE  set variable  Height
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ALTITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ALTITUDE_WEBGUI}    ${Altitude_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAIN_ALTITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAIN_ALTITUDE_WEBGUI}    ${Uncertain_Altitude_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAIN_SEMI_MAJOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAIN_SEMI_MAJOR_WEBGUI}    ${Uncertain_Semi_Major_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_SEMI_MINOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_SEMI_MINOR_WEBGUI}    ${Uncertain_Semi_Minor_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ORIENTATION_MAJOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ORIENTATION_MAJOR_WEBGUI}    ${Orientation_of_Major_Axis_TS}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_CONFIDENCE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_CONFIDENCE_WEBGUI}    ${Confidence_TS}
    BuiltIn.Sleep  5s
    press keys    ${XPATH_CONFIDENCE_WEBGUI}      RETURN
    BuiltIn.Sleep  3s
    Scroll Element Into View  ${XPATH_LATITUDE_WEGUI}
    BuiltIn.Sleep  10s
    #press keys    ${XPATH_LATITUDE_WEGUI}      RETURN
    #BuiltIn.Sleep  3s
    Click DMS Element      ${XPATH_SAVE_BUTTON_ngps}
    BuiltIn.Sleep  10s


Update Nominal GPS values Webgui
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_NGPS_WEBGUI}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_WEGUI}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_LATITUDE_DROPDOWN}
    #BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_LATITUDE_WEGUI}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'north'   set variable   South
    ...  ELSE  set variable  North
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_LATITUDE_WEGUI}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  3s
    Clear Element Text     ${XPATH_DEGREE_OF_LATITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LATITUDE_WEBGUI}    ${Latitude_Degree_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_DEGREE_OF_LONGITUTE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LONGITUTE_WEBGUI}    ${Longitude_Degree_1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_DROPDOWN}
    #BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'height'   set variable   Depth
    ...  ELSE  set variable  Height
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_DIRECTION_OF_LATITUDE_WEBGUI}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ALTITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ALTITUDE_WEBGUI}    ${Altitude_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAIN_ALTITUDE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAIN_ALTITUDE_WEBGUI}    ${Uncertain_Altitude_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAIN_SEMI_MAJOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAIN_SEMI_MAJOR_WEBGUI}    ${Uncertain_Semi_Major_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_SEMI_MINOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_SEMI_MINOR_WEBGUI}    ${Uncertain_Semi_Minor_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ORIENTATION_MAJOR_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ORIENTATION_MAJOR_WEBGUI}    ${Orientation_of_Major_Axis_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_CONFIDENCE_WEBGUI}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_CONFIDENCE_WEBGUI}    ${Confidence_1}
    BuiltIn.Sleep  5s
    press keys    ${XPATH_CONFIDENCE_WEBGUI}      RETURN
    BuiltIn.Sleep  3s
    Scroll Element Into View  ${XPATH_LATITUDE_WEGUI}
    BuiltIn.Sleep  10s
    Click DMS Element      ${XPATH_SAVE_BUTTON_ngps}
    BuiltIn.Sleep  10s


Open WebGUI Console
    [Documentation]  Open WebGUI  page
    ${open_page}=  Format String   ${WEBUI_CONSOLE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    go to   ${open_page}
    BuiltIn.Sleep  10s
    Wait Until Page Contains Element  ${XPATH_WEBGUI_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Validate WebGUI Overridden Params
    Search WebGUI Parameter    eNodeB     Nominal GPS
    ${Value}       GET TEXT       ${XPATH_NOMINAL_GPS_TABLE}
    Log      ${Value}
    #should contain  ${Value}     Latitude Sign:
    #${Value_1}     Get Value      ${XPATH_Latitudesign_webgui}
    #should contain  ${Value_1}     ${Latitude_Sign_1}
    should contain  ${Value}     Degrees of Latitude:
    should contain  ${Value}     Degrees of Longitude:
    #should contain  ${Value}     Direction of Altitude:
    #${Value_2}     Get Value     ${XPATH_Direction_of_altitude_webgui}
    #should contain  ${Value_2}     ${Direction_Altitude_1}
    should contain  ${Value}     Altitude:
    ${Value_3}     Get Value     ${ALTITUDE}
    should contain  ${Value_3}     ${Altitude_1}
    should contain  ${Value}     Uncertain Semi-Major:
    ${Value_4}     Get Value     ${Uncertain_semi_major}
    should contain  ${Value_4}     ${Uncertain_Semi_Major_1}
    should contain  ${Value}     Uncertain Semi-Minor:
    ${Value_5}     Get Value     ${uncertain_semi_minor}
    should contain  ${Value_5}     ${Uncertain_Semi_Minor_1}
    #should contain  ${Value}     Uncertain Altitude:
    #${Value_6}     Get Value     ${uncertain_altitude}
    #should contain  ${Value_6}     ${Uncertain_Altitude_1}
    #should contain  ${Value}     OrientationOfMajorAxis
    #should contain  ${Value}     ${Orientation_of_Major_Axis_1}
    should contain  ${Value}     Confidence:
    ${Value_7}     Get Value     ${Confidence}
    should contain  ${Value_7}     ${Confidence_1}

Open Operational Param
    ${open_page}=  Format String   ${OPERATIONAL_PAGE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    go to   ${open_page}
    Wait Until Page Contains Element  ${XPATH_OPERATIONAL_PARAM}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Search Operational Parameter
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    ${sector_tab}=  Format String   ${XPATH_ORP_SECTOR_TAB}   sector=${sector}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${sector_tab}
    BuiltIn.Sleep  5s
    Click DMS Element  ${sector_tab}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
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



Search WebGUI Parameter
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
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
    ${sector_tab}=  Format String   ${XPATH_ORP_SECTOR_TAB}   sector=${sector}
    BuiltIn.Sleep  10s
    Click DMS Element  ${sector_tab}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XAPTH_EXPAND_COLLAPSE_BUTTON}
    BuiltIn.Sleep  5s
    #${collapse_expand_text}=  Get Text  ${XPATH_ORP_COLLAPSE_EXPAND_TEXT}
    #Run Keyword If  'Collapse All' in '''${collapse_expand_text}'''  Click DMS Element  ${ID_ORP_COLLAPSE_EXPAND_BUTTON}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_ExpandCollapse
    BuiltIn.Sleep  5s
    Click DMS Element  ${XAPTH_EXPAND_COLLAPSE_BUTTON}
    BuiltIn.Sleep  3s
    #${collapse_expand_text}=  Get Text  ${XPATH_ORP_COLLAPSE_EXPAND_TEXT}
    #Run Keyword If  'Expand All' in '''${collapse_expand_text}'''  Click DMS Element  ${ID_ORP_COLLAPSE_EXPAND_BUTTON}



Validate Operational Param NGPS Data
    Search Operational Parameter    eNodeB    Nominal GPS
    ${Value}       GET TEXT       ${XPATH_OPERATIONAL_TABLE}
    Log      ${Value}
    should contain  ${Value}     Latitude Sign
    should contain  ${Value}     ${Latitude_Sign_1}
    should contain  ${Value}     Degrees of Latitude
    should contain  ${Value}     Degrees of Longitude
    should contain  ${Value}     Direction of Altitude
    #should contain  ${Value}     ${Direction_Altitude_1}
    should contain  ${Value}     Altitude
    should contain  ${Value}     ${Altitude_1}
    should contain  ${Value}     Uncertain Semi-Major
    should contain  ${Value}     ${Uncertain_Semi_Major_1}
    should contain  ${Value}     Uncertain Semi-Minor
    should contain  ${Value}     ${Uncertain_Semi_Minor_1}
    should contain  ${Value}     Uncertain Altitude
    should contain  ${Value}     ${Uncertain_Altitude_1}
    #should contain  ${Value}     OrientationOfMajorAxis
    #should contain  ${Value}     ${Orientation_of_Major_Axis_1}
    should contain  ${Value}     Confidence
    should contain  ${Value}     ${Confidence_1}


Open Provision Data
    ${open_page}=  Format String   ${DEVICE_PROVSIONED_DATA_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    go to   ${open_page}
    Wait Until Page Contains Element  ${XPATH_PROVISIONED_DATA}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Validate Provision Data NGPS
    Search Operational Parameter    eNodeB    Nominal GPS
    ${Value}       GET TEXT       ${XPATH_GPS_TABLE}
    Log      ${Value}
    should contain  ${Value}     WebGUI
    Log      ${Value}
    should contain  ${Value}     Latitude Sign
    #should contain  ${Value}     ${Latitude_Sign_1}
    should contain  ${Value}     Degrees of Latitude
    should contain  ${Value}     Degrees of Longitude
    should contain  ${Value}     Direction of Altitude
    #should contain  ${Value}     ${Direction_Altitude_1}
    should contain  ${Value}     Altitude
    should contain  ${Value}     ${Altitude_1}
    should contain  ${Value}     Uncertain Semi-Major
    should contain  ${Value}     ${Uncertain_Semi_Major_1}
    should contain  ${Value}     Uncertain Semi-Minor
    should contain  ${Value}     ${Uncertain_Semi_Minor_1}
    #should contain  ${Value}     Uncertain Altitude
    #should contain  ${Value}     ${Uncertain_Altitude_1}
    #should contain  ${Value}     OrientationOfMajorAxis
    #should contain  ${Value}     ${Orientation_of_Major_Axis_1}
    should contain  ${Value}     Confidence
    should contain  ${Value}     ${Confidence_1}

Open Device History
    Open Device History Page

Validate Device History for NGPS
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category and Click on Show Button WEBGUI  ${event_type}

Open WebGUI whitelist Console
    [Documentation]  Open WebGUI whitelist Console
    go to   ${WEBUI_CONSOLE}
    BuiltIn.Sleep  30s
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

open and configure whitelist
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_WHITELIST_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_CANCEL_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_WHITELIST_TABLE_CHECKBOX}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DELETE_BUTTON_WEBUI}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_WHITELIST_ADD_BUTTON}
    BuiltIn.Sleep  5s
    INPUT DMS TEXT     ${XPATH_WHITELIST_ROW_ADD_SECTOR1}    ${WHITELIST_SECTOR1}
    BuiltIn.Sleep  5s
    INPUT DMS TEXT     ${XPATH_WHITELIST_ROW_ADD_SECTOR2}    ${WHITELIST_SECTOR2}
    BuiltIn.Sleep  5s
    press keys    ${XPATH_WHITELIST_ROW_ADD_SECTOR2}    RETURN
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_WHITELIST_TABLE_CHECKBOX}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_WHITELIST_SAVE}
    BuiltIn.Sleep  20s

Validate WebGUI Overridden Params Whitelist
    Search WebGUI Parameter    eNodeB    whitelist
    ${Value}       GET VALUE       ${XPATH_WHITELIST_TEXTBOX}
    Log      ${Value}
    #should contain  ${Value}     Device.FAP.X_0005B9_RUWhiteList
    #should contain  ${Value}     ${WHITELIST_SECTOR1};${WHITELIST_SECTOR2}


Validate Operational Param whitelist Data
    Search Operational Parameter    eNodeB    whitelist
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATh_SHOW_ADVANCE_OPTION}
    BuiltIn.Sleep  5s
    ${Value}       GET TEXT       ${XPATH_WHITELIST_OPERATIONAL_DATA}
    Log      ${Value}
    should contain  ${Value}     ${WHITELIST_SECTOR1}
    should contain  ${Value}     ${WHITELIST_SECTOR2}

Validate Provision Data whitelist
    Search Operational Parameter    eNodeB    whitelist
    ${Value}       GET TEXT       ${XPATH_WHITELIST_PROVISION_TABLE}
    Log      ${Value}
    should contain  ${Value}     WebGUI
    should contain  ${Value}     ${WHITELIST_SECTOR1};${WHITELIST_SECTOR2}


Validate Device History for whitelist
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category and Click on Show Button WEBGUI whitelist  ${event_type}

Delete overridden param
    #Input DMS Text       ${XPATH_INPUT_PRAM_WEBGUI}    whitelist
    #BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_DELETE_BUTTON_webgui_whiltelist}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  5s
    #Click DMS Element    ${XPATH_DELETE_BUTTON}
    #BuiltIn.Sleep  5s
    #Click DMS Element    ${DELETE_CONFIRM_BUTTON}

Delete overridden param Nominal GPS
    Search Operational Parameter    eNodeB   Nominal
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_LATITUDE_SIGN}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_DEGREE_OF_LATITUDE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_DEGREE_OF_LONGITUDE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_DIRECTION_OF_ALTITUDE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_ALTITUDE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_SEMI_MAJOR}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Scroll Element Into View     ${DELETE_SEMI_MINOR}
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_SEMI_MINOR}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Scroll Element Into View     ${DELETE_UNCERTAIN_ALTITUDE}
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_UNCERTAIN_ALTITUDE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Scroll Element Into View     ${DELETE_ORIENTATION_MAJOR_AXIS}
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_ORIENTATION_MAJOR_AXIS}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error    Scroll Element Into View     ${DELETE_CONFIDENCE}
    Run Keyword And Ignore Error    Click DMS Element    ${DELETE_CONFIDENCE}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${XPATH_SAVE_BUTTON}
    Click DMS Element    ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Click on WebGUI Acces
     BuiltIn.Sleep  5s
     Click DMS Element    ${XPATH_WEBGUI_LINK}
     BuiltIn.Sleep  10s
