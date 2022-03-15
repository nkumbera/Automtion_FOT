*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../overwrridden_params/page/overwrite_params_helper.robot
Resource            ../../device_history/page/device_history_helper.robot
Library             SeleniumLibrary
Library             Collections
Variables           bulk_configuration_ui_controls.py
Variables           ../testdata/bulk_configure_testdata.py
Library            DateTime

*** Variables ***


*** Keywords ***
Open Bulk Device Configuration Page
    [Documentation]  Open Bulk Device Configuration page
    ${open_page}=  Format String   ${BULK_DEVICE_CONFIGURATION_URL}   dms_device_console=${DMS_NC_URL}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${XPATH_BULK_DEVICE_CONFIGURATION_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_BULK_DEVICE_CONFIGURATION_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    # Reload Page
    BuiltIn.Sleep  2s

Select Device Type and Software Version
    [Documentation]  Select device type and software version
    [Arguments]  ${device_type}  ${software_version}
    BuiltIn.Sleep  5s
    ${device_and_software_xpath}=  Format String   ${XPATH_DEVICE_AND_SOFTWARE_INPUT}   input=Device Type
    Select DMS Dropdown Option  ${device_and_software_xpath}  ${device_type}
    BuiltIn.Sleep  5s
    ${device_and_software_xpath}=  Format String   ${XPATH_DEVICE_AND_SOFTWARE_INPUT}   input=Software Version
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${device_and_software_xpath}  ${software_version}
    BuiltIn.Sleep  5s


Update Overridden Parameters For devices
    [Documentation]  Update DMS overridden parameters for eNodeB, Sector 1 and Sector 2
    BuiltIn.Sleep  10s
    Update Overridden Parameter  eNodeB  LTE X2 Configuration  scalar  ${LTE_NL_PARAM_DICT2}
    #Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Overridden Parameters For All Sectors
    [Documentation]  Update DMS overridden parameters for eNodeB, Sector 1 and Sector 2
    # [Arguments]  ${enodeb_params}  ${sector1_params}  ${sector2_params}
    #Update Overridden Parameter  Sector 2  PLMN  tabular  ${PLMN_PARAM_DICT}
    #BuiltIn.Sleep  2s
    #Update Overridden Parameter  Sector 2  LTE  tabular  ${LTE_PARAM_DICT}
    #BuiltIn.Sleep  2s
    #Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT}
    #BuiltIn.Sleep  2s
    #Update Overridden Parameter  Sector 1  PLMN  tabular  ${PLMN_PARAM_DICT}
    #BuiltIn.Sleep  2s
    #Update Overridden Parameter  eNodeB  Core Network Parameter  scalar  ${CNP_PARAM_DICT}
    #BuiltIn.Sleep  2s
    #Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT}
    Update Overridden Parameter  eNodeB  LTE X2 Configuration  scalar  ${LTE_NL_PARAM_DICT3}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Select Device From Device List
    [Documentation]  Select device from existing device list
    [Arguments]  ${device_filter}
    BuiltIn.Sleep  2s
    Select DMS Dropdown Option  ${XPATH_DEVICE_FILTER_LIST_INPUT}  ${device_filter}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_SELECT_ALL_DEVICE_CHECKBOX_INPUT}
    BuiltIn.Sleep  2s
    #Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    Scroll Element Into View  ${ID_SELECTEDDEVICES_TEXT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    #BuiltIn.Sleep  10s

Update Core Parameters For devices
    BuiltIn.Sleep  10s
    Update Overridden Parameter  eNodeB  Core  scalar  ${Core_Network_parameter_dict1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  2s

Update RF Parameters For devices
    BuiltIn.Sleep  10s
    Update Overridden Parameter  Sector 1  RF Parameters  scalar  ${Device_RF_parameter_dict1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  2s

Add Device for configuration
    [Arguments]  ${Device_mac}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${Device_mac}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Open Proactive job

    Go To   ${Proactive_job}
    Wait Until Element Is Visible  ${XPATH_PROACTIVE_JOB_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_PROACTIVE_JOB_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Create Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}
    Click DMS Element    ${XPATH_ADD_JOB}
    #BuiltIn.Sleep  2s
    #Execute javascript  document.body.style.zoom="90%"
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    #BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select schedule time    ${XPATH_START_TIME_bulk}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_DEVICE_TYPE_cntrl}
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_DEVICE_CRITERIA_ALL}
    #maximize browser window
    execute javascript  window.scrollBy(600, 700)
    #BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    #BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_BELOW_DEVICE}
    #BuiltIn.Sleep  5s
    #Scroll Element Into View  ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_Vertical_scroll}
    #BuiltIn.Sleep  2s

    #execute javascript  window.scrollTo(0,document.body.scrollHeight) # end of page
    #document.body.scrollTop = document.body.scrollHeight;
    #document.documentElement.scrollTop = document.documentElement.scrollHeight;
    #JavascriptExecutor jse = (JavascriptExecutor) driver
    #jse.executeScript("window.scrollBy(0,document.body.scrollHeight || document.documentElement.scrollHeight)", "")
    #execute javascript  window.scrollTo(0,document.body.scrollHeight || document.documentElement.scrollHeight)
    #BuiltIn.Sleep  5s
    #execute javascript  window.scrollBy(0,-document.body.scrollHeight || document.documentElement.scrollHeight)
    #BuiltIn.Sleep  5s
    #execute javascript  window.scrollBy(0,-document.body.scrollHeight) # start of page
    #BuiltIn.Sleep  5s
    #Execute JavaScript    window.document.evaluate(${XPATH_PAGE_END}, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);

    #Set Window Position    200    200
    #BuiltIn.Sleep  5s
    #mimize browser window
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    #Set Window Position    	0    50
    #BuiltIn.Sleep  5s
    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    #Click DMS Element     ${XPATH_DEVICE_CRITERIA_ALL}
    #Built uIn.Sleep  2s
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  15s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_PROACTIVE_SAVE}
    #BuiltIn.Sleep  2s


Add Device for configuration Proactive Job
    [Arguments]  ${Network_Param_config_mac}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${Network_Param_config_mac}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Verify Provisioned values
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${XPATH_RF_PROVISION_TABLE}
    BuiltIn.Sleep  5s
    Log          ${value}
    Should Contain     ${value}     ${DL_Bandwidth}
    Should Contain     ${value}     ${UL_Bandwidth}

Delete present job
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_DELETE_BUTTON_Proactive_Job}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_DELETE_BUTTON_Proactive_Job}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_CONFIRM_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s

Search Device Proactive job
    BuiltIn.Sleep  5s
    input dms text  ${XPATH_FILTER_NAME}    ${Device_Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Proactive_job_Apply_Filter}
    BuiltIn.Sleep  5s
    ${Result}=     Get Text     ${XPATH_TABLE_ROW}
    Log    ${Result}
    RUN KEYWORD IF  '${RESULT}'=='${Device_Job_name}'  Delete present job

Search Network Proactive job
    BuiltIn.Sleep  5s
    input dms text  ${XPATH_FILTER_NAME}    ${Network_Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Proactive_job_Apply_Filter}
    BuiltIn.Sleep  5s
    ${Result}=     Get Text     ${XPATH_TABLE_ROW}
    Log    ${Result}
    RUN KEYWORD IF  '${RESULT}'=='${Network_Job_name}'  Delete present job

Verify Network Provisioned values
    [Documentation]     Search DMS overridden parameter in respective sector
    [Arguments]     ${sector}  ${section}
    BuiltIn.Sleep  5s
    Search Provision Parameter    ${sector}  ${section}
    BuiltIn.Sleep  5s
    ${value}          GET TEXT         ${XPATH_Core_Network}
    BuiltIn.Sleep  5s
    Log          ${value}
    Should Contain     ${value}     ${Security_Gateway_Server1}
    #Should Contain     ${value}     ${Security_Gateway_Server2}
    #Should Contain     ${value}     ${Security_Gateway_Server3}
    #Should Contain     ${value}     ${Security_Gateway_Server4}

Add Bulk Device for configuration
    #[Arguments]  ${Device_mac}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Log     ${Device MACID List}
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        Log    ${macid}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  2s
        Clear Element Text     ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  2s
        Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${macid}
        BuiltIn.Sleep  2s
        Click DMS Element  ${XPATH_APPLY_FILTER}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_SELECT_DEVICE}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
        BuiltIn.Sleep  5s
    END
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Search Device Reset Proactive job
    [arguments]    ${job_name}
    BuiltIn.Sleep  5s
    input dms text  ${XPATH_FILTER_NAME}    ${job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Proactive_job_Apply_Filter}
    BuiltIn.Sleep  5s
    ${Result}=     Get Text     ${XPATH_TABLE_ROW}
    Log    ${Result}
    RUN KEYWORD IF  '${RESULT}'=='${job_name}'  Delete present job


Add Reset Reboot Device for configuration Proactive Job
    [Arguments]  ${Device MACID List}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        BuiltIn.Sleep  2s
        Clear Element Text     ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  2s
        Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${macid}
        BuiltIn.Sleep  2s
        Click DMS Element  ${XPATH_APPLY_FILTER}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_SELECT_DEVICE}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
        BuiltIn.Sleep  5s
    END
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Add Reboot Device for configuration Proactive Job
    [Arguments]  ${Device MACID List}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  5s
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT_BOOT['Device MACID List Boot']}
        BuiltIn.Sleep  5s
        Clear Element Text     ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  5s
        Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${macid}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_APPLY_FILTER}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_SELECT_DEVICE}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
        BuiltIn.Sleep  5s
    END
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Add Bulk Device for Reboot configuration
    #[Arguments]  ${Device_mac}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Log     ${Device MACID List}
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT_BOOT['Device MACID List Boot']}
        Log    ${macid}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  2s
        Clear Element Text     ${XPATH_PATH_MACID_INPUT}
        BuiltIn.Sleep  2s
        Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${macid}
        BuiltIn.Sleep  2s
        Click DMS Element  ${XPATH_APPLY_FILTER}
        BuiltIn.Sleep  10s
        Click DMS Element  ${XPATH_SELECT_DEVICE}
        BuiltIn.Sleep  10s
        Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
        BuiltIn.Sleep  10s
    END
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Create Rechability Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}
    Click DMS Element    ${XPATH_ADD_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE_MODE}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_SCHEDULE_JOBTYPE}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    ${Current Time}=    GET Value     ${XPATH_SCHEDULE_DATE}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}	${post} =	Split String	${split value}[1]	:	1
    #${split_value_minutes}     Split String   ${split value}[1]   :
    #Log     ${split_value_minutes}
    #Log     ${split_value_minutes}[1]
    Log     ${pre}
    Log     ${post}
    ${new value}=    Evaluate   int('${post}') + 10
    Log    ${new value}
    ${new date}=     Catenate     ${split value}[0]  ${pre}:${new value}  ${split value}[2]
    Log     ${new date}
    #Click DMS Element     ${XPATH_start_button}
    #BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_MINUTES_XPATH}
    #BuiltIn.Sleep  5s
    #${minutes}=    GET Value     ${XPATH_MINUTES_XPATH}
    #Log    ${minutes}
    #${new value}=    Evaluate   ${minutes} + 10
    #Log    ${new value}
    #Select DMS Dropdown Option  ${XPATH_MINUTES_XPATH}    ${new value}
    #Scroll Element Into View  ${new value}
    #BuiltIn.Sleep  5s
    #Click DMS Element     ${new value}
    #BuiltIn.Sleep  5s

    #${CurrentDate}=  Get Current Date  result_format=%m/%d/%Y %H:%M:%S.%f
    #${newdatetime} =  Add Time To Date  ${CurrentDate}  15 minutes
    #Log  ${newdatetime}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_SCHEDULE_DATE}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_SCHEDULE_DATE}      ${new date}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_FREQUENCY}    ${Frequency_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_DEVICE_TYPE_cntrl}
    BuiltIn.Sleep  5s
    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_SCHEDULE_DATE}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_SCHEDULE_DATE}      ${new date}
     BuiltIn.Sleep  5s
    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  15s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s

Device console and Operation History reachability Verification
    BuiltIn.Sleep  2s
    ${Last_contacted_time}=     get text    ${XPATH_LAST_CONTACTED_TIME}
    Log    ${Last_contacted_time}
    BuiltIn.Sleep  10s
    Click DMS Element     ${XPATH_OPERATION_HISTORY}
    BuiltIn.Sleep  10s
    Input DMS Text    ${XPATH_OPERATION_TABLE_INPUT}    Test_Rechability
    BuiltIn.Sleep  5s
    click dms button    ${XPATH_OPERATION_APPLY_FILTER}
    BuiltIn.Sleep  5s
    ${Method_name}=     get text     ${XPATH_OPERATION_HISTORY_TABLE_METHOD}
    Log    ${Method_name}
    ${Resource_name}=     get text     ${XPATH_OPERATION_HISTORY_TABLE_RESOURCE_NAME}
    Log    ${Resource_name}
    ${Status}=     get text     ${XPATH_OPERATION_HISTORY_TABLE_OPERATION_STATUS}
    Log    ${Status}
    should contain      ${Method_name}     	 Reachability Check
    should contain      ${Resource_name}     	 ${Rechability_job_name}
    should contain      ${Status}     Success

Reachability Verification on Device History
    #Export Device History  Tabular  Last 1 hour  All
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    BuiltIn.Sleep  1s
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    #Click on Export Button
    BuiltIn.Sleep  2s
    ${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    Log    ${Device_history_table}
    should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_table}     Device Reachability Response

Update Overridden Parameters For CUCP VNFs
    [Documentation]  Update DMS overridden parameters CUCP VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G CUCP  CU CP NR Cell Configuration  tabular  ${CUCP_NR_CELL_PARAM_DICT2}
    Update Overridden Parameter for 5G CUCP  Heartbeat Configuration  scalar  ${HB_PARAM_DICT2}
    Update Overridden Parameter for 5G CUCP  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT2}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Device Overridden Parameters For CUCP VNFs
    [Documentation]  Update DMS overridden parameters CUCP VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G CUCP  CU CP NR Cell Configuration  tabular  ${CUCP_NR_CELL_PARAM_DICT1}
    Update Overridden Parameter for 5G CUCP  Heartbeat Configuration  scalar  ${HB_PARAM_DICT1}
    Update Overridden Parameter for 5G CUCP  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Overridden Parameters For CUUP VNFs
    [Documentation]  Update DMS overridden parameters CUUP VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G CUUP  CU UP gNB Configuration  scalar  ${CUUP_GNBID_LENGTH_PARAM_DICT2}
    Update Overridden Parameter for 5G CUUP  Heartbeat Configuration  scalar  ${HB_PARAM_DICT2}
    Update Overridden Parameter for 5G CUUP  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT2}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Device Overridden Parameters For CUUP VNFs
    [Documentation]  Update DMS overridden parameters CUUP VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G CUUP  CU UP gNB Configuration  scalar  ${CUUP_GNBID_LENGTH_PARAM_DICT1}
    Update Overridden Parameter for 5G CUUP  Heartbeat Configuration  scalar  ${HB_PARAM_DICT1}
    Update Overridden Parameter for 5G CUUP  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Overridden Parameters For DU VNFs
    [Documentation]  Update DMS overridden parameters DU VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G DU  DU Node  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT1}
    Update Overridden Parameter for 5G DU  Cell 1  NR Cell Configuration  scalar  ${NRCELL_CONFIG_PARAMS_DICT1}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}

Update Device Overridden Parameters For DU VNFs
    [Documentation]  Update DMS overridden parameters DU VNFs
    BuiltIn.Sleep  10s
    Update Overridden Parameter for 5G DU  DU Node  VES Collector Configuration  scalar  ${VES_COLLECTOR_PARAM_DICT2}
    Update Overridden Parameter for 5G DU  Cell 1  NR Cell Configuration  scalar  ${NRCELL_CONFIG_PARAMS_DICT2}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DEVICE_BULK_CONFIG_NEXT_BUTTON}