*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../overwrridden_params/page/overwrite_params_helper.robot
Resource            ../../device_history/page/device_history_helper.robot
Library             SeleniumLibrary
Library             Collections
Variables           NetworkPolicy_ui_controls.py
Variables           ../../policy/page/policy_ui_controls.py
Library            DateTime

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile_IMPORT_NETWORKPOLICY_EventType_BC}          ${EXECDIR}${IMPORT_NETWORKPOLICY_EventType_BC}
${AddFile_IMPORT_NETWORKPOLICY_OnDemand_BC}          ${EXECDIR}${IMPORT_NETWORKPOLICY_OnDemand_BC}
${AddFile_IMPORT_NETWORKPOLICY_Schedule_BC}          ${EXECDIR}${IMPORT_NETWORKPOLICY_Schedule_BC}

*** Keywords ***
Select DeviceType and Software Version
    [Documentation]  Verify Select DeviceType and Software Version
     Scroll Element Into View       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     Set Focus To Element       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   8s
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   8s
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE}
     BuiltIn.Sleep   10s
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   12s
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   12s
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION}
     BuiltIn.Sleep   12s
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION}

Open Network policy Configuration Page
    [Documentation]  Open Network policy Configuration Page
    ${open_page}=  Format String   ${NETWORK_POLICY_CONFIGURATION_URL}   dms_device_console=${DMS_NC_URL}
    Log  ${open_page}
    Go To   ${open_page}

Open RealDevice Network policy Configuration Page
    [Documentation]  Open Network policy Configuration Page
    BuiltIn.Sleep  5s
    Go to   ${DMS_Realdevice_NetworkPolicy_Page}
    BuiltIn.Sleep  5s

Verify the Success msg
    [Documentation]  Verify the success msg for network policy
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    ${success_msg} =    Format String   ${XAPTH_NP_NAME_VALIDATION}     ${Policy_Name}
    Wait Until Element Is Visible   ${success_msg}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep   8s
    CLICK DMS ELEMENT   ${ID_NP_OPERATIONAL_HISTORY}
    BuiltIn.Sleep   8s
    Input DMS Text    ${XPATH_NP_RESOURCE_NAME_TXTBOX}    ${Policy_Name}
    BuiltIn.Sleep   8s
    CLICK DMS ELEMENT     ${ID_NP_OPERATIONAL_HISTORY_APPLYFILTER}
    BuiltIn.Sleep   8s
    ${SUCESS}       Get DMS Element Text   ${XPATH_OPERATIONAL_HISTORY_STATUS}
    Should Be Equal    ${SUCESS}    Success
    BuiltIn.Sleep   8s
    Click DMS Element     ${XPATH_OH_DETAILS_BUTTON}
    Wait Until Element Is Visible     ${XPATH_OH_DEVICE_MSG}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible     ${XPATH_OH_NP_INITIATED_MSG}     timeout=${BROWSER_ELEMENT_TIMEOUT}
   # Wait Until Element Is Visible     ${XPATH_OH_NP_INITIATED_SUCCESS_MSG}     timeout=${BROWSER_ELEMENT_TIMEOUT}
   BuiltIn.Sleep   8s
    CLICK DMS ELEMENT     ${XPATH_OH_NP_MSG_OK_BTN}

Delete the Policy
    [Documentation]  Delete the Policy Created
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    BuiltIn.Sleep   8s
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   8s
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   8s
    #${DELETE_POLICY} =    Format String   ${XPATH_NP_DELETE_POLICY}     ${Policy_Name}
    #Scroll Element Into View      ${DELETE_POLICY}
    #Set Focus To Element    ${DELETE_POLICY}
    #BuiltIn.Sleep   4s
    #Click DMS Element    ${DELETE_POLICY}
    BuiltIn.Sleep   8s
    Scroll Element Into View      ${ID_NP_POLICY_DELETE_BUTTON}
    Set Focus To Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   8s
    Click DMS Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   8s
    Click DMS Element    ${ID_NP_CONFIRM_DELETE_BTN}
    Log     Policy deleted Successfully

Add Network Policy for GPV On Demand
     [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Click DMS Element   ${NETWORK_POLICY_XPATH_EXECUTION_ONDEMAND}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
#     Scroll Element Into View       ${NETWORK_POLICY_DEVICETYPE_ARROW}
#     Set Focus To Element       ${NETWORK_POLICY_DEVICETYPE_ARROW}
#     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_ARROW}
#     BuiltIn.Sleep   5s
#     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE}
#     BuiltIn.Sleep   5s
#     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
#     BuiltIn.Sleep   5s
#     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   6s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_GPV}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Set Focus To Element    ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     Execute JavaScript      window.scrollBy(0,500)
     Click DMS Element  ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View       ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}
     Set Focus To Element       ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}
     BuiltIn.Sleep   8s
     Click DMS Element     ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}
     BuiltIn.Sleep   8s
     press keys   ${XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View       ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     Set Focus To Element       ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_SAVE_AND_EXECUTE}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}




Add Network Policy for GPV in Event Type BootStrap
     [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
     BuiltIn.Sleep   8s
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_DP_BOOTSTRAP_CHECKBOX}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_SCHEDULED_CALENDER}
     Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
     BuiltIn.Sleep   8s

     #Click DMS Element   ${XPATH_DP_EXECUTION_SCHEDULED_RADIOBTN}
     #BuiltIn.Sleep   5s
     #Click DMS Element    ${XPATH_DP_SCHEDULED_CALENDER}
     #BuiltIn.Sleep   5s

     #${Current Time}=    GET Value     ${XPATH_START_TIME_Network_Policy}
   # Log    ${Current Time}
    #${split value}     Split String   ${Current Time}
    #Log     ${split value}
    #Log     ${split value}[0]
    #Log     ${split value}[1]
    #Log     ${split value}[2]
    #${pre}	${post} =	Split String	${split value}[1]	:	1
    #Log     ${pre}
    #Log     ${post}
    #Log     int(${post})
    #${new value}=    Evaluate   int(${post}) + 3
    #Log    ${new value}
    #${new date}=     Catenate     ${split value}[0]  ${pre}:${new value}  ${split value}[2]
    #Log     ${new date}

    #BuiltIn.Sleep  8s
    #Clear Element Text     ${XPATH_START_TIME_Network_Policy}
    #BuiltIn.Sleep  8s
    #Input DMS Text      ${XPATH_START_TIME_Network_Policy}      ${new date}
    #BuiltIn.Sleep  8s

    Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
     BuiltIn.Sleep   8s
     #Select DeviceType and Software Version
     #Scroll Element Into View       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Set Focus To Element       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION}
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_GPV}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Set Focus To Element    ${XPATH_NP_DEVICE_lIST}
     Execute JavaScript      window.scrollBy(0,500)
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View       ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     Set Focus To Element       ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${ID_NP_SAVE_BTN}
     BuiltIn.Sleep  8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}

Add Network Policy for SPV in Event Type Boot
     [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
     BuiltIn.Sleep   8s
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_DP_BOOT_CHECKBOX}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
     BuiltIn.Sleep   8s
     #Select DeviceType and Software Version
     #Scroll Element Into View       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Set Focus To Element       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION}
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_SPV}
     BuiltIn.Sleep   8s
     Click DMS Element    ${ID_EXPAND_ALL}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_EXPAND_DEVICE}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_DP_GPV_SERVICES_PARAM_HEADER1}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View       ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     Set Focus To Element       ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB2}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_DP_GPV_SERVICES_PARAM_SUB1}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${XPATH_DP_SPV_FN_TEXTBOX}   1
     BuiltIn.Sleep   8s
     Input DMS Text  ${XPATH_DP_SPV_NR_TEXTBOX}   120
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${ID_NP_SAVE_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}

Add Network Policy for GPA Event Type All
     [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
     BuiltIn.Sleep   8s
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_DP_ALL_CHECKBOX}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
     BuiltIn.Sleep   8s

     #Scroll Element Into View       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Set Focus To Element       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION}
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_GPA}
     BuiltIn.Sleep   8s
     Click DMS Element    ${ID_EXPAND_ALL}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_EXPAND_DEVICE}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Click DMS Element    ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HEADER}
     Set Focus To Element    ${XPATH_NP_FAULTMGMT_HEADER}
     Click DMS Element      ${XPATH_NP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_NP_FAULTMGMT_HEADER}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HISTORY_HEADER}
     Click DMS Element     ${XPATH_NP_FAULTMGMT_HISTORY_HEADER}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text    ${XPATH_NP_FAULTMGMT_HISTORY_INPUT}    1
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${ID_NP_SAVE_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}

Add Network Policy for SPA Event Type Periodic
     [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text    ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
     Click DMS Element   ${XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_DP_PERIODIC_CHECKBOX}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
     BuiltIn.Sleep   8s
     Scroll Element Into View       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     Set Focus To Element       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   8s
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE}
     BuiltIn.Sleep   8s
     #Scroll Element Into View       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Set Focus To Element       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_SPA}
     BuiltIn.Sleep   8s
     Click DMS Element    ${ID_EXPAND_ALL}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_EXPAND_DEVICE}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Click DMS Element    ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HEADER}
     Set Focus To Element    ${XPATH_NP_FAULTMGMT_HEADER}
     Click DMS Element      ${XPATH_NP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_NP_FAULTMGMT_HEADER}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_CURRENTALARM}
     Click DMS Element     ${XPATH_NP_FAULTMGMT_CURRENTALARM}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_COMBOBOX}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_COMBOVALUE2}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${ID_NP_SAVE_BTN}
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}

Add Device Policy for Add Object in OnDemand
    [Documentation]  Add Network policy on Demand
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     Click DMS Element   ${NETWORK_POLICY_XPATH_EXECUTION_ONDEMAND}
     #Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION}
     Select DeviceType and Software Version
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_ADD_OBJECT}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Set Focus To Element    ${XPATH_NP_DEVICE_lIST}
     Execute JavaScript      window.scrollBy(0,500)
   #  Click DMS Element   ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HEADER}
     Set Focus To Element    ${XPATH_NP_FAULTMGMT_HEADER}
     #Click DMS Element      ${XPATH_NP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_NP_FAULTMGMT_HEADER}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULT_MGMT_CURRALARM}
     BuiltIn.Sleep   8s
     Click DMS Element     ${XPATH_NP_FAULT_MGMT_CURRALARM}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s

     Click DMS Element      ${XPATH_NP_DEVICE_SELECTION_DEVICE}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_EXPAND_ALL}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_NP_EXPANDALL_DEVICE}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICE_FILTER_ARROW}
     Set Focus To Element     ${XPATH_NP_DEVICE_FILTER_ARROW}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_NP_DEVICE_FILTER_ARROW}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_NP_DEVICE_TYPE_COMBO}
     BuiltIn.Sleep   8s
     Set Focus To Element     ${XPATH_NP_DEVICE_FILTER_ARROW}
     Click DMS Element      ${XPATH_NP_DEVICE_SELECT_CHECKBOX}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_DEVICES}
     Set Focus To Element    ${ID_NP_ADD_DEVICES}
     Click DMS Element      ${ID_NP_ADD_DEVICES}

     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_SAVE_AND_EXECUTE}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}


Add Device Policy for Delete Object in Scheduled
     [Documentation]  Add Device Policy for Delete Object in Scheduled
     [Arguments]     ${Policy_Name}
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Open Network policy Configuration Page
     BuiltIn.Sleep   8s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     BuiltIn.Sleep   8s
     Select DeviceType and Software Version
     BuiltIn.Sleep   8s
     Click DMS Element   ${NETWORK_POLICY_XPATH_EXECUTION_SCHEDULED}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     Click DMS Element    ${XPATH_NP_SCHEDULED_CALENDER}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_SCHEDULED_SELECT_DATE}
     BuiltIn.Sleep   8s
     #Select DeviceType and Software Version
     ##Scroll Element Into View       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Set Focus To Element       ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement    ${NETWORK_POLICY_SOFTWAREVERSION}
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_DELETE_OBJECT}
     BuiltIn.Sleep   8s
     Click DMS Element    ${ID_EXPAND_ALL}
     BuiltIn.Sleep   8s
     Click DMS Element    ${XPATH_NP_EXPAND_DEVICE}
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_DEVICE_lIST}
     Click DMS Element     ${XPATH_NP_DEVICE_lIST}
     BuiltIn.Sleep   8s
     press keys    ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HEADER}
     Set Focus To Element    ${XPATH_NP_FAULTMGMT_HEADER}
     Click DMS Element      ${XPATH_NP_FAULTMGMT_HEADER}
     BuiltIn.Sleep   8s
     press keys     ${XPATH_NP_FAULTMGMT_HEADER}      ARROW_RIGHT
     BuiltIn.Sleep   8s
     Scroll Element Into View     ${XPATH_NP_FAULTMGMT_HISTORY_HEADER}
     Click DMS Element     ${XPATH_NP_FAULTMGMT_HISTORY_HEADER}
     BuiltIn.Sleep   8s
     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Input DMS Text    ${XPATH_NP_FAULTMGMT_HISTORY_INPUT}    1
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${ID_NP_SAVE_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}


Import Network Policies BC Schedule
    [Documentation]  Import Network Policies BC Schedule
    Import Network Policies BC     ${AddFile_IMPORT_NETWORKPOLICY_Schedule_BC}

Import Network Policies BC Event Type
    [Documentation]  Import Network Policies BC Event Type
    Import Network Policies BC    ${AddFile_IMPORT_NETWORKPOLICY_EventType_BC}

Import Network Policies BC OnDemand
    [Documentation]  Import Network Policies BC OnDemand
    Import Network Policies BC    ${AddFile_IMPORT_NETWORKPOLICY_OnDemand_BC}

Import Network Policies BC
    [Documentation]  Import Network Policies BC
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

Verify BC Policy Import
    [Documentation]  Verify BC Policy Import
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
    Verify BC Policy Creation  ${Policy_Name}

Export Network Policies BC
    [Documentation]  Export Network Policies BC
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

Verify BC Policy Creation
    [Documentation]  Verify BC Policy Creation
    [Arguments]     ${Policy_Name}
    Open Network policy Configuration Page
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   ${NETWORK_POLICY_Sleep_Low}
    ${value}        Get Text     ${NETWORK_POLICY_GETNAME}
    Log             ${value}
    Should Contain    ${value}    ${Policy_Name}

Delete BC Network Policy
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


Add ondemand SPV Policy for EnableBanner
    [Arguments]     ${Policy_Name}
     BuiltIn.Sleep   10s
     Click DMS Element  ${NETWORK_POLICY_ID_ADD_POLICY_BTN}
     Input DMS Text  ${NETWORK_POLICY_ID_NP_NAME_TXTBOX}    ${Policy_Name}
     Click DMS Element   ${NETWORK_POLICY_XPATH_EXECUTION_ONDEMAND}
     #Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     #BuiltIn.Sleep   4s
     #Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION}
     Scroll Element Into View       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     Set Focus To Element       ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   8s
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE_ARROW}
     BuiltIn.Sleep   8s
     Click DMS ELement    ${NETWORK_POLICY_DEVICETYPE}
     BuiltIn.Sleep   10s
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   12s
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_ARROW}
     BuiltIn.Sleep   12s
     Click DMS ELement  ${XPATH_SOFTWAREVERSION_ARROW_BUTTON}
     BuiltIn.Sleep   5s
     Scroll Element Into View    ${NETWORK_POLICY_SOFTWAREVERSION_6}
     BuiltIn.Sleep   12s
     Click DMS ELement  ${NETWORK_POLICY_SOFTWAREVERSION_6}
     BuiltIn.Sleep   5s
     Scroll Element Into View    ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS ELement  ${XPATH_NP_DEVICEOPERATION_ARROWBTN}
     BuiltIn.Sleep   8s
     Click DMS Element  ${XPATH_NP_DEVICEOPERATION_SPV}
     BuiltIn.Sleep   8s
    Scroll Element Into View  ${NETWORK_Policy_search}
    BuiltIn.sleep    5s
    Click DMS Element  ${NETWORK_Policy_search}
    BuiltIn.sleep    5s
    #Click DMS Element    ${XPATH_DP_DEVICEOPERATION_ARROWBTN}
    #BuiltIn.Sleep   5s
    #Click DMS Element    ${NETWORK_Policy_search}
    BuiltIn.Sleep   5s
    Input DMS Text     ${NETWORK_Policy_search}     ${POLICY_ENABLE_SEARCH_VALUE}
    BuiltIn.Sleep   5s
    Scroll Element Into View  ${XPATH_NP_DEVICE_lIST}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_NP_DEVICE_lIST}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_NP_DEVICE_lIST}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View  ${XPATH_NP_DeviceInfo_tree}
    BuiltIn.Sleep   5s
    Click DMS ELement    ${XPATH_NP_DeviceInfo_tree}
    BuiltIn.Sleep   5s
    press keys   ${XPATH_NP_DeviceInfo_tree}    ARROW_RIGHT
    BuiltIn.Sleep   5s
    Scroll Element Into View    ${XPATH_EnableBanner_value}
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_EnableBanner_value}
    BuiltIn.Sleep   5s

     Scroll Element Into View    ${ID_NP_ADD_POLICY_BTN}
     Set Focus To Element    ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${ID_NP_ADD_POLICY_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element      ${XPATH_ENABLEBANNER_TEXTBOX}
     BuiltIn.Sleep   8s
     Input DMS Text  ${XPATH_ENABLEBANNER_TEXTBOX}   1
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s

Add Device for Network Policy
     Click DMS Element      ${XPATH_NP_DEVICE_SELECTION_DEVICE}
     BuiltIn.Sleep   8s


    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_NP_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_NP_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_NP_MACID_SEARCH}   ${NP_MAC_ID}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_NP_DEVICE_APPLY}
    BuiltIn.Sleep  2s
    #Scroll Down Page
    #BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_NP_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_NP_SELECT_DEVICE}
    BuiltIn.Sleep  2s
    #Scroll Element Into View    ${ID_ADD_BUTTON}
   # BuiltIn.Sleep  2s
    Click DMS Element   ${ID_NP_ADD_BUTTON}
    BuiltIn.Sleep  2s
     BuiltIn.Sleep   8s
     Click DMS Element      ${NETWORK_POLICY_ID_NP_NEXT_BTN}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_SAVE_AND_EXECUTE}
     BuiltIn.Sleep   8s
     Click DMS Element       ${XPATH_NP_CONFIRMBTN}


Verify EnableBanner SPV details in history

    BuiltIn.Sleep  2s
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
    Should Contain    ${history_detail_value}    SetParameterValues
    Should Contain    ${history_detail_value}    EnableBanner_SPV
    Should Contain    ${history_detail_value}    Success
    Should Contain    ${history_detail_value}    NETWORK
    BuiltIn.sleep    4s
    #Click DMS Element  ${XPATH_HISTORY_DETAIL_CLOSE}

   #BuiltIn.sleep    2s


Delete the Realdevice Policy
    [Documentation]  Delete the Device Policy Created
    [Arguments]     ${Policy_Name}
    Open RealDevice Network policy Configuration Page
    BuiltIn.Sleep   8s
    Input DMS Text      ${XPATH_NP_NAME_FILTER}     ${Policy_Name}
    BuiltIn.Sleep   8s
    Click DMS Element     ${ID_NP_APPLY_FILTER}
    BuiltIn.Sleep   8s
    #${DELETE_POLICY} =    Format String   ${XPATH_NP_DELETE_POLICY}     ${Policy_Name}
    #Scroll Element Into View      ${DELETE_POLICY}
    #Set Focus To Element    ${DELETE_POLICY}
    #BuiltIn.Sleep   4s
    #Click DMS Element    ${DELETE_POLICY}
    BuiltIn.Sleep   8s
    Scroll Element Into View      ${ID_NP_POLICY_DELETE_BUTTON}
    Set Focus To Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   8s
    Click DMS Element    ${ID_NP_POLICY_DELETE_BUTTON}
    BuiltIn.Sleep   8s
    Click DMS Element    ${ID_NP_CONFIRM_DELETE_BTN}
    Log     Policy deleted Successfully