*** Settings ***
Library  String
Variables  rp_params_ui_controls.py
Resource  ../../common/ui_common.robot
Variables  ../testdata/RP_testdata.py
*** Variables ***
${value_to_set}
${rows}


*** Keywords ***
Open Operational RP Params
    [Documentation]  Open Operational PR Params Page
    ${open_page}=  Format String   ${DEVICE_RP_PARAMS_PAGE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open PR Dashboard
    [Documentation]  Open Page PR Dashboard
    ${open_page}=  Format String   ${PR_DASHBOARD_PAGE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Page Contains Element  //div[@id='DC_RP Dashboard_Header']   timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open Webgui overridden RP Param
    [Documentation]  Open Webgui overridden RP Param Page
    ${open_page}=  Format String   ${RP_WEBGUI_OVERRIDDEN_PARAM}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_WEBGUI_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_WEBGUI_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Verify PR Dashboard PR2000 Text
    [Documentation]  Open and verify the PR2000 images
    #${xpath_image}=  Format String  ${XPATH_RP2000_IMAGE}  image=RP2100-cgrp-Outdoor-icon

    #${xpath_image}=  Format String  ${XPATH_RP2000_IMAGE}  image=RP2000-cgrp-Indoor-icon
    #Wait Until Page Contains Element  ${xpath_image}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #${xpath_image}=  Format String  ${XPATH_RP2000_IMAGE}  image=green-btm-left
    #Wait Until Page Contains Element  ${xpath_image}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_RP2000_Summary_Text}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${Text}     Get DMS Element Text      ${XPATH_RP2000_Summary_Text}
    Run Keyword And Ignore Error     Should Contain    ${Text}    0005B9-LTE_Enterprise_C-RANSC_Radio




Open Overridden RP Params
    [Documentation]  Open Overridden PR Params Page
    ${open_page}=  Format String   ${DEVICE_RP_OVERRIDDEN_PARAM}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_RP_OVERRIDDEN_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_RP_OVERRIDDEN_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open RP Provisioned Data
    [Documentation]  Open RP Provisioned Data Page
    ${open_page}=  Format String   ${DEVICE_RP_PROVSIONED_DATA}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_RP_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_RP_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s


Enclosure Type Appy Filter
    [Documentation]  Apply filter with the given Enclosure type

    #Execute JavaScript    window.scrollTo(0, 700)
    Scroll Element Into View    ${END_OF_RP_TABLE}
    Scroll Element Into View    ${RP_ENCLOSURE_TYPE}
    #Set Focus To Element    ${RP_MAPPING_TAB}
    Set Focus To Element    ${RP_ENCLOSURE_TYPE}
    BuiltIn.Sleep  5s
    #${List}    Select All From List    ${RP_ENCLOSURE_TYPE}
    #Log    ${List}
    Clear Element Text  ${RP_ENCLOSURE_TYPE}
    #Select From List By Value    ${ENCLOSURE_DROP_DOWN}     ${Enclosure_Value}
    Click DMS Element  ${RP_ENCLOSURE_TYPE}
    BuiltIn.Sleep  5s
    #Click DMS Element    ${ENCLOSURE_DROP_DOWN}
    Press Keys    ${RP_ENCLOSURE_TYPE}    DOWN
    #Select From List By Value    ${RP_ENCLOSURE_TYPE}     ${Enclosure_Value}
    #Input Text  ${RP_ENCLOSURE_TYPE}  ${Enclosure_Value}
    BuiltIn.Sleep  5s
    #Press Keys    ${RP_ENCLOSURE_TYPE}    DOWN
    Press Keys    ${LIST_ITEM}      ENTER
    #Click DMS Element    ${RP_ENCLOSURE_TYPE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${RP_OVERRIDDEN_PARAM_APPLY_FILTER}
    BuiltIn.Sleep  5s

Verify Enclosure Type
    [Documentation]  Verify Enclosure Type
    ${Entry_value}       GET TEXT      ${GET_TABLE_ENTRY_INFO}
    Log        ${Entry_value}
    Scroll Element Into View    ${END_OF_RP_TABLE}
    Scroll Element Into View    ${RP_ENCLOSURE_TYPE}
    #Get Table Row Count    ${XPATH_TABLE}
    Set Focus To Element    ${RP_ENCLOSURE_TYPE}
    Set Focus To Element    ${XPATH_RP_COLUMN}
    #${Enclosure_value}       GET VALUE            ${XPATH_RP_COLUMN_TX_POWER}
    #${Enclosure_value}       GET TEXT          ${XPATH_TABLE}
    #${Enclosure_value}       GET VALUE          ${XATH_RP_ID}
    ${Enclosure_value}       GET TEXT          ${XAPTH_TABLE_BODY}
    ${Lines}                 Get Lines Containing String     ${Enclosure_value}    Indoor
    Log                     ${Lines}
    ${Enclosure_value}       GET TEXT          ${GET_ENCLOSURE_VALUE}
    #${result}=       evaluate            re.search(r'\\d+', '''${Entry_value}''').group(1)             re
    ${Entry_result}=       evaluate            re.search(r'Showing (\\d+) to (\\d+) of (\\d+) entries', '''${Entry_value}''').group(2)          re
    ${Line_count}             Get Line Count        ${Lines}
    ${Entry_result}=        Convert To Integer         ${Entry_result}
    Should Be Equal   ${Entry_result}      ${Line_count}



Check Location value present
    BuiltIn.Sleep  5s
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_PR_MAPPING_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    ${value}         GET TEXT              ${XPATH_PROVISIONED_DATA_TABLE}
    Log              ${value}
    ${RP_Location_value}         GET TEXT              ${XPATH_RP_COLUMN_LOCATION}
    Log              ${RP_Location_value}
    Set Global Variable      ${RP_Location_value}

Edit Attribute Location
    Scroll Element Into View    ${END_OF_RP_TABLE}
    Scroll Element Into View    ${XPATH_EDIT_ATTRIBUTE}
    Wait Until Element Is Visible        ${XPATH_EDIT_ATTRIBUTE}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_EDIT_ATTRIBUTE}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible        ${ALL_AP_RADIO_BUTTON}
    Click DMS Element     ${ALL_AP_RADIO_BUTTON}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible        ${XPATH_RP_LOCATION_CHECKBOX}
    Click DMS Element     ${XPATH_RP_LOCATION_CHECKBOX}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible        ${XPATH_RP_LOCATION_INPUT_TEXT_BOX}
    #${present_text_value}=  Get Text  ${XPATH_RP_COLUMN_LOCATION}
    #Log  Value is ${present_text_value}
    ${value_to_set_location}=  RUN KEYWORD IF  '${RP_Location_value}' == "Belandur"   set variable   Bangalore
    ...  ELSE  set variable  Belandur
    Log  Setting Value to ${value_to_set_location}
    Set Global Variable      ${value_to_set_location}
    Input Text           ${XPATH_RP_LOCATION_INPUT_TEXT_BOX}      ${value_to_set_location}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_SAVE_BUTTON}
    Wait Until Element Is Visible       ${XAPTH_SAVE_MESSAGE}
    ${value}          GET TEXT         ${XAPTH_SAVE_MESSAGE}
    #Should Be Equal   ${SAVE_VALUE}      ${value}
    Run Keyword If  '${value}' == '${NEW_SAVE_VALUE}' or '${value}' == '${EXISTING_SAVE_VALUE}'    log to console  executed with multiple or

Check RP value present
    BuiltIn.Sleep  5s
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_PR_MAPPING_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    ${value}         GET TEXT              ${XPATH_PROVISIONED_DATA_TABLE}
    Log              ${value}
    ${RP_Tx_value}         GET TEXT              ${XPATH_RP_COLUMN_TX_POWER}
    Log              ${RP_Tx_value}
    Set Global Variable      ${RP_Tx_value}

Edit Attribute RP Tx Power
    Scroll Element Into View    ${END_OF_RP_TABLE}
    Scroll Element Into View    ${XPATH_EDIT_ATTRIBUTE}
    Click DMS Element     ${XPATH_EDIT_ATTRIBUTE}
    BuiltIn.Sleep  5s
    Click DMS Element     ${ALL_AP_RADIO_BUTTON}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible        ${XPATH_RP_TX_POWER_CHECKBOX}
    Click DMS Element     ${XPATH_RP_TX_POWER_CHECKBOX}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible        ${XPATH_RP_TXPOWER_INPUT_TEXT_BOX}
    ${value_to_set}=  RUN KEYWORD IF  '${RP_Tx_value}' == '15'   set variable   14
    ...  ELSE  set variable  15
    Log  Setting Value to ${value_to_set}
    Set Global Variable      ${value_to_set}
    BuiltIn.Sleep  2s
    Input Text           ${XPATH_RP_TXPOWER_INPUT_TEXT_BOX}      ${value_to_set}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible       ${XAPTH_SAVE_MESSAGE}
    ${value}          GET TEXT         ${XAPTH_SAVE_MESSAGE}
    #Should Be Equal   ${SAVE_VALUE}      ${value}
    Run Keyword If  '${value}' == '${NEW_SAVE_VALUE}' or '${value}' == '${EXISTING_SAVE_VALUE}'    log to console  executed with multiple or


Update AutoTx Power
    BuiltIn.Sleep  5s
    Click DMS Element  ${AUto_Tx_Power_Filter_Box}
    BuiltIn.Sleep  3s
    Click DMS Element  ${AUto_Tx_Power_Filter_Box_DropDown}
    BuiltIn.Sleep  3s
    ${true_false}=  Get Value  ${XPATH_Auto_Tx_Power_VALUE_TO_GET}
    BuiltIn.Sleep  3s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   set variable   FALSE
    ...  ELSE  set variable  TRUE
    Log  Setting Value to ${true_false}
    BuiltIn.Sleep  2s
    ${xpath_string} =  Format String   ${XPATH_Auto_Tx_Power_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XAPTH_OVERRIDDEN_SAVE_BUTTON}
    Wait Until Element Is Enabled  ${AUto_Tx_Power_Filter_Box}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible       ${XAPTH_SAVE_MESSAGE}
    ${value}          GET TEXT         ${XAPTH_SAVE_MESSAGE}
    #Should Be Equal   ${SAVE_VALUE}      ${value}
    Run Keyword If  '${value}' == '${NEW_SAVE_VALUE}' or '${value}' == '${EXISTING_SAVE_VALUE}'    log to console  executed with multiple or
    Set Global Variable      ${value_to_set}
    [Return]  ${value_to_set}

Verify Location Value

    BuiltIn.Sleep  5s
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_PR_MAPPING_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    ${value}         GET TEXT              ${XPATH_PROVISIONED_DATA_TABLE}
    Log              ${value}
    ${value}         GET TEXT              ${XPATH_RP_COLUMN_LOCATION}

    Log              ${value}
    #${value}          GET TEXT         ${XPATH_RP_COLUMN_LOCATION}
    Should Be Equal   ${value}      ${value_to_set_location}



Verify RP TX Power Value

    BuiltIn.Sleep  5s
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_PR_MAPPING_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    ${value}         GET TEXT              ${XPATH_PROVISIONED_DATA_TABLE}
    Log              ${value}
    ${value}         GET TEXT              ${XPATH_RP_COLUMN_TX_POWER}
    Log              ${value}
    #${value}          GET TEXT         ${XPATH_RP_COLUMN_TX_POWER}
    Should Be Equal   ${value}      ${value_to_set}

Verify Auto Tx Power Provisioned
    BuiltIn.Sleep  5s
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${RP_PROV_PAGE_SEARCH_TEXTFIELD}  Auto Tx Power
    BuiltIn.Sleep  5s
    Click DMS Element    ${RP_PROV_PAGE_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    #Wait Until Keyword Succeeds    5s    GET TEXT         ${PROV_DATA_PAGE_AUTO_TX_POWER_VALUE}
    ${value}          GET TEXT         ${PROV_DATA_PAGE_AUTO_TX_POWER_VALUE}
    Log          ${value_to_set}
    Should Be Equal   ${value_to_set}      ${value}


Edit RP Params
     BuiltIn.Sleep  5s
     Scroll Element Into View    ${END_OF_RP_TABLE}
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_PR_IDENTIFIER}    ${RP_MAC_ADDRESS}
     BuiltIn.Sleep  5s
     Click DMS Element     ${XPATH_FILTER_APPLY_BUTTON}
     BuiltIn.Sleep  5s
     Scroll Element Into View    ${RP_EDIT_BUTTON}
     BuiltIn.Sleep  5s
     Click DMS Element     ${RP_EDIT_BUTTON}

Update GPS Configuration
    BuiltIn.Sleep  5s
    #Wait Until Element Is Visible  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Wait Until Page Contains Element  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element     ${RP_MAPPING_GPS_CONFIGURATION}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_SIGN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_DROPDOWN}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'North'   set variable   North
    ...  ELSE  set variable  North
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  3s
    Clear Element Text     ${XPATH_DEGREE_OF_LATITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LATITUDE}    ${Latitude_Degree}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_DEGREE_OF_LONGITUTE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LONGITUTE}    ${Longitude_Degree}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_DROPDOWN}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'Height'   set variable   Height
    ...  ELSE  set variable  Height
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ALTITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ALTITUDE}    ${Altitude}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINTY_ALTITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINTY_ALTITUDE}    ${Uncertain_Altitude}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINITY_SEMI_MAJOR}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINITY_SEMI_MAJOR}    ${Uncertain_Semi_Major}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINITY_SEMI_MINOR}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINITY_SEMI_MINOR}    ${Uncertain_Semi_Minor}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ORIENTATION}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ORIENTATION}    ${Orientation_of_Major_Axis}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_CONFIDENCE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_CONFIDENCE}    ${Confidence}
    BuiltIn.Sleep  5s


Update GPS Configuration Teardown
    BuiltIn.Sleep  5s
    #Wait Until Element Is Visible  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Wait Until Page Contains Element  ${XPATH_RP_PARAMS_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element     ${RP_MAPPING_GPS_CONFIGURATION}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_SIGN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_LATITUDE_DROPDOWN}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'North'   set variable   South
    ...  ELSE  set variable  North
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  3s
    Clear Element Text     ${XPATH_DEGREE_OF_LATITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LATITUDE}    ${Latitude_Degree_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_DEGREE_OF_LONGITUTE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_DEGREE_OF_LONGITUTE}    ${Longitude_Degree_1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DIRECTION_OF_LATITUDE_DROPDOWN}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'Height'   set variable   Depth
    ...  ELSE  set variable  Height
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ALTITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ALTITUDE}    ${Altitude_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINTY_ALTITUDE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINTY_ALTITUDE}    ${Uncertain_Altitude_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINITY_SEMI_MAJOR}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINITY_SEMI_MAJOR}    ${Uncertain_Semi_Major_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_UNCERTAINITY_SEMI_MINOR}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_UNCERTAINITY_SEMI_MINOR}    ${Uncertain_Semi_Minor_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_ORIENTATION}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_ORIENTATION}    ${Orientation_of_Major_Axis_1}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_CONFIDENCE}
    BuiltIn.Sleep  3s
    Input Text     ${XPATH_CONFIDENCE}    ${Confidence_1}
    BuiltIn.Sleep  5s


Save GPS Configuration
  BuiltIn.Sleep  5s
  Click DMS Element  ${XPATH_RUMAPPING_SAVE}

Verify GPS configuration Parameter
  BuiltIn.Sleep  5s
  Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
  Click DMS Element     ${COLLAPSE_EXPAND_ALL_BUTTON}
  BuiltIn.Sleep  5s
  Input Text  ${RP_PROV_PAGE_SEARCH_TEXTFIELD}  ${RP_MAC_ADDRESS}
  BuiltIn.Sleep  5s
  Click DMS Element    ${RP_PROV_PAGE_SEARCH_BUTTON}
  BuiltIn.Sleep  5s
  ${rows} =      get element count   ${RP_PROVISIONTABLE}
  Log    ${rows}
  ${value}          GET TEXT         ${RP_PROVISIONTABLE}
  Log          ${value}
  #Should Contain     ${value}     ${Latitude_Sign}
  #Should Contain     ${value}     ${Direction_Altitude}
  Should Contain     ${value}     ${Uncertain_Semi_Major}
  Should Contain     ${value}     ${Uncertain_Semi_Minor}
  Should Contain     ${value}     ${Uncertain_Altitude}
  Should Contain     ${value}     ${Orientation_of_Major_Axis}
  Should Contain     ${value}     ${Confidence}
  #${type}=     Evaluate      type($RP_PROVISIONTABLE)
  #Log          ${type}
  #${lines}       Get Lines Containing String  ${RP_PROVISION_TABLE}  ${RP_MAC_ADDRESS}
  #Log          ${lines}
  #${value}          GET Table Row Count         ${RP_PROVISION_TABLE}
  #${List_count}    Get Index From List       ${RP_PROVISION_TABLE}    ${RP_MAC_ADDRESS}
  #Log          ${List_count}
  #Log          ${value}
  #Should Be Equal   ${value_to_set}      ${value}

Delete RP Webgui Location Parameter
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${Location_param}
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE}
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE_CONFIRM}

Delete RP Webgui Tx_power Parameter
   BuiltIn.Sleep  10s
   Run Keyword And Ignore Error    Click DMS Element     ${Tx_power_param}
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE}
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE_CONFIRM}

Delete RP Webgui Nominal GPS Parameter
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Deployment_type_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Deployment_type_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Installation_type_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Installation_type_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Latitude_sign_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Latitude_sign_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Degree_of_latitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Degree_of_latitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Degree_of_longitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Degree_of_longitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Direction_of_altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Direction_of_altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${semi_major_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${semi_major_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${semi_minor_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${semi_minor_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${uncertain_altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${uncertain_altitude_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${confidence_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${confidence_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Scroll Element Into View    ${Orientation_of_major_axis_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${Orientation_of_major_axis_xpath}
   BuiltIn.Sleep  2s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE}
   BuiltIn.Sleep  5s
   Run Keyword And Ignore Error    Click DMS Element     ${RP_WEBGUI_DELETE_CONFIRM}