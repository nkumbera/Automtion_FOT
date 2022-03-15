*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../overwrridden_params/page/overwrite_params_helper.robot
Resource            ../../device_history/page/device_history_helper.robot
Library             SeleniumLibrary
Library             Collections
Variables           NetworkPolicy_ui_controls.py
Variables           ../../policy/page/policy_ui_controls.py
Library            DateTime
Resource            ../../common/ui_common.robot
Resource            ../../overwrridden_params/page/overwrite_params_helper.robot
Resource            ../../device_history/page/device_history_helper.robot
Library             SeleniumLibrary
Library             Collections
Variables           ../../NetworkPolicy/Page/NetworkPolicy_ui_controls.py
Variables           NetworkPolicy_VNF_ui_controls.py
Variables           ../../policy_gNB/page/policy_ui_controls.py
Library            DateTime

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_CUCP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_EventType_CUCP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_CUUP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_EventType_CUUP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_DU}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_EventType_DU}
${AddFile_IMPORT_NETWORKPOLICY_VNF_OnDemand_CUCP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_OnDemand_CUCP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_OnDemand_CUUP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_OnDemand_CUUP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_OnDemand_DU}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_OnDemand_DU}
${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_CUCP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_Schedule_CUCP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_CUUP}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_Schedule_CUUP}
${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_DU}          ${EXECDIR}${IMPORT_NETWORKPOLICY_VNF_Schedule_DU}



*** Keywords ***


Select schedule time_Network_Policy
    [Documentation]  Select schedule time
    ${Current Time}=    GET Value     ${XPATH_NP_START_TIME}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}  ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + 6
    Log    ${new_value}
    ${new_value_old}=    set variable    ${new_value}
    #${pre_old}=    set variable    ${pre}
    ${pre}=    Evaluate   int('${pre}') + 0
    Log    ${pre}
    ${pre_old}=    set variable    ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    #${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}
    ${pre}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${pre}') + 1
    ...  ELSE   set variable   ${pre_old}
    Log     ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    ${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}
    ...  ELSE   set variable   ${pre}
    ${new_value}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${new_value}') - 60
    ...  ELSE   set variable   ${new_value_old}
    Log     ${new_value}
    ${new_value}=    Run keyword if  ${new_value} == 0    set variable    01
    ...  ELSE   set variable   ${new_value}
    ${new_value}=    Evaluate   int('${new_value}') + 0
    Log    ${new_value}
    ${len}=     Evaluate   int(math.log10(${new_value})) + 1
    Log  ${len}
    #${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    #Log  ${len_pre}
    ${new date}=     Run keyword if  int(${len}) == 1    Catenate     ${split value}[0]  ${pre}:0${new_value}  ${split value}[2]
    ...  ELSE    Catenate     ${split value}[0]  ${pre}:${new_value}  ${split value}[2]
    Log     ${new date}
    BuiltIn.Sleep  ${NETWORK_POLICY_Sleep_Low}
    Clear Element Text     ${XPATH_NP_START_TIME}
    BuiltIn.Sleep  ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element   ${XPATH_ADMIN_ERROR}
    BuiltIn.Sleep  ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text      ${XPATH_NP_START_TIME}      ${new date}
    BuiltIn.Sleep  ${NETWORK_POLICY_Sleep_Low}


Add VNF Policy On Demand
    [Documentation]  Add VNF Policy On Demand
    Log   Add VNF Policy On Demand
    [Arguments]     ${Policy_Name_OnDemand}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Add VNF Policy    ${Policy_Name_OnDemand}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Select Execution Details On Demand
    Select Device Model

Add VNF Policy Event Type
    [Documentation]  Add VNF Policy Event Type
    Log   Add VNF Policy Event Type
    [Arguments]     ${Policy_Name_EventType}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Add VNF Policy    ${Policy_Name_EventType}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Select Execution Details Event Type
    Select Device Model

Add VNF Policy Scheduled
    [Documentation]  Add VNF Policy Scheduled
    Log   Add VNF Policy Scheduled
    [Arguments]     ${Policy_Name_Scheduled}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Add VNF Policy    ${Policy_Name_Scheduled}   ${OnDemand_ADDPOLICY_DEVICETYPE}
    Select Execution Details Scheduled
    Select Device Model

Add VNF Policy
    [Documentation]  Add VNF Policy
    Log   Add VNF Policy
    [Arguments]     ${Policy_Name}   ${NETWORK_ADDPOLICY_DEVICETYPE}
    Open Network policy Configuration Page
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Select DeviceType and Software Version   ${NETWORK_ADDPOLICY_DEVICETYPE}

Select Device Model
    [Documentation]  Select Device Model
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${XPATH_DP_DEVICEOPERATION_GCD}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text     ${NETWORK_Policy_search}     ${POLICY_SEARCH_VALUE_GCD}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_Model}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    press keys   ${XPATH_DP_DEVICE_lIST_Model}    ARROW_RIGHT
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View  ${XPATH_DP_DEVICE_lIST_VesListener}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS ELement    ${XPATH_DP_DEVICE_lIST_VesListener}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    press keys   ${XPATH_DP_DEVICE_lIST_VesListener}    ARROW_RIGHT
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View  ${XPATH_DP_DEVICE_LIST_PARAM_VESURL}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS ELement    ${XPATH_DP_DEVICE_LIST_PARAM_VESURL}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${ID_DP_ADD_NETWORKPOLICY_BTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${NETWORK_POLICY_ID_NP_NEXT_BTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${NETWORK_POLICY_ID_NP_NEXT_BTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${ID_NP_SAVE_BTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${XPATH_NP_CONFIRMBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}

Open Network policy Configuration Page
    [Documentation]  Open Network policy Configuration Page
    ${open_page}=  Format String   ${NETWORK_POLICY_CONFIGURATION_URL}   dms_device_console=${DMS_NC_URL}
    Log  ${open_page}
    Go To   ${open_page}

Select DeviceType and Software Version
    [Documentation]  Verify Select DeviceType and Software Version
    [Arguments]     ${NETWORK_POLICY_DEVICETYPE_VNF}
     Scroll Element Into View       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     Set Focus To Element       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_VNF}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION_VNF}
     BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_VNF}

Select Execution Details On Demand
    Click DMS Element   ${XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}

Select Execution Details Event Type
    Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${XPATH_DP_RESET_CHECKBOX}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View    ${XPATH_NP_SCHEDULED_CALENDER}
    #Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
    #BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    #Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
    #Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
    #Select schedule time    ${XPATH_NP_START_TIME}
    Select schedule time_Network_Policy
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}

Select Execution Details Scheduled
    Click DMS Element   ${XPATH_DP_EXECUTION_SCHEDULED_RADIOBTN}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    #Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
    #BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    #Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
    #Select schedule time     ${XPATH_NP_START_TIME}
    Select schedule time_Network_Policy
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}

Delete VNF Network Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Scroll Element Into View      ${ID_NP_POLICY_DELETE_BUTTON}
    Set Focus To Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element    ${ID_NP_CONFIRM_DELETE_BTN}
    Log     Policy deleted Successfully


Verify VNF Policy Creation
    [Documentation]  Verify VNF Policy Creation
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    ${value}        Get Text     ${NETWORK_POLICY_GETNAME}
    Log             ${value}
    Should Contain    ${value}    ${Policy_Name}

Import Network Policies VNF CUCP Schedule
    [Documentation]  Import Network Policies VNF CUCP Schedule
    Import Network Policies VNF     ${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_CUCP}

Import Network Policies VNF CUUP Schedule
    [Documentation]  Import Network Policies VNF CUUP Schedule
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_CUUP}

Import Network Policies VNF DU Schedule
    [Documentation]  Import Network Policies VNF DU Schedule
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_Schedule_DU}

Import Network Policies VNF CUCP Event Type
    [Documentation]  Import Network Policies VNF CUCP Event Type
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_CUCP}

Import Network Policies VNF CUUP Event Type
    [Documentation]  Import Network Policies VNF CUUP Event Type
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_CUUP}

Import Network Policies VNF DU Event Type
    [Documentation]  Import Network Policies VNF DU Event Type
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_EventType_DU}

Import Network Policies VNF CUCP OnDemand
    [Documentation]  Import Network Policies VNF CUCP OnDemand
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_OnDemand_CUCP}

Import Network Policies VNF CUUP OnDemand
    [Documentation]  Import Network Policies VNF CUUP OnDemand
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_OnDemand_CUUP}

Import Network Policies VNF DU OnDemand
    [Documentation]  Import Network Policies VNF DU OnDemand
    Import Network Policies VNF    ${AddFile_IMPORT_NETWORKPOLICY_VNF_Ondemand_DU}

Import Network Policies VNF
    [Documentation]  Import Network Policies VNF
    [Arguments]     ${AddFile}
    Open Network policy Configuration Page
    Click DMS Element   ${XPATH_NP_IMPORT_BUTTON}
    BuiltIn.sleep    5s
    Wait Until Page Contains Element   ${UploadFiletest}   60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}     ${AddFile}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    5s

Verify VNF Policy Import
    [Documentation]  Verify VNF Policy Import
    [Arguments]     ${Policy_Name}
    Wait Until Element Is Visible  ${XPATH_NPOLICY_IMPORT_MSG}
    ${value}        Get Text     ${XPATH_NPOLICY_IMPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Policy Imported Successfully
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element  ${XPATH_NC_OPERATION_HISTORY}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element  ${XPATH_OPERATION_NAME}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text  ${XPATH_OPERATION_NAME}  ${NP_OPERATION_TYPE}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element  ${XPATH_APPLY_FILTER_2}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element  ${XPATH_MORE_DETAILS}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    ${value}        Get Text     ${NP_XPATH_INFO}
    Log             ${value}
    Should Contain Any    ${value}    CREATED    UPDATED
    Click DMS Element  ${XPATH_OK}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Verify VNF Policy Creation  ${Policy_Name}

Export Network Policies VNF
    [Documentation]  Export Network Policies VNF
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element   ${NP_XPATH_CHECKBOX}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element   ${NP_XPATH_EXPORT}
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}
    Wait Until Element Is Visible  ${XPATH_NPPOLICY_EXPORT_MSG}
    ${value}        Get Text     ${XPATH_NPPOLICY_EXPORT_MSG}
    Log             ${value}
    Should Contain    ${value}    Download completed
    BuiltIn.sleep    ${NETWORK_POLICY_Sleep_Low}

