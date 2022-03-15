*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Variables           policy_ui_controls.py
Variables           Policy_testData.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${EXECDIR}${IMPORT_POLICY_FILE_LOCATION}

*** Keywords ***
Open Devicy Policy Page
    [Documentation]  Open Device Policy page
    ${open_page}=      Format String      ${DEVICE_POLICY_PAGE}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Log  ${open_page}
    Go To   ${open_page}
    Wait Until Element Is Visible  ${ID_DP_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Verify the Success msg
    [Documentation]  Verify the success msg for device policy
    [Arguments]     ${Policy_Name}
    Open Devicy Policy Page
    ${success_msg} =    Format String   ${XPATH_DP_SUCCESS_MSG}     ${Policy_Name}
    Wait Until Element Is Visible   ${success_msg}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Delete the Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Devicy Policy Page
    ${DELETE_POLICY} =    Format String   ${XPATH_DP_DELETE_POLICY}     ${Policy_Name}
    Run keyword And Continue On Failure    Click DMS Element    ${DELETE_POLICY}
    BuiltIn.Sleep   5s
    Run keyword And Continue On Failure    Click DMS Button     ${XPATH_DELETE_CONFIRM_BTN}
    Run keyword And Continue On Failure    Wait Until Element Is Visible   ${XPATH_DELETE_MSG_NOTIFICATION}  timeout=180s
    Log     Policy deleted Successfully

Execute the Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Devicy Policy Page
    ${Execute_POLICY} =    Format String   ${XPATH_DP_EXECUTE_POLICY}     ${Policy_Name}
    Click DMS Element    ${Execute_POLICY}
    BuiltIn.Sleep   5s
    Log     Policy executed Successfully

Add Device Policy for GPV On Demand
     [Documentation]  Add device policy for on Demand
     [Arguments]     ${Policy_Name}     @{param_list}
     Open Devicy Policy Page
     #BuiltIn.Sleep   5s
     #Click DMS Element  ${XPATH_VALDIN_LIC}
     BuiltIn.Sleep   5s
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     BuiltIn.Sleep   5s
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     BuiltIn.Sleep   5s
     Click DMS Element   ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
     BuiltIn.Sleep   5s
     Click DMS ELement  ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys    ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   5s

     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   5s
     press keys     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}      ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element     ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Scroll Element Into View       ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   5s
     Set Focus To Element       ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   5s


     Click DMS Element      ${XPATH_DP_GPV_DEVICEINFO_PARAM_SUB1}
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_DEVICEINFO_PARAM_SUB2}
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_DEVICEINFO_PARAM_SUB3}
     BuiltIn.Sleep   5s

     Scroll Element Into View    ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.Sleep   5s
     Set Focus To Element    ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.Sleep   5s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.Sleep   5s
     Scroll Element Into View    ${ID_DP_SAVE_AND_EXECUTE_BTN}
     BuiltIn.Sleep   5s
     Scroll Element Into View    ${XPATH_PAGE_BEGIN}
     BuiltIn.Sleep   5s
     Set Focus To Element    ${ID_DP_SAVE_AND_EXECUTE_BTN}
     BuiltIn.Sleep   5s
     Click DMS Element      ${ID_DP_SAVE_AND_EXECUTE_BTN}
     BuiltIn.Sleep   5s


Add Device Policy for SPV Scheduled
     [Documentation]  Add device policy for scheduled
     [Arguments]     ${Policy_Name}
     Open Devicy Policy Page
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     BuiltIn.Sleep   5s
     Click DMS Element   ${XPATH_DP_EXECUTION_SCHEDULED_RADIOBTN}
     BuiltIn.Sleep   5s
     #Click DMS Element    ${XPATH_DP_SCHEDULED_CALENDER}
     #BuiltIn.Sleep   5s

     ${Current Time}=    GET Value     ${XPATH_START_TIME}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}	${post} =	Split String	${split value}[1]	:	1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    ${new value}=    Evaluate   int(${post}) + 3
    Log    ${new value}
    ${new date}=     Catenate     ${split value}[0]  ${pre}:${new value}  ${split value}[2]
    Log     ${new date}

    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_START_TIME}      ${new date}
    BuiltIn.Sleep  5s

     #Click DMS Element    ${XPATH_DP_SCHEDULED_SELECT_DATE}
     #BuiltIn.Sleep   5s
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   5s
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_SPV}
     BuiltIn.Sleep   5s
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   5s
     press keys     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}      ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   5s
     #Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     #BuiltIn.Sleep   5s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.Sleep   5s
     Input DMS Text  ${XPATH_DP_SPV_FN_TEXTBOX}   1
     BuiltIn.Sleep   5s
     #Input DMS Text  ${XPATH_DP_SPV_NR_TEXTBOX}   120
     #BuiltIn.Sleep   5s
     Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.Sleep   5s
     Set Focus To Element     ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.Sleep   5s
     Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.Sleep   5s
     Click DMS Element            ${ID_DP_SAVE_BUTTON}




Add Device Policy for GPA Event Type All
     [Documentation]  Add device policy for GPA Event Type All
     [Arguments]     ${Policy_Name}
     Open Devicy Policy Page
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.Sleep   5s
     Click DMS Element    ${XPATH_DP_ALL_CHECKBOX}
     BuiltIn.Sleep   5s
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_GPA}
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element     ${XPATH_DP_GPA_TIME_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_GPA_TIME_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element     ${XPATH_DP_GPA_FAULT_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_GPA_FAULT_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPA_TIME_SUB}
     BuiltIn.Sleep   5s

     #Click DMS Element      ${XPATH_DP_GPA_FAULT_ATTR1}
     #BuiltIn.Sleep   3s
     #Click DMS Element      ${XPATH_DP_GPA_FAULT_ATTR2}
     #BuiltIn.Sleep   4s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
     Set Focus To Element     ${XPATH_DP_COLLAPSE_DEVICE}
     Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.sleep    5s
     Click DMS Element            ${XPATH_SAVE_BUTTON}
     BuiltIn.sleep    5s

Add Device Policy for SPA Event Type Periodic
     [Documentation]  Add device policy for SPA Event Type Periodic
     [Arguments]     ${Policy_Name}
     Open Devicy Policy Page
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.sleep    5s
     Click DMS Element    ${XPATH_DP_PERIODIC_CHECKBOX}
     BuiltIn.sleep    5s
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_SPA}
     BuiltIn.sleep    5s
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
      BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element     ${XPATH_DP_GPA_TIME_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_GPA_TIME_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element     ${XPATH_DP_GPA_FAULT_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_GPA_FAULT_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element      ${XPATH_DP_GPA_TIME_SUB}
     BuiltIn.Sleep   5s

     #Click DMS Element      ${XPATH_DP_GPA_FAULT_ATTR1}
     #BuiltIn.Sleep   3s
     #Click DMS Element      ${XPATH_DP_GPA_FAULT_ATTR2}
     #BuiltIn.Sleep   4s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.sleep    5s
     Click DMS Element      ${XPATH_DP_PERIODIC_DRPDOWN}
     Click DMS Element       ${XPATH_DP_PERIODIC_VALUE}
     BuiltIn.sleep    5s
     Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
     Set Focus To Element      ${XPATH_DP_COLLAPSE_DEVICE}
     Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
      BuiltIn.sleep    5s
     Click DMS Element            ${XPATH_SAVE_BUTTON}
     BuiltIn.sleep    5s

Add Device Policy for Add Object in Event Type Boot
     [Documentation]  Add device policy for Add Object in Event Type Boot
     [Arguments]     ${Policy_Name}
     Open Devicy Policy Page
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     Click DMS Element    ${XPATH_DP_BOOT_CHECKBOX}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ADD_OBJECT}
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     Click DMS ELement    ${XPATH_DP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_FAULTMGMT_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element   ${XPATH_DP_FAULTMGMT_HISTORY_HEADER}
     BuiltIn.sleep    5s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.sleep    5s
     Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
     Set Focus To Element      ${XPATH_DP_COLLAPSE_DEVICE}
     Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.sleep    5s
     Click DMS Element            ${XPATH_SAVE_BUTTON}
     BuiltIn.sleep    5s

Add Device Policy for Add Object in Event Type BootStrap
     [Documentation]  Add device policy for Add Object in Event Type BootStrap
     [Arguments]     ${Policy_Name}
     Open Devicy Policy Page
     Click DMS Element  ${ID_DP_ADD_NEW_BUTTON}
     Input DMS Text  ${ID_DP_POLICY_NAME}  ${Policy_Name}
     Click DMS Element    ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     Click DMS Element    ${XPATH_DP_BOOTSTRAP_CHECKBOX}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ADD_OBJECT}
     Click DMS ELement    ${XPATH_DP_DEVICE_lIST}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_DEVICE_lIST}    ARROW_RIGHT
     Click DMS ELement    ${XPATH_DP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   5s
     press keys   ${XPATH_DP_FAULTMGMT_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   5s
     Click DMS Element   ${XPATH_DP_FAULTMGMT_HISTORY_HEADER}
     BuiltIn.sleep    5s
     Click DMS Element      ${ID_DP_ADD_POLICY_BTN}
     BuiltIn.sleep    5s
     Scroll Element Into View    ${XPATH_DP_COLLAPSE_DEVICE}
     Set Focus To Element      ${XPATH_DP_COLLAPSE_DEVICE}
     Click DMS Element            ${XPATH_DP_COLLAPSE_DEVICE}
     BuiltIn.sleep    5s
     Click DMS Element            ${XPATH_SAVE_BUTTON}
     BuiltIn.sleep    5s


Device Policy Import
    [Documentation]  Import device policy
    Click DMS Element   ${XPATH_IMPORT_BUTTON}
    BuiltIn.sleep    5s
    #Click DMS Element   ${XPATH_CHOOSE_FILE}
    #BuiltIn.sleep    3s
    Wait Until Page Contains Element   ${UploadFiletest}   60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}     ${AddFile}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_IMPORT_MSG}
    ${value}        Get Text     ${XPATH_POLICY_IMPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Policy Imported Successfully
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_OPERATION_HISTORY}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_OPERATION_NAME}
    BuiltIn.sleep    5s
    Input DMS Text  ${XPATH_OPERATION_NAME}  ${OPERATION_TYPE}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_APPLY_FILTER_2}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_MORE_DETAILS}
    BuiltIn.sleep    5s
    ${value}        Get Text     ${XPATH_INFO}
    Log             ${value}
    Should Contain    ${value}    CREATED
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s


Device Policy Clone
    [Documentation]  Clone device policy
    Input DMS Text  ${XPATH_POLICY_NAME1}  ${POLICY_NAME}
    BuiltIn.sleep    5s
    Click DMS Element  ${APPLY_FILTER_POLICY}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_CLONE}
    BuiltIn.sleep    5s
    Get DMS Element Text  ${XPATH_POLICY_CLONE_NAME}
    #Input Text  ${XPATH_POLICY_CLONE_NAME}  +  Copy
    ${value}        Get Text     ${XPATH_POLICY_CLONE_NAME}
    Log             ${value}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_OK_BUTTON}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_CLONE_SUCCESS}
    ${value}        Get Text     ${XPATH_CLONE_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    successfully
    BuiltIn.sleep    5s
    Input DMS Text  ${XPATH_POLICY_NAME1}  ${POLICY_NAME_CLONE}
    BuiltIn.sleep    5s
    Click DMS Element  ${APPLY_FILTER_POLICY}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_DELETE}
    BuiltIn.sleep    5s
    Click DMS Element  ${XPATH_CONFIRM_BUTTON}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_DELETE_MSG}
    ${value}        Get Text     ${XPATH_DELETE_MSG}
    Log             ${value}
    Should Contain    ${value}    Deleted Policy successfully
    BuiltIn.sleep    5s


Device Policy Export
    [Documentation]  Export device policy
    Click DMS Element   ${XPATH_CHECKBOX}
    BuiltIn.sleep    5s
    Click DMS Element   ${XPATH_EXPORT}
    BuiltIn.sleep    5s
    Wait Until Element Is Visible  ${XPATH_POLICY_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_POLICY_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Download completed
    BuiltIn.sleep    5s
    #Input DMS Text  ${XPATH_POLICY_NAME1}  ${POLICY_NAME}
    #BuiltIn.sleep    2s
    #Click DMS Element  ${APPLY_FILTER_POLICY}
    #BuiltIn.sleep    2s
    #Click DMS Element  ${XPATH_DELETE}
    #BuiltIn.sleep    3s
    #Click DMS Element  ${XPATH_CONFIRM_BUTTON}
    #BuiltIn.sleep    3s
    @{ret_val} =  create list    ${POLICY_NAME}    ${POLICY_NAME_2}
    FOR  ${item}  IN  @{ret_val}
       log to console  Item: ${item}
        Input DMS Text  ${XPATH_POLICY_NAME1}  ${item}
        BuiltIn.sleep    5s
       Click DMS Element  ${APPLY_FILTER_POLICY}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_DELETE}
       BuiltIn.sleep    5s
       Click DMS Element  ${XPATH_CONFIRM_BUTTON}
       BuiltIn.sleep    5s
    END

