*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Variables           overwrite_params_ui_controls.py
Resource           ../resources/device_history/device_history_page_keywords.robot

*** Variables ***


*** Keywords ***
Open Overridden Params Page
    [Documentation]  Open Overridden Paramas page
    ${open_page}=  Format String   ${DEVICE_OVERWRRIDDEN_PARAMETER}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

Open gNB Overridden Params Page
    [Documentation]  Open Overridden Paramas page
    [arguments]    ${OVERRIDDEN_PARAM_URL}
    #${DEVICE_MACID}      'bulkcomm-8001cuup1'
    ${open_page}=  Format String   ${OVERRIDDEN_PARAM_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

Update Carrier Aggregation Downlink
    [Documentation]  Update Carrier Aggregration
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_FILTER_DROPDOWN_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   set variable   FALSE
    ...  ELSE  set variable  TRUE
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    Wait Until Element Is Enabled  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    [Return]  ${value_to_set}

Add New Tabular Param List Row
    [Documentation]    Delete existing rows in under respective section and add new row
    [Arguments]     ${section}
    ${delete_list_button_xpath}=  Format String   ${XPATH_ORP_TABULAR_PARAM_DELETE_LIST_BUTTON}   section=${section}
    BuiltIn.Sleep  2s
    ${bool}=  Run Keyword And Return Status  Page Should Contain Element  ${delete_list_button_xpath}  limit=1
    Run Keyword If  ${bool}  Click DMS Element  ${delete_list_button_xpath}
    ${add_list_button_xpath}=  Format String   ${XPATH_ORP_TABULAR_PARAM_ADD_LIST_BUTTON}   section=${section}
    # Scroll Element Into View  ${add_list_button_xpath}
    Wait Until Element is Visible  ${add_list_button_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Execute Javascript  document.evaluate('${add_list_button_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
    Click DMS Element  ${add_list_button_xpath}
    BuiltIn.Sleep   2s

Update Overridden Parameter
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${sector}  ${section}  ${param_type}  ${param_list}
    Search DMS Overriden Parameter  ${sector}  ${section}
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
        ${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        BuiltIn.Sleep   2s
        #Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        BuiltIn.Sleep   2s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${attr_value}=  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${list_button}=  Catenate  ${overridden_param_xpath}  /following::div
        BuiltIn.Sleep   2s
        Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select DMS Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   5s
        Press Keys  ${overridden_param_xpath}  TAB
        #Clear Element Text  ${overridden_param_xpath}
        #Set Focus To Element  ${overridden_param_xpat
        #Input Text  ${overridden_param_xpath}  ${value}
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   1s
    END
    #Click DMS Element  //html

Save DMS Overriden Parameter
    [Documentation]  Save DMS overridden parameters
    #Click DMS Element  //html
    BuiltIn.Sleep   2s
    Set Focus To Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Press Keys  ${ID_ORP_PARAM_SAVE_BUTTON}  TAB
    #${Status}=     Run Keyword And Return Status    Element Should be Enabled    ${ID_ORP_PARAM_SAVE_BUTTON}
    #${class}=       Get Element Attribute  ${ID_ORP_PARAM_SAVE_BUTTON}  class
    #${bool}=  Run Keyword And Return Status  Should Contain  ${class}  disbaled
    #Run Keyword Unless  ${bool}  Click DMS Element  ${ID_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   13s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   13s
    Scroll Element Into View  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    ##BuiltIn.Sleep   15s
    wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    #echo     ${condition}
    Scroll Element Into View  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    BuiltIn.Sleep   5s
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Wait Until Loading Icon Disappears

Search DMS Overriden Parameter
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


Search DMS Overriden WhiteList Parameter
    [Arguments]     ${sector}  ${section}
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  2s
    ${sector_tab}=  Format String   ${XPATH_ORP_SECTOR_TAB}   sector=${sector}
    BuiltIn.Sleep  10s
    Click DMS Element  ${sector_tab}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ORP_RP_WHITELIST_EXPAND_BUTTON}

Check If Element Is Clickable
    [Documentation]     Check if element is clickable using opacity value of the same
    [Arguments]     ${clickable_element}
    ${val}=  Set Variable  return window.getComputedStyle(document.evaluate('{element}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue).getPropertyValue('opacity');
    ${clickable_element}=  Format String   ${val}   element=${clickable_element}
    ${opacity_value}=  Execute Javascript  ${clickable_element}
    Log  ${opacity_value}
    Should Be Equal  ${opacity_value}  1

Insert PR WhiteList
    [Arguments]  ${sector_data}
    BuiltIn.Sleep  5s
    Search DMS Overriden WhiteList Parameter  eNodeB  WhiteList
    BuiltIn.Sleep  5s
    Clear Element Text  ${XPATH_ORP_RP_WHITELIST}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XPATH_ORP_RP_WHITELIST}   ${sector_data}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_RP_VERIFY_WHITELIST}
    BuiltIn.Sleep  5s
    #Wait Until Page Contains Element  ${XPATH_ORP_RP_VERIFY_WHITELIST_SUCCESSFUL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}

Insert gNB RP WhiteList
    [Arguments]  ${sector_data}
    BuiltIn.Sleep  5s
    Search gNB DMS Overriden Parameter  WhiteList RPs
    BuiltIn.Sleep  5s
    Clear Element Text  ${XPATH_ORP_gNB_RP_WHITELIST}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_ORP_RP_SHOW_ADVANCE_OPTIONS}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XPATH_ORP_gNB_RP_WHITELIST}   ${sector_data}
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_ORP_RP_CLICK_OUTSIDE}
    Scroll Element Into View  ${XPATH_ORP_RP_SHOW_ADVANCE_OPTIONS}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_ORP_gNB_CELL4_RP_WHITELIST}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_RP_VERIFY_WHITELIST}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_RP_VERIFY_WHITELIST}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_DU_WHITELIST_UNKNOWN_RP_WARNING}
    #BuiltIn.Sleep  5s
    #Wait Until Page Contains Element  ${XPATH_ORP_RP_VERIFY_WHITELIST_WARNING}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${WhitelistWarning}   get text    ${ID_DU_WHITELIST_UNKNOWN_RP_WARNING}
    log   ${WhitelistWarning}
    should contain  ${WhitelistWarning}   DMS has no knowledge of some of the RPs
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_PARAM_CANCEL_BUTTON}

Delete PR WhiteList
    Search DMS Overriden WhiteList Parameter  eNodeB  WhiteList
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_WHITELIST_DELETE_PARAMS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}

Delete mandatory parameters in sector1
    Search DMS Overriden WhiteList Parameter  Sector 1  RF
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element   ${XPATH_ORP_RF_DOWNLINK_DELETE_BTN}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_RF_UPLINK_DELETE_BTN}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Delete optional parameters in sector2
    Search DMS Overriden WhiteList Parameter  Sector 2  eCSFB
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element   ${XPATH_ORP_ECSFB_MULTIPLENID_DELETE_BTN}
    BuiltIn.Sleep  5s
    ClICK DMS ELEMENT   ${XPATH_ORP_ECSFB_MULTIPLESID_DELETE_BTN}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_ECSFB_HOMEREG_DELETE_BTN}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}

Delete Optional parameters in enodeB
    Search DMS Overriden WhiteList Parameter  eNodeB  Carrier Aggregation
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element   ${XPATH_OWP_CARRIER_AGGRE_DELETE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}

Decrease NoOfSector Parameter
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${sector}  ${section}    ${param_type}
    Search DMS Overriden Parameter  ${sector}  ${section}
    BuiltIn.Sleep   2s
    #${param_type}=  Convert To Upper Case  ${param_type}
    #BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_SECTOR_DELETE_BUTTON}
    BuiltIn.Sleep  5s

Increase NoOfSector Parameter
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${sector}  ${section}  ${param_type}
    Search DMS Overriden Parameter  ${sector}  ${section}
    BuiltIn.Sleep   2s
    ${param_type}=  Convert To Upper Case  ${param_type}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_SECTOR_ADD_BUTTON}
    BuiltIn.Sleep  5s

Update Cell Identity
    [Arguments]     ${sector}    ${section}     ${value}
    Search DMS Overriden Parameter  ${sector}  ${section}
    BuiltIn.Sleep   2s
    Scroll Element Into View  ${XPATH_CELL_IDENTITY_COMBO}
    Click DMS Element    ${XPATH_CELL_IDENTITY_COMBO}
    BuiltIn.Sleep   2s
    Scroll Element Into View  ${XPATH_CELL_IDENTITY_VALUE}
    Click DMS Element    ${XPATH_CELL_IDENTITY_VALUE}
    BuiltIn.Sleep   2s
    Scroll Element Into View  ${XPATH_SECTOR_CELL_PARAMETER}
    Click DMS Element  ${XPATH_SECTOR_CELL_PARAMETER}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_SECTOR_CELL_PARAMETER}
    BuiltIn.Sleep  5s
    Input DMS Text     ${XPATH_SECTOR_CELL_PARAMETER}    ${value}
    BuiltIn.Sleep  2s
    Press Keys   ${XPATH_SECTOR_CELL_PARAMETER}    RETURN
    BuiltIn.Sleep  2s

Configure ACB
    BuiltIn.Sleep  5s
    click dms element    ${XPATH_CONFIGURE_ACB_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XAPTH_CONFIGURE_BARRING}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XAPTH_BARRING_FACTOR_DROPBOX}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   set variable   TRUE
    ...  ELSE  set variable  FALSE
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XAPTH_BARRING_FACTOR}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XAPTH_BARRING_FACTOR}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XAPTH_BARRING_FACTOR_MO_INPUT}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    BuiltIn.Sleep  5s
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == '0'   set variable   5
    ...  ELSE  set variable  10
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  2s
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_CONFIGURE_ACB_OK_BUTTON}
    BuiltIn.Sleep  2s
    click dms element    ${XPATH_CONFIGURE_ACB_OK_BUTTON}
    BuiltIn.Sleep  5s

Open Provisioned Data
    [Documentation]  Open Provisioned Data Page
    ${open_page}=  Format String   ${DEVICE_PROVSIONED_DATA}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_PROVISIONED_DATA_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Search Provision Parameter
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    Maximize Browser Window
    BuiltIn.Sleep  7s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Scroll Element Into View  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
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


Verify ACB Provisioned
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
    ${value}          GET TEXT         ${XPATH_PLMN_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    #Get From List    ${value}    16
    Get Line Count    ${value}
    ${Line_value_25}=    Get Line   ${value}    25
    Log     ${Line_value_25}
     ${Line_value_21}=    Get Line   ${value}    21
    Log     ${Line_value_21}
    ${type string}=    Evaluate     type($value)
    Log To Console     ${type string}
    #Should Be Equal   ${Line_value_25}      10
    #Should Be Equal   ${Line_value_21}      TRUE
    should contain   ${value}    10
    should contain   ${value}    TRUE


Verify Cell Identity Provisioned
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${XAPTH_RF_PARAMETER}
    BuiltIn.Sleep  5s
    Log          ${value}
    ${Line_value_5}=    Get Line   ${value}    5
    Log     ${Line_value_5}

Verify SPS Parameters
    [Documentation]     Search SPS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${XPATH_SPS_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    Should Contain     ${value}     ${Configured_Process}
    Should Contain     ${value}     ${MCS_Override}
    Should Contain     ${value}     ${Max_Downlink}
    Should Contain     ${value}     ${Max_Uplink}
    Should Contain     ${value}     ${Release_Time}
    Should Contain     ${value}     ${Max_Hybrid_Automatic_Repeat_Request}


Save Overriden Parameter
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
    ##BuiltIn.Sleep   15s
    #wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    #echo     ${condition}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    BuiltIn.Sleep   3s
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Wait Until Loading Icon Disappears

Update Multiband TRUE
   BuiltIn.Sleep   5s
   Click DMS Element  ${XPATH_FREQUENCY_BAND_INDICATOR}
   BuiltIn.Sleep   3s
   Click DMS Element  ${XPATH_FREQUENCY_BAND_VALUE_TRUE}

Update Multiband FALSE
   BuiltIn.Sleep   5s
   Click DMS Element  ${XPATH_FREQUENCY_BAND_INDICATOR}
   BuiltIn.Sleep   3s
   Click DMS Element  ${XPATH_FREQUENCY_BAND_VALUE_FALSE}

Verify BandRseervation
   Element Should Be Visible  ${XPATH_BAND_RESERVATION_LABEL}

Verify Cell Identity
   Element Should Be Visible  ${XPATH_CELL_IDENTITY}

Verify Frequency
   Element Should Be Visible  ${XPATH_DOWNLINK_BANDWIDTH}

Verify BandRseervation Value
    ${value}=     get value    ${BAND_RESERVATION_VALUE}
    #convert to string    ${RP5000_PART_NO1}
    #Convert To Integer    ${value}
    Should Be Equal   ${value}    1234570

Verify Cell Identity Value
    ${value}=     get value    ${XPATH_SECTOR_CELL_PARAMETER}
    #convert to string   ${cell_value_input}
    #Convert To Integer    ${value}
    Should Be Equal   ${value}    12345

Verify Frequency Value
    ${value}=     get value    ${XPATH_DOWNLINK_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Should Be Equal  ${value}    75

Blacklist Verification on Device History
    #Export Device History  Tabular  Last 1 hour  All
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category and Click on Show Button  ${event_type}
    #Click on Export Button

Click enodeB Optional Param
   Click DMS Element  ${XPATH_ENODE_OPTIONAL_PARAM}
   BuiltIn.Sleep   3s

Click enodeB Optional Conf Param
   Click DMS Element  ${XPATH_ENODE_OPTIONAL_PARAM}
   BuiltIn.Sleep   3s

Verify Blacklist Value
    Scroll Element Into View  ${XPATH_BLACKLIST_RADIO}
    ${NEW_VALUE}=     get text    ${XPATH_BLACKLIST_TEXT}
    Log    ${NEW_VALUE}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${NEW_VALUE}     ${Blacklist_RP}

Verify Cat-M1 Provisioned
    [Documentation]     Verify Provisioning
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${XPATH_CATM1_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    Should Contain     ${value}     ${CATM1_STATUS}


Click Delta Param
   Click DMS Element  ${XPATH_DELTA_PARAM_ICON}
   BuiltIn.Sleep   3s

Search Delta Parameter in Provisioning Page
    [Documentation]     Search Delta Parameter in Provisioning Page
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_DELTA_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_PROVISIONING_APPLY_BUTTON}
    BuiltIn.Sleep  5s


Verify SPID Param Value
    ${value}=     get value    ${XPATH_SAVED_SPID_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s

SPID Value and Source Provisioning Page
    ${value}=     get text    ${XPATH_PROVISIONING_SPID_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONING_SPID_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

SPID Value and Source in Provisioned Page
    BuiltIn.Sleep   2s
    ${value}=     get text    ${XPATH_PROVISIONED_SPID_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONED_SPID_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

Verify SPID Value in PnP Status
    Scroll Element Into View  ${XPATH_SPID_PNP_PAGE}
    ${value}=     get text    ${XPATH_SPID_VALUE_PNP_PAGE}
    Log    ${value}
    should contain      ${value}     true

SPID Verification on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category for SPID and Click on Show Button  ${event_type}

Verify MIMO Param Value
    ${value}=     get value    ${XPATH_SAVED_MIMO_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s

MIMO Value and Source Provisioning Page
    ${value}=     get text    ${XPATH_PROVISIONING_MIMO_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONING_MIMO_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

MIMO Value and Source in Provisioned Page
    BuiltIn.Sleep   2s
    ${value}=     get text    ${XPATH_PROVISIONED_MIMO_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONED_MIMO_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

Click Sector 1 Optional Param
    Click DMS Element  ${XPATH_SECTOR1_OPTIONAL_PARAM}
    BuiltIn.Sleep   3s

Verify MIMO Value in PnP Status
    Scroll Element Into View  ${XPATH_MIMO_PNP_STATUS}
    ${value}=     get text    ${XPATH_MIMO_VALUE_PNP_STATUS}
    Log    ${value}
    should contain      ${value}     true

MIMO Verification on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category for MIMO and Click on Show Button  ${event_type}


Dashboard DMS Overriedn Params Status
    [Documentation]  Check the Device DMS Overriden Params Summary
    Log  Check DMS Overriden Params Summary content
    Click DMS Element   ${XPATH_DMS_OVERRIDEN_MENU}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_DMSOVERRIDEN_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_DMSOVERRIDEN_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_DASHBOARD_DMSOVERRIDEN_GNBCONFIG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_DMSOVERRIDEN_GNBCONFIG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Search gNB DMS Overriden Parameter
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Scroll Element Into View    ${ID_ORP_SEARCH_INPUT}
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${ID_ORP_SEARCH_BUTTON}
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    #BuiltIn.Sleep  5s
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

Set gNB Name Value
    Search gNB DMS Overriden Parameter       gNB Name
    #Click DMS Element  ${XPATH_OWP_FILTER_DROPDOWN_BUTTON}
    #BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${gName_value}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'Test-Replan'   set variable   Test-Replan-test
    ...  ELSE  set variable  Test-Replan
    Log  Setting Value to ${value_to_set}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    BuiltIn.Sleep  10s
    Input Text  ${gName_value}  ${value_to_set}
    BuiltIn.Sleep  5s
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    #Wait Until Element Is Enabled  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    [Return]  ${value_to_set}


Update gNB Overriden Parameter
    [Documentation]     Update gNB Overriden Parameter
    [Arguments]     ${section}  ${param_type}  ${param_list}
    Search gNB CP DMS Overriden Parameter    ${section}
    BuiltIn.Sleep   5s
    ${param_type}=  Convert To Upper Case  ${param_type}
    BuiltIn.Sleep   5s
    ${param_xpath}=  Run Keyword If  '${param_type}' == 'SCALAR'  Set Variable  ${XPATH_ORP_SCALAR_PARAM_INPUT}
    ...     ELSE IF  '${param_type}' == 'TABULAR'  Set Variable  ${XPATH_ORP_TABULAR_PARAM_INPUT}
    Run Keyword If  '${param_type}' == 'TABULAR'  Add New Tabular Param List Row  ${section}
    BuiltIn.Sleep   10s
    FOR    ${key}    IN    @{param_list}
        ${value}=    Get From Dictionary    ${param_list}    ${key}
        BuiltIn.Sleep   10s
        ${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        BuiltIn.Sleep   5s
        #Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        BuiltIn.Sleep   5s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${attr_value}=  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        #${list_button}=  Catenate  ${overridden_param_xpath}  /following::div
        BuiltIn.Sleep   5s
        Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   5s
        Scroll Element Into View     ${overridden_param_xpath}
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select DMS Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   10s
        Press Keys  ${overridden_param_xpath}  TAB
        #Clear Element Text  ${overridden_param_xpath}
        #Set Focus To Element  ${overridden_param_xpat
        #Input Text  ${overridden_param_xpath}  ${value}
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   5s
    END
    #Click DMS Element  //html

Search gNB CP DMS Overriden Parameter
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

Verify ENDCEnable Param Value
    ${value}=     get value    ${XPATH_SAVED_ENDCEnable_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s

ENDCEnable Value and Source Provisioning Page
    ${value}=     get text    ${XPATH_PROVISIONING_ENDCEnable_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONING_ENDCEnable_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

Verify ENDCEnable Value in PnP Status
    Scroll Element Into View  ${XPATH_ENDCEnable_PNP_PAGE}
    ${value}=     get text    ${XPATH_ENDCEnable_VALUE_PNP_PAGE}
    Log    ${value}
    should contain      ${value}     true

ENDCEnable Value and Source in Provisioned Page
    BuiltIn.Sleep   2s
    ${value}=     get text    ${XPATH_PROVISIONED_ENDCEnable_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    TRUE
    BuiltIn.Sleep   2s
    ${value1}=     get text    ${XPATH_PROVISIONED_ENDCEnable_SOURCE}
    Log    ${value1}
    Should Be Equal  ${value1}    DMS GUI
    BuiltIn.Sleep   2s

ENDCEnable Verification on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Compute Event Category for ENDCEnable and Click on Show Button  ${event_type}

Delete DMS Overriden Parameter
    [Arguments]     ${sector}  ${section}
    Search DMS Overriden Parameter  ${sector}  ${section}
    BuiltIn.Sleep  2s
    #Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    #BuiltIn.Sleep  10s
    Click DMS Element   ${XPATH_GUIOVERRIDE_DELETE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}

Delete DMS Overriden Parameter ENDCEnable Helper
    Delete DMS Overriden Parameter  eNodeB  EN-DC Enable

Delete DMS Overriden Parameter ENDCX2 Helper
    Delete DMS Overriden Parameter  eNodeB  EN-DC X2


S1SigServerList_Value
    [Arguments]     ${value}
    Search DMS Overriden Parameter  eNodeB  Core Network Parameter
    BuiltIn.Sleep   2s
    Scroll Element Into View  ${XPATH_S1SIG_SERVER_LIST}
    Click DMS Element    ${XPATH_S1SIG_SERVER_LIST}
    BuiltIn.Sleep   2s
    Input DMS Text     ${XPATH_S1SIG_SERVER_LIST}    ${value}
    Click DMS Element    ${XPATH_DC_SecGWServer_TF}
    Log  Setting value of Core Network Parameter key:S1SigServerList_Value with value: ${value}
    BuiltIn.Sleep  3s

Delete Enhanced File Transfer
    Run Keyword And Ignore Error     Click DMS Element    ${XPATH_FILE_TYPE}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element    ${XPATH_FILE_ENH_DELETE_BUTTON_CONFIRMATION}
    BuiltIn.Sleep  5s

Configure LICENSE Value
   Click DMS Element    ${XPATH_FileEnh_Det_Button}
   ${NUMBER}    set variable    6
   ${value_to_set_index}    set variable    ${NUMBER}
   ${xpath_index} =  Format String   ${XPATH_FileTransEnh_index}  value=${value_to_set_index}
   Log   ${xpath_index}
   input dms text     ${xpath_index}    ${value_to_set_index}
   BuiltIn.Sleep  5s
   #${value_to_set_index}    set variable    ${NUMBER}
   ${value_to_set_name}    set variable    ${NUMBER}
   Log   ${NUMBER}
   ${xpath_name} =  Format String   ${XPATH_FileTransEnh_Name}  value=${value_to_set_name}
   Log   ${xpath_name}
   Click DMS Element    ${xpath_name}
   BuiltIn.Sleep  5s
   ${value_to_set}    set variable    LICENSE
   ${xpath_string} =  Format String   ${XPATH_FILETYPE_VALUE}  value=${value_to_set}
   Log   Xpath ${xpath_string}
   Click DMS Element  ${xpath_string}
   BuiltIn.Sleep  5s

Update File Tansfer with Different File Type
    Click DMS Element    ${XPATH_ADD_FILE_ENCH_TYPE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_FILE_ENH_ADD_ALL_FILE_TYPE}
    BuiltIn.Sleep  5s
    @{EVENT_TYPE} =  create list    ALARM   DEBUG    PERFORMANCE    FAILUREEVENT    ACTIVITY
    #@{EVENT_TYPE} =  create list    ALARM   DEBUG
    ${NUMBER}    set variable    1
    FOR  ${item}  IN  @{EVENT_TYPE}
        Log   ${NUMBER}
        Click DMS Element    ${XPATH_FileEnh_Det_Button}
        BuiltIn.Sleep  5s
        ${value_to_set_index}    set variable    ${NUMBER}
        ${xpath_index} =  Format String   ${XPATH_FileTransEnh_index}  value=${value_to_set_index}
        Log   ${xpath_index}
        input dms text     ${xpath_index}    ${value_to_set_index}
        BuiltIn.Sleep  5s
        #${value_to_set_index}    set variable    ${NUMBER}
        ${value_to_set_name}    set variable    ${NUMBER}
        Log   ${NUMBER}
        ${xpath_name} =  Format String   ${XPATH_FileTransEnh_Name}  value=${value_to_set_name}
        Log   ${xpath_name}
        Click DMS Element    ${xpath_name}
        BuiltIn.Sleep  5s
        ${value_to_set}    set variable    ${item}
        ${xpath_string} =  Format String   ${XPATH_FILETYPE_VALUE}  value=${value_to_set}
        Log   Xpath ${xpath_string}
        Click DMS Element  ${xpath_string}
        BuiltIn.Sleep  5s
        Log   ${NUMBER}
        ${value_to_start_time}    set variable    ${NUMBER}
        ${xpath_start_time_value} =  Format String   ${XPATH_START_TIME}  value=${value_to_start_time}
        Log   ${xpath_start_time_value}
        input dms text     ${xpath_start_time_value}      14:02
        Scroll Element Into View    ${XPATH_TRANSFER_Last_Col}
        BuiltIn.Sleep  15s
        Log   ${NUMBER}
        ${value_to_win_duration}    set variable    ${NUMBER}
        ${xpath_duration} =  Format String   ${XPATH_WIN_DURATION}  value=${value_to_win_duration}
        Log   ${xpath_duration}
        Click DMS Element     ${xpath_duration}
        BuiltIn.Sleep  10s
        input dms text     ${xpath_duration}       600
        #BuiltIn.Sleep  10s
        press keys  ${xpath_duration}      ENTER
        BuiltIn.Sleep  10s
        #Scroll Element Into View    ${XPATH_TRANSFER_Last_Col}
        BuiltIn.Sleep  10s
        Log   ${NUMBER}
        ${value_to_interval}    set variable    ${NUMBER}
        ${xpath_interval} =  Format String   ${XPATH_WIN_INTERVAL}  value=${value_to_interval}
        Log   ${xpath_interval}
        input dms text     ${xpath_interval}        900
        BuiltIn.Sleep  5s
        Scroll Element Into View    ${XPATH_TRANSFER_Last_Col}
        BuiltIn.Sleep  5s
        Log   ${NUMBER}
        ${xpath_transfer_now_value} =  Format String   ${XPATH_TRANSFER_NOW}  value=${NUMBER}
        Log   ${xpath_transfer_now_value}
        Click DMS Element    ${xpath_transfer_now_value}
        BuiltIn.Sleep  10s
        input dms text     ${xpath_transfer_now_value}    0
        press keys  ${xpath_transfer_now_value}      ENTER
        BuiltIn.Sleep  10s
        ${NUMBER}=     Evaluate   ${NUMBER} + 1
    END
    Configure LICENSE Value
    BuiltIn.Sleep  10s
    Click DMS Element     ${XPATH_FILE_TRANSFER_SAVE_BUTTON}
    BuiltIn.Sleep  10s

Delete Activity Log
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element    ${XPATH_DELETE_BUTTON}


Select Activiy Log
    BuiltIn.Sleep  10s
    Click DMS Element     ${XPATH_ACTIVITY_LOG_SELECET}
    BuiltIn.Sleep  10s
    ${xpath_string} =  Format String   ${XPATH_FILETYPE_VALUE}  value=SELECT
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ACTIVITY_CHECKBOX}
    BuiltIn.Sleep  5s

Save File Transfer changes
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Verify File Transfer Log value
    ${File_Transfer_log_type}     Get Text     ${XPATH_FILE_TYPE_LOG_VALUE}
    Log     ${File_Transfer_log_type}
    should contain    ${File_Transfer_log_type}     ACTIVITY
    should contain    ${File_Transfer_log_type}     DMS GUI

Update Enhanced File Transfer
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ENH_FILE_INDEX}
    BuiltIn.Sleep  5s
    input dms text     ${XPATH_ENH_FILE_INDEX}    1
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SERVER_URL}
    BuiltIn.Sleep  5s
    input dms text     ${XPATH_SERVER_URL}    sftp://10.211.240.92:30
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ENH_USERNAME}
    BuiltIn.Sleep  5s
    input dms text     ${XPATH_ENH_USERNAME}    admin
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ENH_PASSWORD}
    BuiltIn.Sleep  5s
    input dms text     ${XPATH_ENH_PASSWORD}    admin
    BuiltIn.Sleep  5s

Verify File Type value
    Scroll Element Into View    ${XPATH_FILE_TYPE_TABLE}
    BuiltIn.Sleep  5s
    ${FILE_DETAILS_TABLE}     Get Text     ${XPATH_FILE_DETAILS_TABLE}
    Log     ${FILE_DETAILS_TABLE}
    should contain    ${FILE_DETAILS_TABLE}     sftp://10.211.240.92:30
    should contain    ${FILE_DETAILS_TABLE}     admin
    should contain    ${FILE_DETAILS_TABLE}     admin
    ${FILE_TYPE_TABLE}     Get Text     ${XPATH_FILE_TYPE_TABLE}
    Log     ${FILE_TYPE_TABLE}
    should contain    ${FILE_TYPE_TABLE}     ACTIVITY
    should contain    ${FILE_TYPE_TABLE}     DMS GUI
    should contain    ${FILE_TYPE_TABLE}     DEBUG
    should contain    ${FILE_TYPE_TABLE}     PERFORMANCE
    should contain    ${FILE_TYPE_TABLE}     FAILUREEVENT
    should contain    ${FILE_TYPE_TABLE}     ACTIVITY
    should contain    ${FILE_TYPE_TABLE}     LICENSE

Update Overridden Parameter for 5G CUCP
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${section}  ${param_type}  ${param_list}
    Search DMS Overriden Parameter for 5G CUCP  ${section}
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
        ${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        BuiltIn.Sleep   2s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        BuiltIn.Sleep   2s
        Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select DMS Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   5s
        Press Keys  ${overridden_param_xpath}  TAB
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   1s
    END

Search DMS Overriden Parameter for 5G CUCP
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s

Update Overridden Parameter for 5G CUUP
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${section}  ${param_type}  ${param_list}
    Search DMS Overriden Parameter for 5G CUUP  ${section}
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
        ${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        BuiltIn.Sleep   2s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        BuiltIn.Sleep   2s
        Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select DMS Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   5s
        Press Keys  ${overridden_param_xpath}  TAB
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   1s
    END

Search DMS Overriden Parameter for 5G CUUP
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${section}
    BuiltIn.Sleep  7s
    Click DMS Element  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${ID_ORP_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${ID_ORP_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_ORP_SEARCH_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s

Update Overridden Parameter for 5G DU
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${sector}  ${section}  ${param_type}  ${param_list}
    Search DMS Overriden Parameter for 5G DU  ${sector}  ${section}
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
        ${overridden_param_xpath}=  Format String   ${param_xpath}   section=${section}  overridden_param=${key}
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Wait Until Element is Visible  ${overridden_param_xpath}  timeout=${BROWSER_ELEMENT_TIMEOUT}
        BuiltIn.Sleep   2s
        ${attr_value}=  Run Keyword If  '${param_type}' == 'SCALAR'  Execute Javascript  return document.evaluate('${overridden_param_xpath}/following-sibling::div',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.getAttribute("role");
        BuiltIn.Sleep   2s
        Set Focus To Element  ${overridden_param_xpath}
        Scroll Element Into View     ${overridden_param_xpath}
        BuiltIn.Sleep   2s
        Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
        BuiltIn.Sleep   2s
        Scroll Element Into View     ${overridden_param_xpath}
        Click DMS Element  ${overridden_param_xpath}
        BuiltIn.Sleep   5s
        Run Keyword If  '${attr_value}' == 'button'  Select DMS Dropdown Option  ${overridden_param_xpath}  ${value}
        ...  ELSE  Execute Javascript  document.evaluate('${overridden_param_xpath}',document.body,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.value='${value}';
        BuiltIn.Sleep   5s
        Press Keys  ${overridden_param_xpath}  TAB
        Log  Setting value of ${section} key:${key} with value: ${value}
        BuiltIn.Sleep   1s
    END

Search DMS Overriden Parameter for 5G DU
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
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
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ORP_COLLAPSE_EXPAND_BUTTON}
    BuiltIn.Sleep  3s

Open Overridden Params Page1
    [Documentation]  Open Overridden Paramas page
    [Arguments]     ${DEVICE_MACID_RDC}
    ${open_page}=  Format String   ${DEVICE_OVERWRRIDDEN_PARAMETER}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID_RDC}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Reload Page
    BuiltIn.Sleep  10s

