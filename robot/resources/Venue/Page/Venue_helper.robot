*** Settings ***

#Library             String
#Variables           Import_ui_controls.py
Variables           Venue_ui_controls.py
Variables           ../testdata/Venue_testdata.py
Variables            ../../device_list/page/device_list_ui_controls.py
Variables            ../../device_list/testdata/device_list_testdata.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${VENUE_FILE_LOCATION}


*** Keywords ***

Select and import Venue file
     BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_VENUE_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}


Verify Operation History values for Venue import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    [Arguments]     ${Venue_name}
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_type}      	${Venue_name}
    Should Contain    ${Operation_status}      Success
    #Should Contain    ${Operation_name}      	Marriott_Connecticut_Automation.zip

Open Enterprise View page
    go to   ${DMS_NC_Enterprise_View}
    Wait Until Page Contains Element  ${ENTERPRISE_VIEW_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  40s

Search Venue name
    [arguments]    ${Venue_name_input}
    Click DMS Element  ${SEARCH_VENUE}
    BuiltIn.Sleep  5s
    #Input Text  ${XPATH_OH_OPERATION_TYPE}  Netconf Mount
    Input Text  ${SEARCH_VENUE}  ${Venue_name_input}
    BuiltIn.Sleep  10s
    Click DMS Element  ${VENUE_SEARCH_BUTTON}
    BuiltIn.Sleep  10s
    log    ${Venue_name_input}
    log    ${VENUE_NAME}
    Click DMS Element  ${VENUE_NAME}
    BuiltIn.Sleep  30s

Verify Device in Venue page
    BuiltIn.Sleep  10s
    #${total_device_count} = Get DMS Element Text    ${TOTAL_DEVICE_COUNT}
    #${total_device_count} =  Get DMS Element Text  ${TOTAL_DEVICE_COUNT}
    #Log     ${total_device_count}
    #Should Contain    ${total_device_count}      	5
    #BuiltIn.Sleep  5s
    #Should Be Equal As Strings  ${total_device_count}  ${actual_device_count}
    #BuiltIn.Sleep  5s
    Scroll Element Into View  ${TOTAL_DEVICE_COUNT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${TOTAL_DEVICE_COUNT}
    BuiltIn.Sleep  5s
    ${cucp_id}  Get DMS Element Text    ${VENUE_CUCP_VNF_ID}
    Log     ${cucp_id}
    Should Contain    ${cucp_id}      	ipsec2-2051cucp1
    ${cuup_id}  Get DMS Element Text    ${VENUE_CUUP_VNF_ID}
    Log     ${cuup_id}
    Should Contain    ${cuup_id}      	ipsec2-2051cuup1
    ${du_id}  Get DMS Element Text    ${VENUE_DU_VNF_ID}
    Log     ${du_id}
    Should Contain    ${du_id}      	ipsec2-2051du1
    ${bc_mac_id}  Get DMS Element Text    ${VENUE_BC_MAC_ID}
    Log     ${bc_mac_id}
    Should Contain    ${bc_mac_id}      	0005B9423AB2
    ${du_rp_id}  Get DMS Element Text    ${VENUE_DU_RP_VNF_ID}
    Log     ${du_rp_id}
    Should Contain    ${du_rp_id}      	ipsec2-2051du1_0005B9514245_1
    ${bc_rp_id}  Get DMS Element Text    ${VENUE_BC_RP_MAC_ID}
    Log     ${bc_rp_id}
    Should Contain    ${bc_rp_id}      	0005B9423AB2_0005B9519AA1_1


Verify updated service area and replan status
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${TOTAL_DEVICE_COUNT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${TOTAL_DEVICE_COUNT}
    BuiltIn.Sleep  5s



    ${cucp_service_area}  Get DMS Element Text    ${VENUE_CUCP_SA}
    Log     ${cucp_service_area}
    Should Contain    ${cucp_service_area}      	ipsec2-2051cucp1_1
    Page Should Contain Element    ${CUCP_REPLAN_STATUS}
    ${cuup_service_area}  Get DMS Element Text    ${VENUE_CUUP_SA}
    Log     ${cuup_service_area}
    Should Contain    ${cuup_service_area}      	ipsec2-2051cuup1_1
    Page Should Contain Element    ${CUUP_REPLAN_STATUS}
    ${du_service_area}  Get DMS Element Text    ${VENUE_DU_SA}
    Log     ${du_service_area}
    Should Contain    ${du_service_area}      	ipsec2-2051du1_1
    Page Should Contain Element    ${DU_REPLAN_STATUS}
    ${bc_service_area}  Get DMS Element Text    ${VENUE_BC_SA}
    Log     ${bc_service_area}
    Should Contain    ${bc_service_area}      	BC_Automation_1
    Page Should Contain Element    ${BC_REPLAN_STATUS}



Open Venue Overridden Param
    BuiltIn.Sleep  10s
    Click DMS Element  ${DMS_Overridden_params_at_venue}
    BuiltIn.Sleep  10s

Select the device and software type
    [arguments]    ${Device_type}    ${XAPTH_Device_type_LIST_ELEMENT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${show_DMS_overridden_params}
    BuiltIn.Sleep  15s
    #Click DMS Element  ${Device_type}
    #BuiltIn.Sleep  15s
    Press Keys    ${DEVICE_type_input}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  10s
    Input Text  ${DEVICE_type_input}   ${Device_type}
    BuiltIn.Sleep  5s
    #Press Keys    ${DEVICE_type_input}  ENTER
    #BuiltIn.Sleep  10s
    Click DMS Element     ${XAPTH_Device_type_LIST_ELEMENT}
    BuiltIn.Sleep  5s
    Press Keys    ${Device_Software_Version}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  10s

    Input Text  ${Device_Software_Version}   ${Software_Version}
    BuiltIn.Sleep  10s
    #Press Keys    ${Device_Software_Version}  ENTER
    Click DMS Element     ${XAPTH_Software_Version_LIST_ELEMENT}
    BuiltIn.Sleep  10s

Search venue overridden param
    Input Text  ${Venue_SEARCH_INPUT_TEXT}   VES
    BuiltIn.Sleep  10s
    Click DMS Element     ${VEnue_SEARCH_BUTTON}
    BuiltIn.Sleep  5s


Search VENUE DMS Overriden Parameter
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



Update VENUE Overridden Parameter
    [Documentation]     Update Overriden Parameter
    [Arguments]     ${sector}  ${section}  ${param_type}  ${param_list}
    Search VENUE DMS Overriden Parameter  ${sector}  ${section}
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

Save VENUE DMS Overriden Parameter
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
    Scroll Element Into View  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    ##BuiltIn.Sleep   15s
    #wait until page contains element   ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}    timeout=15s
    #echo     ${condition}
    #Scroll Element Into View  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    #Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    #BuiltIn.Sleep   3s
    #Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    #Wait Until Loading Icon Disappears

Verify Venue provisioned value
    ${Table_value}    GET Text   ${XAPTH_VES_PROVISIONED_DATA}
    Log     ${Table_value}
    should contain    ${Table_value}    ${VES_URL_venue}
    should contain    ${Table_value}    ${VES_Username_venue}
    should contain    ${Table_value}    ${VES_Password_venue}
    should contain    ${Table_value}    Venue Override


Verify Building and Floor details
    BuiltIn.Sleep  15s
    Click DMS Element    ${CLICK_ON_VIEW_BUILDING}
    BuiltIn.Sleep  5s
    ${Building_name}    get text    ${GET_BUILING_DETAILS}
    should Contain    ${Building_name}    BldgM003
    Log    ${Building_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${CLICK_ON_VIEW_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element    ${CLICK_ON_MANAGE_ELEMENT_FLOOR1}
    BuiltIn.Sleep  60s
    ${CU_CP_Count}    get text    ${GET_CU_CP_SUMMARY_DETAILS}
    should Contain    ${CU_CP_Count}    1
    Log    ${CU_CP_Count}
    BuiltIn.Sleep  5s
    ${CU_UP_Count}    get text    ${GET_CU_UP_SUMMARY_DETAILS}
    should Contain    ${CU_UP_Count}    1
    Log    ${CU_UP_Count}
    BuiltIn.Sleep  5s
    ${DU_Count}    get text    ${GET_DU_SUMMARY_DETAILS}
    should Contain    ${DU_Count}    1
    Log    ${DU_Count}

Verify RPTxOff Flag status in venue page

    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_TOGGLE_BUTTON}
    BuiltIn.Sleep  5s
    ${RPTxOff_value}    Run Keyword And Return status        Click DMS Element    ${XPATH_TOGGLE_BUTTON}
    #${RPTxOff_value}    Element Text Should Be   ${GET_FLAG_DETAILS}    OFF
    #${RPTxOff_value}    Get value    ${GET_FLAG_DETAILS}
    #should Contain any   ${RPTxOff_value}    enabled    disabled     not configured
    log    ${RPTxOff_value}
    BuiltIn.Sleep  5s
    ${Current_value} =    Run keyword if  '${RPTxOff_value}' == False     Click DMS Element    ${XPATH_TOGGLE_BUTTON}
    log     ${Current_value}


update ves values cucp
    [Arguments]    ${url}    ${username}    ${password}
    Click DMS Element   ${XPATH_VES_URL_CUCP}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VES_URL_CUCP}  ${url}
    Click DMS Element   ${XPATH_VES_USERNAME_CUCP}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VES_USERNAME_CUCP}  ${username}
    Click DMS Element   ${XPATH_VES_PASSWORD_CUCP}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VES_PASSWORD_CUCP}  ${password}

update ves values cuup
    [Arguments]    ${url}    ${username}    ${password}
    Click DMS Element   ${XPATH_VES_URL_CUUP}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_VES_URL_CUUP}  ${url}
    Click DMS Element   ${XPATH_VES_USERNAME_CUUP}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_VES_USERNAME_CUUP}  ${username}
    Click DMS Element   ${XPATH_VES_PASSWORD_CUUP}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_VES_PASSWORD_CUUP}  ${password}
    BuiltIn.Sleep  5s

#Export the Venue
    #BuiltIn.Sleep  10s
    #Click DMS Element    ${CLICK_EXPORT_BUTTON}
    #BuiltIn.Sleep  5s

Add CP from venue floor
    Click DMS Element   ${XPATH_VIEW_BUILDING}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_VIEW_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MANAGE_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ADD_DEVICE_TO_FLOOR}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VNFID_ENTER}  ${CP_vnfid_venue}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_ENABLE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  3s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MESSAGE_ADD}
    ${value}        Get Text     ${XPATH_SUCCESS_MESSAGE_ADD}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_NC_FLOOR_SAVE}
    Click DMS Element  ${XPATH_VENUE_CANVAS}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_NC_FLOOR_SAVE}  ENTER
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_CLOSE}
    BuiltIn.Sleep  6s
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Add}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICELIST_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_VNFID_SEARCH}  ${CP_vnfid_venue}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  5s

Add UP from venue floor
    Click DMS Element   ${XPATH_VIEW_BUILDING}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_VIEW_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MANAGE_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ADD_DEVICE_TO_FLOOR}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_PC_DROPDOWN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_PC_UP}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_VNFID_ENTER}  ${UP_vnfid_venue}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_ENABLE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  3s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MESSAGE_ADD}
    ${value}        Get Text     ${XPATH_SUCCESS_MESSAGE_ADD}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_VENUE_CANVAS}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_NC_FLOOR_SAVE}  ENTER
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_CLOSE}
    BuiltIn.Sleep  6s
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Add}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICELIST_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_VNFID_SEARCH}  ${UP_vnfid_venue}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  5s


Add DU from venue floor
    Click DMS Element   ${XPATH_VIEW_BUILDING}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_VIEW_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MANAGE_FLOOR}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_ADD_DEVICE_TO_FLOOR}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_PC_DROPDOWN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_PC_DU}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_VNFID_ENTER}  ${DU_vnfid_venue}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_ENABLE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  3s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MESSAGE_ADD}
    ${value}        Get Text     ${XPATH_SUCCESS_MESSAGE_ADD}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_VENUE_CANVAS}
    BuiltIn.Sleep  4s
    Press Keys    ${XPATH_NC_FLOOR_SAVE}  ENTER
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_CLOSE}
    BuiltIn.Sleep  6s
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Add}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICELIST_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_VNFID_SEARCH}  ${DU_vnfid_venue}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  5s

Open gNB Overridden Page
    [Documentation]  Open gNB Overridden Page
    [Arguments]  ${OVERRIDDEN_PAGE_URL}
    ${open_page}=  Format String   ${OVERRIDDEN_PAGE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_OWP_OVERRIDDEN_PARAM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Delete gNB DMS VES Overriden Parameter
    [Arguments]     ${section}
    Search gNB CP DMS Overriden Parameter    ${section}
    BuiltIn.Sleep  2s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_1}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_2}
    BuiltIn.Sleep  5s
    Run Keyword And Ignore Error     Click DMS Element   ${XPATH_VES_param_3}
    BuiltIn.Sleep  5s

Save gNB Overriden Parameter
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

Export the Venue
    BuiltIn.Sleep  20s
    Click DMS Element    ${CLICK_EXPORT_BUTTON}
    Log    ${CLICK_EXPORT_BUTTON}

Verify Venue Export Notificaton Status
    Wait Until Element Is Visible  ${XPATH_VENUE_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_VENUE_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Success
    Should Contain    ${value}    Download completed
    BuiltIn.Sleep  4s

Verify Downloaded Venue File in Local System
    Copy File To Location

Generate GSC Report for all gNB
    BuiltIn.Sleep  10s
    click dms element    ${CLICK_GENERATE_GSC_BUTTON}
    BuiltIn.Sleep  10s
    click dms element    ${CLICK_GENERATE_BUTTON}
    BuiltIn.Sleep  10s

Generate GSC Report for a gNB
    BuiltIn.Sleep  10s
    click dms element    ${CLICK_GENERATE_GSC_BUTTON}
    BuiltIn.Sleep  10s
    ${gNB_selector_xpath}=  Format String   ${XPATH_GNBID_SELECTOR}   input=Select gNBId
    Select DMS Dropdown Option    ${gNB_selector_xpath}    2051
    BuiltIn.Sleep  5s
    click dms element    ${CLICK_GENERATE_BUTTON}
    BuiltIn.Sleep  10s

Verify Operation History values for GSC Report
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_type}      	ONECELL5G GoldStandard Compliance Report
    Should Contain    ${Operation_status}      Success

Verify MAP Topology Details
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_MAP_DETAIL}
    BuiltIn.Sleep  5s

    #Mouse over  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #${map_details}    Get DMS Element Text    ${XPATH_MAP_DETAIL}
    #Log     ${map_details}



    #Get Topology Value
    BuiltIn.Sleep  15s
    open context menu    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    BuiltIn.Sleep  5s
    Mouse over   //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    ${value_get}=    get Text    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    Log    ${XPATH_View}
    ${value_get1}=    get Text    ${XPATH_topo_value}
    Log    ${value_get1}
    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016cuup1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60556

    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016du1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60550

    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016cucp1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60556

Verify device count and status from CUCP dashboard
    ${value_get_cuup}=    get Text    ${XPATH_CU_DETAIL}
    Log    ${value_get_cuup}
    Should Contain    ${value_get_cuup}    Central Unit User Plane
    #${value_get1}=    get Text    ${XPATH_CUUP_COUNT}
    #Log    ${value_get1}
    Should Contain    ${value_get_cuup}    1
    #${value_get2}=    get Text    ${XPATH_CUUP_COUNT}
    #Log    ${value_get1}

    ${value_get_du}=    get Text    ${XPATH_DU_DETAIL}
    Log    ${value_get_du}
    Should Contain    ${value_get_du}    Distributed Unit
    Should Contain    ${value_get_du}    1

    ${value_get_rp}=    get Text    ${XPATH_RU_DETAIL}
    Log    ${value_get_rp}
    Should Contain    ${value_get_rp}    Radio Point
Verify device count and status from CUUP dashboard
    ${value_get_cucp}=    get Text    ${XPATH_CU_DETAIL}
    Log    ${value_get_cucp}
    Should Contain    ${value_get_cucp}    Central Unit Control Plane
    Should Contain    ${value_get_cucp}    1

    ${value_get_du}=    get Text    ${XPATH_DU_DETAIL}
    Log    ${value_get_du}
    Should Contain    ${value_get_du}    Distributed Unit
    Should Contain    ${value_get_du}    1

    ${value_get_rp}=    get Text    ${XPATH_RU_DETAIL}
    Log    ${value_get_rp}
    Should Contain    ${value_get_rp}    Radio Point

Verify device count and status from DU dashboard
    ${value_get_cucp}=    get Text    ${XPATH_CP_DETAIL}
    Log    ${value_get_cucp}
    Should Contain    ${value_get_cucp}    Central Unit Control Plane
    Should Contain    ${value_get_cucp}    1

    ${value_get_cuup}=    get Text    ${XPATH_CU_DETAIL}
    Log    ${value_get_cuup}
    Should Contain    ${value_get_cuup}    Central Unit User Plane
    Should Contain    ${value_get_cuup}    1

    ${value_get_rp}=    get Text    ${XPATH_DU_RU_DETAIL}
    Log    ${value_get_rp}
    Should Contain    ${value_get_rp}    Radio Point

Verify CUCP MAP Topology Details
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_MAP_DETAIL}
    BuiltIn.Sleep  5s

    #Mouse over  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #${map_details}    Get DMS Element Text    ${XPATH_MAP_DETAIL}
    #Log     ${map_details}



    #Get Topology Value
    BuiltIn.Sleep  15s
    open context menu    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    BuiltIn.Sleep  5s
    Mouse over   //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    ${value_get}=    get Text    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    Log    ${XPATH_View}
    ${value_get1}=    get Text    ${XPATH_topo_value}
    Log    ${value_get1}


    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016cucp1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60556

Verify CUUP MAP Topology Details
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_MAP_DETAIL}
    BuiltIn.Sleep  5s

    #Mouse over  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #${map_details}    Get DMS Element Text    ${XPATH_MAP_DETAIL}
    #Log     ${map_details}



    #Get Topology Value
    BuiltIn.Sleep  15s
    open context menu    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    BuiltIn.Sleep  5s
    Mouse over   //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    ${value_get}=    get Text    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    Log    ${XPATH_View}
    ${value_get1}=    get Text    ${XPATH_topo_value}
    Log    ${value_get1}
    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016cuup1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60556



Verify DU MAP Topology Details
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_MAP_DETAIL}
    BuiltIn.Sleep  5s

    #Mouse over  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_MAP_DETAIL}
    #BuiltIn.Sleep  5s
    #${map_details}    Get DMS Element Text    ${XPATH_MAP_DETAIL}
    #Log     ${map_details}



    #Get Topology Value
    BuiltIn.Sleep  15s
    open context menu    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    BuiltIn.Sleep  5s
    Mouse over   //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    ${value_get}=    get Text    //*[@id="dashboard_map_neighbor"]/div/div[1]/div[2]
    Log    ${XPATH_View}
    ${value_get1}=    get Text    ${XPATH_topo_value}
    Log    ${value_get1}


    Should Contain    ${value_get1}    VNFID: csblrlabsvtcc1ec16-1016du1
    Should Contain    ${value_get1}    FIPS: 17037
    Should Contain    ${value_get1}    County: DEKALB
    Should Contain    ${value_get1}    State: IL
    Should Contain    ${value_get1}    ZIP Code: 60550

