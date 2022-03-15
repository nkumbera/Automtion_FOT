*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Variables           policy_ui_controls.py
Variables           Policy_testData.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${EXECDIR}${IMPORT_POLICY_FILE_LOCATION}
${AddPolicy_CUCP}          ${EXECDIR}${CU_CP_POLICY_LOCATION}
${AddPolicy_CUUP}          ${EXECDIR}${CU_UP_POLICY_LOCATION}
${AddPolicy_DU}            ${EXECDIR}${DU_POLICY_LOCATION}


*** Keywords ***
Open Vnf Policy Page
    [Documentation]  Open Vnf Policy page
    [arguments]    ${VNF_POLICY_PAGE}
    ${open_page}=      Format String      ${VNF_POLICY_PAGE}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_VNF_POLICY_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

CP Device Policy Import
    [Documentation]  Import device policy
   #[arguments]    CP_policy
    BuiltIn.sleep    2s
    Click DMS Element   ${XPATH_POLICY_IMPORT_BUTTON}
    BuiltIn.sleep    5s
    Wait Until Page Contains Element   ${UploadFiletest}    60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}    ${AddPolicy_CUCP}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_IMPORT_SUCCESS}
    ${value}        Get Text     ${XPATH_POLICY_IMPORT_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    Policy Imported Successfully
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_CHECKBOX}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_EXPORT}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_POLICY_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Download completed
    BuiltIn.sleep    5s
    @{ret_val} =  create list    ${CP_POLICY1}    ${CP_POLICY2}
    FOR  ${item}  IN  @{ret_val}
       log to console  Item: ${item}
        Input DMS Text  ${XPATH_ENTER_POLCIYNAME}  ${item}
        BuiltIn.sleep    5s
       Click DMS Element  ${APPLY_FILTER_POLICY}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_DEL}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_CONFIRM_BUTTON}
       BuiltIn.sleep    5s
    END



UP Device Policy Import
    [Documentation]  Import device policy
    BuiltIn.sleep    2s
    Click DMS Element   ${XPATH_POLICY_IMPORT_BUTTON}
    BuiltIn.sleep    5s
    #Click DMS Element   ${XPATH_CHOOSE_FILE}
    #BuiltIn.sleep    3s
    Wait Until Page Contains Element   ${UploadFiletest}    60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}    ${AddPolicy_CUUP}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_IMPORT_SUCCESS}
    ${value}        Get Text     ${XPATH_POLICY_IMPORT_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    Policy Imported Successfully
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_CHECKBOX}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_EXPORT}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_POLICY_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Download completed
    BuiltIn.sleep    5s
    @{ret_val} =  create list    ${UP_POLICY1}    ${UP_POLICY2}
    FOR  ${item}  IN  @{ret_val}
       log to console  Item: ${item}
        Input DMS Text  ${XPATH_ENTER_POLCIYNAME}  ${item}
        BuiltIn.sleep    5s
       Click DMS Element  ${APPLY_FILTER_POLICY}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_DEL}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_CONFIRM_BUTTON}
       BuiltIn.sleep    5s
    END



DU Device Policy Import
    [Documentation]  Import device policy
    BuiltIn.sleep    2s
    Click DMS Element   ${XPATH_POLICY_IMPORT_BUTTON}
    BuiltIn.sleep    5s
    #Click DMS Element   ${XPATH_CHOOSE_FILE}
    #BuiltIn.sleep    3s
    Wait Until Page Contains Element   ${UploadFiletest}    60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}    ${AddPolicy_DU}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_IMPORT_SUCCESS}
    ${value}        Get Text     ${XPATH_POLICY_IMPORT_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    Policy Imported Successfully
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_CHECKBOX}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_EXPORT}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_POLICY_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Download completed
    BuiltIn.sleep    7s
    @{ret_val} =  create list    ${DU_POLICY1}    ${DU_POLICY2}
    FOR  ${item}  IN  @{ret_val}
       log to console  Item: ${item}
        Input DMS Text  ${XPATH_ENTER_POLCIYNAME}  ${item}
        BuiltIn.sleep    5s
       Click DMS Element  ${APPLY_FILTER_POLICY}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_DEL}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_CONFIRM_BUTTON}
       BuiltIn.sleep    5s
    END


Add ondemand Policy for Cert
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
    BuiltIn.sleep    5s
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    Input DMS Text     ${Policy_search}     ${POLICY_SEARCH_VALUE}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_Security_tree}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_Security_tree}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_Factory_CA_SERVER}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_Factory_CA_SERVER}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_Cert_value}
    BuiltIn.Sleep   5s
    Click DMS Element    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    Run keyword if   '${Policy_Name}' == 'EnableAutomaticRPKeyCertsDownload_SPV'   Input DMS Text  ${XPATH_USERFIELD_VALUE}   1
    BuiltIn.Sleep   5s
    Run keyword if   '${Policy_Name}' == 'EnableAutomaticRPKeyCertsDownload_SPV'   Input DMS Text  ${XPATH_USERFIELD_VALUE}   1
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
    BuiltIn.Sleep   5s
    Set Focus To Element     ${XPATH_DP_COLLAPSE_DEVICE}
    BuiltIn.Sleep   5s
    Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
    BuiltIn.Sleep   5s
    Click DMS Element            ${ID_DP_SAVE_BUTTON}


Open Realdevice Devicy Policy Page
    [Documentation]  Open Device Policy page
    BuiltIn.Sleep  5s
    Go to   ${DMS_Realdevice_Policy_Page}
    BuiltIn.Sleep  5s


Delete the Realdevice Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Realdevice Devicy Policy Page
    BuiltIn.Sleep   5s
    Input DMS Text    ${Policy_Name_field}    ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_APPLY_FILTER_OH}
    BuiltIn.Sleep   5s
    ${DELETE_POLICY} =    Format String   ${XPATH_DP_DELETE_POLICY}     ${Policy_Name}
    Run keyword And Continue On Failure   Click DMS Element    ${DELETE_POLICY}
    BuiltIn.Sleep   5s
    Run keyword And Continue On Failure    Click DMS Button     ${XPATH_DELETE_CONFIRM_BTN}
    Run keyword And Continue On Failure    Wait Until Element Is Visible   ${XPATH_DELETE_MSG_NOTIFICATION}  timeout=180s
    Log     Policy deleted Successfully


Execute the Realdevice Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Realdevice Devicy Policy Page
    BuiltIn.Sleep   5s
    Input DMS Text    ${Policy_Name_field}    ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_APPLY_FILTER_OH}
    BuiltIn.Sleep   5s
    ${Execute_POLICY} =    Format String   ${XPATH_DP_EXECUTE_POLICY}     ${Policy_Name}
    Click DMS Element    ${Execute_POLICY}
    BuiltIn.Sleep   5s
    Log     Policy executed Successfully

Verify Realdevice Success msg
    [Documentation]  Verify the success msg for device policy
    [Arguments]     ${Policy_Name}
    Open Realdevice Devicy Policy Page
    ${success_msg} =    Format String   ${XPATH_DP_SUCCESS_MSG}     ${Policy_Name}
    Wait Until Element Is Visible   ${success_msg}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Add ondemand Policy
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
    BuiltIn.sleep    5s
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    Input DMS Text     ${Policy_search}     ${POLICY_SEARCH_VALUE_GCD}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST_Model}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_VesListener}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST_VesListener}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DP_DEVICE_LIST_PARAM_VESURL}
    BuiltIn.Sleep   5s
    Click DMS Element    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    Click DMS Element            ${ID_DP_SAVE_BUTTON}

Execute the Get Configured Data Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${VNF_POLICY_PAGE_url}     ${Policy_Name}
    Open Vnf Policy Page    ${VNF_POLICY_PAGE_url}
    ${Execute_POLICY} =    Format String   ${XPATH_DP_EXECUTE_POLICY}     ${Policy_Name}
    Click DMS Element    ${Execute_POLICY}
    BuiltIn.Sleep   5s
    Log     Policy executed Successfully

Verify VNF Success msg
    [Documentation]  Verify the success msg for device policy
    [Arguments]     ${VNF_POLICY_PAGE_url}    ${Policy_Name}
    Open Vnf Policy Page    ${VNF_POLICY_PAGE_url}
    ${success_msg} =    Format String   ${XPATH_DP_SUCCESS_MSG}     ${Policy_Name}
    Wait Until Element Is Visible   ${success_msg}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Delete VNF Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${VNF_POLICY_PAGE_url}   ${Policy_Name}
    Open Vnf Policy Page    ${VNF_POLICY_PAGE_url}
    ${DELETE_POLICY} =    Format String   ${XPATH_DP_DELETE_POLICY}     ${Policy_Name}
    Run keyword And Ignore Error    Click DMS Element    ${DELETE_POLICY}
    BuiltIn.Sleep   5s
    Run keyword And Ignore Error    Click DMS Button     ${XPATH_DELETE_CONFIRM_BTN}
    Run keyword And Ignore Error    Wait Until Element Is Visible   ${XPATH_DELETE_MSG_NOTIFICATION}  timeout=180s
    Log     Policy deleted Successfully

Execute the Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Devicy Policy Page
    ${Execute_POLICY} =    Format String   ${XPATH_DP_EXECUTE_POLICY}     ${Policy_Name}
    Click DMS Element    ${Execute_POLICY}
    BuiltIn.Sleep   5s
    Log     Policy executed Successfully

Add Schedule Policy
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_SCHEDULE_RADIOBTN}
    BuiltIn.sleep    5s
    Select schedule time    ${XPATH_START_TIME_policy}
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    #Scroll Element Into View       ${POLICY_SEARCH_VALUE_Schedule}
    Input DMS Text     ${Policy_search}     ${POLICY_SEARCH_VALUE_Schedule}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_DP_DEVICE_lIST_Model}
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST_Model}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    ${tree_value_selected}    get Text    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   5s
    #Scroll Element Into View       ${XPATH_3GPP}
    Click DMS ELement    ${XPATH_3GPP}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_3GPP}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    ${tree_value_selected_3gpp}    get Text    ${XPATH_3GPP}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_PerfMetric}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_PerfMetric}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_PerfMetric}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    ${tree_value_selected_perfmetric}    get Text    ${XPATH_PerfMetric}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_ATTRIBUTE}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_ATTRIBUTE}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_ATTRIBUTE}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    ${tree_value_selected_attribute}    get Text    ${XPATH_ATTRIBUTE}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_ADMNIN_STATE}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_ADMNIN_STATE}
    #BuiltIn.Sleep   5s
    #press keys   ${XPATH_ADMNIN_STATE}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    ${tree_value_selected_admin}    get Text    ${XPATH_ADMNIN_STATE}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${ID_DP_ADD_POLICY_BTN}
    Click DMS Element    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    ${tree_value_selected_policy}    get Text    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${XPATH_Managed_element_index}
    Click DMS Element  ${XPATH_Managed_element_index}
    Input DMS Text  ${XPATH_Managed_element_index}  1
    BuiltIn.Sleep   3s
    Scroll Element Into View    ${XPATH_Perf_metrics_job}
    Click DMS Element  ${XPATH_Perf_metrics_job}
    Input DMS Text  ${XPATH_Perf_metrics_job}   1
    BuiltIn.Sleep   3s
    Scroll Element Into View    ${XPATH_admin_new_value}
    Click DMS Element  ${XPATH_admin_new_value}
    Input DMS Text  ${XPATH_admin_new_value}  5
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${ID_VNF_POLICY_HEADER}
    BuiltIn.Sleep   3s
    Click DMS Element            ${XPATH_SAVE_POLICY}
    BuiltIn.Sleep   5s

Add EventType Policy
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_EventType_RADIOBTN}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_REBOOT}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_RESET}
    BuiltIn.sleep    5s
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    #Scroll Element Into View       ${POLICY_SEARCH_VALUE_Schedule}
    Input DMS Text     ${Policy_search}     ${POLICY_SEARCH_VALUE_Schedule}
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_DP_DEVICE_lIST_Model}
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST_Model}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    #Scroll Element Into View       ${XPATH_3GPP}
    Click DMS ELement    ${XPATH_3GPP}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_3GPP}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_PerfMetric}
    Click DMS ELement    ${XPATH_PerfMetric}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_PerfMetric}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_ATTRIBUTE}
    Click DMS ELement    ${XPATH_ATTRIBUTE}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_ATTRIBUTE}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${XPATH_ADMNIN_STATE}
    Click DMS ELement    ${XPATH_ADMNIN_STATE}
    #BuiltIn.Sleep   5s
    #press keys   ${XPATH_ADMNIN_STATE}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View       ${ID_DP_ADD_POLICY_BTN}
    Click DMS Element    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${XPATH_Managed_element_index}
    Click DMS Element  ${XPATH_Managed_element_index}
    Input DMS Text  ${XPATH_Managed_element_index}  1
    BuiltIn.Sleep   3s
    Scroll Element Into View    ${XPATH_Perf_metrics_job}
    Click DMS Element  ${XPATH_Perf_metrics_job}
    Input DMS Text  ${XPATH_Perf_metrics_job}   1
    BuiltIn.Sleep   3s
    Scroll Element Into View    ${ID_VNF_POLICY_HEADER}
    BuiltIn.Sleep   3s
    Click DMS Element            ${XPATH_SAVE_POLICY}
    BuiltIn.Sleep   5s
Add ondemand Policy for EnableBanner
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
    BuiltIn.sleep    5s
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    Input DMS Text     ${Policy_search}     ${POLICY_ENABLE_SEARCH_VALUE}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_DeviceInfo_tree}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_DeviceInfo_tree}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${XPATH_EnableBanner_value}
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_EnableBanner_value}
    BuiltIn.Sleep   5s
    Click DMS Element    ${ID_DP_ADD_POLICY_BTN}
    BuiltIn.Sleep   5s
    Click DMS Element     ${ID_DP_SAVE_EXECUTE_BUTTON}

Search Policy from Device Policy
    [arguments]  ${Policy_Name}
    BuiltIn.Sleep   30s
    Click DMS Element  ${XPATH_DP_SEARCH_POLICY}
    BuiltIn.sleep    5s
    Input DMS Text     ${XPATH_DP_SEARCH_POLICY}     ${Policy_Name}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_APPLY_SEARCH}

Verify EnableBanner GPV details in history

    BuiltIn.Sleep  10s
    Scroll Element Into View     ${XPATH_POLICY_RESPONSE_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_POLICY_RESPONSE_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     Policy Response
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_POLICY_RESPONSE_ROW}
    BuiltIn.Sleep  10s
    ${history_detail_value}=     get text    ${XPATH_HISTORY_DETAIL}
    Log    ${history_detail_value}
    #Should Be Equal  ${value}    ${response_severity}
    #BuiltIn.Sleep  5s
        #Click DMS Element ${XPATH_HISTORY_DETAIL_CLOSE}
    BuiltIn.Sleep  5s
    Should Contain    ${history_detail_value}    OnDemand
    Should Contain    ${history_detail_value}    GetParameterValues
    Should Contain    ${history_detail_value}    EnableBanner_GPV
    Should Contain    ${history_detail_value}    Success
    Should Contain    ${history_detail_value}    DEVICE
    BuiltIn.sleep    4s
    #Click DMS Element  ${XPATH_HISTORY_DETAIL_CLOSE}
    BuiltIn.sleep    2s


Add On demand RU State policy for DU
    [arguments]  ${Policy_Name}    ${Policy_Type}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
    BuiltIn.sleep    5s
    Click DMS Element  ${ID_DP_POLICY_NAME}
    BuiltIn.sleep    5s
    Input DMS Text     ${ID_DP_POLICY_NAME}     ${Policy_Name}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
    BuiltIn.sleep    5s
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   5s
    #Click DMS Element  ${Policy_search}
    #BuiltIn.sleep    5s
    Click DMS Element    ${Policy_Type}
    BuiltIn.Sleep   5s
    Input DMS Text     ${Policy_search}     active
    BuiltIn.Sleep   5s
    Click DMS Element  ${Policy_search}
    BuiltIn.sleep    2s
    press keys   ${XPATH_ORAN_AGGREGATION}    ARROW_RIGHT
    BuiltIn.Sleep   2s
    Click DMS Element  ${XPATH_ORAN_AGGREGATION}
    BuiltIn.Sleep   2s
    press keys   ${XPATH_RU_INSTANCE}    ARROW_RIGHT
    BuiltIn.Sleep   2s
    Click DMS Element  ${XPATH_RU_INSTANCE}
    BuiltIn.Sleep   2s
    press keys   ${XPATH_ORAN_AGG_UPLANE}    ARROW_RIGHT
    BuiltIn.Sleep   2s
    Click DMS Element  ${XPATH_ORAN_AGG_UPLANE}
    BuiltIn.Sleep   2s
    press keys   ${XPATH_USER_PLANE}    ARROW_RIGHT
    BuiltIn.Sleep   2s
    Click DMS Element  ${XPATH_USER_PLANE}
    BuiltIn.Sleep   2s
    press keys   ${XPATH_TX_CARRIER}    ARROW_RIGHT
    BuiltIn.Sleep   2s
    Click DMS Element  ${XPATH_TX_CARRIER}
    BuiltIn.Sleep   2s
    #Click DMS Element  ${Policy_search}
    #BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_ACTIVE_PARAM}
    BuiltIn.Sleep   5s
    Click DMS Element  ${XPATH_ADD_PARAM}
    BuiltIn.Sleep   5s
    Input DMS Text     ${XPATH_INPUT_RUINSTANCE}    CommScope_RP5100_0005B9519AB1
    BuiltIn.Sleep   2s
    Input DMS Text     ${XPATH_INPUT_NAME1}     Carrier0-DL
    BuiltIn.Sleep   2s
    Input DMS Text     ${XPATH_NEWVALUE_TEXT}   DISABLED
    BuiltIn.Sleep   5s
    Click DMS Element   ${XPATH_SAVE_EXECUTE}
    BuiltIn.Sleep   7s
    Open gNB Device Dashboard
    BuiltIn.Sleep   4s
    Wait Until Element Is Visible  ${XPATH_CELL_STATE_INACTIVE}
    ${value}        Get Text     ${XPATH_CELL_STATE_INACTIVE}
    Log             ${value}
    Should Contain    ${value}     INACTIVE
    BuiltIn.Sleep  2s
    Open Vnf Policy Page    ${VNF_DU_POLICY_PAGE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_CHECKBOX}
    BuiltIn.Sleep   2s
    Click DMS Element   ${XPATH_DELETE}
    BuiltIn.Sleep   2s
    Click DMS Element   ${XPATH_CONFIRM_BUTTON}
    BuiltIn.Sleep   2s
